require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
 end

 def valid?
   @sender.valid? == true && @receiver.valid? == true
 end

 def execute_transaction

   if @status == "pending"
     @sender.balance -= @amount
     @receiver.balance += @amount
     if @sender.valid? == true
       @status = "complete"
     else
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   else
    end
 end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end

  end


end
