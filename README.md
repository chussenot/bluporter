# Assignment: Teleporter

The year is **2092** people are using teleportation instead of taking planes, boats or cars.
You're an engineer at the company **Blue Origins** that manages a limited number of teleporters.
A **teleporter** -- which looks like an elevator, can only be used by 3 people in the same time.

Your mission is to design a reservation system for people to **book a place** in a teleporter.
The resevation system should allow people to choose a departure point and a destination point
and see if any teleporters are available.

If a teleporter is available, a person should be able to reserve a place by entering his/her name.
If a teleported is busy, since is 2092 and there are no privacy issues,
anyone should be able to see the names of the persons who reserved the teleporter.

**Blue Origins** does not allow waste, so a person could register only one place in the teleporter with his/her name.
You're an awesome engineer at **Blue Origins**, so you're free to add any features not listed above.

[See the demo here!](http://bluporter.herokuapp.com/)

## Install

### Application

```
  bundle install
  bower list
  bower install
  bundle exec rake db:seed
  bundle exec rails s
```

### Ruby 2.1.1

Install ruby 2.1.1 with homebrew

```
  brew update
  brew install rbenv-gemset
  brew install ruby-build # or upgrade
  rbenv install 2.1.1
  gem install bundle
```

### Node.js and bower

```
  brew install node
  npm install bower -g
```

## Blueporter API documentation (Blueprint)

* [V1](/api.md)
