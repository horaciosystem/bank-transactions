defmodule Balance do
  @name :balance

  def loop(balance) do
    receive do
      {customer_pid, :read} ->
        send(customer_pid, {:ok, balance})
      {customer_pid, :credit, value} ->
        balance = credit(balance, value)
        send(customer_pid, :ok)
      {customer_pid, :debit, value} ->
        balance = debito(balance, value)
        send(customer_pid, :ok)
    end
    loop(balance)
  end

  defp credit(balance, value) do
    balance + value
  end

  defp debito(balance, value) do
    balance - value
  end

  def start do
    initial_balance = 0.0
    pid = spawn(__MODULE__, :loop, [initial_balance])
    :global.register_name(@name, pid)
  end



end
