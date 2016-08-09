class McQuestionsController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @mc_question = McQuestion.new
  end

  def create
    @mc_question = McQuestion.new(mc_question_params)
    if @mc_question.save
      Survey.find(params[:survey_id]).questions.create(question: @mc_question)


      if params[:mc_question][:num_options]


        params[:mc_question][:num_options].to_i.times do
          @mc_question.options << @mc_question.options.build
        end

        redirect_to new_survey_mc_question_path
      else

        flash[:success] = "You created a question :)"
        redirect_to survey_questions_path
      end
    else
      flash.now[:error] = "Something went wrong :("
      render :new
    end
  end

  private

    def mc_question_params
      params.require(:mc_question).permit(:question_text, :num_options, :required)
    end
end
