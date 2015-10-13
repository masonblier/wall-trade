# wallpapers list of thumbs
@Wallpapers = React.createClass
  getInitialState: ->
    wallpapers: @props.data
  getDefaultProps: ->
    wallpapers: []
  render: ->
    React.DOM.div
      className: 'wallpapers'
      React.DOM.div
        className: 'wallpapers-thumbs'
        if @state.wallpapers?.length > 0
          for wallpaper in @state.wallpapers
            React.createElement WallpaperThumb, key: wallpaper.id, wallpaper: wallpaper
        else
          "No wallpapers found."
