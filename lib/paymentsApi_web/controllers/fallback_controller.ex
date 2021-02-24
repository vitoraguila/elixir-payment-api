defmodule PaymentsApiWeb.FallbackController do
  use PaymentsApiWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(PaymentsApiWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
