{div} = React.DOM

# wallpapers tags edit field
@WallpaperTagsField = React.createClass
  getInitialState: ->
    tags = ({id: id, text: tag} for tag, id in (@props.tags or []))
    tags: tags
    suggestions: @props.all_tags

  setTags: (tags) ->
    @setState tags: tags
    @props.handleChange?(tag.text for tag in tags)

  handleDelete: (i) ->
    tags = @state.tags
    tags.splice i, 1
    @setTags tags

  handleAddition: (tag) ->
    tags = @state.tags
    tags.push
      id: 1 + tags.length
      text: tag
    @setTags tags

  handleDrag: (tag, currPos, newPos) ->
    # tags = @state.tags
    # tags.splice currPos, 1
    # tags.splice newPos, 0, tag
    # @setTags tags

  render: ->
    div className: "wallpaper-tags-field",
      React.createElement ReactTags.WithContext,
        tags: @state.tags
        suggestions: @state.suggestions
        handleDelete: @handleDelete
        handleAddition: @handleAddition
        handleDrag: @handleDrag
