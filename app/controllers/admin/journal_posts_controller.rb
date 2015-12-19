module Admin
  class JournalPostsController < Admin::BaseController
    mongosteen

    has_scope :by_category
    has_scope :hidden, type: :boolean
    has_scope :not_hidden, type: :boolean

    json_config methods: %w(hex slug sorted_categories opengraph_image_url meta_title meta_description),
                actions: {
                  index: {
                    except: %w(body_markdown body_html),
                    methods: %w(hex slug)
                  }
                }
  end
end
