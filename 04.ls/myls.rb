#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './lib/display_builder'

class Myls
  builder = DisplayBuilder.new
  OPTIONS = { column: 3, show_hidden: false }.freeze
  all_file_names = Dir.children('.')
  all_file_names.map(&:length).max

  builder.build_display(
    all_file_names.sort,
    column: OPTIONS[:column],
    show_hidden: OPTIONS[:show_hidden]
  ).each do |file_name|
    puts file_name.map.with_index { |file, index| file.ljust(builder.column_widths[index]) }.join(' ')
  end
end
