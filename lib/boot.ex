Balance.start
Enum.map(1..10,
  fn(e) ->
    spawn_link(fn() ->
      Customer.deposit(e * 2)
    end)
    spawn_link(fn() ->
      Customer.withdrawal(e)
    end)
end)

# Enum.map(1..100,
#   fn(e) -> spawn_link(fn() ->
#     Customer.withdrawal(e)
#   end)
# end)

# Enum.map(1..10000,
#   fn(e) -> spawn_link(fn() ->
#     Customer.deposit(e)
#   end)
# end)

:timer.sleep(1000)
Customer.read_balance
# Customer.deposit 10
# Customer.read_ballance
# Customer.deposit 100
# Customer.read_ballance
# Customer.withdrawal 40
# Customer.read_ballance
