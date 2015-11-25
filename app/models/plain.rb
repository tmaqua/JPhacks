class Plain < ActiveRecord::Base
  scope :where_like_tsukkomi_origin, ->(src_text) {
    text = src_text.gsub(/[\\%_]/){|m| "\\#{m}"}
    where("tsukkomi_origin LIKE ?", "%#{text}%") 
  }
end
