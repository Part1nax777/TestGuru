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

users = User.create!([
  { name: 'Алеша Попович' },
  { name: 'Барон Мюнхаузен' },
  { name: 'Винни Пух' }
])

tests = Test.create!([
  { title: 'Математика', complexity: 3, category: categories[0], author: users[0] },
  { title: 'История', complexity: 2, category: categories[0], author: users[0] },
  { title: 'Право', complexity: 3, category: categories[1], author: users[1] },
  { title: 'Экономика', complexity: 1, category: categories[1], author: users[1] },
  { title: 'География', complexity: 1, category: categories[0], author: users[2] },
  { title: 'Программирование', complexity: 3, category: categories[1], author: users[2] }
])

questions = Question.create!([
  { body: 'Log(100)', test: tests[0] },
  { body: 'В каком году была Куликовская битва', test: tests[1] },
  { body: 'В каком году родился Петр 1', test: tests[1] },
  { body: 'Правовые отношения при наследстве', test: tests[2] },
  { body: 'Основной капиталл это', test: tests[3] },
  { body: 'Столица Чехии', test: tests[4] },
  { body: 'Язык низкого уровня', test: tests[5] }
])

answers = Answer.create!([
  { body: '2', question: questions[0] },
  { body: '1380', question: questions[1] },
  { body: '1672', question: questions[1] },
  { body: 'Семейные', question: questions[2] },
  { body: 'Машины и механизмы', question: questions[3] },
  { body: 'Прага', question: questions[4] },
  { body: 'Assembler', question: questions[0] }
])


