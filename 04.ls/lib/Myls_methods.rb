# frozen_string_literal: true


module MylsMethods
  def jaks(y,column,show_hidden = false)
      index = 0
      y = reject_hidden_files(y,show_hidden)
   x = Array.new(column) { Array.new((y.size.to_f/column).ceil, nil) }
    x.each_with_index do |cols, row|
      cols.each_with_index do |cell, col|
        x[row][col] = y[index]
        index = index +1
      end
    end
   xx = x.transpose
   xx = xx.map{|file| file.compact}
   xx


  end

  def reject_hidden_files(yf,show_hidden)
      if show_hidden
      hh = yf.reject{|faile_name|faile_name.start_with?(".")}
      return hh
      end
      yf
    end


end