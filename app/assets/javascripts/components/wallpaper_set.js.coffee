{div, h2} = React.DOM

# wallpapers scrollable set
@WallpaperSet = React.createClass
  getInitialState: ->
    name: @props.name
    wallpapers: @props.wallpapers

  render: ->
    div className: 'wallpaper-set',
      h2 null,
        @state.name
      div
        className: 'wallpaper-set-wrap'
        if @state.wallpapers?.length > 0
          div
            className: 'wallpaper-set-thumbs'
            for wallpaper in @state.wallpapers
              React.createElement WallpaperThumb, key: wallpaper.id, wallpaper: wallpaper
        else
          "No wallpapers found."
