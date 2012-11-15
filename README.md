Description
===========

Provides a method `validate_required_attributes` to abstract handling required\_attributes in other cookbooks.

Usage
=======

Add `depends "required_attributes"` to the metadata.rb

The cookbook you want to use this in should have an Array in `node[:cookbook_name][:required_attributes]` that's an array of symbols

```ruby
default[:mycookbook][:some_important_attribute] = nil

default[:mycookbook][:required_attributes] = [
  :some_important_attribute
]
```

In a recipe call out the validate_required_attributes method with your cookbook's name

`validate_required_attributes(:cookbook_name)`
