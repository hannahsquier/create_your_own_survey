class Question < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question, polymorphic: true
  has_many :question_responses
end
