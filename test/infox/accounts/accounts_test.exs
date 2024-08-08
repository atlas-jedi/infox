defmodule Infox.Accounts.AccountsTest do
  use Infox.DataCase

  alias Infox.Accounts
  alias Infox.Accounts.Projections.User
  alias Infox.Auth

  describe "register user" do
    @tag :integration
    test "should succeed with valid data" do
      assert {:ok, %User{} = user} = Accounts.register_user(build(:user))

      assert user.email == "betinho337@gmail.com"
    end
  end
end
