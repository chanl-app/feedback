Package.describe({
  name: 'template-styles',
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

  both = ['server', 'client']

  api.use([
    'coffeescript'
    ], both);

  api.use(
    [
    'less',
    'session',
    'jquery',
    'templating',
    'fortawesome:fontawesome',
    'natestrauser:animate-css'
    ],'client');

  api.addFiles([
    'lib/navbar.html',
    'lib/styles/main.less'
    ], 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('template-styles');
  api.addFiles('template-styles-tests.js');
});
