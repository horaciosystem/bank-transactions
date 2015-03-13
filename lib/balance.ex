defmodule Balance do
  @name :balance

  def loop(balance) do
    receive do
      {customer_pid, :read} ->
        send(customer_pid, {:ok, balance})
      {customer_pid, :credit, value} ->
        balance = balance + value
        send(customer_pid, :ok)
      {customer_pid, :debit, value} ->
        balance = balance - value
        send(customer_pid, :ok)
    end
    loop(balance)
  end
  def pid, do: Process.whereis(@name)
  def start do
    initial_balance = 0.0
    pid = spawn(__MODULE__, :loop, [initial_balance])
    Process.register(pid, @name)
  end

  def stop do
    Process.exit(pid(), :normal )
    Process.unregister(@name)
  end

end
