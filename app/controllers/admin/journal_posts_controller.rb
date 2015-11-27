module Admin
  class JournalPostsController < Admin::BaseController
    mongosteen

    has_scope :by_category

    json_config methods: %w(hex slug sorted_categories),
                actions: {
                  index: {
                    except: %w(body_markdown body_html),
                    methods: %w(hex slug)
                  }
                }
  end
end
