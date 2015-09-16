Schemas.User = new SimpleSchema
  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email
    label: -> TAPi18n.__ 'email'

  "emails.$.verified":
    type: Boolean
    label: -> TAPi18n.__ 'userEmailVerified'

  createdAt:
    type: Date

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
    # @roles.indexOf('admin') > -1
  isCustomer: ->
    # @roles.indexOf('customer') == -1
    true
  email: ->
    @emails[0].address