class Book
  include Mongoid::Document
  include Mongoid::Timestamps

  field :book_id, type: Integer
  field :title, type: String
  field :author, type: String
  field :published_year, type: Integer
  field :price, type: Float
  field :genre, type: String

  validates :title, presence: true
end
