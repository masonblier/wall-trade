# components/wallpapers spec
describe "wallpapers", ->

  beforeEach ->
    fixture.set ""
    @$el = fixture.$el[0]

  it "should display a list of thumbnails from list data", ->
    data = [
      { id: 1, name: "Test A", image: {thumb: {url: "#"}} }
      { id: 2, name: "Test B", image: {thumb: {url: "#"}} }
    ]

    component = React.createElement Wallpapers, {data: data}
    React.render component, @$el

    expect($(".wallpaper-thumb", @$el).length).toBe(2)
    expect($(".wallpaper-thumb", @$el).first().text()).toBe("Test A")
    expect($(".wallpaper-thumb", @$el).first().text()).toBe("Test A")
    expect($(".wallpaper-thumb img", @$el).first().attr("src")).toBe("#")

  it "should display empty message when no wallpapers in list", ->
    data = []
    component = React.createElement Wallpapers, {data: data}
    React.render component, @$el

    expect($(".wallpapers-thumbs", @$el).text()).toBe("No wallpapers found.")
    expect($(".wallpapers-thumb", @$el).length).toBe(0)
