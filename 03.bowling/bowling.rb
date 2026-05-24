#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []

shots = scores.map { |s| s == 'X' ? 10 : s.to_i }

a = 0
extra_sum = 9.times.sum do
  if shots[a] == 10
    a += 1
    shots[a] + shots[a + 1]
  else
    a += 2
    if shots[a- 2] + shots[a - 1] == 10
      shots[a]
    else
      0
    end
  end
end

puts extra_sum + shots.sum
