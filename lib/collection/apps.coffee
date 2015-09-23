@UserApps = new Mongo.Collection 'user_apps'

Schemas.UserApps = new SimpleSchema
	name:
		type: String
		optional: false
		label: 'App Name'
		autoform:
			placeholder: 'You app name'

	description:
		type: String
		optional: false
		label: 'App Description'
		autoform: 
			placeholder: 'Reviews board for app to get user feedback'
			rows: 3

	category:
		type: String
		optional: false
		label: 'Category'
		allowedValues: ['general', 'android', 'ios', 'web']
		autoform: {
			type: "select"
			firstOption: '(select app category)	'
			options: [
				{label: 'Both', value: 'general'}
				{label: 'Android', value: 'android'}
				{label: 'IOS app', value: 'ios'}
			]
		}

	keys:
		type: Object
		optional: true
		label: 'App keys'
		autoform: omit: true

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

UserApps.attachSchema Schemas.UserApps