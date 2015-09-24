trimInput = (value)->
	return value.replace(/^\s*|\s*$/g, '');

isNotEmpty = (value)->
	if value && value != ''
		return true;
	
	console.log('Please fill in all required fields.');
	return false;

isEmail = (value)->
	filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if filter.test(value)
		return true;

	console.log('Please enter a valid email address.');
	return false;

isValidPassword = (password)->
	if password.length < 6
		console.log('Your password should be 6 characters or longer.');
		return false;
	
	return true;

areValidPasswords = (password, confirm)->
	if !isValidPassword(password)
		return false;
	
	if password != confirm
		console.log('Your two passwords are not equivalent.');
		return false;
	
	return true;

Template.changeAccountPasswordForm.events
	'submit #changeAccountPasswordForm': (e, t) ->
		e.preventDefault()

		changeAccountPasswordForm = $(e.currentTarget)

		# email = trimInput(changeAccountPasswordForm.find('#signUpEmail').val().toLowerCase()),
		currentPassword = changeAccountPasswordForm.find('#currentPassword').val()
		newPassword = changeAccountPasswordForm.find('#newPassword').val()
		confirmNewPassword = changeAccountPasswordForm.find('#confirmNewPassword').val()

		if isNotEmpty(currentPassword) and isNotEmpty(newPassword) and isNotEmpty(confirmNewPassword) and areValidPasswords(newPassword, confirmNewPassword)
			Accounts.changePassword currentPassword, newPassword, (err, resp)->
				if err
					message = "There was an error logging in: <strong>#{err.reason}</strong>"
					changeAccountPasswordForm.find('#form-messages').html(message)

				else
					changeAccountPasswordForm.find('#form-messages').html("password changed")

		changeAccountPasswordForm.find('#currentPassword').val null
		changeAccountPasswordForm.find('#newPassword').val null
		changeAccountPasswordForm.find('#confirmNewPassword').val null