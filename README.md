# Journal

*Glutten-free foundation for editorial websites powered by [Character](https://github.com/slate-studio/chr) project.*


### Installation

Add to ```Gemfile```:

    gem 'journal-chr'

Add tape resource controllers to ```routes.rb```, `admin` scope:

```ruby
  mount_journal_posts_crud
  mount_journal_pages_crud
  mount_journal_categories_crud
```

Add tape resource controllers to ```routes.rb```, `website` scope:

```ruby
  root 'journal_posts#index'
  mount_journal_categories
  mount_journal_pages
  mount_journal_posts
```

Add to ```admin.scss``` and ```admin.coffee```:

```scss
@import "journal";
```

```coffee
#= require journal
```

Add to ```admin.coffee``` character configuration object:

```coffee
journal: new JournalPosts()
pages:   new JournalPages()
```


## Journal family

- [Character](https://github.com/slate-studio/chr): Powerful javascript CMS for apps
- [Mongosteen](https://github.com/slate-studio/mongosteen): Add CRUD actions for Mongoid models with one line
- [Loft](https://github.com/slate-studio/loft): Media assets manager for Character CMS
- [Inverter](https://github.com/slate-studio/inverter): An easy way to connect Rails templates content to CMS


## License

Copyright © 2015 [Alexander Kravets](https://github.com/alexkravets). Loft is free software, and may be redistributed under the terms specified in the [license](LICENSE.md).