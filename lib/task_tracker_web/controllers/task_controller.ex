defmodule TaskTrackerWeb.TaskController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Tasks
  alias TaskTracker.Tasks.Task

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        #|> redirect(to: Routes.task_path(conn, :show, task))
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    user_name = TaskTracker.Users.get_user(task.user_id)
    if (user_name == nil) do
      user_name = %{name: "Not assigned"}
      render(conn, "show.html", task: task, user: user_name)
    else
      render(conn, "show.html", task: task, user: user_name)
    end
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    changeset = Tasks.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)
    current_user_id = conn.assigns[:current_user].id
    |> TaskTracker.Users.get_user!
    # the below is wrong. Fix. ID refers to task id.
    assignee_user = elem(Integer.parse(task_params["user_id"]), 0)
    |> TaskTracker.Users.get_user!
    cond do
      rem(elem(Integer.parse(task_params["time"]), 0), 15) != 0 ->
        put_flash(conn, :error, "Must be a 15 minute increment.")
        |> redirect(to: Routes.task_path(conn, :index))
      # do check for correct user here.
      assignee_user.manager == nil or current_user_id.id != assignee_user.manager.id ->
        # get list of underling ids, and then check against those ids.
        put_flash(conn, :error, "You're not the manager of the new assignee. Only direct managers can assign tasks.")
        |> redirect(to: Routes.task_path(conn, :index))
    true ->
      case Tasks.update_task(task, task_params) do
        {:ok, task} ->
          conn
          |> put_flash(:info, "Task updated successfully.")
          #|> redirect(to: Routes.task_path(conn, :show, task))
          |> redirect(to: Routes.task_path(conn, :index))
        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", task: task, changeset: changeset)
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
