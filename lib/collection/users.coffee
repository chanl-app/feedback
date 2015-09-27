Schemas.UserSettings = new SimpleSchema
  smsNotifications:
    label: -> 'user settings'
    type: Boolean
    optional: true
    autoValue: ->
      if @isInsert
        false

Schemas.User = new SimpleSchema
  username:
    type: String,
    label: "Username" 
    optional: true

  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email
    label: -> 'Email'

  "emails.$.verified":
    type: Boolean
    label: -> 'Verified'

  auth:
    type: [Object]
    optional: true
    autoform: omit: true

  "auth.$.apiKey":
    type: String
    optional: true
    autoform: omit: true

  createdAt:
    type: Date
    autoform: omit: true

  profile:
    type: Schemas.UserProfile
    defaultValue: {}

  phone:
    type: Schemas.UserPhone
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true
    autoform: omit: true

  "app":
    type: Object
    optional: true
    autoform: omit: true
    blackbox: true

  "app.$._id":
    type: String
    optional: false

  "app.$.name":
    type: String
    optional: false

  roles:
    type: [String]
    blackbox: true
    optional: true
    autoform: omit: true

  settings:
    type: Schemas.UserSettings

Meteor.users.attachSchema Schemas.User

Meteor.users.helpers
  fullName: () ->
    (@profile.firstName || '')  + ' ' + (@profile.lastName || '')
  isAdmin: ->
    @roles.indexOf('admin') > -1
  isCustomer: ->
    @roles.indexOf('customer') == 0
  email: ->
    @emails[0].address

  apiKey: ->
    @services?.resume?.loginTokens?[0].hashedToken

  username: ->
    @emails[0].address

  activeApp: ->
    if @app?
      @app
    else
      false

  id: ->
    @_id