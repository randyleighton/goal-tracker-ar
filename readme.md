#Goal Tracker

This is a Ruby project by Randy Leighton. This utilizes active record instead of SQL like the previous version of the Goal Tracker.

This app allows you to add players, games and create goals scored by players.

Project is designed to meet assessment criteria for Active Record mastery including:

1. Associations: Relations are created and tested with shoulda-matchers between the tables.

2. Validations: Validation put on creating new Player objects, to validate if name is present. It also verifies that the jersey number is numeric and a maximum of 2 characters long. Testing is in place for each validation in the class it is called on.

3. Scopes - There is a class method in Game for searching for games by date.

4. Callbacks: there is a callback function in the player class to lowercase the name input then Capitalize it. There is a test in place for this method.
