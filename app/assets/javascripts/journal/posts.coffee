class @JournalPosts
  constructor: (menuTitle='Journal', title='Categories', apiPath='/admin') ->
    config =
      menuTitle: menuTitle
      title:     title

      onModuleInit: (module) ->
        if module.chr.isDesktop()
          module.chr.$mainMenu.find('.menu-journal').attr 'href', '#/journal/all_posts'

      items:
        all_posts:
          title: 'All'

          arrayStore: new RailsArrayStore({
            resource:    'journal_post'
            path:        "#{ apiPath }/journal_posts"
            sortBy:      'published_at'
            sortReverse: true
            searchable:  true
          })

          formSchema:
            editor:
              type: 'group'
              inputs:
                title:         { type: 'string',   placeholder: 'Title' }
                body_markdown: { type: 'markdown', label: 'Content', htmlFieldName: 'body_html', placeholder: 'Content' }
            settings:
              type: 'group'
              inputs:
                hidden: { type: 'switch', label: 'Draft', default: true }
                slug: new AntsSlugInput()
                published_at: { type: 'datetime', label: 'Publish At' }
                meta: new AntsMetaGroup()

          showWithParent: true
          fullsizeView:   true

          viewTabs:
            editor: 'Content'
            settings: 'Settings'

          onItemRender: (item) ->
            renderJournalPostItem(item)

          onViewShow: (view) ->
            if view.object
              hex = view.object.hex
              addPreviewHeaderButton(view, "/#{ hex }/preview", "/#{ hex }")

    return config
