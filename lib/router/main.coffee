Router.map ->
	@route "home",
		path: "/"
		onBeforeAction: ->
			if Meteor.user()?.isCustomer()
				@redirect 'dashboard'
			else
				@next()

		layoutTemplate: "homeLayout"
    
	@route 'signOut',
		path: '/sign-out'
		onBeforeAction: ->
			Meteor.logout ->
			@redirect '/'
			@next()