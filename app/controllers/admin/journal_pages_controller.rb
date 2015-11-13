class Admin::JournalPagesController < Admin::BaseController
  mongosteen
  json_config methods: %w(slug)
end