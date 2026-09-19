# frozen_string_literal: true

module MylsMethods
  def build_display(all_file_names, column, show_hidden: false)
    directory_file_names = show_hidden ? all_file_names : reject_hidden_files(all_file_names)
    display_cells = Array.new(column) { Array.new((directory_file_names.size.to_f / column).ceil, nil) }
    filled_display_cells = fill_cells(display_cells, directory_file_names)
    format_display_cells(filled_display_cells)
  end

  def reject_hidden_files(all_file_names)
    all_file_names.reject { |file_name| file_name.start_with?('.') }
  end

  def fill_cells(display_cells, directory_file_names)
    index = 0
    display_cells.each_with_index do |cols, row|
      cols.each_index do |col|
        display_cells[row][col] = directory_file_names[index]
        index += 1
      end
    end
  end

  def format_display_cells(display_cells)
    display_cells.transpose.map(&:compact)
  end
end
