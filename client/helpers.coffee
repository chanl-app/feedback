Template.registerHelper 'Truncate', (text, length)->
	_.str.prune text, length

Template.registerHelper 'User', ->
	Meteor.user()

Template.registerHelper 'Config', ->
	Config

Template.registerHelper 'reviewTableSettings', ->
	rowClass: (item)->
		if !item.viewed
			'warning'
	noDataTmpl: Template.noReviewData
	fields: [
		key: '_id'
		label: ''
		tmpl: Template.cellCheckbox
		sortable: false
		headerClass: 'col-md-1'
	,
		key: 'title'
		label: 'Title'
		sortable: false
		headerClass: 'title col-md-2'
	,
		key: 'text'
		label: 'Message'
		sortable: false
		headerClass: 'text col-md-3'
	,
		key: 'createdAt'
		label: 'Date'
		sortable: false
		sortDirection: -1
		headerClass: 'col-md-2'
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
		headerClass: 'col-md-4'

	]