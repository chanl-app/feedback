Router.map ->
	@route "userApps",
		path: "/dashboard/apps"
		template: 'userApps'
		controller: DashboardController
		action: ->
			@render 'PostAside', {to: 'aside'}
			@render()
		# yieldRegions:
		# 	'MyAside': {to: 'aside'}			
		waitOn: ->
			# Meteor.subscribe 'allReviews', Meteor.userId()
		data: ->
			# reviews: Reviews.find({archived: {$in: [false, null, undefined]}}, {sort: {createdAt: -1}}).fetch()
			apps: UserApps.find owner: Meteor.userId()

	@route 'newUserApp',
		path: '/dashboard/apps/new'
		template: 'newUserApp'
		controller: DashboardController
		action: ->
			@render()
		waitOn: ->

		data: ->