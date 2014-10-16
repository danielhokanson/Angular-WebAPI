'use strict';

angular.module('angular-webapi')
  .controller('UserCtrl', function ($scope, httpSvc) {
      $scope.login = function login() {
          httpSvc.post('user/login', $scope.user);
      };
  });
