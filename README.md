# 🏘 Apartment App

This app has been created for you to mimic the feeling of entering into a developer role where there is established code that you have not created. This apartment application has a few features that have been created for you and some key items that have been left totally untouched. Part of your job as a developer is to be able to pick up code that has already been created, understand what is going on with it, and continue the development of that code.

## 👨‍💻 How We Got Here

```
$ rails new apartment-app -d postgresql -T
$ cd apartment-app
$ rails db:create
$ bundle add rspec-rails
$ rails generate rspec:install
$ bundle add webpacker
$ bundle add react-rails
$ rails webpacker:install
$ rails webpacker:install:react
$ yarn add @babel/preset-react
$ yarn add @rails/activestorage
$ yarn add @rails/ujs
$ rails generate react:install
$ rails generate react:component App
$ bundle add devise
$ rails generate devise:install
$ rails generate devise User
$ rails db:migrate
$ rails generate controller Home index
```

## 🛠 Configurations

### Apartment Resource

The Devise User model is going to have an association with the Apartment model. In this situation, the User will have many apartments and the Apartments will belong to a User.

```bash
rails generate resource Apartment street:string city:string state:string manager:string email:string price:string bedrooms:integer bathrooms:integer pets:string image:text user_id:integer
rails db:migrate
```

### User and Apartment Associations

The Apartments will belong to a User and a User will have many apartments.

**app/models/apartment.rb**

```ruby
class Apartment < ApplicationRecord
  belongs_to :user
end
```

**app/models/user.rb**

```ruby
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :apartments
end
```

### Devise Config

**config/environments/development.rb**

```ruby
This line added:
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

**config/initializers/devise.rb**

```ruby
# This line replaced:
config.sign_out_via = :delete
# With this line:
config.sign_out_via = :get
```

Add this code into the following file:

**app/views/home/index.html.erb**

```javascript
<%= react_component 'App', {
  logged_in: user_signed_in?,
  current_user: current_user,
  new_user_route: new_user_registration_path,
  sign_in_route: new_user_session_path,
  sign_out_route: destroy_user_session_path
} %>
```

### React in Rails Config

**app/views/layouts/application.html.erb**

```ruby
# This line replaced:
<%= javascript_importmap_tags %>
# With this line:
<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
```

**config/routes.rb**

```ruby
# These lines added:
get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }
root 'home#index'
```

### React Routing Config

```bash
yarn add react-router-dom
```

**app/javascript/components/App.js**

```javascript
import { BrowserRouter, Routes, Route } from "react-router-dom"
```

### Reactstrap Config

```bash
bundle add bootstrap
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
yarn add reactstrap
```

**app/assets/stylesheets/application.scss**

```css
@import "bootstrap";
```

## ⚡️ Getting Started

Once you're able to clone the repository, within the root of the project directory, run:

```bash
bundle
yarn
rails db:setup
```

## 🏁 Start the App

```bash
rails s
```

See what is available already in the application.

- What can a USER do?
- What views (pages, components) are available?

## 🚗 Testing

To run the existing testing suite, run:

```bash
yarn test
rspec spec
```

## 🧹 Linting

To run the linter and find errors in React, run:

```bash
yarn eslint .
```

To run the linter and find errors in Rails, run:

```bash
standardrb
```

### Apartment Data Specs

Part of your responsibility will be to build out robust tests both for models and for requests.
Tests you will need are:

REQUEST:

- to ensure a user can see all apartments
- to ensure a user can see all apartments that belong to them
- to ensure a user can make a new apartment
- to ensure a user can update an apartment
- to ensure a user can remove an apartment
- to ensure a user cannot make a new apartment with nil values
- to ensure an error will be thrown if an unregistered user tried to make an apartment
- to ensure an error will be thrown if a user tries to edit an apartment that doesn't belong to them
- to ensure an error will be thrown if a user tries to delete an apartment that doesn't belong to them

MODELS:

- to ensure apartment is valid
- to ensure a user cannot make a new apartment with nil values
- to ensure a user cannot make a new apartment that already exists in the database
- to ensure a user cannot update an apartment with nil values
- to ensure a user cannot update another user's apartment
