defmodule Infox.Accounts.Events.UserRegistered do
  @derive Jason.Encoder
  defstruct [
    :user_uuid,
    :email,
    :hashed_password
  ]
end
