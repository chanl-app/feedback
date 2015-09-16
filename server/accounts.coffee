Accounts.onCreateUser (options, user) ->
	if options.profile?.guard
	else
		user.roles = ['customer']

	# profileImageUrl = undefined
	# user.profile = options.profile or {}

	# if user.services?.facebook
	# 	user.emails = [{address: user.services.facebook.email, verified: true}]
	# 	user.profile.firstName = user.services.facebook.first_name
	# 	user.profile.lastName = user.services.facebook.last_name
	# if user.services?.google
	# 	user.emails = [{address: user.services.google.email, verified: true}]
	# 	user.profile.firstName = user.services.google.given_name
	# 	user.profile.lastName = user.services.google.family_name
	# # TODO: twitter email, first name and last name
	user