Meteor.methods
	changeActiveApp: (options)->
		check options, Object
		check options.id, String
		check options.name, String

		if @userId
			doc = 
				app: 
					_id: options.id
					name: options.name

			Meteor.users.update @userId, {$set: {"app": doc.app}}, (err, resp)->
				if err
					console.log "Something went wrong"