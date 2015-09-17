@DashboardController = RouteController.extend
	layoutTemplate: "dashboardLayout"
	onBeforeAction: ->
		unless Meteor.user()
			@redirect 'home'
		else
			if Meteor.user().isCustomer()
				@next()
			else
				@next()
				@redirect 'dashboard'
				
	
Router.map ->
	@route "dashboard",
		path: "/dashboard"
		template: 'reviews'
		controller: DashboardController
		waitOn: ->
			Meteor.subscribe 'allReviews', Meteor.userId()
		data: ->
			reviews: Reviews.find({}, {sort: {createdAt: -1}}).fetch()

	@route "starred",
		path: "/starred"
		template: 'reviews'
		controller: DashboardController
		waitOn: ->
			Meteor.subscribe 'allReviews', Meteor.userId()
		data: ->
			reviews: Reviews.find({starred: true}, {sort: {createdAt: -1}}).fetch()

	@route "archive",
		path: "/archived"
		template: 'reviews'
		controller: DashboardController
		waitOn: ->
			Meteor.subscribe 'allReviews', Meteor.userId()
		data: ->
			reviews: Reviews.find({archived: true}, {sort: {createdAt: -1}}).fetch()

	@route 'profile',
		path: '/profile'
		template: 'profile'
		controller: DashboardController
		waitOn: ->

		data: ->
			