Template.registerHelper 'User', ->
	Meteor.user()

Template.registerHelper 'Config', ->
	Config

Template.registerHelper 'reviewTableSettings', ->
	rowClass: (item)->
		if !item.viewed
			'warning'
	fields: [
		key: '_id'
		label: ''
		tmpl: Template.cellCheckbox
		sortable: false
	,
		key: 'title'
		label: 'Title'
		sortable: false
	,
		key: 'text'
		label: 'Message'
		sortable: false
	,
		key: 'createdAt'
		label: 'Date'
		sortable: false
		sortDirection: -1
		fn: (value, object)->
			if value instanceof Date
				moment(value).format("MMM DD YY")
			else
				'no date'
	,
		key: '_id'
		label: ''
		tmpl: Template.reviewActionCell
		sortable: false

	]