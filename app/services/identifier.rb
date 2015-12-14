class Identifier

    def self.identify(text)
        words = TextPreprocessor.prepare(text)
        
        probabilities = {}
        FirstLetter.pluck(:locale).uniq.each do |locale|
            probabilities[locale] = self.probability(words, locale)
        end

        puts probabilities
        probabilities.max_by{|k,v| v}.first
    end

    def self.probability(words, locale)
        probability = 0

        words.each do |word|
            probability += FirstLetter.find_by(
                letter: word.first,
                locale: locale
            ).try(:frequency) || 0

            for i in 1..word.length-1
                probability += ChainedLetter.find_by(
                    first_letter: word[i-1],
                    second_letter: word[i],
                    locale: locale
                ).try(:frequency) || 0
            end
        end

        probability
    end
end