defmodule Infox.Accounts.Projectors.User do
  use Commanded.Projections.Ecto,
    application: Infox.App,
    name: "Accounts.Projectors.User",
    consistency: :strong

  alias Infox.Accounts.Events.UserRegistered

  alias Infox.Accounts.Projections.User

  project(%UserRegistered{} = registered, fn multi ->
    Ecto.Multi.insert(multi, :user, %User{
      uuid: registered.user_uuid,
      email: registered.email,
      hashed_password: registered.hashed_password
    })
  end)
end
