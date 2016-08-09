class McQuestionsController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @mc_question = McQuestion.new
  end

  def create
    @mc_question = McQuestion.new(mc_question_params)
    if @mc_question.save
      Survey.find(params[:survey_id]).questions.create(question: @mc_question)
      redirect_to edit_mc_question_path(@mc_question.id)
    else
      flash.now[:error] = "Something went wrong :("
      render :new
    end
  end

  def edit

    @mc_question = McQuestion.find(params[:id])

    if @mc_question.options.empty?
      @mc_question.num_options.times do
        @mc_question.options << @mc_question.options.build
      end
    end

  end

  def update
    @mc_question = McQuestion.find(params[:id])

    if @mc_question.update(mc_question_params)
      flash[:success] = "Successfully created/updated question! :)"
      redirect_to survey_questions_path(survey_id: get_survey_id)
    else
      flash.now[:error] = "Something went wrong :("
      render :edit
    end
  end

  def destroy
    survey_id = get_survey_id
    if  Question.where(question_type: 'McQuestion', question_id: params[:id]).first.destroy && McQuestion.find(params[:id]).destroy

      redirect_to survey_questions_path(survey_id: survey_id)
    else
      flash[:error] = "Could not delete."
      render :show
    end
  end


  private

  def mc_question_params
    params.require(:mc_question).permit(:question_text, :num_options, :required, options_attributes: [:option, :id])
  end

  def get_survey_id
     Question.where(question_type:'McQuestion', question_id: params[:id]).first.survey_id
  end
end
