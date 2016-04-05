# [time2eat](http://time2eat1.herokuapp.com/)
A voting app that allows a group of people to vote on questions such as where should the group eat, what should the group eat, what should the budget be, and so forth.

This was coded from 08 Mar 2016 to 16 Mar 2016 as a group project (teams of 4-5 people) for NEXT Academy's January 2016 bootcamp. The team presented this app on 16 Mar 2016 to NEXT Academy students and staff.


Deployed [here](http://time2eat1.herokuapp.com/).


## Stack
#### Back End
* Ruby 2.2
* Rails 4.2.5.2
* Postgresql database 0.18.4

### Front End
* Bootstrap-sass 3.3.6

## APIs
* Yelp
* Google Maps

## App Flow

### Landing Page
* Succintly explains the app
* User can enter their email to subscribe to time2eat updates

### Sign Up / Log In
* User signs up (and is immediately logged in) OR user logs in

### Voting Groups
* User can create a voting group with a title and a description
* If the user created the voting group, they can add other users by username
    * If the user tries to add non-existent or duplicate usernames, a pop-up will notify the user.

### Questions
* User can create, edit, view, and delete questions and question options. For example...
    * Question: What should we eat?
    * Question Options: Burgers, Noodles, Steamboat

### Vote
* User can create and edit their vote
* On the voting results page, the user can view...
    * the voting results
    * whether they have voted
    * view the number of people who have voted (eg: 2 out of 3 people have voted)

### Search
* From the voting results page, the user can perform a Yelp search. (eg: burgers at Boston)

### View Search Results
* User can view their search results (name, description, Yelp rating, number of reviews, categories)
* User can click through to the business' Yelp page
* A Google Map marks the location of all the search results. The markers have the businesses' name and description

Developers
----------
* [Janice Shiu](https://github.com/contrepoint)
* [Man Darasirigul](https://github.com/manjarb)
* [YC Lim](https://github.com/yclim95)

Testing
----------
This app was not developed in a TDD manner. The developers realise that this is a weakness.