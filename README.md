# WhoSings

A demo project to create a quick Demo App to test [MusixMatch Api](https://developer.musixmatch.com/) following [these criteria](./MusixmatchiOSTest.pdf).

The work has been divided in [User Stories](https://github.com/mvitolo/WhoSings/pulls?q=is%3Apr+is%3Aclosed) and for each of them has been created a PR.

## User Stories

_**1 Card Quiz**_
> As I user I want to be able to see 1 Card Quiz
> 
> So I can play the game
> 
> The card will show lyrics from one of the 
> most rated songs with three buttons
> to give three possibilities to the user

_**2 Game Quiz**_
> As I user I want to be tested with N Card Quiz
> 
> So I can see how good I am at this game
> 
> The user will open the card quiz
> The partial result will be shown un the bottom of the screen

**_3 User Login_**
> As a user I want to be able to login
> 
> to keep track of my scores 

**_4 User Scores_**
> As a user I want to be able to see my scores
> 
> So I can see how good I am

**_5 Leaderboard_**
> As a user I want to be able to see the leaderboard
> 
> so I can see all other's scores


## Notes

The main issue was mostly related to the consuption of the quota for the free tier of the api. I have so created a `LocalApiClient` conform to `ApiClient` to being able to mock locally the api responses.

It has been used a declarative approach using the third party library [UIKitPlus](https://github.com/MihaelIsaev/UIKitPlus)
