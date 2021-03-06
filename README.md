# TaskTracker


## Design considerations part 1:

The user has a name, email, and id. This allows us to allow logins via email, but refer to logged in users by their preferred name. This is because everyone has unique emails but not unique names.
Additionally, I made the task name and description uneditable after creation. This is because the task will not change after creation. If the task needs to change, then simply update the task to be finished and create a new one.I updated the completion status to be check marks and X's since it looks cool.
I made a profile button in the navbar. This is because a user would want to see their email and ID. 

I also made sure to allow non-logged in users the ability to get in and use the app. 

# Design considerations part 2:

##NOTE that the create new time block does NOT work very well with Firefox. It is better in chrome.

The Task Report for each manager (where the manager can see all of the assigned tasks to their underlings) is in their profile, since the profile also must list the underlings. I thought it only made sense that the user would also want to know what tasks their underlings also had on the same page.
Additionally, I kept the functionality that all users are able to see all tasks. I simply disabled the option for the ability to reassign tasks to those who were not the direct manager.
If a manager gets deleted, the user's manager gets nulled. They no longer have a manager, and they have the option to assign a new manager. This is a bit awkward, since it's difficult to determine hierarchy, and arbitrary managers they dont have shouldn't have control over random other users. Either way, this system works. Orphaned users have the ability to select managers, and they can recieve tasks again.

I also made sure that anyone can complete any task, even if it's not assigned to them. From my own experience, even if a task was assigned to me by my manager, anyone would be able to complete it for me, if we were working together, or for some other reason. 
Similarly, anyone can unassign a task from themselves. This is because if a task needs to pass from assignee to assignee and neither assignee shares a manager, there is no mechanism to do so. Because of this, anyone can unassign tasks, but only managers can assign them.

Lastly, I made it so that a not-logged-in user can only view the whole list of tasks (the index page) and can't do anything else. This is because we want to encourage users to log in.
