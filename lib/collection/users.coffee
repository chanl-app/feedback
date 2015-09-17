Schemas.UserSettings = new SimpleSchema
  smsNotifications:
    label: -> 'user settings'
    type: Boolean
    optional: true
    autoValue: ->
      if @isInsert
        false

Schemas.User = new SimpleSchema
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

  "auth.$.apiKey":
    type: String
    optional: true

  createdAt:
    type: Date

  profile:
    type: Schemas.UserProfile
    defaultValue: {}

  # phone:
  #   type: Schemas.UserPhone
  #   optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true

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
  id: ->
    @_id