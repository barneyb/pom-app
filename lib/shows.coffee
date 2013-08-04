handlebars = require("handlebars")

module.exports =
	tile: (doc, req) ->
		handlebars.templates["tile.html"](doc)
