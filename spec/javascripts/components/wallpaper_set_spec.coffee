# components/wallpaper_set spec
describe "wallpaper_set", ->

  beforeEach ->
    fixture.set ""
    @$el = fixture.$el[0]

  describe "with wallpapers", ->

    beforeEach ->
      props =
        name: "Test Set"
        wallpapers: [
          { id: 1, name: "Test A", image: {thumb: {url: "#"}} }
          { id: 2, name: "Test B", image: {thumb: {url: "#"}} }
        ]
      component = React.createElement WallpaperSet, props
      React.render component, @$el

    it "should display the set name", ->
      expect($(".wallpaper-set h2", @$el).text()).toBe("Test Set")

    it "should display a list of thumbnails from list data", ->
      expect($(".wallpaper-thumb", @$el).length).toBe(2)
      expect($(".wallpaper-thumb", @$el).first().text()).toBe("Test A")
      expect($(".wallpaper-thumb", @$el).last().text()).toBe("Test B")
      expect($(".wallpaper-thumb img", @$el).first().attr("src")).toBe("#")

  describe "empty state", ->

    beforeEach ->
      component = React.createElement WallpaperSet,
        name: "Test Set"
        wallpapers: []
      React.render component, @$el

    it "should display empty message when no wallpapers in list", ->
      expect($(".wallpaper-set-wrap", @$el).text()).toBe("No wallpapers found.")
      expect($(".wallpapers-thumb", @$el).length).toBe(0)
