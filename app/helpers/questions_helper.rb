module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Изменение вопроса в тесте #{question.test.title}"
    else
      "Создание вопроса в тесте #{question.test.title}"
    end
  end
end
