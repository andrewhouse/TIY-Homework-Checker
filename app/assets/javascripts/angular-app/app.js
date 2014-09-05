angular.module('table', ['ngResource']).
  controller('TableCtrl', ['$scope', '$resource', function($scope, $resource){
  var Tests = $resource('/homeworks.json');
  $scope.queries = Tests.get(function(queries) {
    queries.assignments.forEach(function(assignment){
      assignment.lowtitle = assignment.title.toLowerCase();
      assignment.lowdescription = assignment.description.toLowerCase();
      assignment.ndate = new Date(assignment.date + "EDT");
      assignment.date_string = assignment.ndate.toLocaleDateString("en-US", options);
      assignment.date_string2 = assignment.ndate.toLocaleDateString("en-US", options2);
    });
  });

  now = new Date();
  $scope.search = $scope.search || now.toLocaleDateString("en-US", {month:"long"})

  var options = {weekday: "long", month: "long", day: "2-digit"};
  var options2 = {weekday: "narrow", month: "2-digit", day: "numeric"}

  $scope.date_filter = function(assignment) {
    if (!$scope.search) { return false; }
    lowercase = $scope.search.toLowerCase();
    // title = assignment.title.toLowerCase();
    // description = assignment.description.toLowerCase();
    // date = new Date(assignment.date + "EDT");
    // date_string = date.toLocaleDateString("en-US", options);
    // date_string2 = date.toLocaleDateString("en-US", options2)
    console.log("assignment is:", assignment);
    console.log("search term is:", $scope.search);
    if (assignment.date_string2.indexOf($scope.search) > -1) {
      return true; //search date
    } else if (assignment.date_string.toLowerCase().indexOf(lowercase) > -1) {
      return true; // search date with number month
    } else if (assignment.lowtitle.indexOf(lowercase) > -1){
      return true; // search title
    } else if (assignment.lowdescription.indexOf(lowercase) > -1){
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
  });
