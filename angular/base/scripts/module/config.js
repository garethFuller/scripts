require('./')
  .config(config);

/**
 * @ngInject
 */
function config($stateProvider) {
  $stateProvider
    .state('PATH', {
      url: 'PATH',
      parent: 'app',
      template: require('./MODNAME.html')
    });
}
