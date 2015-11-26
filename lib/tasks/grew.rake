namespace :grew do
  desc "文章からボケとツッコミを分別してDBに保存"
  task :text_base, ['filename'] => :environment do |task, args|

    file_path = "db/" + args.filename.to_s
    nm = Natto::MeCab.new

    File.open(file_path) do |file|
      # 田中：どうも～、おめでとうございま～す！\n\n  ~>  どうも～、おめでとうございま～す！
      texts = file.read.split("\n").reject(&:blank?).map { |n| n.gsub(/.*：/, "") }

      texts.each_with_index do |text, index|
        nm.parse(text) do |elm|
          Plain.where_like_tsukkomi_origin(elm.surface).each do |tsukkomi|
            if tsukkomi.boke_origin.nil?
              tsukkomi.boke_origin = text
              tsukkomi.save
            else
              Plain.create(tsukkomi_origin: tsukkomi, boke_origin: text)
            end
          end
        end
      end
    end

  end
end
