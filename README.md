# Demi

WIP

Main routes of consequence are

```
GET      /:course/:timeline/:week(.:format)             weeks#show
POST     /:course/:timeline/:week/assignments(.:format) weeks#assignments
POST     /:course/:timeline/:week/goals(.:format)       weeks#goals
POST     /:course/:timeline/:week/resources(.:format)   weeks#resources
```

For reading and manipulating a week. See `specs/controllers/weeks_controller_spec.rb` for example usage.
