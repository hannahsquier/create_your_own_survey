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

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      redirect_to survey_questions_path(survey_id: @survey.id)
    else
      render :edit
    end
  end

  def destroy
    if Survey.find(params[:id]).destroy
      redirect_to surveys_path
    else
      flash[:error] = "Could not delete."
      render :show
    end
  end

  private

    def survey_params
      params.require(:survey).permit(:title, :description)
    end
end
