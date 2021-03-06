module Whoopsie
  class Railtie < Rails::Railtie
    Config = Struct.new(:enable, :recipients, :sender)
    config.whoopsie = Config.new

    initializer "whoopsie.configure_middleware" do
      Rails.application.middleware.insert_before ActiveRecord::ConnectionAdapters::ConnectionManagement, ExceptionNotification::Rack

      ExceptionNotification.configure do |config|
        # Ignore additional exception types.
        # ActiveRecord::RecordNotFound, AbstractController::ActionNotFound and ActionController::RoutingError are already added.
        # config.ignored_exceptions += %w{ActionView::TemplateError CustomError}

        # Adds a condition to decide when an exception must be ignored or not.
        # The ignore_if method can be invoked multiple times to add extra conditions.
        # config.ignore_if do |exception, options|
        #   ! Rails.application.config.whoopsie.enable
        # end

        if Rails.application.config.whoopsie.enable
          config.add_notifier :email, {
            :email_prefix         => "[ERROR] ",
            :sender_address       => Rails.application.config.whoopsie.sender,
            :exception_recipients => Rails.application.config.whoopsie.recipients,
          }
        end
      end
    end
  end
end
