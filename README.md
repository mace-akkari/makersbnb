# Makers BNB
## Team MGOD

An Airbnb clone created for our week 5 group project at Makers.


# User Stories

### Any signed-up user can list a new space.
### Users can list multiple spaces.

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

### Users should be able to name their space, provide a short description of the space, and a price per night.

```
As a landlord,
So that I can show some information about my space,
I would like my space to have a name, description and price.
```

### Users should be able to offer a range of dates where their space is available....

```
As a landlord,
So that I can show availability for my space,
I would like to select a start date and end date.
```

### Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

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


### Nights for which a space has already been booked should not be available for users to book that space.

```
As a tenant,
So I can't book the same date as another tenant,
I only want to see spaces that are available.
```


### Until a user has confirmed a booking request, that space can still be booked for that night.

```
As a user,
Until I confirm a date for a space,
The space will still be avilable for other users to book.
```

Database Setup SQL Commands (run each command in sequential order)

CREATE DATABASE makersbnb;

CREATE DATABASE makersbnb_test;


\c makersbnb

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(50), full_name VARCHAR(50), email VARCHAR(50), password VARCHAR(255));

\c makersbnb_test

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(50), full_name VARCHAR(50), email VARCHAR(50), password VARCHAR(255))
