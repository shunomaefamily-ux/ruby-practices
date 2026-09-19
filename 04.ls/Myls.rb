# frozen_string_literal: true
require_relative './lib/Myls_methods'
include MylsMethods
class Myls
  options = {  column: 3, show_hidden: false}
  all_file_names = Dir.children('.')

  build_display(all_file_names,options[:column],options[:show_hidden]).each { |hhh|
 puts hhh }

end
