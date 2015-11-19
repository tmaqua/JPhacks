namespace :cabocha do
  desc "引数textをcabochaで係り受け解析"
  task :parse, ['text'] => :environment do |task, args|
    parser = CaboCha::Parser.new
    text = args.text
    # contents = parser.parse(text).toString(CaboCha::OUTPUT_RAW_SENTENCE).split("-D")
    contents = parser.parse(text).toString(CaboCha::CABOCHA_FORMAT_XML)
    # puts contents
    hash = Hash.from_xml(contents)
    chunks = hash["sentence"]["chunk"]
    chunks.each_with_index do |chunk, index|
      link = chunk["link"].to_i
      tok = chunk["tok"]
      
      if link == -1
        
        nm = Natto::MeCab.new('-F %f[6] -E \n')
        chunks[link]["tok"].each do |token|
          puts nm.parse(token)
        end
        next
      end

      puts("#{index} ~> #{link}")
      puts("#{tok} : #{chunks[link]["tok"]}")

    end
  end
end