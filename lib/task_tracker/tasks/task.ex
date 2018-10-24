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
    IO.inspect(attrs)
    #user_id = case Map.fetch(attrs, "user_id") do
    #  {:ok, val} -> val
    #  _ -> nil
    #end
    #attrs = Map.put(attrs, "user_id", user_id)
    task
    |> cast(attrs, [:title, :description, :user_id, :time, :completion])
    |> validate_required([:title, :description, :time, :completion])
  end
end
