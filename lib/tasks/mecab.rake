namespace :mecab do
  desc "引数textをmecabで構文解析"
  task :parse, ['text'] => :environment do |task, args|
    nm = Natto::MeCab.new
    text = args.text
    puts nm.parse(text)
  end
end
