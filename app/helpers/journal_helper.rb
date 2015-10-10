module JournalHelper
  def journal_post_breadcrumbs(post, separator)
    [ link_to('kra.vc', root_path),
      link_to(post.hex, journal_post_short_path(post.hex)),
      link_to(post.slug, journal_post_path(post.hex, post.slug)) ].join(separator).html_safe
  end

  def journal_page_breadcrumbs(page, separator)
    [ link_to('kra.vc', root_path),
      link_to(page.slug, journal_page_path(page)) ].join(separator).html_safe
  end
end
