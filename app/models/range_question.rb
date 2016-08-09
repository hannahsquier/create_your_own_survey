class RangeQuestion < ActiveRecord::Base
  has_one :question, as: :question, dependent: :destroy
  has_one :survey, through: :questions
end
