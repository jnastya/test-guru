# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  { title: 'Frontend' }, { title: 'Backend' }, { title: 'Mobile Development' }
])

tests = TEST.create([
  { title: 'HTML', level: 1, category_id: categories[0].id },
  { title: 'GO', level: 2, category_id: categories[1].id },
  { title: 'Ruby', level: 1, category_id: categories[1].id },
  { title: 'Java', level: 3, category_id: categories[2].id },
  { title: 'Python', level: 2, category_id: categories[2].id }
])

questions = Question.create([
  { body: 'Ruby is an object oriented general purpose programming language.', test_id: tests[2].id },
  { body: 'Which element is used for creating links??', test_id: tests[0].id },
  { body: 'Mathematical operations can be performed on a string. State whether true or false.', test_id: tests[4].id },
  { body: 'Is Go a case sensitive language?', test_id: tests[1].id },
  { body: 'Can we create an instance of Enum outside of Enum itself?', test_id: tests[3].id },
])

answers = Answer.create([
  { body: '<a>', question_id: questions[1].id, correct: true },
  { body: '<p>', question_id: questions[1].id },
  { body: '<li>', question_id: questions[1].id },
  { body: '<ol>', question_id: questions[1].id },
  { body: 'True', question_id: questions[0].id, correct: true },
  { body: 'False', question_id: questions[0].id },
  { body: 'True', question_id: questions[2].id },
  { body: 'False', question_id: questions[2].id, correct: true },
  { body: 'Yes', question_id: questions[3].id, correct: true },
  { body: 'No', question_id: questions[3].id }
  { body: 'True', question_id: questions[2].id },
  { body: 'False', question_id: questions[2].id, correct: true },
])

users = User.create([
  { name: 'Aleks', age: 23 },
  { name: 'Olga', age: 30 },
  { name: 'Vova', age: 28 },
  { name: 'Elena', age: 21 },
])

test_passages = TestPassage.create([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[1].id, test_id: tests[1].id },
  { user_id: users[2].id, test_id: tests[3].id },
  { user_id: users[2].id, test_id: tests[4].id },
  { user_id: users[3].id, test_id: tests[1].id },
  { user_id: users[3].id, test_id: tests[4].id },
])
