class Trainer

    # Using all words in the set of words, calculate the
    # initial probabilities and the transition probabilities
    # initial P (x) = (occurences of X as the first letter)/(number of words)
    # chained P (x, y) = (occurences of x, y) / (number of pairs with x, z)

    def process(language, text = '')
        title, text = Wikipedia.article(language.locale) if text.blank?

        train(language, text)
    end

    private

    def train(language, text)
        words = text_processor.prepare(text)
        first_letters, chained_letters = parse_text(words)

        save_first(language, first_letters)
        save_chained(language, chained_letters)
        true
    end

    def parse_text(words)
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

    def save_first(language, first_letters)
        first_letters_sum = language.first_letters.sum(:occurences) + first_letters.values.reduce(:+)

        first_letters.each do |letter, occurences|
            first_letter = language.first_letters.find_or_create_by(
                letter: letter
            )
            first_letter.update!(
                occurences: first_letter.occurences + occurences,
                frequency: (first_letter.occurences + occurences).to_f / first_letters_sum
            )
        end
    end

    def save_chained(language, chained_letters)
        chained_letters_sums = {}
        chained_letters.keys.map {|k| k.to_s.first}.uniq.each do |fl|
            chained_letters_sums[fl] = language.chained_letters.where(first_letter: fl).sum(:occurences) + chained_letters.select { |k,_v| k.first == fl }.values.reduce(:+)
        end

        chained_letters.each do |letters, occurences|
            chained_letter = language.chained_letters.find_or_create_by(
                first_letter: letters.first,
                second_letter: letters.last
            )
            chained_letter.update!(
                occurences: chained_letter.occurences + occurences,
                frequency: (chained_letter.occurences + occurences).to_f / chained_letters_sums[letters.first]
            )
        end
    end

    def text_processor
        @text_processor ||= TextPreprocessor.new
    end
end