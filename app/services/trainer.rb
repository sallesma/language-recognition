class Trainer

    def self.train(text, language)
        self.clear_language(language)
        words = self.parse(text)
        self.probabilities(words, language)
    end

    # TODO refactor/delete when training is incremental
    def self.clear_language(language)
        FirstLetter.where(language: language).destroy_all
        ChainedLetter.where(language: language).destroy_all
    end

    # Remove all special characters and convert all
    # letters into lowercases to obtain the set of words
    def self.parse(text)
        text.downcase.split(" ")
    end

    # Using all words in the set of words, calculate the
    # initial probabilities and the transition probabilities
    # initial P (x) = (occurences of X as the first letter)/(number of words)
    # chained P (x, y) = (occurences of x, y) / (number of pairs with x, z)
    def self.probabilities(words, language)
        words.each do |word|
            FirstLetter.find_or_create_by(
                letter: word.first,
                language: language
            ).increment!(:occurences)

            for i in 1..word.length-1
                ChainedLetter.find_or_create_by(
                    first_letter: word[i-1],
                    second_letter: word[i],
                    language: language
                ).increment(:occurences)
            end
        end

        FirstLetter.where(language: language).each do |letter|
            letter.update(frequency: letter.occurences.to_f / words.count)
        end
        ChainedLetter.where(language: language).each do |letter|
            letter.update(
                frequency: letter.occurences.to_f / ChainedLetter.where(language: language, first_letter: letter.first_letter).count
            )
        end
    end
end