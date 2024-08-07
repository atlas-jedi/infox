defmodule Infox.Accounts.Commands.RegisterUser do
  alias Infox.Accounts.Commands.RegisterUser
  alias Infox.Auth

  use Domo, skip_defaults: true

  @type email :: String.t()

  defstruct [
    :user_uuid,
    :email,
    :password,
    :hashed_password
  ]

  @type t :: %__MODULE__{
          user_uuid: String.t(),
          email: email(),
          password: String.t(),
          hashed_password: String.t()
        }

  @doc """
  Hash the password and clear the original password.
  """
  def hash_password(%RegisterUser{password: password} = register_user) do
    %RegisterUser{register_user | password: nil, hashed_password: Auth.hash_password(password)}
  end
end
