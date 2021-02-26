defmodule PaymentsApiWeb.AccountsController do
  use PaymentsApiWeb, :controller

  alias PaymentsApi.Account
  alias PaymentsApi.Accounts.Transaction.Response, as: TransactionResponse

  action_fallback PaymentsApiWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- PaymentsApi.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- PaymentsApi.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- PaymentsApi.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
