class ApplicationController < ActionController::Base

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
end
