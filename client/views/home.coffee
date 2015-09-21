Template.signUpForms.rendered = () ->
	# console.log Variables.particles
	# particlesJS.load 'particles-js', Variables.particles, ->
	# 	console.log('callback - particles.js config loaded');
	console.log Variables.particles
	$('#particles-js').particleground({
		parallax: false
		maxSpeedX: 0.9
		maxSpeedY: 1.0
		proximity: 120
		density: 9000
		particleRadius: 5
		dotColor: '#FFF'
		lineColor: '#FFF'
		lineWidth: 0.3
		curvedLines: true
		directionX: 'center'
		directionY: 'center'
		});
	# particlesJS('particles-js', Variables.particles, ->
	# 	console.log('callback - particles.js config loaded')
	# )