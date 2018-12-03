# frozen_string_literal: true
require 'set'

frequency = 0
seen_frequencies = Set[0]
input = File.readlines(File.join(File.dirname(__FILE__), "input.txt")).map(&:to_i)

input.cycle do |change|
  frequency += change
  break unless seen_frequencies.add?(frequency)
end

puts frequency
  