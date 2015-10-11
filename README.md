wall-trade
===

Wallpaper gallery and sharing site.

Dependencies
---
- [Rails](http://rubyonrails.org/) 4.x
- [ImageMagick](http://www.imagemagick.org/script/index.php) 6.3.5 or later
- [PostgreSQL](http://www.postgresql.org/) 9.x

Setup
---
Install gems

```
bundle install
```

Create postgres database user `wall-trade` with CreateDB permissions

```
create user "wall-trade";
alter user "wall-trade" createdb;
```

Run rails db initialization

```
rake db:create db:migrate
```

Run tests
---
Uses RSpec 3 tests

```
rake spec
```
