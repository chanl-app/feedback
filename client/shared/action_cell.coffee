Template.reviewActionCell.events
	'click button.view': () ->
		data = 
			collection: 'Review'
			data: Reviews.findOne @_id

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

Template.cellStarred.events
	'click button.star': (e, t) ->
		Reviews.update({_id: @_id}, { $set: {starred: !@starred}})