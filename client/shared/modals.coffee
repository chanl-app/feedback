Template.viewItemModal.helpers
	results:  ->
		data = Session.get 'viewItemData'
		return data

Template.delItemModal.events
	'click button.delete': ->
		item = Session.get 'delItemData'

		Reviews.remove item.data._id

		console.log "delete item"
		$('#delItemModal').modal('toggle')
		return