module JournalHelper
  def journal_post_breadcrumbs(post, separator)
    if @site_name.presence
      [ link_to(@site_name, root_path),
        link_to(post.hex, journal_post_short_path(post.hex)),
        link_to(post.slug, show_journal_post_path(post.hex, post.slug)) ].join(separator).html_safe
    else
      ''
    end
  end

  def journal_page_breadcrumbs(page, separator)
    if @site_name.presence
      [ link_to(@site_name, root_path),
        link_to(page.slug, show_journal_page_path(page)) ].join(separator).html_safe
    else
      ''
    end
  end

  def journal_absolute_url(url)
    if url && ! url.include?('//')
      host = ENV.fetch("HOST")
      "http://#{host}#{url}"
    end
  end
end
