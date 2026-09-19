# frozen_string_literal: true

require_relative './lib/myls_methods'

class Myls
  extend MylsMethods
  options = { column: 3, show_hidden: false }
  all_file_names = Dir.children('.')

  build_display(
    all_file_names,
    options[:column],
    show_hidden: options[:show_hidden]
  ).each do |file_name|
    puts file_name
  end
end
