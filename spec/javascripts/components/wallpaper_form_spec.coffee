# components/wallpaper_form spec
describe "wallpaper_form", ->

  beforeEach ->
    fixture.set ""
    @$el = fixture.$el[0]

  makeProps = (options = {}) ->
    data: options.data or {
      id: null
      name: null
      image: null
      tags: []
    }
    errors: options.errors or null
    all_tags: options.all_tags or []
    form:
      mode: options.form_mode or "new",
      token: "TEST_TOKEN"

  describe "new mode", ->

    beforeEach ->
      component = React.createElement WallpaperForm, makeProps()
      React.render component, @$el

    it "should display an empty form", ->
      expect($("input[name='wallpaper[name]']", @$el).val()).toBe("")
      expect($("input[name='wallpaper[image]']", @$el).val()).toBe("")
      expect($("input[name='wallpaper[tag_list]']", @$el).val()).toBe("")

    it "should POST to /wallpapers", ->
      expect($("form", @$el).attr("method")).toBe("POST")
      expect($("form", @$el).attr("action")).toBe("/wallpapers")

  describe "edit mode", ->

    beforeEach ->
      component = React.createElement WallpaperForm, makeProps
        data:
          id: 1
          name: "Test"
          image: null
          tags: ["Tag1", "Tag2"]
        form_mode: 'edit'
      React.render component, @$el

    it "should display editable values, but no image", ->
      expect($("input[name='wallpaper[name]']", @$el).val()).toBe("Test")
      expect($("input[name='wallpaper[tag_list]']", @$el).val()).toBe("Tag1, Tag2")
      expect($("input[name='wallpaper[image]']", @$el).val()).toBe("")

    it "should PATCH to /wallpapers/1", ->
      expect($("form", @$el).attr("method")).toBe("POST")
      expect($("form", @$el).attr("action")).toBe("/wallpapers/1")
      expect($("input[name='_method']", @$el).val()).toBe("patch")

  describe "errors", ->

    it "should show all errors", ->
      component = React.createElement WallpaperForm, makeProps
        errors:
          name: ["Error 1", "Error 2"]
          image: ["Error 3"]
      React.render component, @$el

      expect($(".form-error", @$el).length).toBe(3)
      expect($(".form-error", @$el).first().text()).toBe("name Error 1")
      expect($(".form-error", @$el).last().text()).toBe("image Error 3")
