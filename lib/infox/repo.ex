defmodule Infox.Repo do
  use Ecto.Repo,
    otp_app: :infox,
    adapter: Ecto.Adapters.Postgres
end
