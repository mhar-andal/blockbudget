module AILogic
  def self.process_question(question)
    case question.downcase
    when 'how much $ do i have?'
      return "$3,512"
<<<<<<< HEAD
    when 'what is my next scheduled purchase?'
      return "[item]"
=======
    when 'can i go out for dinner?'
      return "Yes you can! You have $62.35 left budgeted for eating out for the rest of the month."
    when 'do i need to pay taxes on bitcoin?'
      return 'Of course you do.'
    when 'pay my electricity bill'
      return 'Paid. you have $112.46 left in your Utilities budget this month'
>>>>>>> 134900c103cd757ad68eeb6de25e9eec9bded264
    else
      return "Sorry, I don't know that question."
    end
  end
end
