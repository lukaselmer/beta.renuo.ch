# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig =
  rootPath: process.cwd()

  watchOptions: preferredMethods: ['watchFile','watch']

  plugins:
    sass:
      compass: false
# =================================
# Template Data
# These are variables that will be accessible via our templates
# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

  templateData:
# Specify some site properties
    site:
    # The production url of our website
      url: "https://www.renuo.ch"

      # Here are some old site urls that you would like to redirect from
      oldUrls: [
        'renuo.ch',
        'www.beta.renuo.ch',
        'beta_renuo.herokuapp.com'
      ]

      # The default title of our website
      title: "Internet Solutions"

      # When your website appears in search results in say Google, the text here will be shown underneath your website's title.
      # The website description (for SEO)
      description: """
                   Renuo AG, Internet solutions
                   """

      # The website keywords (for SEO) separated by commas
      keywords: """
                Renuo, Internet soulutions, Web, Websites, Webseite, Internet Seite, Internetseite, Homepage, Homepages, Consulting, Software Engineering, Ruby, Ruby on Rails, mobile, mobile apps,
                javascript, nodejs, node, android, ipad, iphone, rails, professional, Webagentur, Websiten, Web 2.0, CMS, Web-Applikationen, E-Commerce Lösungen
                """

      # The website author's name
      author: "Renuo AG | info@renuo.ch | http://www.renuo.ch"

      # The website author's email
      email: "info@renuo.ch"



    # -----------------------------
    # Helper Functions

    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page's title
    # we can apply that formatting here
    getPreparedTitle: ->
      # if we have a document title, then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} | #{@site.title}"
        # if our document does not have it's own title, then we should just use the site's title
      else
        @site.title

    # Get the prepared site/document description
    getPreparedDescription: ->
      # if we have a document description, then we should use that, otherwise use the site's description
      @document.description or @site.description

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
      # Merge the document keywords with the site keywords
      @site.keywords.concat(@document.keywords or []).join(', ')

    link_to: (name, link)->
      "<a href='#{link}'>#{name}</a>"

    image_tag: (image_name)->
      "<img src='/images/#{image_name}' />"

    team_image_tag: (image_name, alt)->
      "<img src='/images/portraits/#{image_name}.jpg' class='portrait' alt='#{alt}' />"

    age: (y, m, d)->
      m = m - 1
      date = new Date()
      minus_year = 0
      age = date.getFullYear() - y
      minus_year = 1 if date.getMonth() < m
      minus_year = 1 if date.getMonth() == m && date.getDate() < d
      age - minus_year

    getSlider: (id, data)->
      return '' unless data
      fs  = require 'fs'
      eco = require 'eco'
      #docpad = @docpad
      template = fs.readFileSync "#{docpadConfig.rootPath}/src/helpers/slider.html.eco", 'utf-8'
      eco.render template, sliderId: id, slider: data


# =================================
# Collections
# These are special collections that our website makes available to us

  collections:
  # For instance, this one will fetch in all documents that have pageOrder set within their meta data
    pages: (database) ->
      database.findAllLive({pageOrder:
        $exists: true}, [
        pageOrder: 1, title: 1
      ])

  # This one, will fetch in all documents that have the tag "post" specified in their meta data
    posts: (database) ->
      database.findAllLive({tags:
        $hasAll: ['post']}, [
        date: -1
      ])

    main_navi: (database) ->
      database.findAllLive({isMainNavi:
        $exists: true}, [
        position: 1
      ])

    projects: (database) ->
      database.findAllLive({tags:
        $hasAll: ['project']}, [
        position: 1
      ])

    news: (database) ->
      database.findAllLive({tags:
        $hasAll: ['news']}, [
        date: -1
      ])

    jobs_zurich: (database) ->
      database.findAllLive({
        tags: $hasAll: ['jobs-online-zurich']
      }, [position: 1])

    jobs_st_gallen: (database) ->
      database.findAllLive({
        tags: $hasAll: ['jobs-online-st-gallen']
      }, [position: 1])

# =================================
# DocPad Events

# Here we can define handlers for events that DocPad fires
# You can find a full listing of events on the DocPad Wiki
  events:
# Server Extend
# Used to add our own custom routes to the server before the docpad routes are added
    serverExtend: (opts) ->
      # Extract the server from the options
      {server} = opts
      docpad = @docpad

      # As we are now running in an event,
      # ensure we are using the latest copy of the docpad configuraiton
      # and fetch our urls from it
      latestConfig = docpad.getConfig()
      oldUrls = latestConfig.templateData.site.oldUrls or []
      newUrl = latestConfig.templateData.site.url

      # Redirect any requests accessing one of our sites oldUrls to the new site url
      server.use (req, res, next) ->
        if req.headers.host in oldUrls
          res.redirect(newUrl + req.url, 301)
        else
          next()

    writeAfter: (opts,next) ->
      balUtil = require('safeps')
      #require('bal-util')

      # Prepare
      docpad = @docpad
      rootPath = docpad.config.rootPath
      outPath = docpad.config.outPath

      # Bundle the scripts the editor uses together
      # #{outPath}/vendor/lib/jquery.js
      command = """
      #{rootPath}/node_modules/.bin/browserify
      #{outPath}/vendor/jquery.collapse.js
      #{outPath}/vendor/log.js
      #{outPath}/scripts/script.js
                | #{rootPath}/node_modules/.bin/uglifyjs > #{outPath}/scripts.js
                """.replace(/\n/g,' ')

      # Execute
      balUtil.exec(command, {cwd:rootPath,output:true}, next)


      # Perform the grunt `min` task
      # https://github.com/gruntjs/grunt/blob/0.3-stable/docs/task_min.md
      #command = ["#{rootPath}/node_modules/.bin/grunt", 'min']

      # Execute
      #balUtil.spawn(command, {cwd:rootPath,output:true}, next)

      # Chain
      @


# Regenerate Delay
  # The time (in milliseconds) to wait after a source file has
  # changed before using it to regenerate. Updating over the
  # network (e.g. via FTP) can cause a page to be partially
  # rendered as the page is regenerated *before* the source file
  # has completed updating: in this case increase this value.
  regenerateDelay: 2000


# Export our DocPad Configuration
module.exports = docpadConfig
