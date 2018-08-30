class Transfer

attr_reader :sender, :receiver
attr_accessor :status, :amount, :sender_previous_balance, :receiver_previous_balance


def initialize (sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  @sender_previous_balance=sender.balance
  @receiver_previous_balance=receiver.balance
end

def valid?
  if sender.valid? && receiver.valid?
    true
  else
    false
  end
end

def execute_transaction
  if @status == "complete"
    @status
  else
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end
end

def reverse_transfer
  @sender.balance = @sender_previous_balance
  @receiver.balance = @receiver_previous_balance
  @status = "reversed"
end





end
