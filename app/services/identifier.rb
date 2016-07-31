class Identifier

    def self.identify(text)
        words = TextPreprocessor.prepare(text)
        
        probabilities = {}
        Language.all.each do |language|
            probabilities[language] = self.probability(words, language)
        end

        puts probabilities
        probabilities.max_by{|k,v| v}.first
    end

    def self.probability(words, language)
        probability = 0

        words.each do |word|
            probability += FirstLetter.find_by(
                letter: word.first,
                language: language
            ).try(:frequency) || 0

            for i in 1..word.length-1
                probability += ChainedLetter.find_by(
                    first_letter: word[i-1],
                    second_letter: word[i],
                    language: language
                ).try(:frequency) || 0
            end
        end

        probability
    end
end