#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './lib/display_builder'
require_relative './lib/display_options'
require 'optparse'
require 'etc'

opt = OptionParser.new

options = {}
opt.on('-a') { options[:show_hidden] = true }
opt.on('-l') { options[:ll] = true }
opt.parse!(ARGV)

myls_options = DisplayOptions.new(**options)

builder = DisplayBuilder.new
all_file_names = Dir.entries('.')
unless options[:ll]
  builder.build_display(
    all_file_names.sort,
    column: myls_options.options[:column],
    show_hidden: myls_options.options[:show_hidden]
  ).each do |file_name|
    puts file_name.map.with_index { |file, index| file.ljust(builder.column_widths[index]) }.join(' ')
  end
end

def rwxrwxrwx(file_state)
  ggg = file_state.mode.digits(2)
  t = ggg.each_with_index.map { |x, i| x.zero? ? '-' : 'xwrxwrxwr'[i] }[0..8].join + kana(ggg[12..])
  t.reverse
end

def kana(name)
  {
    [0, 0, 1, 1] => 's',
    [0, 1, 0, 1] => 'l',
    [0, 0, 0, 1] => '-',
    [0, 1, 1] => 'b',
    [0, 0, 1] => 'd',
    [0, 1] => 'c',
    [1] => 'p'
  }[name]
end
if options[:ll]
  kkkk = []
  builder.reject_hidden_files(all_file_names).each do |name|
    name_stat = File.stat(name)

    kkkk << [rwxrwxrwx(name_stat), name_stat.nlink.to_s, Etc.getpwuid(name_stat.uid).name, Etc.getgrgid(name_stat.gid).name, name_stat.size.to_s,
             name_stat.mtime.strftime('%b %e %H:%M'), name]
  end
  kkkk = kkkk.sort { |dddd, ffff| dddd[-1] <=> ffff[-1] }
  lkjl = kkkk.transpose.map { |cell| cell.map { |ggg| ggg.to_s.length } }.map(&:max)

  kkkk.each do |file_name|
    puts file_name.each_with_index.map { |file, index| file.ljust(lkjl[index]) }.join(' ')
  end
end
