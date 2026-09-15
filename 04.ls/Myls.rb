# frozen_string_literal: true

class Myls
    times = 0
   x = Array.new(2) { Array.new(3, 0) }
 y = Dir.children('.')
    x.each_with_index do |cols, row|
      cols.each_with_index do |cell, col|
        x[row][col] = y[times]
        times = times +1
      end
    end
 xx =x.transpose
p xx[0]
p xx[1]
p xx[3]

end
