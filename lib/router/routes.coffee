@DashboardController = RouteController.extend
	layoutTemplate: "dashboardLayout"
	onBeforeAction: ->
		unless Meteor.user()
			@redirect 'home'
		else
			if Meteor.user().isCustomer()
				@next()
			else
				@redirect 'dashboard'


	
Router.map ->
	@route "dashboard",
	    path: "/dashboard"
	    template: 'reviews'
	    controller: DashboardController
    