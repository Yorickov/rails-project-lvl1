# frozen_string_literal: true

require_relative "lib/hexlet_code/version"

Gem::Specification.new do |spec|
  spec.name          = "hexlet_code"
  spec.version       = HexletCode::VERSION
  spec.authors       = "Dzmitry Monich"
  spec.email         = ["yorickov@gmail.com"]

  spec.summary       = "Plain DSL form builder"
  spec.description   = "Generates html-forms via DSL according to passed options"
  spec.homepage      = "https://github.com/Yorickov/rails-project-lvl1"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.1"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  spec.metadata["bug_tracker_uri"] = "https://github.com/Yorickov/rails-project-lvl1/issues"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  # spec.executables << 'rake'
  spec.require_paths = ["lib"]

  spec.extra_rdoc_files = ["README", "LICENSE.txt"]
  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency "pry", "~> 0.13.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
  spec.add_development_dependency "solargraph"

  spec.post_install_message = "Thanks for installing!"
  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
