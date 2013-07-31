exports.views =
	"brand-count":
		map: (doc) ->
			t = doc.brand
			emit((if t.indexOf("Black Milk ") == 0 then t.substr(11) else t), 1)
		reduce: (key, values, rereduce) ->
			result = 0
			for v in values
				result += v
			result
	"category-count":
		map: (doc) ->
			emit(cat, 1) for cat in doc.categories
		reduce: (key, values, rereduce) ->
			result = 0
			for v in values
				result += v
			result
