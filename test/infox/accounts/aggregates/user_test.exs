defmodule Infox.Accounts.Aggregates.UserTest do
  alias Infox.Accounts.Events.UserRegistered

  use Infox.AggregateCase, aggregate: Infox.Accounts.Aggregates.User

  describe "register user" do
    @tag :unit
    test "should succeed when valid" do
      user_uuid = UUID.uuid4()

      assert_events(build(:register_user, user_uuid: user_uuid), [
        %UserRegistered{
          user_uuid: user_uuid,
          email: "betinho337@gmail.com",
          hashed_password: "betinho337"
        }
      ])
    end
  end
end
