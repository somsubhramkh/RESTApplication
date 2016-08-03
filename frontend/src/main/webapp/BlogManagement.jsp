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
      <div class="generic-container" ng-controller="BlogController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Blogs </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.blog.blogId" />
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="blogTitle">Title</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.blog.blogTitle" id="blogTitle" class="blogTitle form-control input-sm" placeholder="Enter Blog title" required ng-minlength="5"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.blogTitle.$error.required">This is a required field</span>
                                      <span ng-show="myForm.blogTitle.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.blogTitle.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      
                         
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="blogContent">Content</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.blog.blogContent" id="blogContent" class="blogContent form-control input-sm" placeholder="Enter Content" required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.blogContent.$error.required">This is a required field</span>
                                      <span ng-show="myForm.blogContent.$error.minlength">Minimum length required is 1</span>
                                      <span ng-show="myForm.blogContent.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                      
 						<input type="hidden" ng-model="ctrl.blog.creationDate" />
 						<input type="hidden" ng-model="ctrl.blog.username" />
 						
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.blog.blogId ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">Blogs </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Blog ID</th>
                              <th>Title</th>
                              <th>Content</th>
                              <th>CreationDate</th>
                              <th>Author</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.blogs">
                              <td><span ng-bind="u.blogId"></span></td>
                              <td><span ng-bind="u.blogTitle"></span></td>
                              <td><span ng-bind="u.blogContent"></span></td>
                              <td><span ng-bind="u.creationDate|date:'medium'"></span></td>
                              <td><span ng-bind="u.username"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.blogId)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.blogId)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/resources/js/app.js' />"></script>
      <script src="<c:url value='/resources/js/blog_service.js' />"></script>
      <script src="<c:url value='/resources/js/blog_controller.js' />"></script>
  </body>
</html>