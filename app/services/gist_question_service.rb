class GistQuestionService

  ResultObject = Struct.new(:success?, :html_url)

  def initialize(question, client = octokit_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    gist = @client.create_gist(gist_params)
    ResultObject.new(gist.html_url.present?, gist.html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description_message', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def octokit_client
    Octokit::Client.new(access_token: ENV['GIST_TOKEN'])
  end
end

