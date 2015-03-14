defmodule Customer do

  def deposit(value) do
    send(Balance.pid, {self, :credit, value})
    receive do
      :ok -> IO.puts "deposit of #{value} has been sucessfully"
    end
  end

  def withdrawal(value) do #SACAR
    send(Balance.pid, {self, :debit, value})
    receive do
      :ok -> IO.puts "take your money #{value}"
      :no_ballance ->
        IO.puts "Not enough ballance"
        :failed
    end
  end

  def read_balance do
    send(Balance.pid, {self, :read})
    receive do
      {:ok, ballance} -> 
        IO.puts "Your ballance is #{ballance}"
        ballance
    end
  end

end
