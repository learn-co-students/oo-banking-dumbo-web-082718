require_relative './bank_account.rb'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.sender.balance - amount < 0
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    unless self.status == "complete"
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
