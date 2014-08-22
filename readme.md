#Goal Tracker

This is an active record Ruby project by Randy Leighton

This allows you to add players, games and create goals scored by players in a join table.

This utilizes active record instead of SQL like the previous version of the Goal Tracker.

Project focuses on meeting assessment criteria for Active Record mastery including:

associations: relations are created and tested with shoulda-matchers between the tables.

validations: validation put on creating new Player objects, to validate if name is present. It also verifies that the jersey number is only 2 characters long.

scopes

callbacks: there is a callback function in the player class to lowercase the name input then Capitalize it.
