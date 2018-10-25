# TaskTracker


## Design considerations part 1:

The user has a name, email, and id. This allows us to allow logins via email, but refer to logged in users by their preferred name. This is because everyone has unique emails but not unique names.
Additionally, I made the task name and description uneditable after creation. This is because the task will not change after creation. If the task needs to change, then simply update the task to be finished and create a new one.I updated the completion status to be check marks and X's since it looks cool.
I made a profile button in the navbar. This is because a user would want to see their email and ID. 

I also made sure to allow non-logged in users the ability to get in and use the app. 

# Design considerations part 2:

The Task Report for each manager (where the manager can see all of the assigned tasks to their underlings) is in their profile, since the profile also must list the underlings. I thought it only made sense that the user would also want to know what tasks their underlings also had on the same page.
Additionally, I kept the functionality that all users are able to see all tasks. I simply disabled the option for the ability to reassign tasks to those who were not the direct manager.
If a manager gets deleted, the user's manager gets nulled. They no longer have a manager, and they have the option to assign a new manager. This is a bit awkward, since it's difficult to determine hierarchy, and arbitrary managers they dont have shouldn't have control over random other users. Either way, this system works. Orphaned users have the ability to select managers, and they can recieve tasks again.


