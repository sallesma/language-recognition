class Trainer

    def self.train(text, locale)
        self.clear_language(locale)
        words = TextPreprocessor.prepare(text)
        self.probabilities(words, locale)
    end

    # TODO refactor/delete when training is incremental
    def self.clear_language(locale)
        FirstLetter.where(locale: locale).destroy_all
        ChainedLetter.where(locale: locale).destroy_all
    end

    # Using all words in the set of words, calculate the
    # initial probabilities and the transition probabilities
    # initial P (x) = (occurences of X as the first letter)/(number of words)
    # chained P (x, y) = (occurences of x, y) / (number of pairs with x, z)
    def self.probabilities(words, locale)
        words.each do |word|
            FirstLetter.find_or_create_by(
                letter: word.first,
                locale: locale
            ).increment!(:occurences)

            for i in 1..word.length-1
                ChainedLetter.find_or_create_by(
                    first_letter: word[i-1],
                    second_letter: word[i],
                    locale: locale
                ).increment(:occurences)
            end
        end

        FirstLetter.where(locale: locale).each do |letter|
            letter.update(frequency: letter.occurences.to_f / words.count)
        end
        ChainedLetter.where(locale: locale).each do |letter|
            letter.update(
                frequency: letter.occurences.to_f / ChainedLetter.where(locale: locale, first_letter: letter.first_letter).count
            )
        end
    end
end