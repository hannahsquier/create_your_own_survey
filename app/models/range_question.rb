class RangeQuestion < ActiveRecord::Base
  has_one :question, as: :question
  has_one :survey, through: :questions
end
