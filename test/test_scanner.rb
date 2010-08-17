require 'helper'

module Wolex
  describe 'scanner' do
    it 'should scan stuff' do
      scanner = Wolex::Scanner.new
      scanner.scan_setup '10'
      scanner.next_token.must_equal [:NUMBER, 10]
    end
  end
end
