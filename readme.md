# A "Bog" Adventure App - Intro to Rails 

| background |
|---|
|A bog is a mire that accumulates peat, a deposit of dead plant material—often mosses. |

Researchers at your local biology lab are exploring and documenting a series of bogs, and the creatures of interest. Our job is to encourage people in the community to explore the bogs and submit their findings using our web application.

We'll be creating a single model app to demonstrate editing resources.
It's important to get comfortable with the process of starting a new Rails app since you'll be doing that for quite awhile

##Components

### Bog Model

* A creature model that stores `name` and `description`

### Bog Controller

* A controller for your home page
* A controller that manages bog creature


### Bog Routes / Views

| route | action / view | bonus? |
|-------|--------|------|
| GET /  | Your home page | no. |
| GET /creature | list all creatures | no. |
| GET /creature/new | show add creature form | no. |
| POST /creature | create creature (no view) | no. |
| GET /creature/1 | list creature (id=1) | no. |
| GET /creature/2/edit | show edit creature form (id=2) | **bonus** |
| PUT /creature/3 | update an existing creature (id=3) | **bonus** |

##Recommended Process

###Create basic app

* Fork / clone
* cd into directory
* Create app `rails new ./ -T`
* Test app
    * Run server `rails s`
    * Goto localhost:3000


###Build specific functionality

* Create model `rails g model ...` (you write the rest of this command)
* Migrate `rake db:migrate`
* Test models
    * run console `rails c`
    * Try some stuff...
        * `Creature.all`
        * `Creature.create`
        * `Createre.new`
        * `Creature.find`
        * ...etc ...etc
* Close console run `rails s`
* Create routes...
    * Add route to `routes.rb`
    * Add controller / action
    * Add view
    * Test (go to url in browser)
    * Repeat for each view
* Add HTML to each view
    * Use bootstrap
    * Make it pretty... oh so pretty!!!
* Add code to make the app functional

## Bonus

* Make a navigation bar
* Make an edit form to edit an existing *Creature*
* Make a delete button for each *Creature*
 



