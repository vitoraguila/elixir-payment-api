defmodule PaymentsApiWeb.UsersController do
  use PaymentsApiWeb, :controller

  alias PaymentsApi.User

  action_fallback PaymentsApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- PaymentsApi.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
