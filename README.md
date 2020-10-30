# <div style="text-align: center">Makers BnB (Team MGOD) </div>

<div style="text-align: center"> by: <a href="https://github.com/mace-akkari">Mace</a>, <a href="https://github.com/gonzalober">Gonzalo</a>, <a href="https://github.com/otisvg">Otis</a>, <a href="https://github.com/dan-holmes">Dan</a></div>
<br>


#### Project Summary
An Airbnb clone created for our Week 5 group project at Makers. We were given a list of specifications that we broke down into into the user stories listed below. We used these user stories to split up tasks and assign them to pairs. 

If you would like to try our project out, you'll first need to create a PostgresSQL database and include relevant tables - the commands for doing so can be found at the end of this document.
<br>
---
#### Successes
* We got on really well as a group and approached every day with a positive attitude.
* We held daily stand-ups, midday-checkins and a retro at the end of the working day.
* We all had a chance to work on important features, and would review and merge eachothers' pull requests so everyone could have input, and understand eachothers' code.


#### Challenges and how we overcame them
* We found using the git branch/pull request/merge workflow confusing at first - we weren't certain that we were applying it correctly. We decided to watch a few videos together to ensure that we were approaching this new git workflow correctly, and soon after, we were able to confidently apply this newfound knowledge.
* When a pair got blocked, or just needed some help with understanding a concept, we wouldn't shy away from asking the other pair for help - which often helped unblock us. If we were still blocked, we'd reach out to a coach.

#### What we learnt this week
* Consolidated knowledge on building Sinatra apps using a database
* How to implement ActiveRecord, and define custom methods when necessary
* How to implement BCrypt password authentication
* Breaking down a specification into user stories, and assigning them as tasks to pairs
* How to coordinate effectively as a team
* How to use the git branch/pull request/merge workflow
* How to apply CSS to make our app look pretty

#### Our process for splitting user stories and pairing in general
* A big priority was ensuring everyone on the team could understand the codebase as a whole - whilst merging our pull requests we would each explain our changes to the group.
* We prioritised pairing on tasks that we felt could help us consolidate knowledge and learn concepts we may not have initially been as confident with. For example, if a couple of people wanted to learn more about ActiveRecord, they would pair up and work on a task associated with ActiveRecord (e.g. user authentication/listing spaces).

<br>

## User Stories


```
As a user,  
So I can access spaces,  
I would like to sign up.
```

```
As a landlord,  
So that I can advertise my space,  
I would like to be able list multiple spaces.
```

```
As a landlord,
So that I can show some information about my space,
I would like my space to have a name, description and price.
```

```
As a landlord,
So that I can show availability for my space,
I would like to select a start date and end date.
```

```
As a tenant,
So I can hire a space,
I would like to request to hire a space for one night.
```

```
As a landlord,
So I can rent my space,
I would like to approve requests from tenants.
```

```
As a tenant,
So I can't book the same date as another tenant,
I only want to see spaces that are available.
```

```
As a user,
Until I confirm a date for a space,
The space will still be avilable for other users to book.
```

### Database Setup SQL Commands (run each command in sequential order)

##### Setting up the main database
```
CREATE DATABASE makersbnb;

\c makersbnb;

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(50), full_name VARCHAR(50), email VARCHAR(50), password VARCHAR(255));

CREATE TABLE spaces (id SERIAL PRIMARY KEY, description VARCHAR(120), price INT4, location VARCHAR(60), start_date DATE, end_date DATE, user_id INT4);

CREATE TABLE requests (id SERIAL PRIMARY KEY, user_id INT4, space_id INT4, date DATE, confirmed BOOL);
```

##### Setting up the test database
```
CREATE DATABASE makersbnb_test;

\c makersbnb_test

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(50), full_name VARCHAR(50), email VARCHAR(50), password VARCHAR(255);

CREATE TABLE spaces (id SERIAL PRIMARY KEY, description VARCHAR(120), price INT4, location VARCHAR(60), start_date DATE, end_date DATE, user_id INT4);

CREATE TABLE requests (id SERIAL PRIMARY KEY, user_id INT4, space_id INT4, date DATE, confirmed BOOL);
```
