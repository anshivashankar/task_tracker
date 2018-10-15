defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :id, :integer
      add :title, :string
      add :description, :text
      add :user, :integer
      add :time, :integer
      add :completion, :boolean, default: false, null: false

      timestamps()
    end

  end
end
