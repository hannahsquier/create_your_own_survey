# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Survey.destroy_all
Question.destroy_all
McQuestion.destroy_all
RangeQuestion.destroy_all

10.times do
  s = Survey.create(
    title: Faker::Superhero.name,
    description: Faker::Hipster.paragraph(2, false, 4)
    )

  (2..6).to_a.sample.times do
    r = RangeQuestion.new(
      question_text: Faker::Company.bs + "?",
      min: (2..6).to_a.sample,
      max: (7..12).to_a.sample,
      required: [true, false].sample
      )
    s.questions.create(question: r)
  end

  (2..6).to_a.sample.times do
    mc = McQuestion.new(
      question_text:Faker::StarWars.quote + "?",
      num_options: (2..6).to_a.sample,
      required: [true, false].sample
      )

    mc.num_options.times do
      mc.options << McOption.create( option: Faker::Company.catch_phrase)
    end
    s.questions.create(question: mc)
  end
end