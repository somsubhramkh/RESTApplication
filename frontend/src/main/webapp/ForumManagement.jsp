<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>AngularJS $http Example</title>  
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="ForumController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Forum</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      
                      <input type="hidden" ng-model="ctrl.forum.postId" />
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="category">Category</label>
                              <div class="col-md-7">
                                 <select ng-model="ctrl.forum.category" ng-options="c for c in categories"></select>
                                  
                              </div>
                          </div>
                      </div>
                      
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="postTitle">Title</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.forum.postTitle" id="postTitle" class="postTitle form-control input-sm" placeholder="Enter Post title" required ng-minlength="5"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.postTitle.$error.required">This is a required field</span>
                                      <span ng-show="myForm.postTitle.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.postTitle.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      
                         
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="postContent">Content</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.forum.postContent" id="postContent" class="postContent form-control input-sm" placeholder="Enter Content" required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.postContent.$error.required">This is a required field</span>
                                      <span ng-show="myForm.postContent.$error.minlength">Minimum length required is 1</span>
                                      <span ng-show="myForm.postContent.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                      
 						<input type="hidden" ng-model="ctrl.forum.creationDate" />
 						<input type="hidden" ng-model="ctrl.forum.username" />
 						
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.forum.postId ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">Forum Posts </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Forum ID</th>
                              <th>Title</th>
                              <th>Content</th>
                              <th>CreationDate</th>
                              <th>Author</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.forums">
                              <td><span ng-bind="u.postId"></span></td>
                              <td><span ng-bind="u.postTitle"></span></td>
                              <td><span ng-bind="u.postContent"></span></td>
                              <td><span ng-bind="u.creationDate|date:'medium'"></span></td>
                              <td><span ng-bind="u.username"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.postId)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.postId)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/resources/js/app.js' />"></script>
      <script src="<c:url value='/resources/js/forum_service.js' />"></script>
      <script src="<c:url value='/resources/js/forum_controller.js' />"></script>
  </body>
</html>