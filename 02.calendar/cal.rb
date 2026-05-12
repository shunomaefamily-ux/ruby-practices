#!/usr/bin/env ruby

require 'date'
require 'optparse'

year = Date.today.year
month = Date.today.month
opts = OptionParser.new
opts.on('-y', '--year input_year', Integer) { |y| year = y }
opts.on('-m', '--month input_month', Integer) { |m| month = m }
opts.parse!(ARGV)

first_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)
calender_week_day = first_date.wday

month_and_year = "#{ first_date.strftime('%B') } #{ first_date.year }"
puts month_and_year.center(20)
puts 'Su Mo Tu We Th Fr Sa'

calender_week_day.times { print '   ' }
last_date.day.times do
  if first_date.saturday?
    puts first_date.strftime('%e')
  elsif first_date.day == last_date.day
    puts first_date.strftime('%e')
  else
    print first_date.strftime('%e') + " "
  end
  first_date += 1
end
