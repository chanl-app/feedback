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

Reviews.attachSchema Schemas.Reviews