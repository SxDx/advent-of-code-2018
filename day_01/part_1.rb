# frozen_string_literal: true

puts File.readlines(File.join(File.dirname(__FILE__), "input.txt")).map(&:to_i).inject(0, :+)