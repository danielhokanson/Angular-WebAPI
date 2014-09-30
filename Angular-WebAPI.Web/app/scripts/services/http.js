'use strict';

angular.module('angular-webapi')
  .service('httpSvc', function httpSvc($q, $http, $cookies) {
      var self = this;
      var _sessionGenerated = $q.defer();
      Object.defineProperty(self, 'hasSession', {
          get: function () {
              return $cookies['qss-id'] ? true : false;
          }
      });
      self.sessionRetrieved = _sessionGenerated.promise;
      function getSession() {
          $http.get('Session/Get').then(function () {
              _sessionGenerated.resolve();
          }, function () {
              _sessionGenerated.reject();
          });
      }
      function buildRequestPromise(func, args) {
          if (self.hasSession) {
              return func.apply(null, args);
          } else {
              var requested = $q.defer();
              getSession().then(function (data, status, headers, config) {
                  requested.resolve(data, status, headers, config);
              }, function (data, status, headers, config) {
                  requested.reject(data, status, headers, config);
              });
              return requested.promise;
          }
      }
      self.get = function get(url, config) {
          return buildRequestPromise($http.get, [url, config]);
      };
      self.delete = function (url, config) {
          return buildRequestPromise($http.delete, [url, config]);
      };
      self.head = function head(url, config) {
          return buildRequestPromise($http.head, [url, config]);
      };
      self.jsonp = function jsonp(url, config) {
          return buildRequestPromise($http.jsonp, [url, config]);
      };
      self.post = function set(url, data, config) {
          return buildRequestPromise($http.post, [url, data, config]);
      };
      self.put = function put(url, data, config) {
          return buildRequestPromise($http.put, [url, data, config]);
      };
      self.patch = function patch(url, data, config) {
          return buildRequestPromise($http.patch, [url, data, config]);
      };
  });
