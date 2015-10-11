{div, img, a} = React.DOM

# wallpapers thumbnail
@WallpaperThumb = React.createClass
  render: ->
    div className: "wallpaper-thumb",
      a
        href: "/wallpapers/#{@props.wallpaper.id}"
        div null,
          @props.wallpaper.name
        img
          alt: ""
          src: @props.wallpaper.image.thumb.url
