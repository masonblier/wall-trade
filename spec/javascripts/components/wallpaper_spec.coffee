# components/wallpaper spec
describe "wallpaper", ->

  beforeEach ->
    fixture.set ""
    @$el = fixture.$el[0]

  beforeEach ->
    props =
      data:
        name: "Test Wallpaper",
        tags: ["Tag 1", "Tag 2"]
        image:
          url: "#full"
          thumb:
            url: "#thumb"
    component = React.createElement Wallpaper, props
    @c = React.render component, @$el

  it "should display name and tags", ->
    expect($(".wallpaper h1", @$el).text()).toBe("Test Wallpaper")
    expect($(".tag-list a", @$el).first().text()).toBe("Tag 1")
    expect($(".tag-list a", @$el).last().text()).toBe("Tag 2")

  it "should initially display thumb url", ->
    expect($(".wallpaper-box a img", @$el).attr("src")).toBe("#thumb")

  it "should allow toggle between full and thumb views", ->
    @c.toggleFullView({preventDefault:->})
    expect($(".wallpaper-box a img", @$el).attr("src")).toBe("#full")
    @c.toggleFullView({preventDefault:->})
    expect($(".wallpaper-box a img", @$el).attr("src")).toBe("#thumb")
