db = require("db")

class ResultSet
    constructor: (@dbName, @docName, @viewName) ->
        @rows = new Backbone.Collection()
        @db = db.use(@dbName)

    getPage: (limit, offset) =>
        end = offset + limit
        rowsNeeded = end - @rows.length
        console.log "getPage", limit, offset, rowsNeeded
        @fetchMore(rowsNeeded) if rowsNeeded > 0
        @rows.slice(offset, Math.min(end, @rows.length))

    fetchMore: (count) =>
        return if @rows.length == @totalRows
        cb = (err, data) =>
            console.log err, data
            return alert(err) if (err)
            @totalRows = data.total_rows
            @rows.add(row) for row in data.rows
        @db.getView @docName, @viewName, cb

module.exports = ResultSet
