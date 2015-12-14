desc "Fetch wikipedia articles from one language to train"
task :auto_train_from_wikipedia => :environment do
  puts 'Starting training...'
  language = ARGV[1].to_s
  locale = ARGV[2].to_s
  number = ARGV[3]
  puts language
  puts locale
  puts number

  for i in 1..number.to_i
    puts "Training with text number: #{i}"
    title, text = Wikipedia.article(locale)
    puts "Training from: #{title}, number of characters: #{text.length}"
    Trainer.train(text, language)
  end

  puts 'Finished training.'

  (1..3).each { |i| task ARGV[i].to_sym do;end if ARGV[i] }
end