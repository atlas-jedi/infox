defmodule Infox.Repo.Migrations.CreateAccountsUser do
  use Ecto.Migration

  def change do
    create table(:accounts_users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :username, :string
      add :email, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:accounts_users, [:username], name: :unique_username)
    create unique_index(:accounts_users, [:email], name: :unique_email)
  end
end
