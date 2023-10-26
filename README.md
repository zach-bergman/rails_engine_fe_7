# Consuming your Rails Engine API

Congratulations! You've written your first API. Just like the API you consumed for your week 1 project, your Rails Engine API can be used by other projects now, too. For this challenge, you will create a front end application that will make calls to your backend application, the Rails Engine API you have just created.

## Learning/Review Goals:
* Practice TDD
* Consume an API
* Gain familiarity with service-oriented architecture

## Setup

Just like your week 1 project, this will be a new Rails app. You should fork this repository. 

```sh
git clone <your forked copy of this repo>
cd rails_engine_fe
bundle
bundle exec rails db:create
```

In `/config/puma.rb`, you'll notice that the port has changed from 3000 to 5000. This should be on or around line 12.

We do this because Rails Engine is not in production or hosted somewhere other than localhost. If Rails Engine is running on port 3000, our front end will need to have a different port so they can run at the same time. Now, when we do `rails s`, our front end application will automatically use port 5000. You can also do this manually every time you start your server by passing the port number with a `-p` flag like so:
`rails s -p 5000`. You should see that your server is "listening on tcp://localhost:5000" now instead of the usual 3000.

```ruby
port        ENV.fetch("PORT") { 5000 }
```

**In order for your frontend to properly get data from your backend Rails Engine API, you must keep your backend server running locally at the same time.**

## The Challenge

### 1. Merchants Index
As a visitor, <br>
When I visit '/merchants' <br>
I should see a list of merchants by name <br>
and each merchant's name is a link to their show page (merchants/:id).

<br>
<br>

![Wireframe for /merchants index](/docs/rails_engine_challenge_merchants.png)

<br>
<br>


### 2. Merchants Show
When I visit the merchants index page (`/merchants`)<br>
and I click a merchant's name <br>
I should be on page `'/merchants/:id'` <br>
And I should see that merchant's name
and a list of items that merchant sells.

<br>
<br>

![Wireframe for /merchants show](/docs/rails_engine_challenge_merchants_show.png)

<br>
<br>

### 3. Items Index 
As a visitor, <br>
When I visit '/items' <br>
I should see a list of item names,<br>
and each name is a link to that item's show page (`/items/:id`),<br>
and when I click on that link, I am taken to that item's show page<br>
where I see the name of the item, its description, and unit price.<br>

<br>
<br>

## Extra Practice
If you have time or want extra practice, complete the following user stories that match the "Find One" and "Find All" endpoints of your backend project's "Section Two" requirements.


### 4. Find One
As a visitor, <br>
when I visit `/search`, <br>
I see a form that allows me to search for a single Merchant (or a single Item) by its name.<br>


### 5. Find All
As a visitor<br>
when I visit `/search`,<br>
I see a form that allows me to search for all Merchants (or Items) by name, min_price, or max_price.

![Wireframe for Search Page](/docs/rails_engine_challenge_search.png)
