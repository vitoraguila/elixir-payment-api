defmodule PaymentsApiWeb.AccountsControllerText do
  use PaymentsApiWeb.ConnCase

  alias PaymentsApi.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "vvv",
        password: "123456",
        nickname: "eee",
        email: "vvv@teste.com",
        age: 23
      }

      {:ok, %User{account: %Account{id: account_id}}} = PaymentsApi.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic dml0b3I6YWJjMTIz")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, do a deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{
                 "balance" => "50.00",
                 "id" => _id
               },
               "message" => "Balance changed successfully"
             } = response
    end
  end
end
