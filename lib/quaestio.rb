require 'curb'

class Quaestio

  def initialize
    @debate_id  = nil
    @uri        = nil
  end

  def newDebate(question, firstname, lastname)
    c     = initCurb(NEW_DEBATE)
    form1 = Curl::PostField.content("question", question)
    form1 = Curl::PostField.content("username", firstname + lastname)

    c.http_post(NEW_DEBATE, form1)
    
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

  def getUserStats
    param = { username: (firstname + lastname) }
    Curl::Easy.perform(USER_STATS + '?' + param.to_query)

    c.response_code == 200
  end


  def debate_id
    @debate_id
  end

  def uri
    @uri
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