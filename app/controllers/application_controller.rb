module Fileuploadapp
    class Application < Rails::Application
        config.middleware.insert_before 0, "Rack::Cors" do
            allow do
                origins '*'
                resource '*', :headers => :any, :methods => [:get, :post, :options]
            end
        end
        config.api_only = true
    end
end

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    def create 
        if params.has_key?("question")
            Question.create(question_params(params["question"]))
        else
            params["question"].each do |question|
                if question["textStatement"] != "" || question["altA"] != "" || question["altB"] != "" || question["altC"] != "" || question["altD"] != "" || question["altE"] != "" || question["correctAlt"] != "" 
                  Question.create(question_params(question))
                end
            end
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

        #devise_parameter_sanitizer.permit(:account_update) do |user|
        #    user.permit(:firstName, :lastName, :role_id, :regNumber, :avatar)
        #end

        #devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :role_id, :regNumber, :avatar])
    end
    # The path used after sign up.
    def after_sign_up_path_for(resource)
        account_new_path(current_user.id)
    end
end
