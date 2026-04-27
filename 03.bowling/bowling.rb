x = [0,10,1,5,0,0,0,0,10,10,10,5,1,8,1,0,4]

extra_sum=0
a=0
9.times do
  puts x[a]
  if x[a]==10
    extra_sum = extra_sum + x[a+1] + x[a+2]
    a+=1
   next
  else
    if x[a] + x[a+1] == 10
    extra_sum = extra_sum + x[a+2]
    end
    a+=1
    puts x[a]
    a+=1
  end
end


puts x[a]
puts x[a+1]
puts x[a+2]
puts extra_sum + x.sum
