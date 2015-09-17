@TabularTables = {}
tableActionButtons =
	data: '_id'
	title: 'Actions'
	tmpl: Meteor.isClient && Template.reviewActionCell
	width: '200px'
	orderable: false

reviewActionCellButtons = [ tableActionButtons ]

TabularTables.Reviews = new Tabular.Table
	name: 'Reviews'
	collection: Reviews
	extraFields: ['title', 'text']
	columns: _.union [
		data: '_id'
		width: '10px'
		tmpl: Meteor.isClient && Template.cellCheckbox
		orderable: false
	,
		data: 'starred'
		width: '10px'
	,
		{data: 'title', title: 'Title'}
	,	
		data: 'text'
		title: 'Text'
		orderable: false
	], reviewActionCellButtons