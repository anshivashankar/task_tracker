# TaskTracker

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## Design considerations:

The user has a name, email, and id. This allows us to allow logins via email, but refer to logged in users by their preferred name. This is because everyone has unique emails but not unique names.
Additionally, I made the task name and description uneditable after creation. This is because the task will not change after creation. If the task needs to change, then simply update the task to be finished and create a new one.I updated the completion status to be check marks and X's since it looks cool.
I made a profile button in the navbar. This is because a user would want to see their email and ID. 

I also made sure to allow non-logged in users the ability to get in and use the app. 

