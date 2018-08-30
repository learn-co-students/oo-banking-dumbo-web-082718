class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize (sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if sender.valid? && sender.balance > @amount && @status == "pending"
      # checking if they have enough money to send 
      receiver.deposit(@amount)
      sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.valid? && receiver.balance > @amount && @status == "complete"
      sender.deposit(@amount)
      receiver.balance -= @amount
      @status = "reversed"
    else
    end
  end



end
