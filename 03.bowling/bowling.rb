#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = scores.map { |s| s == 'X' ? 10 : s.to_i }

frame_first = 0
bonus_scores = 9.times.sum do
  if shots[frame_first] == 10
    bonus_score = shots[frame_first + 1] + shots[frame_first + 2]
    frame_first += 1
  else
    bonus_score = shots[frame_first] + shots[frame_first + 1] == 10 ? shots[frame_first + 2] : 0
    frame_first += 2
  end
  bonus_score
end

puts bonus_scores + shots.sum
