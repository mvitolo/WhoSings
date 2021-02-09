# WhoSings

A demo project to create a quick Demo App to test [MusixMatch Api](https://developer.musixmatch.com/).

The work has been divided in [User Stories](https://github.com/mvitolo/WhoSings/pulls?q=is%3Apr+is%3Aclosed) and for each of them has been created a PR.

The main issue was mostly related to the consuption of the quota for the free tier of the api. I have so created a `LocalApiClient` conform to `ApiClient` to being able to mock locally the api responses.
