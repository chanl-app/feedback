Template.userApps.events
	'click li.user-app': (e, t) ->
		Meteor.call "changeActiveApp", {id: @_id, name: @name}, (error, resp)->
			if error 
				console.log "sorry something went wrong"
			else
				Config.notification.success "Active app changed" 