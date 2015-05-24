require('./')
  .config(config);

/**
 * @ngInject
 */
function config($stateProvider) {
  $stateProvider
    .state('MODNAME', {
      url: 'MODNAME',
      parent: 'app',
      template: require('./MODNAME.html')
    });
}
