class Screen

	WIDTH = 50
	LENGTH = 6

  attr_accessor :display

  def initialize
    @display = Array.new(LENGTH) { Array.new(WIDTH , '.') }
  end

	def rect(x, y)
    x.times do |row|
       y.times do |column|
          @display[column][row] = '#'
       end
    end
  end

  def rotate_row(index, shift)
    row = @display[index]
    last_values = row.drop(WIDTH - shift)
    row.insert(0, last_values).flatten!
    shift.times do
      row.pop
    end
    @display[index] = row
  end

  def rotate_column(index, shift)
    column = []
    LENGTH.times do |value|
      column.push(@display[value][index])
    end
    last_values = column.drop(LENGTH - shift)
    column.insert(0, last_values).flatten!
    shift.times { column.pop }
    LENGTH.times do |value|
      @display[value][index] = column[value]
    end
  end

  def draw
    @display.each { |row|
      row_for_out = ''
      row.each {|symbol|
        row_for_out += symbol
      }
      puts row_for_out
    }
  end

  def lightened_pixels_count
    count = Hash.new(0)
    LENGTH.times do |row_index|
      row = @display[row_index]
      row.each {|pixel| count[pixel] += 1}
    end
    count
  end
end
