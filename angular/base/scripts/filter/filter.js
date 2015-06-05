require('./')
  .factory('CONSTANTONE', CONSTANTONEFilter);

/**
 * @ngInject
 */
function CONSTANTONEFilter() {

  return function(input) {
    // convert to lower case as an example
    var returnVal = input.toLowerCase();

    return returnVal;
  };

}
