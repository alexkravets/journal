class @JournalPosts
  constructor: (menuTitle='Journal', title='Posts', apiPath='/admin') ->
    config =
      menuTitle: menuTitle
      title:     title

      arrayStore: new RailsArrayStore({
        resource:   'journal_post'
        path:       "#{ apiPath }/journal_posts"
        sortBy:     'published_at'
        searchable: true
      })

      formSchema:
        title:         { type: 'string', placeholder: 'Post Title' }
        body_markdown: { type: 'markdown', htmlFieldName: 'body_html', placeholder: 'Content' }
        published_at:  { type: 'datetime', label: 'Publish At' }
        hidden:        { type: 'switch',   label: 'Draft' }

    return config