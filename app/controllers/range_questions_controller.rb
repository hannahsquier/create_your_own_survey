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

  def edit
    @range_question = RangeQuestion.find(params[:id])
  end

  def update
    @range_question = RangeQuestion.find(params[:id])

    if @range_question.update(range_question_params)
      redirect_to survey_questions_path(survey_id: get_survey_id)
    else
      flash.now[:error] = "Something went wrong :("
      render :edit
    end
  end

  def destroy
    survey_id = get_survey_id
    if Question.where(question_type: 'RangeQuestion', question_id: params[:id]).first.destroy && RangeQuestion.find(params[:id]).destroy
      redirect_to survey_questions_path(survey_id: survey_id)
    else
      flash[:error] = "Could not delete."
      render :show
    end
  end

  private

    def range_question_params
      params.require(:range_question).permit(:question_text, :min, :max, :required)
    end


    def get_survey_id
      Question.where(question_type:'RangeQuestion', question_id: params[:id]).first.survey_id
    end
end
