class Admin::JournalPostsController < Admin::BaseController
  mongosteen
  json_config methods: %w(hex slug),
              actions: {
                index: {
                  except: %w(body_markdown body_html),
                  methods: %w(hex slug)
                }
              }
end
