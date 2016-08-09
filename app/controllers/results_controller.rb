require 'results'

class ResultsController < ApplicationController
  def show
    # @question_results = []
    # SurveyResponse.where(survey_id: params[:id]).each do |response|
    #   @question_results << response.question_responses
    # end
    @survey = Survey.find(params[:id])
    @results = Results.new(params[:id]).get_results

  end

  private



end
