module SurveyResponsesHelper
  def get_question_object(question)
    question.question_type.classify.constantize.find(question.question_id)
  end
end
