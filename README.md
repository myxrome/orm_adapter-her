# ORM Adapter - Her ORM Adapter

Adds Her ORM adapter to the orm_adapter project.

### ORM Adapter
>Provides a single point of entry for popular ruby ORMs. Its target audience is gem authors who want to support more than one ORM.

For more information see the [orm_adapter project](http://github.com/ianwhite/orm_adapter).

### Her ORM
>Her is an ORM (Object Relational Mapper) that maps REST resources to Ruby objects. It is designed to build applications that are powered by a RESTful API instead of a database.

For more information see the [Her ORM](https://github.com/remiprev/her)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'orm_adapter-her'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orm_adapter-her

## Devise

>Devise is a flexible authentication solution for Rails.

For more information see the [Devise](https://github.com/plataformatec/devise).

And now you can use Devise authentication based on Her ORM.

Add the following lines to Gemfile:

```ruby
gem 'her'
gem 'orm_adapter-her'
gem 'devise'
```

And then configure Devise using "--orm her" parameter:

    $ rails generate devise:install --orm her
    $ rails generate devise User --orm her
    
After that you can create User model:

```ruby
class User
  include Her::Model
  extend Devise::Models
  devise :database_authenticatable, :rememberable, :trackable

  attributes :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
             :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip

end
```

## Known Limitations and Issues

* The find_ methods does not supports order, limit and offset options. Her ORM limitation.
* Her ORM does not supports save method with arguments, but Devise has save(validate: false). This is why there is SaveFix module. Remove it if any related gems will fix the issues.
* There is no unit test. Fill free to add it.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
