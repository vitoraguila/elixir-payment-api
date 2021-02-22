defmodule PaymentsApi.Repo do
  use Ecto.Repo,
    otp_app: :paymentsApi,
    adapter: Ecto.Adapters.Postgres
end
