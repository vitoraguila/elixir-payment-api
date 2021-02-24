defmodule PaymentsApi do
  alias PaymentsApi.Users.Create, as: UserCreate

  alias PaymentsApi.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
