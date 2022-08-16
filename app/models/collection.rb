class Collection < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 8 }
  has_many :user_collections
  has_many :boxes

  include PgSearch::Model
  multisearchable against: [:name]
  PgSearch.multisearch_options = {
    using: {:tsearch => { :prefix => true }}
  }

  # include PgSearch::Model
  # pg_search_scope :global_search,
  #   against: [ :name ],
  #   associated_against: {
  #     box: [ :name ],
  #     item: [ :name ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
