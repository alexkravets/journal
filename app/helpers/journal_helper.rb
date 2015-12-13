module JournalHelper
  def journal_post_category_links(post)
    html = ""
    if post.categories.any?
      html << "<span class='journal-post-header-categories'>"
      html << post.categories.collect do |c|
        link_to(c.title, show_journal_category_path(c.slug))
      end.join(" ")
      html << "</span>"
    end
    html.html_safe
  end

  def journal_post_time(post)
    time = post.published_at.strftime("%m.%d.%Y")
    html = """<time datetime='#{post.published_at}'
          class='journal-post-header-time'>
  #{time}
</time>"""
    html.html_safe
  end
end
