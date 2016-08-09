class McOptionsController < ApplicationController
  def new
    @survey = survey.find(params[:survey_id])
    @mc_question = McQuestion.find(params[:mc_question_id])
    @option = McOption.build
  end

  def create
  end

end
