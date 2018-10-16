defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completion, :boolean, default: false
    field :description, :string, default: ""
    field :time, :integer, default: 0
    field :title, :string
    field :user, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :user, :time, :completion])
    |> validate_required([:title, :description, :user, :time, :completion])
  end
end
