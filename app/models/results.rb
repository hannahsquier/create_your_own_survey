class Results

  def initialize(survey_id)
    @survey = Survey.find(survey_id)
  end

  def get_results
    results = initialize_results_hash
    question_responses = []

    SurveyResponse.where(survey_id: @survey.id).each do |response|
     response.question_responses.each do |question_response|
        question_responses << question_response
      end
    end

    question_responses.each do |response|
      q = get_question_obj(Question.find(response.question_id))
      if q.class.name == "RangeQuestion"
        results[q][response.answer] += 1
      else
        q.options.each do |option|
          results[q][option.option] += 1 if option.id == response.answer
        end
      end
    end
    results
  end

  private

  def get_question_obj(question)
    question.question_type.classify.constantize.find(question.question_id)
  end

  def initialize_results_hash
    results = {}
    @survey.questions.each do |question|
       q = get_question_obj(question)
       results[q] = {}

       if q.class.name == "McQuestion"
        q.options.each do |option|
          results[q][option.option] = 0
        end

      else
        (q.min..q.max).to_a.each do |n|
          results[q][n] = 0
        end
      end

    end
    results
  end

end

