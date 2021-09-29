# frozen_string_literal: true

require_relative "lib/rails_credentials_custom_key/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_credentials_custom_key"
  spec.version       = RailsCredentialsCustomKey::VERSION
  spec.authors       = ["Takumi Shotoku"]
  spec.email         = ["sinsoku.listy@gmail.com"]

  spec.summary       = "Customize how to get the master key in Rails."
  spec.description   = "Provides a way to get the master key in Rails other than environment variables and key files."
  spec.homepage      = "https://github.com/sinsoku/rails_credentials_custom_key"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 5.2"
end
