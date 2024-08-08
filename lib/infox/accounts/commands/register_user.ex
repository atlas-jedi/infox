defmodule Infox.Accounts.Commands.RegisterUser do
  alias Infox.Accounts.Commands.RegisterUser
  alias Infox.Accounts.Projections.User
  alias Infox.Auth

  use Domo, skip_defaults: true

  @type email :: String.t()
  precond(email: &validate_email/1)

  defstruct [
    :user_uuid,
    :email,
    :password,
    :hashed_password
  ]

  @type t :: %__MODULE__{
          user_uuid: String.t() | nil,
          email: email(),
          password: String.t(),
          hashed_password: String.t()
        }

  defp validate_email(email) do
    case Regex.match?(~r/\S+@\S+\.\S+/, email) do
      true -> :ok
      false -> {:error, "invalid email"}
    end

    case Infox.Repo.get_by(User, email: email) do
      nil -> :ok
      _ -> {:error, "email already registered"}
    end
  end

  @doc """
  Assign a unique identity to the user.
  """
  def assign_uuid(%RegisterUser{} = register_user, uuid) do
    %RegisterUser{register_user | user_uuid: uuid}
  end

  @doc """
  Hash the password and clear the original password.
  """
  def hash_password(%RegisterUser{password: password} = register_user) do
    %RegisterUser{register_user | password: nil, hashed_password: Auth.hash_password(password)}
  end
end
