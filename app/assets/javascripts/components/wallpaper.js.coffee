{div, h1, img, a} = React.DOM

# wallpaper full view
@Wallpaper = React.createClass

  getInitialState: ->
    fullView: false

  toggleFullView: (e) ->
    e.preventDefault()
    @setState "fullView": !@state.fullView

  render: ->
    div className: "wallpaper",
      h1 null,
        @props.data.name
      div className: "tag-list",
        "Tags:"
        for tag in @props.data.tags
          a
            className: "tag-link"
            key: tag
            href: "/tags/#{tag}"
            tag
      div className: "wallpaper-box",
        a
          className: "wallpaper-expand"
          href: "#"
          onClick: @toggleFullView
          img
            alt: ""
            src: if @state.fullView
                @props.data.image.url
              else
                @props.data.image.thumb.url
