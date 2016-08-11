#!/usr/bin/env ruby

ARGF.each_line
  .reject { |line| line.strip.match(%r(\A\Z|\A(#|//))) }
  .each do |line|
    puts(line)
  end
