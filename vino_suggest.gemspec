require_relative 'lib/vino_suggest/version'

Gem::Specification.new do |spec|
  spec.name          = "vino_suggest"
  spec.version       = VinoSuggest::VERSION
  spec.authors       = ["Emma Bindi"]
  spec.email         = ["emma.bindi@outlook.com"]

  spec.summary       = "Wine Selection Assistant - Terminal Application."
  spec.description   = "Em's Wine Selection Assistant is a terminal app design to assist user's with the decision making process of identifying and selecting a bottle of wine to purchase from the list of available options, within their budget and according to their preference."
  spec.homepage      = "https://github.com/emmabindi/wine-terminal-app"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "colorize", "~> 0.8.1"
  spec.add_dependency "rubocop", "~> 0.80.1"
  spec.add_dependency "tty-prompt", "~> 0.21.0"
  spec.add_dependency "terminal-table", "~> 1.8.0"
  spec.add_dependency "artii", "~> 2.1.2"
end
