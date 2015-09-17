@TabularTables = {}
tableActionButtons =
	data: '_id'
	title: 'Actions'
	tmpl: Meteor.isClient && Template.reviewActionCell
	width: '200px'
	orderable: false
	searchable: false

tableDate = 
	data: 'createdAt'
	title: ''	
	orderable: true
	searchable: false
	render:(val, type, doc) ->
		if val instanceof Date
			moment(val).format("MMM DD YY")
		else
			'no date'
reviewActionCellButtons = [ tableActionButtons, tableDate ]

TabularTables.Reviews = new Tabular.Table
	name: 'Reviews'
	collection: Reviews
	extraFields: ['title', 'text']
	# subs: 'userReviews'
	order: [[5, "desc"]]
	columns: _.union [
		data: '_id'
		width: '10px'
		tmpl: Meteor.isClient && Template.cellCheckbox
		orderable: false
		searchable: false
	,
		data: 'starred'
		width: '5px'
		orderable: false
		searchable: false
		tmpl: Meteor.isClient && Template.cellStarred
	,
		{data: 'title', title: 'Title'}
	,	
		data: 'text'
		title: 'Text'
		orderable: false
	], reviewActionCellButtons
	selector: (userId)->
		{owner: userId}