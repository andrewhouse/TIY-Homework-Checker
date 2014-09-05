angular.module('table', ['ngResource']).
  controller('TableCtrl', ['$scope', '$resource', function($scope, $resource){
  var Tests = $resource('/homeworks.json');
  $scope.queries = Tests.get();

  now = new Date();
  $scope.search = $scope.search || now.toLocaleDateString("en-US", {month:"long"})

  var options = {weekday: "long", month: "long", day: "2-digit"};
  var options2 = {weekday: "narrow", month: "2-digit", day: "numeric"}

  $scope.date_filter = function(assignment) {
    if (!$scope.search) { return false; }
    lowercase = $scope.search.toLowerCase();
    title = assignment.title.toLowerCase();
    description = assignment.description.toLowerCase();
    date = new Date(assignment.date + "EDT");
    date_string = date.toLocaleDateString("en-US", options);
    date_string2 = date.toLocaleDateString("en-US", options2)
    // console.log("assignment is:", assignment);
    // console.log("search term is:", $scope.search);
    if (date_string2.indexOf($scope.search) > -1) {
      return true; //search date
    } else if (date_string.toLowerCase().indexOf(lowercase) > -1) {
      return true; // search date with number month
    } else if (title.indexOf(lowercase) > -1){
      return true; // search title
    } else if (description.indexOf(lowercase) > -1){
      return true; // search description
    } else {
      return false; // filter it out
    }
  }

}]).directive('tooltip', function(){
  return {
    restrict: 'A',
    link: function (scope, element, attrs) {
      $('.ass').tooltip();
    }
  }
}).directive('ngDebounce', function($timeout) {
    return {
        restrict: 'A',
        require: 'ngModel',
        priority: 99,
        link: function(scope, elm, attr, ngModelCtrl) {
            if (attr.type === 'radio' || attr.type === 'checkbox') return;

            elm.unbind('input');

            var debounce;
            elm.bind('input', function() {
                $timeout.cancel(debounce);
                debounce = $timeout( function() {
                    scope.$apply(function() {
                        ngModelCtrl.$setViewValue(elm.val());
                    });
                }, attr.ngDebounce || 1000);
            });
            elm.bind('blur', function() {
                scope.$apply(function() {
                    ngModelCtrl.$setViewValue(elm.val());
                });
            });
        }

    }
});;
