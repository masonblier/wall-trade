# wallpapers list of thumbs
@Wallpapers = React.createClass
  getInitialState: ->
    wallpapers: @props.data
  getDefaultProps: ->
    wallpapers: []
  render: ->
    React.DOM.div
      className: 'wallpapers'
      React.DOM.h2
        className: 'title'
        'Wallpapers'
      React.DOM.div
        className: 'wallpapers-thumbs'
        for wallpaper in @state.wallpapers
          React.createElement WallpaperThumb, key: wallpaper.id, wallpaper: wallpaper
