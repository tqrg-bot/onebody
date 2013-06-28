require 'active_support/concern'

module TagConcern
  extend ActiveSupport::Concern

  included do
    belongs_to :site

    has_many :verses, through: :taggings, conditions: "taggings.taggable_type = 'Verse'"

    validates_presence_of :name
    validates_uniqueness_of :name, scope: :site_id

    scope_by_site_id
  end

  def to_param
    name
  end
end
