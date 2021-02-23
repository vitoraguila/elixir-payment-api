defmodule PaymentsApi.Users.Create do
  alias PaymentsApi.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
