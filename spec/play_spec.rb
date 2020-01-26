require_relative '../lib/play'

RSpec.describe Play do

  def write_to_file(player, moves)
    file_path = '/Users/swapnil/Learning/Carom'
    File.open("#{file_path}/player_#{player}_input.txt", 'w'){|file| file.write(moves)}
  end
  context 'Check results' do

    it "Case 1" do
      write_to_file('one', '1, 1, 2, 1')
      write_to_file('two', '1, 3, 4, 4')
      response = Play.new.run
      expect(response).to eq(0)
    end

    it "Case 2" do
      write_to_file('one', '1,4,4,1,1,4,1,5,6,2')
      write_to_file('two', '1, 2, 3, 4')
      response = Play.new.run
      expect(response).to eq(1)
    end

    it "Case 3" do
      write_to_file('one','1,1,1,1,5,6,2')
      write_to_file('two','1,2,3,4')
      response = Play.new.run
      expect(response).to eq(1)
    end

    it "Case 4" do
      write_to_file('one','1,1,1,0,0,0,2,4')
      write_to_file('two','1,1,4,1,0,0,2,2')
      response = Play.new.run
      expect(response).to eq(1)
    end

    it "Case 5" do
      write_to_file('one','4,1,4,0,0,0,2')
      write_to_file('two','1,1,4,1,0,0,0')
      response = Play.new.run
      expect(response.nil?).to eq(true)
    end

    it "Case 6" do
      write_to_file('one','0,1,2,1,0,1,2')
      write_to_file('two','1,1,4,1,0,1,0')
      response = Play.new.run
      expect(response).to eq(0)
    end

    it "Case 7" do
      write_to_file('one','1,1,3,1,0,1,0')
      write_to_file('two','0,1,2,1,0,4,2')
      response = Play.new.run
      expect(response).to eq(0)
    end

    it "Case 8" do
      write_to_file('one','2,1,0,1,0,1,0')
      write_to_file('two','1,1,0,1,0,4,2')
      response = Play.new.run
      expect(response).to eq(0)
    end
  end
end
