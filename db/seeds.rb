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
  { name: 'Алеша Попович', email: 'ap@email.com', password: '123456' },
  { name: 'Барон Мюнхаузен', email: 'bm@email.com', password: '123456' },
  { name: 'Винни Пух', email: 'vp@email.com', password: '123456' },
  { name: 'Admin', email: 'rsathinknetica@gmail.com', password: '123456', type: 'Admin', first_name: 'Guru', last_name: 'TestGuru' }
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
  { body: '4', question: questions[0] },
  { body: '6', question: questions[0] },
  { body: '1380', question: questions[1] },
  { body: '1672', question: questions[1] },
  { body: '1680', question: questions[1] },
  { body: 'Семейные', question: questions[3] },
  { body: 'Родственные', question: questions[3] },
  { body: 'Дружественные', question: questions[3] },
  { body: 'Машины и механизмы', question: questions[4] },
  { body: 'Здания и сооружения', question: questions[4] },
  { body: 'Вклады и счета в банке', question: questions[4] },
  { body: 'Прага', question: questions[5] },
  { body: 'Париж', question: questions[5] },
  { body: 'Вена', question: questions[5] },
  { body: 'Assembler', question: questions[6] },
  { body: 'C++', question: questions[6] },
  { body: 'Basic', question: questions[6] }
])


