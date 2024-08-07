defmodule Infox.Accounts.Aggregates.User do
  defstruct [
    :uuid,
    :email,
    :hashed_password
  ]

  alias Infox.Accounts.Aggregates.User
  alias Infox.Accounts.Commands.RegisterUser
  alias Infox.Accounts.Events.UserRegistered

  @doc """
  Register a user
  """
  def execute(%User{uuid: nil}, %RegisterUser{} = register) do
    %UserRegistered{
      user_uuid: register.user_uuid,
      email: register.email,
      hashed_password: register.hashed_password
    }
  end

  # State Mutators
  def apply(%User{} = user, %UserRegistered{} = registered) do
    %User{
      user
      | uuid: registered.user_uuid,
        email: registered.email,
        hashed_password: registered.hashed_password
    }
  end
end
