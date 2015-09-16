@Schemas = {}

Schemas.UserProfile = new SimpleSchema
	firstName:
		type: String
		optional: true
		label: -> 'First name'

	lastName:
		type: String
		optional: true
		label: -> 'Last name'