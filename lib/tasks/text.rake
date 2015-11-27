namespace :text do
  desc "textを読み込んで形容詞返し"
  task :parse, ['text'] => :environment do |task, args|
    nm = Natto::MeCab.new()
    nm.parse(args.text) do |n|
      if n.feature.split(",")[0] == "形容詞"
        puts n.surface.gsub(/い$/, "くねーよ!")
      end
    end
  end
end
