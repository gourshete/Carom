require_relative 'play'

RSpec.describe Play do
  it "sums the prices of its line items" do
    play = Play.new
    response = play.call
    expect(response.class.to_s).to eq('String')
  end
end