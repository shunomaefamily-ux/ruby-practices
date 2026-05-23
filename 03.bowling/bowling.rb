#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []

shots = scores.map { |s| s == 'X' ? 10 : s.to_i }

extra_sum = 0
a = 0
9.times do
  if shots[a] == 10
    a += 1
    extra_sum = extra_sum + shots[a] + shots[a + 1]
  else
    a += 2
    extra_sum += shots[a] if shots[a- 2] + shots[a - 1] == 10
  end
end

puts extra_sum + shots.sum
