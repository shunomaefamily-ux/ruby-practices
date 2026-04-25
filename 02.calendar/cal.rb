require 'date'
require "optparse"
option_year=Date.today.year
option_month=Date.today.month
opts = OptionParser.new
opts.on("-y", "--year N1", Integer){|w1|
  option_year = w1
}
opts.on("-m", "--month N2", Integer){|w2|
  option_month = w2
}
opts.parse!(ARGV)
a=Date.new(option_year, option_month, 1)
Month_and_Year = a.strftime('%B')+" "+"#{a.year}"
puts Month_and_Year.center(20)
puts "Su Mo Tu We Th Fr Sa"
a.cwday.times do
  print"   "
end
days_in_month = a.next_month.jd - a.jd
days_in_month.times do
  if a.cwday==6
  puts a.strftime('%e')
    elsif a.day==days_in_month
    puts a.strftime('%e')
    else
    print a.strftime('%e')+" "
  end
  a+=1
end
