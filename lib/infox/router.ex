defmodule Infox.Router do
  use Commanded.Commands.Router

  alias Infox.Accounts.Aggregates.User

  alias Infox.Accounts.Commands.RegisterUser

  identify(User, by: :user_uuid, prefix: "user-")

  dispatch([RegisterUser], to: User)
end
