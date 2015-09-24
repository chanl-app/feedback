Package.describe({
  name: 'philip100:bootstrap-account-change-password',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: '',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.3');


  both = ['server', 'client'];
  
  api.use([
    'coffeescript',
    'iron:router'
  ], both);

  api.use(
    [
    'less',
    'session',
    'jquery',
    'templating',
    'ui',
    'fortawesome:fontawesome',
    'blaze',
    'natestrauser:animate-css',
    'underscore'
    ], 'client');

  api.addFiles([
    'lib/app.html',
    'lib/app.coffee'
  ], 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('philip100:bootstrap-account-change-password');
  // api.addFiles('bootstrap-account-change-password-tests.js');
});
