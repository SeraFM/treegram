Treegram

A photo-sharing web application allows users to open photos account and then log in to the application in order to upload
photos to the server and make them accessible to other users. We assume that the accounts are public. Each user can choose specific users that they wish to follow. When a followed user posts a photo, the following user sees the photo in the the next time they refresh their page in the application. The photos of the user and followed users are displayed in reverse chronological order. order of publication. A user can add comments to a photo that
to a photo he or she posts or to photos of users he or she follows. Finally, a user can delete a previously posted photo with all its comments.


Installation and Usage
------------
Run Postrges Sever

Clone or download this repository and cd into indent directory

```
$ rake db:create
$ rake db:migrate
$ rails server
```

In your browser visit:
```
localhost:3000
```
