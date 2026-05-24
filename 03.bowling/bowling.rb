#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []

shots = scores.map { |s| s == 'X' ? 10 : s.to_i }

a = 0
bonus_scores = 9.times.sum do
  if shots[a] == 10
    a += 1
    shots[a] + shots[a + 1]
  else
    a += 2
    shots[a- 2] + shots[a - 1] == 10 ? shots[a] : 0
  end
end

puts bonus_scores + shots.sum
