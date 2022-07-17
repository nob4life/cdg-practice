require "./CRUD.rb"
require "rspec"

RSpec.describe 'Actors Management' do
  let(:string) do
    <<-STRING
    Hello
    Goodbye
    czxcz
    czxczx
    xzczxcz
    STRING
  end

  before { File.write(FILMS, string) }

  it '#index' do
    expect{ index }.to output(string).to_stdout
  end

  it '#find' do
    expect{ find(1) }.to output(string).to eq("Goodbyu")
  end

  #
end
