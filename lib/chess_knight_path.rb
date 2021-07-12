def initialize_board
  @squares = []
  @unvisited_squares = []
  @distances = {}
  (0..7).to_a.each do |x_coordinate|
    (0..7).to_a.each do |y_coordinate|
      @squares.push([x_coordinate, y_coordinate])
      @unvisited_squares.push([x_coordinate, y_coordinate])
    end
  end
  @squares.each do |square|
    @distances[square] = 10
  end
end

def find_nearest_square
  mini = 10
  summit = []
  @unvisited_squares.each do |square|
    if @distances[square] < mini
      mini = @distances[square]
      summit = square
    end
  end
  summit
end

def find_neighbour_square(current_square)
  neighbours = []
  [[-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]].each do |moves|
    new_x_coordinate = current_square[0] + moves[0]
    new_y_coordinate = current_square[1] + moves[1]
    if new_x_coordinate >= 0 && new_x_coordinate <= 7 && new_y_coordinate >= 0 && new_y_coordinate <= 7
      neighbours.push([new_x_coordinate, new_y_coordinate])
    end
  end
  neighbours
end

def update_distance(current_square, neighbour_square)
  return unless @distances[neighbour_square] > @distances[current_square] + 1

  @distances[neighbour_square] = @distances[current_square] + 1
  @previous_squares[neighbour_square] = current_square
end

def knight(start, finish)
  letters = ('a'..'h').to_a
  @previous_squares = {}
  initialize_board
  source_square = @squares.find { |square| square[0] == letters.index(start.chars.first) && square[1] == start.chars.last.to_i - 1 }
  @distances[source_square] = 0
  until @unvisited_squares.empty?
    nearest_square = find_nearest_square
    @unvisited_squares.delete(nearest_square)
    neighbour_squares = find_neighbour_square(nearest_square)
    neighbour_squares.each do |square|
      update_distance(nearest_square, square)
    end
  end
  final_square = @squares.find { |square| square[0] == letters.index(finish.chars.first) && square[1] == finish.chars.last.to_i - 1 }
  @distances[final_square]
end


