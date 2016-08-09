class McQuestion < ActiveRecord::Base
  has_one :question, as: :q
  has_one :survey, through: :questions

  has_many :options, class_name: "McOption"

  accepts_nested_attributes_for :options
end
