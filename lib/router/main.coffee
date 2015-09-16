Router.map ->
	@route "home",
		path: "/"
		onBeforeAction: ->
			if Meteor.user()?.isCustomer()
				@redirect 'dashboard'
			else
				@next()

		layoutTemplate: "homeLayout"
    