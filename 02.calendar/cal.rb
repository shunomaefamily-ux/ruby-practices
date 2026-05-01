require 'date'

require 'optparse'

option_year=Date.today.year
option_month=Date.today.month
opts = OptionParser.new
opts.on("-y", "--year input_year", Integer){|optioned_year|
  option_year = optioned_year
}
opts.on("-m", "--month input_month", Integer){|optioned_month|
  option_month = optioned_month
}
opts.parse!(ARGV)
day_of_this_month=Date.new(option_year, option_month, 1)
month_and_Year = day_of_this_month.strftime('%B')+" "+"#{day_of_this_month.year}"
puts month_and_Year.center(20)
puts "Su Mo Tu We Th Fr Sa"
day_of_this_month.cwday.times do
  print"   "
end
days_in_month = day_of_this_month.next_month.jd - day_of_this_month.jd
days_in_month.times do
  if day_of_this_month.cwday==6
  puts day_of_this_month.strftime('%e')
    elsif day_of_this_month.day==days_in_month
    puts day_of_this_month.strftime('%e')
    else
    print day_of_this_month.strftime('%e')+" "
  end
  day_of_this_month+=1
end
