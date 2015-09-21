Template.signUpForms.rendered = () ->
	# console.log Variables.particles
	# particlesJS.load 'particles-js', Variables.particles, ->
	# 	console.log('callback - particles.js config loaded');
	console.log Variables.particles
	$('#particles-js').particleground({
		parallax: false
		maxSpeedX: 0.8
		maxSpeedY: 0.8
		proximity: 120
		density: 9000
		particleRadius: 5
		dotColor: '#FFF'
		lineColor: '#FFF'
		});
	# particlesJS('particles-js', Variables.particles, ->
	# 	console.log('callback - particles.js config loaded')
	# )