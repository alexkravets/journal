module Admin
  class JournalPagesController < Admin::BaseController
    mongosteen
    json_config methods: %w(slug opengraph_image_url meta_title meta_description),
                actions: {
                  index: {
                    except: %w(body_markdown body_html),
                    methods: %w(slug)
                  }
                }
  end
end
