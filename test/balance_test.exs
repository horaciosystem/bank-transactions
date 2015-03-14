defmodule BalanceTest do
  use ExUnit.Case

  def ballance_restart do
    if Balance.pid do
      Balance.stop
    end
    Balance.start
  end

  test "it starts and finishes" do
    Balance.start
    assert Process.alive?(Balance.pid)
    Balance.stop
    assert Balance.pid == nil
  end

  test "balance starts with 0.0" do
    ballance_restart
    assert Customer.read_balance == 0.0
    Balance.stop
  end

  test "increases after deposit and decreases after withdrawal" do
    ballance_restart
    Customer.deposit 500.0
    assert Customer.read_balance == 500.0
    Customer.withdrawal 100.0
    assert Customer.read_balance == 400.0
    Balance.stop
  end

   test "make sure it's not possible to withdrawal more then available in account" do
     ballance_restart
     assert Customer.withdrawal(100.0) == :failed
     assert Customer.read_balance == 0.0
     Customer.deposit 400.0
     assert Customer.withdrawal(100.0) == :ok
     assert Customer.read_balance == 300.0
     Balance.stop
   end
end
