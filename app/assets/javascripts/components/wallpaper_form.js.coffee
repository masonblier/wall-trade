# new/edit wallpaper
@WallpaperForm = React.createClass
  getInitialState: ->
    form_mode: @props.form.mode
    form_token: @props.form.token
    form_errors: @props.errors
    name: @props.data.name or ''
    tags: @props.data.tags
    image: null

  handleChange: (e) ->
    name = e.target.name.substring(10, e.target.name.length-1)
    @setState "#{ name }": e.target.value

  handleTagsChange: (tags) ->
    @setState tags: tags

  valid: ->
    @state.name && (@state.form_mode == "edit" or @state.image)

  render: ->
    React.DOM.form
      method: 'POST'
      action: if @state.form_mode == "edit"
          "/wallpapers/#{@props.data.id}"
        else
          "/wallpapers"
      encType: 'multipart/form-data'

      React.DOM.input
        type: 'hidden'
        name: 'authenticity_token'
        value: @state.form_token
      if @state.form_mode == "edit"
        React.DOM.input
          type: 'hidden'
          name: '_method'
          value: 'patch'

      if @state.form_errors
        React.DOM.p null,
          for field of @state.form_errors
            for error in @state.form_errors[field]
              React.DOM.div className: 'form-error', "#{field} #{error}"

      React.DOM.p null,
        React.DOM.label null, "Name:"
        React.DOM.input
          type: 'text'
          placeholder: 'Name'
          name: 'wallpaper[name]'
          value: @state.name
          onChange: @handleChange

      React.DOM.p null,
        React.DOM.label null, "Image:"
        React.DOM.input
          type: 'file'
          name: 'wallpaper[image]'
          onChange: @handleChange

      React.DOM.input
        type: 'hidden'
        name: 'wallpaper[tag_list]'
        value: @state.tags.join(", ")

      React.DOM.p null,
        React.DOM.label null, "Tags:"
        React.createElement WallpaperTagsField,
          tags: @props.data.tags
          all_tags: @props.all_tags
          handleChange: @handleTagsChange

      React.DOM.p null,
        React.DOM.button
          type: 'submit'
          disabled: !@valid()
          'Submit'
