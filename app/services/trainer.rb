class Trainer

    # Using all words in the set of words, calculate the
    # initial probabilities and the transition probabilities
    # initial P (x) = (occurences of X as the first letter)/(number of words)
    # chained P (x, y) = (occurences of x, y) / (number of pairs with x, z)

    def self.train(text, locale)
        words = TextPreprocessor.prepare(text)
        first_letters, chained_letters = self.parse_text(words)

        language = self.language(locale)
        self.save_first(first_letters, language)
        self.save_chained(chained_letters, language)
        true
    end

    def self.language(locale)
        Language.find_or_create_by(locale: locale)
    end

    def self.parse_text(words)
        first_letters = {} # {letter: occurences}
        chained_letters = {} # {letters: occurences}

        words.each do |word|
            first_letters[word.first] = (first_letters[word.first] || 0) + 1

            for i in 1..word.length-1
                key = word[i-1] + word[i]
                chained_letters[key] = (chained_letters[key] || 0) + 1
            end
        end

        return first_letters, chained_letters
    end

    def self.save_first(first_letters, language)
        first_letters_sum = FirstLetter.where(language: language).sum(:occurences) + first_letters.values.reduce(:+)

        first_letters.each do |letter, occurences|
            first_letter = FirstLetter.find_or_create_by(
                letter: letter,
                language: language
            )
            first_letter.update(
                occurences: first_letter.occurences + occurences,
                frequency: (first_letter.occurences + occurences).to_f / first_letters_sum
            )
        end
    end

    def self.save_chained(chained_letters, language)
        chained_letters_sums = {}
        chained_letters.keys.map {|k| k.to_s.first}.uniq.each do |fl|
            chained_letters_sums[fl] = ChainedLetter.where(language: language, first_letter: fl).sum(:occurences) + chained_letters.select { |k,v| k.first == fl }.values.reduce(:+)
        end

        chained_letters.each do |letters, occurences|
            chained_letter = ChainedLetter.find_or_create_by(
                first_letter: letters.first,
                second_letter: letters.last,
                language: language
            )
            chained_letter.update(
                occurences: chained_letter.occurences + occurences,
                frequency: (chained_letter.occurences + occurences).to_f / chained_letters_sums[letters.first]
            )
        end
    end
end