Handlebars = require("handlebars")

module.exports =
	tiles: (head, req) ->
		articles = []
		while row = getRow()
			articles.push Handlebars.templates["tile.html"](row.value)
		start(headers:
			'Content-Type': 'text/html'
		)
		Handlebars.templates["tiles.html"]({articles: articles})
