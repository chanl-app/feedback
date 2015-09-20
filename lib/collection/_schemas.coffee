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

	country:
		type: String
		optional: true
		label: -> 'Country'

	language:
		type: String
		optional: true
		label: -> 'Language'
		
	# username:
	# 	type: String
	# 	unique: true
	# 	label: 'Username'