defmodule TaskTracker.Repo.Migrations.AddUserRelation do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :manager_id, references(:users, on_delete: :nilify_all)
      add :task_id, references(:tasks, on_delete: :nilify_all)
    end
    
    create index(:users, [:task_id])

  end
end
