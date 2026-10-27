# frozen_string_literal: true

class DisplayOptions
  attr_reader :options

  DEFAULT_OPTIONS = { column: 3, show_hidden: false }.freeze
  def initialized(colmun: DEFAULT_OPTIONPS[:colmun], show_hidden: DEFAULT_OPTIONPS[:show_hidden])
    @options = [colmun, show_hidden]
  end
end
