@renderJournalPostItem = (item) ->
  item.$publishedAt =$ "<time datetime='#{ item.object.published_at }' class='journal-post-published-at'></aside>"
  item.$title.before(item.$publishedAt)
  published_at = getJournalPostPublishedAt(item.object)
  item.$publishedAt.html(published_at)

  if item.object.hidden
    item.$el.addClass('journal-post-hidden')
  else
    item.$el.removeClass('journal-post-hidden')


@getJournalPostPublishedAt = (post) ->
  today    = new Date()
  tzOffset = today.getTimezoneOffset() * -1

  m = moment(post.published_at).utcOffset(tzOffset)
  if m.isValid()
    format = 'YYYY/MM/DD' # else 'MMM D, YYYY hh:mm'
    published_at = m.format(format)