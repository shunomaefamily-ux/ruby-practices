# frozen_string_literal: true
require_relative './lib/Myls_methods'
class Myls
  options{  column: 3, show_hidden: false}
  y = Dir.children('.')

  put_directry(Dir.children)
  include MylsMethods
end

myls = Myls.new

myls.jaks
