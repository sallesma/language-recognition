class TextPreprocessor
    
    # Remove all special characters and convert all
    # letters into lowercases to obtain the set of words
    def self.prepare(text)
        text.downcase.split(" ")
    end
end