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
		action: ->
			@render 'PostAside', {to: 'aside'}
			@render()
		# yieldRegions:
		# 	'MyAside': {to: 'aside'}			
		waitOn: ->
			Meteor.subscribe 'allReviews', Meteor.userId()
		data: ->
			appId = Meteor.user()?.app?._id;
			reviews: Reviews.find({appId: appId, archived: {$in: [false, null, undefined]}}, {sort: {createdAt: -1}}).fetch()

	@route "starred",
		path: "/starred"
		template: 'reviews'
		controller: DashboardController
		waitOn: ->
			Meteor.subscribe 'allReviews', Meteor.userId()
		data: ->
			appId = Meteor.user()?.app?._id;
			reviews: Reviews.find({appId: appId, starred: true}, {sort: {createdAt: -1}}).fetch()

	@route "archive",
		path: "/archived"
		template: 'reviews'
		controller: DashboardController
		waitOn: ->
			Meteor.subscribe 'allReviews', Meteor.userId()
		data: ->
			appId = Meteor.user()?.app?._id;
			reviews: Reviews.find({appId: appId, archived: true}, {sort: {createdAt: -1}}).fetch()

	@route 'profile',
		path: '/profile'
		template: 'profile'
		controller: DashboardController
		waitOn: ->

		data: ->
