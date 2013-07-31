exports.validate_doc_update = (newDoc, oldDoc, userCtx) ->
	return if userCtx.roles.indexOf('_admin') >= 0
	throw forbidden: 'Read Only Database'
