Template.reviewActionCell.events
	'click button.view': () ->
		data = 
			collection: 'Review'
			data: Reviews.findOne @_id

		Reviews.update {_id: @_id}, { $set: {viewed: true}}
		Session.set 'viewItemData', data

		$('#viewItemModal').modal('toggle')
		return

	'click button.edit': ->
		review = Reviews.findOne @_id

	'click button.remove': ->
		data = 
			collection: 'Review'
			data: Reviews.findOne @_id

		Session.set 'delItemData', data

		$('#delItemModal').modal('toggle')
		return

	'click button.archive': ->
		Reviews.update {_id: @_id}, { $set: {archived: !@archived}}, (error, resp)->
			if !error 
				console.log "Item archived"

Template.cellStarred.events
	'click button.star': (e, t) ->
		Reviews.update({_id: @_id}, { $set: {starred: !@starred}})