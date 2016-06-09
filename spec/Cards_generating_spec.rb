require_relative '../Inspection'
require_relative '../Constants'
require 'active_support/core_ext/kernel/reporting'
require 'pry'
 
describe 'Testing' do

  let(:cards1) {
    ['CT','CJ','CQ','CK','CA','D6','S5']
  }
  let(:cards2) {
    ['CT','CJ','CQ','CK','C9','D6','S5']
  }
  let(:cards3) {
    ['CT','C8','C7','HQ','C9','C6','S5']
  }
  let(:cards4) {
    ['C4','H4','D4','S4','C9','C6','S5']
  }
  let(:cards5) {
    ['C4','H4','D4','S6','C9','C6','S5']
  }
  let(:cards6) {
    ['C4','H4','D4','S6','C9','C7','S5']
  }
  let(:cards7) {
    ['C4','H4','D6','S6','C9','C7','S5']
  }
  let(:cards8) {
    ['C4','H4','DQ','S6','C9','C7','S5']
  }
  let(:cards9) {
    ['C4','HA','D2','S6','C9','C7','S5']
  }
  let(:cards10) {
    ['C4','H5','D7','S6','C8','CA','ST']
  }
  describe 'Flush Royal' do
    context "when cards = ['CT','CJ','CQ','CK','CA','D6','S5'] then Flush Royal" do
      it 'has right answer' do
        output = capture(:stdout) do
          inspect_combos_by_suit(cards1)
        end
        expect(output).to include 'Flush Royal'
      end
    end
  end
  describe 'Straight Flush' do
    context "when cards = ['CT','CJ','CQ','CK','C9','D6','S5'] then Straight Flush" do
      it 'has right answer' do
        output = capture(:stdout) do
          inspect_combos_by_suit(cards2)
        end
        expect(output).to include 'Straight Flush'
      end
    end
  end
  describe 'Flush' do
    context "when cards = ['CT','C8','C7','HQ','C9','C6','S5'] then Flush" do
      it 'has right answer' do
        output = capture(:stdout) do
          inspect_combos_by_suit(cards3)
        end
        expect(output).to include 'Flush'
      end
    end
  end
  describe 'Kind of four' do
    context "when cards = ['C4','H4','D4','S4','C9','C6','S5'] then Kind of four" do
      it 'has right answer' do
        expect(cards_values_inspect(cards4)).to include 'Kind of four'
      end
    end
  end
  describe 'Full House' do
    context "when cards = ['C4','H4','D4','S6','C9','C6','S5'] then Full House" do
      it 'has right answer' do
        expect(cards_values_inspect(cards5)).to include 'Full House'
      end
    end
  end
  describe 'Three of a kind' do
    context "when cards = ['C4','H4','D4','S6','C9','C7','S5'] then Three of a kind" do
      it 'has right answer' do
        expect(cards_values_inspect(cards6)).to include 'Three of a kind'
      end
    end
  end
  describe 'Two pairs' do
    context "when cards = ['C4','H4','D6','S6','C9','C7','S5'] then Two pairs" do
      it 'has right answer' do
        expect(cards_values_inspect(cards7)).to include 'Two pairs'
      end
    end
  end
  describe 'Pair of a kind' do
    context "when cards = ['C4','H4','DQ','S6','C9','C7','S5'] then Pair" do
      it 'has right answer' do
        expect(cards_values_inspect(cards8)).to include 'Pair'
      end
    end
  end
  describe 'High card' do
    context "when cards = ['C4','HA','D2','S6','C9','C7','S5'] then High card" do
      it 'has right answer' do
        expect(cards_values_inspect(cards9)).to include 'High card'
      end
    end
  end
  describe 'Straight' do
    context "when cards = ['C4','H5','D7','S6','C8','CA','ST'] then Straight" do
      it 'has right answer' do
        expect(straight_inspect(cards10)).to include 'Straight'
      end
    end
  end
end