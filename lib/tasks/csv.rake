require "csv"

namespace :csv do
  desc "csvファイル(引数file)を読み込んで係り受け解析"
  task :parse, ['file'] => :environment do |task, args|
    filename = args.file
    nm = Natto::MeCab.new('-F %f[6] -E \n')
    parser = CaboCha::Parser.new

    CSV.foreach('db/boke.csv') do |row|
      puts("#{row[0]} : #{row[1]}")
      
      if row[0]
        puts("**ボケ**")

        contents = parser.parse(row[0]).toString(CaboCha::CABOCHA_FORMAT_XML)
        hash = Hash.from_xml(contents)
        chunks = hash["sentence"]["chunk"]
        if chunks.class == Hash
          puts "Hash"
        else
          puts "Array"
          chunks.each_with_index do |chunk, index|
            link = chunk["link"].to_i
            tok = chunk["tok"]
            puts("#{tok} : #{chunks[link]["tok"]}")

            if link == -1
              if chunks[link]["tok"].class == String
                puts nm.parse(chunks[link]["tok"]).gsub(/\nEOS$/, "")
              else
                chunks[link]["tok"].each do |token|
                  puts nm.parse(token).gsub(/\nEOS$/, "")
                end
              end
              next
            end
          end
        end
      end

      if row[1]
        puts("**ツッコミ**")
        # puts nm.parse(row[1]).gsub(/\nEOS$/, "")
        contents = parser.parse(row[1]).toString(CaboCha::CABOCHA_FORMAT_XML)
        hash = Hash.from_xml(contents)
        chunks = hash["sentence"]["chunk"]
        if chunks.class == Hash
          puts "Hash"
        else
          puts "Array"
          chunks.each_with_index do |chunk, index|
            link = chunk["link"].to_i
            tok = chunk["tok"]
            puts("#{tok} : #{chunks[link]["tok"]}")

            if link == -1
              if chunks[link]["tok"].class == String
                puts nm.parse(chunks[link]["tok"]).gsub(/\nEOS$/, "")
              else
                chunks[link]["tok"].each do |token|
                  puts nm.parse(token).gsub(/\nEOS$/, "")
                end
              end
              next
            end
          end
        end
      end
      puts("################################################")
    end
  end
end
