class Survey < ActiveRecord::Base
  has_many :questions

  has_many :mc_questions,
            through: :questions,
            source: :question,
            source_type: 'McQuestion'

  has_many :range_questions,
            through: :questions,
            source: :question,
            source_type: 'RangeQuestion'

  has_many :survey_responses
end
