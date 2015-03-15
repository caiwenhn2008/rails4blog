class Article < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tags

  has_many :comments, dependent: :destroy

  validates :title, presence: true,
            length: { minimum: 5 }
  validates :text, presence: true,
            length: { minimum: 5 }

end
