require 'rspec/core/formatters/base_formatter'

module RSpec
  module Core
    module Formatters

      class JunitFormatter < BaseFormatter

        def initialize(output)
          super(output)  
        end

        def start(example_count)
          puts "start(example_count) #{example_count}"
        end

        # This method is invoked at the beginning of the execution of each example group.
        # +example_group+ is the example_group.
        #
        # The next method to be invoked after this is +example_passed+,
        # +example_pending+, or +example_finished+
        def example_group_started(example_group)
          puts "example_group_started(example_group) #{example_group}"
        end

        # This method is invoked at the end of the execution of each example group.
        # +example_group+ is the example_group.
        def example_group_finished(example_group)
          puts "example_group_finished(example_group) #{example_group}"
        end

        def example_started(example)
          puts "example_started(example) #{example}"
        end

        def example_passed(example)
          puts "example_passed(example) #{example}"
        end

        def example_pending(example)
          puts "example_pending(example) #{example}"
        end

        def example_failed(example)
          puts "example_failed(example) #{example}"
        end

        def message(message)
          puts "message(message) #{message}"
        end

        def stop
          puts "stop"
        end

        # This method is invoked after all of the examples have executed. The next method
        # to be invoked after this one is #dump_failure (once for each failed example),
        def start_dump
          puts "start_dump"
        end

        # Dumps detailed information about each example failure.
        def dump_failures
          puts "dump_failures"
        end

        # This method is invoked after the dumping of examples and failures.
        def dump_summary(duration, example_count, failure_count, pending_count)
          puts "dump_summary"
        end

        # This gets invoked after the summary if option is set to do so.
        def dump_pending
          puts "dump_pending"
        end

        def seed(number)
          puts "seed(number) #{number}"
        end

        # This method is invoked at the very end. Allows the formatter to clean up, like closing open streams.
        def close
          puts "close"
        end

        def format_backtrace(backtrace, example)
          puts "format_backtrace(backtrace, example) #{backtrace} #{example}" 
        end

      private

        # def format_caller(caller_info)
        #   backtrace_line(caller_info.to_s.split(':in `block').first)
        # end

        # def dump_backtrace(example)
        #   format_backtrace(example.execution_result[:exception].backtrace, example).each do |backtrace_info|
        #     output.puts cyan("#{long_padding}# #{backtrace_info}")
        #   end
        # end

        # def dump_pending_fixed(example, index)
        #   output.puts "#{short_padding}#{index.next}) #{example.full_description} FIXED"
        #   output.puts blue("#{long_padding}Expected pending '#{example.metadata[:execution_result][:pending_message]}' to fail. No Error was raised.")
        # end

        # def pending_fixed?(example)
        #   example.execution_result[:exception].pending_fixed?
        # end

        # def dump_failure(example, index)
        #   output.puts "#{short_padding}#{index.next}) #{example.full_description}"
        #   dump_failure_info(example)
        # end

        # def dump_failure_info(example)
        #   exception = example.execution_result[:exception]
        #   output.puts "#{long_padding}#{red("Failure/Error:")} #{red(read_failed_line(exception, example).strip)}"
        #   output.puts "#{long_padding}#{red(exception.class.name << ":")}" unless exception.class.name =~ /RSpec/
        #   exception.message.split("\n").each { |line| output.puts "#{long_padding}  #{red(line)}" } if exception.message
        #   if shared_group = find_shared_group(example)
        #     dump_shared_failure_info(shared_group)
        #   end
        # end

        # def dump_shared_failure_info(group)
        #   output.puts "#{long_padding}Shared Example Group: \"#{group.metadata[:shared_group_name]}\" called from " +
        #     "#{backtrace_line(group.metadata[:example_group][:location])}"
        # end

        # def find_shared_group(example)
        #   group_and_ancestors(example).find {|group| group.metadata[:shared_group_name]}
        # end

        # def group_and_ancestors(example)
        #   example.example_group.ancestors.push(example.example_group)
        # end
      end
    end
  end
end
