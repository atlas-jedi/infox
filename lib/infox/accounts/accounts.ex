defmodule Infox.Accounts do
  @moduledoc """
  The boundary for the Accounts context.
  """

  alias Infox.Accounts.Commands.RegisterUser
  alias Infox.Accounts.Projections.User
  alias Infox.App
  alias Infox.Repo

  @doc """
  Register a new user
  """
  def register_user(attrs \\ %{}) do
    uuid = UUID.uuid4()

    register_user =
      attrs
      |> RegisterUser.new!()
      |> RegisterUser.assign_uuid(uuid)
      |> RegisterUser.hash_password()

    with :ok <- App.dispatch(register_user, consistency: :strong) do
      get(User, uuid)
    end
  end

  defp get(schema, uuid) do
    case Repo.get(schema, uuid) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end
end
