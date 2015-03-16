defmodule BalanceTest do
  use ExUnit.Case
  require TestHelper

  test "it starts and finishes" do
    Balance.start
    assert Process.alive?(Balance.pid)
    Balance.stop
    assert Balance.pid == nil
  end

  test "balance starts with 0.0" do
    TestHelper.balance_restart
    assert Customer.read_balance == 0.0
    Balance.stop
  end
end
