require 'chess_knight_path'

describe "#chess_knight_path" do
  let(:board) { [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]] }

  context "initiliazing board" do
    it "should initialize a 8x8 chess board" do
      initialize_board
      expect(@squares).to eq(board)
    end
  end

  context "finding shortest path" do
    [[%w[b3 g5], 3], [%w[b7 d2], 3], [%w[g1 d7], 3], [%w[e6 d5], 2], [%w[a2 h8], 5], [%w[h2 g4], 1]].each do |solutions_array|
      it "shortpath should be #{solutions_array[1]} when squares are #{solutions_array[0][0]} and #{solutions_array[0][1]}" do
        expect(knight(solutions_array[0][0], solutions_array[0][1])).to eq(solutions_array[1])
      end
    end
  end
end
