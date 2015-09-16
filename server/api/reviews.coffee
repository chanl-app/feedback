Api = new Restivus
	useDefaultAuth: true
	prettyJson: true
	version: 'v1'
	auth:
		token: 'auth.apiKey'
		user: ->
			userId: @request.headers['user-id']
			token: @request.headers['login-token']
	defaultHeaders:
		'Content-Type': 'application/json'

Api.addCollection Reviews, 
	excludedEndpoints: ['getAll', 'put']
	routeOptions:
		authRequired: true
	endpoints:
		post:
			authRequired: true
		get:
			authRequired: false
		delete:
			roleRequired: 'admin'