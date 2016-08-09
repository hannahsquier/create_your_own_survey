class McOptionsController < ApplicationController
  def new
    @mc_question = McQuestion.find(params[:mc_question_id])

    @mc_question.num_options.times do
      @mc_question.options << @mc_question.options.build
    end

  end

  def create
  end

end
