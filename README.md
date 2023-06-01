# Devise Encryptable AES

Add AES encryption support for Devise

## Table of Contents

- [Getting started](#getting-started)
- [Configuration](#configuration)
- [Usage](#usage)

## Getting started

Add the following line to your Gemfile:

```ruby
gem 'devise', '~> 4.9'
gem 'devise_encryptable_aes', '~> 0.2.0'
```

Then run `bundle install`

## Configuration

Add the `encryptable` module to your model:

```ruby
class User < ActiveRecord::Base
  devise :database_authenticatable, :encryptable
end
```

And add the `password_salt` field to the database through a migration:

```ruby
class DeviseCreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_salt, :string
  end
end
```

Enable the AES encryptor in <tt>config/initializers/devise.rb</tt>

```ruby
# Uncomment the generated pepper
config.pepper = "long random string"
# Enable the AES encryptor
config.encryptor = :aes256
```

## Usage

Compare password

```ruby
::Devise::Encryptable::Encryptors::Aes256.compare(encrypted_password, password, Devise.pepper)
```

Decrypt password

```ruby
::Devise::Encryptable::Encryptors::Aes256.decrypt(encrypted_password, Devise.pepper)
```

If you get an error when using <tt>valid_password?</tt>, you can customize the <tt>valid_password?</tt> function to

```ruby
  def valid_password?(password)
    ::Devise::Encryptable::Encryptors::Aes256.compare(encrypted_password, password, Devise.pepper)
  end
```
