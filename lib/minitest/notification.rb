require "minitest-notification/version"
require "terminal-notifier-guard"

module Minitest
  # Test notifier for minitest via notification center.
  #
  # == Usage
  #
  # In your test helper put:
  #
  #   require 'minitest/autorun'  
  #   require 'minitest/notification'
  #
  class Notification
    def initialize(io)
      @io = io
    end

    def puts(*o)
      if o.first =~ /(\d+) failures, (\d+) errors/
        description = [ defined?(RUBY_ENGINE) ? RUBY_ENGINE : "ruby", RUBY_VERSION, RUBY_PLATFORM ].join(" ")
        if $1.to_i > 0 || $2.to_i > 0 # fail?
          TerminalNotifier::Guard.failed(o.first, :title => ":-( #{description}")
        else
          TerminalNotifier::Guard.success(o.first, :title => ":-) #{description}")
        end
      else
        @io.puts(*o)
      end
    end
  end
end

MiniTest::Unit.output = MiniTest::Notification.new(MiniTest::Unit.output)
