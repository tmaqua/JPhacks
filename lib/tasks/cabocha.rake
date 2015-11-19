namespace :cabocha do
  desc "引数textをcabochaで係り受け解析"
  task :parse, ['text'] => :environment do |task, args|
    parser = CaboCha::Parser.new
    text = args.text
    puts parser.parse(text).toString(CaboCha::OUTPUT_RAW_SENTENCE)
  end
end
