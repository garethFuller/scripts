require('./')
  .directive('DIRECTIVENAME', DIRECTIVENAMEDirective);

/**
 * @ngInject
 */
function DIRECTIVENAMEDirective() {

  return {
    replace: true,
    restrict: 'E',
    template: require('./TEMPLATENAME.html'),
    link: link
  };

  // Linking function
  function link(scope) {
    // @TODO create the link
  }
}
