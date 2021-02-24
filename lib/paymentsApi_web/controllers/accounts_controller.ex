defmodule PaymentsApiWeb.AccountsController do
  use PaymentsApiWeb, :controller

  alias PaymentsApi.Account

  action_fallback PaymentsApiWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- PaymentsApi.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
