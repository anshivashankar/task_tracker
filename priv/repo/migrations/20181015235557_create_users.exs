defmodule TaskTracker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :manager_id, :id
      add :is_manager, :boolean, default: false, null: false

      timestamps()
    end

  end
end
