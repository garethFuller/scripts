require('./')
  .directive('CONSTANTONE', CONSTANTONEDirective);

/**
 * @ngInject
 */
function CONSTANTONEDirective() {

  return {
    replace: true,
    restrict: 'E',
    template: require('./CONSTANTTWO.html'),
    link: link
  };

  // Linking function
  function link() {
    // @TODO create the link
  }
}
