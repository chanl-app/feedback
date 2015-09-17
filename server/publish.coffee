Meteor.publish 'allReviews', (_id)->
	Reviews.find owner: _id


Meteor.publishComposite 'userReviews',
	find: (tableName, ids, fields)->
		@unblock()
		return Reviews.find({owner: 'XMTejLRCXAwssk72n'}, {})
	children: []

Meteor.publish null, ()->
	return Meteor.users.find({_id: this.userId}, {fields: {"services.resume.loginTokens": 1}});