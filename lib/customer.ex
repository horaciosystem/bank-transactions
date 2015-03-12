defmodule Customer do

  def deposit(value) do
    send(balance_pid, {self, :credit, value})
    receive do
      :ok -> IO.puts "deposit of #{value} has been sucessfully"
    end
  end

  def withdrawal(value) do #SACAR
    send(balance_pid, {self, :debit, value})
    receive do
      :ok -> IO.puts "take your money #{value}"
    end
  end

  def read_balance do
    send(balance_pid, {self, :read})
    receive do
      {:ok, ballance} -> IO.puts "Your ballance is #{ballance}"
    end
  end

  def balance_pid do
    :global.whereis_name(:balance)
  end

end
