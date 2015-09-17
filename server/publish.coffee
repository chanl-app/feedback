Meteor.publish 'allReviews', (_id)->
	Reviews.find owner: _id

# Meteor.publishComposite 'user',
# 	find: ->
# 		Meteor.users.find _id: @userId

Meteor.publish null, ()->
	return Meteor.users.find({_id: this.userId}, {fields: {"services.resume.loginTokens": 1}});