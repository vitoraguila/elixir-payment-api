defmodule PaymentsApi.Users.CreateTest do
  use PaymentsApi.DataCase

  alias PaymentsApi.User
  alias PaymentsApi.Users.Create

  describe "call/1" do
    test "When all params are valid, return an user" do
      params = %{
        name: "vvv",
        password: "123456",
        nickname: "eee",
        email: "vvv@teste.com",
        age: 23
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "vvv", age: 23, id: ^user_id} = user
    end

    test "When there are invalid params, returns an error" do
      params = %{
        name: "dd",
        nickname: "eee",
        email: "vvv@teste.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
