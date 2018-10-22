defmodule TaskTracker.Repo.Migrations.AddUserRelation do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :manager, references(:users, on_delete: :nilify_all)
      add :underlings, references(:users, on_delete: :nilify_all)
      add :tasks_assigned, references(:tasks, on_delete: :nilify_all)
    end
  end
end
