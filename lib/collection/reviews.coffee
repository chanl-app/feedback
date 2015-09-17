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

	starred:
		type: Boolean
		autoform: omit: true
		optional: true
		label: 'Starred'
		defaultValue: false

	archived: 
		type: Boolean
		autoform: omit: true
		optional: true
		label: 'Archived'
		defaultValue: false
		
	owner: 
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoform: omit: true
		autoValue: ->
			if @isInsert
				if Meteor.isClient
					console.log @userId
					@userId
				else
					console.log "bug #{@userId}"
	createdAt:
		type: Date
		autoform: omit: true
		autoValue: ->
			if @isInsert
				new Date()

Reviews.attachSchema Schemas.Reviews