# project_surveyor
Build it, take it, view it.

[A Ruby on Rails project from the Viking Code School which uses Active Record Associations, nested forms, collection forms, range fields, and PostgreSQL](https://www.vikingcodeschool.com)

1. What is the relationship between a survey and its questions?
  One survey to many questions
  - reverse polymorphic relationship. 1 survey has many questions. Question can either be a mc or a range question.

2. How might you create a survey and also create questions for it?
Create survey with title, description. Next page has buttons for what type of question to add. Button to finish making survey

3. What is the relationship between a multiple choice question and its options?
1 to many


4. How do you create a multiple choice questions and also create options for it?

Every question has choices.

---
Survey
  - survey_id (integer)
  - title (string)
  - description (text)

MCQuestion
  - survey_id (integer)
  - question (text)
  - num_options (integer)
  - required (boolean)

RangeQuestion
  - survey_id (integer)
  - question (text)
  - min (integer)
  - max (integer)
  - required (boolean)

SurveyQuestion
  - survey_question_id (integer)
  - question_id (integer)
  - question_type (string)

MCOption
  - mcquestion_id (integer)
  - option (string)

