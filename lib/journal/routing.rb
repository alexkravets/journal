module ActionDispatch::Routing
  class Mapper
    def mount_journal_pages_crud
      resources :journal_pages, controller: 'journal_pages'
    end

    def mount_journal_posts_crud
      resources :journal_posts, controller: 'journal_posts'
    end

    def mount_journal_categories_crud
      resources :journal_categories, controller: 'journal_categories'
    end

    def mount_journal_posts
      get '/:hex/preview' => 'journal_posts#preview',
          as: :preview_journal_post
      get '/:hex/:slug' => 'journal_posts#show',
          as: :show_journal_post,
          constraints: ::Constraints::JournalPosts
      get '/:hex' => 'journal_posts#redirect',
          as: :journal_post_short,
          constraints: ::Constraints::JournalPosts
    end

    def mount_journal_pages
      get '/:slug/preview' => 'journal_pages#preview',
          as: :preview_journal_page,
          constraints: ::Constraints::JournalPages
      get '/:slug' => 'journal_pages#show',
          as: :show_journal_page,
          constraints: ::Constraints::JournalPages
    end

    def mount_journal_categories
      get '/:slug' => 'journal_posts#category',
          as: :show_journal_category,
          constraints: ::Constraints::JournalCategories
    end
  end
end
