require('./')
  .config(config);

/**
 * @ngInject
 */
function config($stateProvider) {
  $stateProvider
    .state('PATH', {
      url: '/PATH',
      parent: 'app',
      controller: 'CONTROLERNANECtrl as vm',
      template: require('./MODNAME.html')
    });
}
