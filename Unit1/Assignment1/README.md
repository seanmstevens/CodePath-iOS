# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

<img src="demo2.gif" width=250><br>

### Notes
Describe any challenges encountered while building the app.
---
Getting the required user stories done was a fairly simple task, as the walkthroughs are very thorough
and any problems that I ran into as a result of using a newer iOS and XCode version were easy to remedy
through Googling. The hardest part of the assignment was the the bonus user story for showing the trailer.
I wanted to use Alamofire for making the API call, however their documentation is difficult to understand,
so I just reused the same networking code we've been using. If I have time later on, I'll go back and
refactor this project with better API call logic.

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll though a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF

<img src="demo.gif" width=250><br>

### Notes
Describe any challenges encountered while building the app.

Although I had enough time to try the bonus user story where I run the app on my physical device,
I was not able to do so because I have a beta iOS build on my phone, and I do not have the requisite
beta XCode version installed on my machine to run the code. Hopefully by the next portion of the assignment
I will be able to figure out how to get the app running on my phone.
