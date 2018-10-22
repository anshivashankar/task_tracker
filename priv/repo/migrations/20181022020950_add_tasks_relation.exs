defmodule TaskTracker.Repo.Migrations.AddTasksRelation do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :user_id, references(:users, on_delete: :nilify_all)
    end

    create index(:tasks, [:user_id])
  end
end
