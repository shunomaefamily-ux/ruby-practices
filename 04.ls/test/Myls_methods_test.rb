# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/Myls_methods'


class MylsMethodsTest < Minitest::Test
  include MylsMethods
  
    def test_jaks
      options = {  column: 3, show_hidden: false}
       y = ["Gemfile", "Gemfile.lock", "Procfile", "README.md", "babel.config.js", "bin", "config", "config.ru", "log", "package.json", "postcss.config.js"]
    

    assert_equal [["Gemfile", "babel.config.js", "log"], ["Gemfile.lock", "bin", "package.json"], ["Procfile", "config", "postcss.config.js"], ["README.md", "config.ru"]], jaks(y,options[:column])

    end

    def test_jaksllll
      options = {  column: 3, show_hidden: true}
       y = ["Gemfile", "Gemfile.lock", "Procfile", "README.md", "babel.config.js", "bin", "config", "config.ru", "log", "package.json", ".postcss.config.js"]
    

    assert_equal [["Gemfile", "babel.config.js", "log"], ["Gemfile.lock", "bin", "package.json"], ["Procfile", "config"], ["README.md", "config.ru"]], jaks(y,options[:column],options[:show_hidden])

    end



end
