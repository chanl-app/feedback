Future = Npm.require('fibers/future')

Api = new Restivus
	useDefaultAuth: false
	prettyJson: true
	version: 'v1'
	defaultHeaders:
		'Content-Type': 'application/json'
	defaultOptionsEndpoint: 'hello'

Api.addCollection Reviews, 
	excludedEndpoints: []
	routeOptions:
		authRequired: true
	endpoints:
		post:
			action: ->
				@bodyParams.owner = @userId
				@bodyParams.appId = @appId

				newFuture = new Future()

				# TODO check
				# check @bodyParams, {title: String, text: String}
				Reviews.insert @bodyParams, (err, resp)->
					if err
						newFuture.return {statusCode: 400, status: 'failed', error: err.message, message: 'Internal server contact admin'}

					if resp
						newFuture.return {status: 'success', data: Reviews.findOne resp, message: 'created object successfully'}

				newFuture.wait()