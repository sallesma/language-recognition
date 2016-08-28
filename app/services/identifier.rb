class Identifier

    def process(identification)
        language = identify(identification.text)
        identification.update!(language: language)
    end

    private

    def identify(text)
        words = text_processor.prepare(text)
        
        probabilities = {}
        Language.all.each do |language|
            probabilities[language] = probability(words, language)
        end

        probabilities.max_by{|_k,v| v}.try(:first)
    end

    def probability(words, language)
        probability = 0

        words.each do |word|
            probability += language.first_letters.find_by(
                letter: word.first
            ).try(:frequency) || 0

            for i in 1..word.length-1
                probability += language.chained_letters.find_by(
                    first_letter: word[i-1],
                    second_letter: word[i]
                ).try(:frequency) || 0
            end
        end

        probability
    end

    def text_processor
        @text_processor ||= TextPreprocessor.new
    end
end