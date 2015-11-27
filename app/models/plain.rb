class Plain < ActiveRecord::Base
  scope :where_like_tsukkomi_origin, ->(src_text) {
    text = src_text.gsub(/[\\%_]/){|m| "\\#{m}"}
    where("tsukkomi_origin LIKE ?", "%#{text}%") 
  }

  scope :where_like_tsukkomi_basic, ->(src_text) {
    text = src_text.gsub(/[\\%_]/){|m| "\\#{m}"}
    where("tsukkomi_basic LIKE ?", "%#{text}%") 
  }
end
