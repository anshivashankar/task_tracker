defmodule TaskTracker.Repo.Migrations.AddTasksRelation do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :assigned_user, references(:users, on_delete: :nilify_all)
    end
  end
end
