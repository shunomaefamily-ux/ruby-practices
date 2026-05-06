#!/usr/bin/env ruby

require 'date'
require 'optparse'

year = Date.today.year
month = Date.today.month
opts = OptionParser.new
opts.on('-y', '--year input_year', Integer) { |y| year = y }
opts.on('-m', '--month input_month', Integer) { |m| month = m }
opts.parse!(ARGV)
day_of_this_month = Date.new(year, month, 1)
month_and_year = "#{day_of_this_month.strftime('%B')} #{day_of_this_month.year}"
puts month_and_year.center(20)
puts 'Su Mo Tu We Th Fr Sa'
calender_week_day = day_of_this_month.cwday % 7
calender_week_day.times { print '   ' }
days_in_month = Date.new(year, month, -1) - day_of_this_month
days_in_month.to_i.times do
  if day_of_this_month.cwday == 6
    puts day_of_this_month.strftime('%e')
  elsif day_of_this_month.day == days_in_month.to_i
    puts day_of_this_month.strftime('%e')
  else
    print day_of_this_month.strftime('%e') + " "
  end
  day_of_this_month += 1
end
