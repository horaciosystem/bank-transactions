defmodule BalanceTest do
  use ExUnit.Case

  test "it starts and finishes" do
    Balance.start
    assert Process.alive?(Balance.pid)
    Balance.stop
    assert Balance.pid == nil
  end

  test "balance starts with 0.0" do
    Balance.start
    assert Customer.read_balance == 0.0
    Balance.stop
  end

  test "increases after deposit and decreases after withdrawal" do
    Balance.start
    Customer.deposit 500.0
    assert Customer.read_balance == 500.0
    Customer.withdrawal 100.0
    assert Customer.read_balance == 400.0
    Balance.stop
  end
end
