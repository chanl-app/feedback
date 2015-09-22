Reviews.allow
	insert: (userId, doc) ->
		# ...
		true
	update: (userId, doc, fields, modifier) ->
		# ...
		doc.owner == userId
	remove: (userId, doc) ->
		# ...
		doc.owner == userId
	# fetch: ['owner'],
	# transform: () ->
	# 	# ...

UserApps.allow
	insert: (userId, doc) ->
		# ...
		true
	update: (userId, doc, fields, modifier) ->
		# ...
		true
	remove: (userId, doc) ->
		# ...
		true
	# fetch: ['owner'],
	# transform: () ->
	# 	# ...
	