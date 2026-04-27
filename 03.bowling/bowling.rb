score = ARGV[0]

scores = score.split(',')

shots = []
scores.each do |s|
  if s == 'X' # strike
    shots << 10
  else
    shots << s.to_i
  end
end

extra_sum=0
a=0
9.times do
  puts shots[a]
  if shots[a]==10
    extra_sum = extra_sum + shots[a+1] + shots[a+2]
    a+=1
   next
  else
    if shots[a] + shots[a+1] == 10
    extra_sum = extra_sum + shots[a+2]
    end
    a+=1
    puts shots[a]
    a+=1
  end
end


puts shots[a]
puts shots[a+1]
puts shots[a+2]
puts extra_sum + shots.sum
