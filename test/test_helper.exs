ExUnit.start()

defmodule TestHelper do
require Balance

  def balance_restart do
    if Balance.pid do
      Balance.stop
    end
    Balance.start
  end

end
