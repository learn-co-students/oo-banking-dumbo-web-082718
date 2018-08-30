require = 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if self.valid? && @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      "Transaction reversal rejected."
    end
  end

end
