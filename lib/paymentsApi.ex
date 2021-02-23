defmodule PaymentsApi do
  alias PaymentsApi.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
