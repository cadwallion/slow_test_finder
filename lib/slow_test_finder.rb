require "slow_test_finder/version"

module SlowTestFinder
  class << self
    attr_accessor :tests, :current_test
    def output_benchmarks
      self.tests.sort! { |a,b| a[:total_time] <=> b[:total_time] }.reverse!

      max = [25, self.tests.size].min
      puts 
      puts "Outputting Top #{max} Slowest Tests"
      puts "-------------------------------"
      puts

      (0..(max-1)).each do |idx|
        test_result = self.tests[idx]
        puts "#{test_result[:name]} - #{test_result[:total_time]}s"
      end
    end

    def start_timed_test(t)
      self.current_test = { :name => t.method_name, :start => Time.now }
    end

    def stop_timed_test
      self.tests ||= []
      result = self.current_test.dup
      result[:stop] = Time.now
      result[:total_time] = result[:stop] - result[:start] 
      self.tests.push(result)
      self.current_test = nil
    end
  end
end

if ENV['SLOW_TESTS']
  class ActiveSupport::TestCase
    setup do
      SlowTestFinder.start_timed_test(self)
    end

    teardown do
      SlowTestFinder.stop_timed_test
    end
  end

  class MiniTest::Unit
    alias_method :orig_run_anything, :_run_anything

    def _run_anything type
      orig_run_anything(type)
      SlowTestFinder.output_benchmarks
    end
  end
end
