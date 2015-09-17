Template.viewItemModal.helpers
	results:  ->
		Session.get 'viewItemData'

Template.delItemModal.events
	'click button.delete': ->
		item = Session.get 'delItemData'

		Reviews.remove item.data._id

		$('#delItemModal').modal('toggle')
		return