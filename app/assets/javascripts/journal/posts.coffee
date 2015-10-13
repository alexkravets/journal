class @JournalPosts
  constructor: (menuTitle='Journal', title='Posts', apiPath='/admin') ->
    config =
      menuTitle: menuTitle
      title:     title

      onModuleInit: (module) ->
        if module.chr.isDesktop()
          module.chr.$mainMenu.find('.menu-journal').attr 'href', '#/journal/all_posts'

      items:
        all_posts:
          title: 'All Posts'

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
                hidden:        { type: 'switch',   label: 'Draft', default: true }
                published_at:  { type: 'datetime', label: 'Publish At' }
                _slug:         { type: 'string',   label: 'Permalink' }

          showWithParent: true
          fullsizeView:   true

          viewTabs:
            editor:   'Post'
            settings: 'Settings'

          onItemRender: (item) ->
            today    = new Date()
            tzOffset = today.getTimezoneOffset() * -1

            m = moment(item.object.published_at).utcOffset(tzOffset)
            if m.isValid()
              format = if today.getFullYear() == m.year() then 'MMM D hh:mm' else 'MMM D, YYYY hh:mm'
              published_at = m.format(format)
              item.$subtitle.html(published_at)

    return config