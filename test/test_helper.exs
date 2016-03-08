ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Centor.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Centor.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Centor.Repo)

