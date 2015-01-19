require 'curb'
require 'json'

class Quaestio

  def initialize
    @debate_id  = nil
    @uri        = nil
    @json       = nil
  end

  def newDebate(question, firstname, lastname)
    c     = initCurb(NEW_DEBATE)
    form1 = Curl::PostField.content("question", question)
    form2 = Curl::PostField.content("username", firstname + lastname)

    c.http_post(NEW_DEBATE, form1, form2)
    
    if c.response_code == 200
      @uri        = c.body_str[URI.regexp]
      @debate_id  = @uri[/\d+/]
      true
    else
      false
    end
  end

  def createUser(firstname, lastname, email)
    c     = initCurb(CREATE_USER)
    form1 = Curl::PostField.content("username", firstname + lastname)
    form2 = Curl::PostField.content("firstname", firstname)
    form3 = Curl::PostField.content("lastname", lastname)
    form4 = Curl::PostField.content("email", email)

    c.http_post(CREATE_USER, form1, form2, form3, form4)

    c.response_code == 200
  end

  def getUserStats(firstname, lastname)
    c = initCurb(USER_STATS + "?username=#{ firstname + lastname }")

    c.perform

    @json = JSON.parse(c.body_str)

    c.response_code == 200
  end

  def getQuestionCount(firstname, lastname)
    Question.where(user_id: Profile.find_by(first_name: firstname, last_name: lastname).user.id).count
  end

  def getAnswerCount(firstname, lastname)
    getUserStats(firstname, lastname)
    @json['answersCount']
  end

  def getCommentCount(firstname, lastname)
    getUserStats(firstname, lastname)
    @json['commentsCount']
  end

  def getUserProficiency(firstname, lastname)
    getUserStats(firstname, lastname)
    @json['overallScore'].to_f
  end


  def debate_id
    @debate_id
  end

  def uri
    @uri
  end

  def json
    @json
  end

  private

    BASE_URI    = 'http://www.quaestio-it.com/api/generic/'
    CREATE_USER = BASE_URI + 'createUser'
    NEW_DEBATE  = BASE_URI + 'newDebate'
    USER_STATS  = BASE_URI + 'getUserStats'

    def initCurb(uri)
      Curl::Easy.new(uri)
    end
end