{div, img, a} = React.DOM

# wallpaper full view
@Wallpaper = React.createClass

  getInitialState: ->
    fullView: false

  toggleFullView: (e) ->
    e.preventDefault()
    @setState "fullView": !@state.fullView

  render: ->
    div className: "wallpaper",
      div null,
        @props.data.name
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
