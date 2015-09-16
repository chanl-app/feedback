@Reviews = new Mongo.Collection 'reviews'

Schemas.Reviews = new SimpleSchema
	title:
		type: String
		optional: false
		label: 'Title'

	text:
		type: String
		autoform:
			rows: 3
		optional: false
		label: 'Message'

	meta:
		type: Object
		blackbox: true
		optional: true
		label: 'Meta data'
		autoform: omit: true

	owner: 
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoform: omit: true
		autoValue: ->
			if @isInsert
				Meteor.userId()

	createdAt:
		type: Date
		autoform: omit: true
		autoValue: ->
			if @isInsert
				new Date()

Reviews.attachSchema Schemas.Reviews