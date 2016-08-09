class SurveysController < ApplicationController
  def new
    @survey = Survey.new
  end

  def show
    @survey = Survey.find(params[:id])
    @survey.questions.build
  end

  def index
    @surveys = Survey.all
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:success] = "You created a survey :)"
      redirect_to survey_questions_path(survey_id: @survey.id)
    else
      flash.now[:error] = "Something went wrong :("
      render :new
    end
  end

  private

    def survey_params
      params.require(:survey).permit(:title, :description)
    end
end
