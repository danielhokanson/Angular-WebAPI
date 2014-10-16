'use strict';

angular
  .module('angular-webapi', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ui.router'
  ]).config(function ($stateProvider) {
      $stateProvider.state('user-login', {
          url: '/user/login',
          templateUrl: 'templates/user/login.html',
          controller: 'UserCtrl'
      }).state('user-register', {
          url: '/user/register',
          templateUrl: 'templates/user/register.html',
          controller: 'UserCtrl'
      });
  });
