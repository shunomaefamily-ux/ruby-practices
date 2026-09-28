# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/display_builder'

class DisplayBuilderTest < Minitest::Test
  
    def test_show_hidden_false_true
      builder = DisplayBuilder.new
      options = {  column: 3, show_hidden: false}
      y = ["Gemfile", "Gemfile.lock", "Procfile", "README.md", "babel.config.js", "bin", "config", "config.ru", "log", "package.json", "postcss.config.js"]
    assert_equal [["Gemfile", "babel.config.js", "log"], ["Gemfile.lock", "bin", "package.json"], ["Procfile", "config", "postcss.config.js"], ["README.md", "config.ru"]], builder.build_display(y,options[:column])
    end

    def test_show_hidden_false
      builder = DisplayBuilder.new
      options = {  column: 3, show_hidden: false}
      y = ["Gemfile", "Gemfile.lock", "Procfile", "README.md", "babel.config.js", "bin", "config", "config.ru", "log", "package.json", ".postcss.config.js"]
      assert_equal [["Gemfile", "babel.config.js", "log"], ["Gemfile.lock", "bin", "package.json"], ["Procfile", "config"], ["README.md", "config.ru"]], builder.build_display(y,options[:column],show_hidden: false)
    end
end
