#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './lib/display_builder'

class Myls
  builder = DisplayBuilder.new
  options = { column: 3, show_hidden: false }
  all_file_names = Dir.children('.')
  name_longest = all_file_names.map(&:length).max

  builder.build_display(
    all_file_names.sort,
    options[:column],
    show_hidden: options[:show_hidden]
  ).each do |file_name|
    puts file_name.map { |file| file.ljust(name_longest) }.join(' ')
  end
end
