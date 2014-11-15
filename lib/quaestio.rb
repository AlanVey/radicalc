require 'curb'

class Quaestio

  def initialize
    @debate_id  = nil
    @uri        = nil
  end

  def newDebate(question)
    c     = initCurb(NEW_DEBATE)
    form1 = Curl::PostField.content("question", question)

    c.http_post(NEW_DEBATE, form1)
    
    if c.response_code == 200
      @uri        = c.body_str[URI.regexp]
      @debate_id  = @uri[/\d+/]
      true
    else
      false
    end
  end

  def closeDebate(id)
    basic_queries(CLOSE_DEBATE, id)
  end

  def showDebate(id)
    basic_queries(SHOW_DEBATE, id)
  end

  def getWinnerAnswer(id)
    # Not sure how api works for this
  end

  def debate_id
    @debate_id
  end

  def uri
    @uri
  end

  private

    BASE_URI          = 'http://www.quaestio-it.com/api/'
    NEW_DEBATE        = BASE_URI + 'newDebate'
    CLOSE_DEBATE      = BASE_URI + 'closeDebate'
    SHOW_DEBATE       = BASE_URI + 'showDebate'
    GET_WINNER_DEBATE = BASE_URI + 'getWinnerDebate'

    def initCurb(uri)
      Curl::Easy.new(uri)
    end

    def basic_queries(uri, id)
      c = initCurb(uri)
      c.http_post(uri, Curl::PostField.content("debate_id", id))
      c
    end
end

=begin

newDebate - Request to create a new debate in ARG-System
POST: http://www.quaestio-it.com/api/newDebate
Parameters:
question: Question written by user.
tags:  Tag list  selected by user.
user_name: username of user involved in operation.
user_data: First name and surname of user involved in operation.
user_expertise: level of expertise of user involved in operation.

modifyDebate - Request to modify an existing debate
POST: ttp://www.quaestio-it.com/api/modifyDebate
Parameters:
debate_id: Debate ID
user_name: username of user involved in operation.
user_data: First name and surname of user involved in operation.
user_expertise: level of expertise of user involved in operation.
  
=end