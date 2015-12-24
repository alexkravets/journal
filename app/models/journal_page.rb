class JournalPage
  include Ants::Content
  include Ants::Orderable
  include Mongoid::Autoinc

  ## Attributes
  field :template_name, default: "show"

  ## Autoinc
  field :int_id, type: Integer
  increments :int_id
end
