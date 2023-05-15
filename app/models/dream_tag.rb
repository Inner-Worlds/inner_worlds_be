class DreamTag < ApplicationRecord
  validates_presence_of :dream_id,
                        :tag_id
                        
  belongs_to :dream
  belongs_to :tag
end
