# Journal

*Glutten-free foundation for editorial websites powered by [Character](https://github.com/slate-studio/chr) project.*


### Installation

Add to ```Gemfile```:

    gem 'journal', github: 'alexkravets/journal'

Add tape resource controllers to ```routes.rb```, `admin` scope:

```ruby
# journal
resources :journal_posts, controller: 'journal_posts'
resources :journal_pages, controller: 'journal_pages'
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
- [Mongosteen](https://github.com/slate-studio/mongosteen): An easy way to add restful actions for mongoid models
- [Inverter](https://github.com/slate-studio/inverter): An easy way to connect Rails templates content to CMS
- [Loft](https://github.com/slate-studio/loft): Media assets manager for Character CMS


## License

Copyright © 2015 [Alexander Kravets](https://github.com/alexkravets). Loft is free software, and may be redistributed under the terms specified in the [license](LICENSE.md).