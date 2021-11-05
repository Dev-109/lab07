# Lab 07
## Overview
For this lab, you will modify the previous lab to use Firestore Cloud as its data source.  The result will be that it could share the data between clients (if using the same account), and changes made by one client will be automatically visible to other clients.

## Instructions
The previous lab had you develop a model which uses SQLite, such that it was kept separated from the user interface.  This will make it somewhat easier for us to migrate to a cloud database.  The `Grade` class should remain the same as does the UI and working of the app, except that this time data would come from cloud (Firestore). 

## Firestore Database
You are required to create a Firestore Database called `grades`. Add some data to it (try and put at least 10 documents to it). Each document should have `sid` as `string` and a `grade` as `string`. Below is the screenshot of sample database created in Firestore:
<br />
<br />
![the grade form page](https://github.com/csci-4100u/lab07/blob/cbb05f7abae5fa9122c62094da6647dda5ab9526/images/database_screenshot.PNG)

### Changes to the User Interface
While it is normally desirable to make minimal changes to the user interface, in this case we need to since we want to support live updates when data is modified in our cloud store.  We'll accomplish this task by using a `StreamBuilder`.  `StreamBuilder` is a class which expects a stream of data, and re-builds the UI when the data has changed.  We've used this class in the in-class demo.  This `StreamBuilder` will now be used to build the `ListView` created in the previous lab.  Try and remove `setState()` method as deemed necessary to avoid unncessary updating of the UI as `StreamBuilder` will do that for us.

Make sure all the features of the app work, e.g., `add`, `delete` and `update` (for this exercise, update should just update the grade of the selected item of the `ListView` to `A`). Make sure the selected item of the ListView still changes its color on selection like the previous lab.
You are free to remove `refresh` icon from the `AppBar`.

Below might be some useful link on how to add, delete and update using FireStore.

Cloud FireStore - https://firebase.flutter.dev/docs/firestore/usage/

## Getting Help
If you run into difficulty, you may wish to check out some of the following resources:

- https://api.flutter.dev/  - The standard documentation for Flutter, all classes and methods.
- https://dart.dev/tutorials - A series of tutorials for the Dart programming language, focusing entirely on the features of Dart.
- https://flutter.dev/docs/reference/tutorials - A series of tutorials for the Flutter platform, focusing mainly on the widgets and API.
- https://flutter.dev/docs/codelabs - A series of deep-dive, more comprehensive, tutorials to learn more about the Flutter platform.
- https://flutter.dev/docs/cookbook - A set of recipes for commonly used features of Flutter.
- https://github.com/flutter/samples/blob/master/INDEX.md - A repository containing some completed Flutter applications.
- http://stackoverflow.com/ - A forum for asking questions about programming.  I bet you know this one already!

Of course, you can always ask the TA for help!  However, learning how to find the answers out for yourself is not only more satisfying, but results in greater learning as well.

## How to Submit
Create your flutter project inside this folder, commit, and then push your code to this repository to submit your lab assignment.
