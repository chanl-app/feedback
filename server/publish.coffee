Meteor.publish 'allReviews', (_id)->
	Reviews.find owner: _id


Meteor.publishComposite 'userReviews',
	find: (tableName, ids, fields)->
		@unblock()
		return []
	children: []

Meteor.publishComposite null,
	find: ->
		Meteor.users.find({_id: @userId}, {fields: {"services.resume.loginTokens": 1, app: 1}})
	
	children: [
		{ 
			find: (user) ->
				UserApps.find owner: user._id
		}
	]