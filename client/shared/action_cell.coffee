Template.reviewActionCell.events
	'click button.view': () ->
		review = Reviews.findOne @_id

		data = 
			collection: 'Review'
			data: review

		Session.set 'viewItemData', data

		$('#viewItemModal').modal('toggle')

	'click button.edit': ->
		review = Reviews.findOne @_id

		console.log "Id: "
		console.log @_id

	'click button.remove': ->
		review = Reviews.findOne @_id
		
		data = 
			collection: 'Review'
			data: review

		Session.set 'delItemData', data

		$('#delItemModal').modal('toggle')