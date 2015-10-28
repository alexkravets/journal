class Admin::JournalPostsController < Admin::BaseController
  mongosteen
  json_config({ methods: %w( hex ) })
end