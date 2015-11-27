module Admin
  class JournalCategoriesController < Admin::BaseController
    mongosteen

    json_config methods: %w(slug),
                actions: {
                  index: {
                    except: %w(body_markdown body_html),
                    methods: %w(slug)
                  }
                }
  end
end
