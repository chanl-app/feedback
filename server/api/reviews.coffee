Api = new Restivus
	useDefaultAuth: true
	prettyJson: true
	version: 'v1'
	defaultHeaders:
		'Content-Type': 'application/json'

Api.addCollection Reviews, 
	excludedEndpoints: []
	routeOptions:
		authRequired: true