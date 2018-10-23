defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :is_manager, :boolean
    belongs_to :manager, TaskTracker.Users.User
    has_many :task, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :manager_id])
    |> validate_required([:name, :email])
  end
end
