class Amoeba.HomepageView
  stateTransitions: new Amoeba.StateTransitions

  constructor: ->
    this.cacheElements()
    this.initStateMachine()
    this.bindEvents()

  cacheElements: ->
    @$header = $("#header")
    @$logoNav = $("#logo nav")
    @$document = $(document)

  bindEvents: ->
    $(".contactus-button").on 'click', =>
      this.showContact()
      return false

    $(".team-button").on 'click', =>
      this.showTeam()
      return false

    # Slide in Header when scrolled down far enough
    @$document.on 'scroll.header', =>
      if @$document.scrollTop() < @$logoNav.offset().top
        @$header.slideUp()
      else @$header.slideDown()

  initStateMachine: ->
    @stateMachine = StateMachine.create(
      initial: "home"

      events: [
        name: "contactevt"
        from: "*"
        to: "contact"
      ,
        name: "homeevt"
        from: "*"
        to: "home"
      ,
        name: "teamevt"
        from: "*"
        to: "team"
      ]

      callbacks:
        oncontact: (event, from, to) =>
          @stateTransitions.contactUsTransition()

        onhome: (event, from, to) =>
          @stateTransitions.homeTransition()

        onteam: (event, from, to) =>
          @stateTransitions.teamTransition()

        onleavecontact: (event, from, to) =>
          @stateTransitions.undoContactUsTransition()

        onleaveteam: (event, from, to) =>
          @stateTransitions.undoTeamTransition()
    )

  showContact: -> @stateMachine.contactevt()
  showTeam: -> @stateMachine.teamevt()
  showHome: -> @stateMachine.homeevt()