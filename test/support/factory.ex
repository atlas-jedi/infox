defmodule Infox.Factory do
  use ExMachina

  alias Infox.Accounts.Commands.RegisterUser

  def user_factory do
    %{
      email: "betinho337@gmail.com",
      password: "betinho337",
      hashed_password: "betinho337"
    }
  end

  def register_user_factory do
    struct(RegisterUser, build(:user))
  end
end
