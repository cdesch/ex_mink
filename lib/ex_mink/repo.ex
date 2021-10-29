defmodule ExMink.Repo do
  use Ecto.Repo,
    otp_app: :ex_mink,
    adapter: Ecto.Adapters.Postgres
end
