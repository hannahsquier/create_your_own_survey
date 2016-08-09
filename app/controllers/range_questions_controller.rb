class RangeQuestionsController < ApplicationController
  def new
    @range_question = RangeQuestion.new
  end

  def create
    @range_question = RangeQuestion.new(range_question_params)
    if @range_question.save
      Survey.find(params[:survey_id]).questions.create(question: @range_question)
      flash[:success] = "You created a question :)"
      redirect_to survey_questions_path(survey_id: params[:survey_id])
    else
      flash.now[:error] = "Something went wrong :("
      render :new
    end
  end

  private

    def range_question_params
      params.require(:range_question).permit(:question_text, :min, :max, :required)
    end
end
