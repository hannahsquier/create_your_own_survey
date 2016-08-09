class SurveyResponsesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @response = SurveyResponse.create(survey_id: @survey.id)
  end

  def create
    params[:question_responses].each do |question, response|
      QuestionResponse.create(survey_response_id: params[:response_id],
                              question_id: question.to_i,
                              answer: response.to_i)

     end

    flash[:success] = "Thank you for your input."
    redirect_to survey_questions_path(survey_id: params[:survey_id])

  end

  private

  def response_params
    params.require(:survey_response).permit(:survey_id, :response_id, question_responses: {})
  end
end
