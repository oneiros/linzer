# frozen_string_literal: true

require "simplecov"
SimpleCov.start

require "securerandom"

require "linzer"
require_relative "rfc9421_examples"
require_relative "response_helper"
require_relative "request_helper"

module Linzer
  module Test
    class << self
      def unit_tests_only?
        ENV["CI"] != "true" && ENV["LINZER_INTEG_TESTS"] != "true"
      end
    end
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
