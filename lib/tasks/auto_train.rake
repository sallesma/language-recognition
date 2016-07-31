desc "Fetch wikipedia articles from one locale to train"
task :auto_train_from_wikipedia => :environment do
  puts 'Starting training...'
  locale = ARGV[1].to_s
  number = ARGV[2]
  puts "locale: #{locale}"
  puts "number of articles: #{number}"

  for i in 1..number.to_i
    puts "Training with text number #{i}"
    title, text = Wikipedia.article(locale)
    puts "Training from: #{title}, number of characters: #{text.length}"
    Trainer.train(text, locale)
  end

  puts 'Finished training.'

  (1..2).each { |i| task ARGV[i].to_sym do;end if ARGV[i] }
end
