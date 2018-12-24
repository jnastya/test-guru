# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!([
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'Mobile Development' }
])

User.create!([
  { first_name: 'Admin', last_name: 'Admin', email: 'admin@test.com', password: 'admintest', password_confirmation: 'admintest' }
])

users = User.all
categories = Category.all
Test.create!([
  { title: 'HTML', level: 1, category: categories[0], author: users[0] },
  { title: 'GO', level: 2, category: categories[1], author: users[0] },
  { title: 'Ruby', level: 1, category: categories[1], author: users[0] },
  { title: 'Java', level: 3, category: categories[2], author: users[0] },
  { title: 'Python', level: 2, category: categories[2], author: users[0] }
])

tests = Test.all
Question.create!([
  { body: 'Ruby is an object oriented general purpose programming language.', test: tests[2] },
  { body: 'Which element is used for creating links??', test: tests[0] },
  { body: 'Mathematical operations can be performed on a string. State whether true or false.', test: tests[4] },
  { body: 'Is Go a case sensitive language?', test: tests[1] },
  { body: 'Can we create an instance of Enum outside of Enum itself?', test: tests[3] },
])

questions = Question.all
Answer.create!([
  { body: '<a>', question: questions[1], correct: true },
  { body: '<p>', question: questions[1] },
  { body: '<li>', question: questions[1] },
  { body: '<ol>', question: questions[1] },
  { body: 'True', question: questions[0], correct: true },
  { body: 'False', question: questions[0] },
  { body: 'True', question: questions[2] },
  { body: 'False', question: questions[2], correct: true },
  { body: 'Yes', question: questions[3], correct: true },
  { body: 'No', question: questions[3] },
  { body: 'True', question: questions[4] },
  { body: 'False', question: questions[4], correct: true },
])

users = User.all
TestPassage.create!([
  { user: users[0], test: tests[0] },
  { user: users[0], test: tests[2] },
  { user: users[0], test: tests[1] },
  { user: users[0], test: tests[3] },
  { user: users[0], test: tests[4] },
  { user: users[0], test: tests[1] },
  { user: users[0], test: tests[4] },
])
