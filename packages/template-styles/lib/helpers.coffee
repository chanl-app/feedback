Template.registerHelper 'UserApps', ->
	UserApps.find({owner:Meteor.userId()}).fetch()