BankWeb.Repo.delete_all(BankWeb.Account)
BankWeb.Repo.delete_all(BankWeb.Customer)
BankWeb.Repo.delete_all(BankWeb.Transaction)

BankWeb.Repo.insert!(%BankWeb.Account{name: "Deposits"})

alice = BankWeb.Customer.build(%{username: "alice"}) |> BankWeb.Repo.insert!
{:ok, _} = BankWeb.Deposit.build(alice, 10_00) |> BankWeb.Repo.transaction

BankWeb.Customer.build(%{username: "bob"}) |> BankWeb.Repo.insert!
