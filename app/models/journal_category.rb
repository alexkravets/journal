class JournalCategory
  include Ants::Content
  include Ants::Orderable
  include Mongoid::Autoinc

  ## Attributes
  field :template_name, default: "show"

  ## Autoinc
  field :int_id, type: Integer
  increments :int_id

  ## Relations
  has_and_belongs_to_many :posts, class_name: "JournalPost", inverse_of: :categories, index: true
end
