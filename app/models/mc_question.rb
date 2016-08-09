class McQuestion < ActiveRecord::Base
  has_one :question, as: :question, dependent: :destroy
  has_one :survey, through: :questions

  has_many :options, class_name: "McOption", dependent: :destroy

  accepts_nested_attributes_for :options
end
