# RailsCredentialsCustomKey

Provides a way to get the master key in Rails other than environment variables and key files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_credentials_custom_key'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rails_credentials_custom_key

## Usage

Set the process to get the master key at the bottom of `config/application.rb`.
For example, if you use AWS Parameter Store, the code is as follows.

```ruby
RailsCredentialsCustomKey.init! do |enc_file|
  client = Aws::SSM::Client.new(region: '<region>')
  env = enc_file.content_path.basename('.yml.enc').to_s
  resp = client.get_parameter(name: "/#{env}/rails_master_key", with_decryption: true)
  resp.parameter.value
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sinsoku/rails_credentials_custom_key. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sinsoku/rails_credentials_custom_key/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsCredentialsCustomKey project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sinsoku/rails_credentials_custom_key/blob/main/CODE_OF_CONDUCT.md).
