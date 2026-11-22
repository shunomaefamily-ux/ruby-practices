# frozen_string_literal: true

class DisplayOptions
  attr_reader :options

  DEFAULT_OPTIONS = { default_column: 3, default_show_hidden: false, ll: false }.freeze
  def initialize(column: DEFAULT_OPTIONS[:default_column], show_hidden: DEFAULT_OPTIONS[:default_show_hidden], ll: DEFAULT_OPTIONS[:ll])
    @options = { column:, show_hidden:, ll: }
  end
end
