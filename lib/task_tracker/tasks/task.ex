defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completion, :boolean, default: false
    field :description, :string, default: ""
    field :time, :integer, default: 0
    field :title, :string
    field :user_num, :integer, default: 0
    belongs_to :user, TaskTracker.Users.User


    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :user_num, :time, :completion])
    |> validate_required([:title, :description, :user_num, :time, :completion])
  end
end
