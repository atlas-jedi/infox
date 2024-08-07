defmodule Infox.Auth do
  @moduledoc """
  Boundary for authentication.
  Uses the bcrypt password to hash passwords.
  """

  alias Bcrypt

  def hash_password(password), do: Bcrypt.hash_pwd_salt(password)
  def validate_password(password, hash), do: Bcrypt.verify_pass(password, hash)
end
