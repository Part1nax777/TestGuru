# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([
  { title: 'Школа' },
  { title: 'Институт' }
])

tests = Test.create!([
  { title: 'Математика', complexity: 3, category_id: categories[0].id },
  { title: 'История', complexity: 2, category_id: categories[0].id },
  { title: 'Право', complexity: 3, category_id: categories[1].id },
  { title: 'Экономика', complexity: 1, category_id: categories[1].id },
  { title: 'География', complexity: 1, category_id: categories[0].id },
  { title: 'Программирование', complexity: 3, category_id: categories[1].id }
])

questions = Question.create!([
  { body: 'Log(100)', test_id: tests[0].id },
  { body: 'В каком году была Куликовская битва', test_id: tests[1].id },
  { body: 'В каком году родился Петр 1', test_id: tests[1].id },
  { body: 'Правовые отношения при наследстве', test_id: tests[2].id },
  { body: 'Основной капиталл это', test_id: tests[3].id },
  { body: 'Столица Чехии', test_id: tests[4].id },
  { body: 'Язык низкого уровня', test_id: tests[5].id }
])

answers = Answer.create!([
  { body: '2', question_id: questions[0].id },
  { body: '1380', question_id: questions[1].id },
  { body: '1672', question_id: questions[1].id },
  { body: 'Семейные', question_id: questions[2].id },
  { body: 'Машины и механизмы', question_id: questions[3].id },
  { body: 'Прага', question_id: questions[4].id },
  { body: 'Assembler', question_id: questions[0].id }
])

users = User.create!([
  { name: 'Алеша Попович' },
  { name: 'Барон Мюнхаузен' },
  { name: 'Винни Пух' }
])
