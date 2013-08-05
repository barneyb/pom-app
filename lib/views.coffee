reduceCount = (key, values, rereduce) ->
	result = 0
	for v in values
		result += v
	result

module.exports =
	"brand-count":
		map: (doc) ->
			t = doc.brand
			emit((if t.indexOf("Black Milk ") == 0 then t.substr(11) else t), 1)
		reduce: reduceCount
	"category-count":
		map: (doc) ->
			emit(cat, 1) for cat in doc.categories
		reduce: reduceCount
	"format-count":
		map: (doc) ->
			emit(doc.format_version || null, 1)
		reduce: reduceCount
	"all-products":
		map: (doc) ->
			emit(doc.title, doc) if doc.title
