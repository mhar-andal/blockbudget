module AILogic
  def self.process_question(question)
    case question.downcase
    when 'how much $ do i have?'
      return "$3,512"
    when 'what is my next scheduled purchase?'
      return "[item]"
    else
      return "Sorry, I don't know that question"
    end
  end
end
