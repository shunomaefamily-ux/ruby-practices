#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []

shots = scores.map do |s|
  if s == 'X' # strike
    10
  else
    s.to_i
  end
end

extra_sum = 0
a = 0
9.times do
  if shots[a] == 10
    extra_sum = extra_sum + shots[a + 1] + shots[a + 2]
    a += 1
    next
  else
    extra_sum += shots[a + 2] if shots[a] + shots[a + 1] == 10
    a += 2
  end
end

puts extra_sum + shots.sum
