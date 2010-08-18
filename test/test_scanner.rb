require 'helper'

module Wolex
  describe 'scanner' do
    before do
      scanner = Wolex::Scanner.new
    end
    
    it 'should scan number' do
      scanner.scan_setup '10'
      scanner.next_token.must_equal [:NUMBER, 10]
    end

    it 'should scan plus sign' do
      scanner = Wolex::Scanner.new
      scanner.scan_setup '+'
      scanner.next_token.must_equal [:ADD, "+"]
    end

    it 'should scan additive expression' do
      scanner = Wolex::Scanner.new
      scanner.scan_setup '1+'
      scanner.next_token.must_equal [:NUMBER, 1]
      scanner.next_token.must_equal [:ADD, "+"]
    end

    it 'should scan subtractive expression' do
      scanner = Wolex::Scanner.new
      scanner.scan_setup '1-'
      scanner.next_token.must_equal [:NUMBER, 1]
      scanner.next_token.must_equal [:SUBTRACT, "-"]
    end

    it 'should scan complex expression' do
      scanner = Wolex::Scanner.new
      scanner.scan_setup '1-1+3'
      scanner.next_token.must_equal [:NUMBER, 1]
      scanner.next_token.must_equal [:SUBTRACT, "-"]
      scanner.next_token.must_equal [:NUMBER, 1]
      scanner.next_token.must_equal [:ADD, "+"]
      scanner.next_token.must_equal [:NUMBER, 3]
    end

    it 'should scan multiplication sign' do
      scanner = Wolex::Scanner.new
      scanner.scan_setup '1*'
      scanner.next_token.must_equal [:NUMBER, 1]
      scanner.next_token.must_equal [:MULTIPLY, "*"]
    end

    it 'should scan division sign' do
      scanner = Wolex::Scanner.new
      scanner.scan_setup '1 /'
      scanner.next_token.must_equal [:NUMBER, 1]
      scanner.next_token.must_equal [:BLANK, " "]
      scanner.next_token.must_equal [:DIVIDE, "/"]
    end
    
    it 'should scan whitespace' do
      scanner = Wolex::Scanner.new
      scanner.scan_setup '4 / 2 + 4'
      scanner.next_token.must_equal [:NUMBER, 4]
      scanner.next_token.must_equal [:BLANK, " "]
      scanner.next_token.must_equal [:DIVIDE, "/"]
      scanner.next_token.must_equal [:BLANK, " "]
      scanner.next_token.must_equal [:NUMBER, 2]
      scanner.next_token.must_equal [:BLANK, " "]
      scanner.next_token.must_equal [:ADD, "+"]
      scanner.next_token.must_equal [:BLANK, " "]
      scanner.next_token.must_equal [:NUMBER, 4]
    end
  end
end
