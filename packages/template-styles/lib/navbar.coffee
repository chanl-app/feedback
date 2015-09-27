Template.navbar.events
	'click .userApp': () ->
		Meteor.call "changeActiveApp", {id: @_id, name: @name}, (error, resp)->
			if error 
				console.log "sorry something went wrong"
			else
				Config.notification.success "Active app changed"