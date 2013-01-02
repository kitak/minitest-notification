# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest-notification/version'

Gem::Specification.new do |gem|
  gem.name          = "minitest-notification"
  gem.version       = Minitest::Notification::VERSION
  gem.authors       = ["Keisuke KITA"]
  gem.email         = ["kei.kita2501@gmail.com"]
  gem.description   = %q{Test notifier for minitest via OSX Notification Center}
  gem.summary       = %q{Display graphical notifications when testing with minitest.}
  gem.homepage      = "https://github.com/kitak/minitest-notification"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'terminal-notifier-guard'
  gem.add_runtime_dependency 'minitest'
end
