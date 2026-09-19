# frozen_string_literal: true


module MylsMethods
  def jaks(y,column,show_hidden = false)
      index = 0
      if show_hidden
      y = y.reject{|faile_name|faile_name.start_with?(".")}
      end
   x = Array.new(column) { Array.new((y.size.to_f/column).ceil, nil) }
    x.each_with_index do |cols, row|
      cols.each_with_index do |cell, col|
        x[row][col] = y[index]
        index = index +1
      end
    end
   xx = x.transpose
   xx


  end


end