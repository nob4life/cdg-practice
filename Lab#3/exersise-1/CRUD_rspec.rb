require "./CRUD.rb"
require "rspec"

RSpec.describe 'Actors Management' do
  let(:string) do
    <<-STRING
    Hello
    Goodbye
    Report
    Gazaring
    People
    STRING
  end

  before { File.write(FILMS, string) }

  it '#index' do
    expect{ index }.to output(string).to_stdout
  end

end
