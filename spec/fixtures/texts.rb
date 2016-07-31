module Fixtures
  module BasicEnglish
    def self.text
      "This is a test."
    end

    def self.first_letters
      [
        ['t', 2, 0.5],
        ['i', 1, 0.25],
        ['a', 1, 0.25]
      ]
    end

    def self.chained_letters
      [
        ['t', 'h', 1, 0.5],
        ['h', 'i', 1, 1.0],
        ['i', 's', 2, 1.0],
        ['t', 'e', 1, 0.5],
        ['e', 's', 1, 1.0],
        ['s', 't', 1, 1.0]
      ]
    end
  end
end