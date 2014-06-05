class Highlither
  @preg_quote: (str) ->
    (str + "").replace /([\\\.\+\*\?\[\^\]\$\(\)\{\}\=\!\<\>\|\:])/g, "\\$1"
      
  @highlight: (data, search) ->
    data.replace new RegExp("(" + Highlither.preg_quote(search) + ")", "gi"), "<em>$1</em>" 

class Search

  constructor: () ->
    search = this
    @from = null
    @to = null

    $("input[type=text]").bind "keyup", ->
      search.from = $('input[name="from"]').val()
      search.to   = $('input[name="to"]').val()
      search.find($('#search').serialize())

  find: (params) ->
    s = this
    $.getJSON "api/travels?"+ params , (data) ->
      s.render(s.filter(data))

  filter: (data) ->
    search = this
    _.map(
        data
      , (t) ->
        t.departure_date  =  moment(t.departure_date,'YYYYMMDD').fromNow()
        t.description     = $.trim(t.description).substring(0, 50).split(" ").slice(0, -1).join(" ") + "...";
        t.from.name       = Highlither.highlight t.from.name, search.from if !!search.from
        t.to.name         = Highlither.highlight t.to.name, search.to if !!search.to
        t
      ) 

  render: (travels) ->
      rendered  = Mustache.render($('#travels_tpl').html(), {travels:travels})
      $('.ui.travels').html(rendered)
      $('.description').hyphenate('en-us')
      $('.item.results').html travels.length + ' results'
      $('.button.book').click ->
        $('.modal.book').modal('show')

class Application
  @bindEvents = () ->
    $('.button.search').click ->
      $("#search").submit()
      $('#search').fadeOut()
      $('.sidebar.left').sidebar('toggle')
      $('.ui.menu.views').toggle()

    $('.button.search_open').click ->
      $( "input.search" ).focus().val('')
      $('.sidebar.top').sidebar('toggle')
      $('.ui.menu.views').toggle()
      $('#search').fadeIn()

    $('.modal.advanced').click ->
      $(".ui.modal").modal('show')
  
checkScroll = ->
  if nearBottomOfPage()
    console.log "nead the End..."

nearBottomOfPage = ->
  scrollDistanceFromBottom() < 150

scrollDistanceFromBottom = (argument) ->
  pageHeight() - (window.pageYOffset + self.innerHeight)

pageHeight = ->
  Math.max document.body.scrollHeight, document.body.offsetHeight

$ ->
  ##
  $('.sidebar.top').sidebar('toggle')
  $('.ui.menu.views').hide()
  search = new Search
  Application.bindEvents()
  search.find('')

  $(document).bind "dom:loaded", ->
    checkScroll()