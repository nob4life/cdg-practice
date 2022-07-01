require 'rspec'
require './main.rb'

RSpec.describe "Main" do
  it "greeting" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Slava', 'Rusinov', "24")
    expect(greeting).to eq('Привет Slava Rusinov. Самое время заняться делом!')
  end

  it "returns sum or second argument" do
    expect(foobar(2,3)).to eq(5)
    expect(foobar(20,3)).to eq(3)
    expect(foobar(3,20)).to eq(20)
  end
end