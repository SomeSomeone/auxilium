# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#srart question block


public
def create_question(text,level,contents)
	answers=Array.new
	contents.each{|content|
		answers << Answer.create(content: content)
	}
	quest = Question.create( text: text , correct_answer_id: answers.first.id , level: level )
	answers.each{|a|
		a.question_id=quest.id
		a.save
	}
end

#level 0
create_question("Именнованая область памяти, которая может быть изменнена это",
				0,
				["переменная","указатель","изменённая","константа"])
create_question("Что такое класс?",
				0,
				["тип данных","объект","переменная","метод"])
create_question("Переменные одного типа объединяют в...?",
				0,
				["массивы","классы","блоки кода","структуры"])
create_question("В чём различий локальной и глобальной переменных?",
				0,
				["оба ответа верны","оба ответа неверны","область видимости","время жизни"])
create_question("Что описывает данное определение: \"Хараткеристика диапозона значенией и действия допустимые для конкретного объекта это...\"?",
				0,
				["тип данных","свойства класса","документация к коду","документация к коду"])
create_question("Как назвают класс объект кторого можно создать только в единичном экземпляре?",
				0,
				["синглтон","приватный класс","абстрактный класс","синглкласс"])

#level 1
create_question("Каковы цели проведения скрам митинга?",
				1,
				["улучшение продуктивности","общением с командой","кофе-брейк","трата времени"])
create_question("После скольких закрытых ревью можно сабмитить код?",
				1,
				["Все ревьюверы","Один из ревьюверов","Ревью тимлида","Сразу"])
create_question("Скрам митинги наиболее непродуктивны для ...?",
				1,
				["Малых команд","Больших команд","Больших команд","Распределённых команд"])
create_question("",
				1,
				["","","",""])
create_question("",
				1,
				["","","",""])
create_question("",
				1,
				["","","",""])
create_question("",
				1,
				["","","",""])
create_question("",
				1,
				["","","",""])
create_question("",
				1,
				["","","",""])
create_question("",
				1,
				["","","",""])