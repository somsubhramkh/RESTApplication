<%@include file="Header.jsp"%>


 <aside class="callout">
      <div class="text-vertical-center"></div>
    </aside>




<div ng-app="myApp">
<div ng-controller="UserController as ctrl">
    <section id="services" class="services bg-primary">
      <div class="container">
        <div class="row text-center">
          <div class="col-lg-10 col-lg-offset-1">
            <h2>
              <br>Register as a New User</h2>
            <hr class="small">
            <div class="section">
            
              <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                <div class="form-group">
                  <div class="col-sm-2">
                    <label class="control-label">Username</label>
                  </div>
                  <div class="col-sm-10">
                    <input type="text" ng-model="ctrl.user.username" id="username" class="username form-control input-sm" placeholder="Enter your username" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.username.$error.required">This is a required field</span>
                                      <span ng-show="myForm.username.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.username.$invalid">This field is invalid </span>
                                  </div>
                  </div>
                  
                </div>
                <div class="form-group">
                  <div class="col-sm-2">
                    <label class="control-label">Password</label>
                  </div>
                  <div class="col-sm-10">
                    <input type="password" ng-model="ctrl.user.password" id="password" class="password form-control input-sm" required ng-minlength="6"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.password.$error.required">This is a required field</span>
                                      <span ng-show="myForm.password.$error.minlength">Minimum length required is 6</span>
                                      <span ng-show="myForm.password.$invalid">This field is invalid </span>
                                  </div>
                  </div>
                  
                </div>
                <div class="form-group">
                  <div class="col-sm-2">
                    <label class="control-label">Name</label>
                  </div>
                  <div class="col-sm-10">
                    <input type="text" ng-model="ctrl.user.name" id="name" class="name form-control input-sm" placeholder="Enter your name" required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span ng-show="myForm.name.$error.minlength">Minimum length required is 1</span>
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                  </div>
                  
                </div>
                <div class="form-group">
                  <div class="col-sm-2">
                    <label class="control-label">Email</label>
                  </div>
                  <div class="col-sm-10">
                    <input type="email" ng-model="ctrl.user.email" id="email" class="email form-control input-sm" placeholder="Enter your Email" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                  </div>
                  
                  
                </div>
                <div class="form-group">
                  <div class="col-sm-2">
                    <label class="control-label">Location</label>
                  </div>
                  <div class="col-sm-10">
                    <input type="text" ng-model="ctrl.user.location" id="location" class="location form-control input-sm" placeholder="Enter your Location" required ng-minlength="1"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.location.$error.required">This is a required field</span>
                                      <span ng-show="myForm.location.$error.minlength">Minimum length required is 1</span>
                                      <span ng-show="myForm.location.$invalid">This field is invalid </span>
                                  </div>
                  </div>
                  
                </div>
                
                <div class="form-group">
                <div class="col-sm-2">
                   
                  </div>
						<div class="col-sm-10">
							<input type="file" class="form-control" path="profilePicture" />
						</div>
					</div>
					
                <div class="form-group">
                  <button type="submit" class="btn btn-default">Register</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- /.col-lg-10 -->
      </div>
      <!-- /.row -->
      <!-- /.container -->
    </section>
    
</div>
</div>    

      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/resources/js/app.js' />"></script>
      <script src="<c:url value='/resources/js/user_service.js' />"></script>
      <script src="<c:url value='/resources/js/user_controller.js' />"></script>
<%@include file="Footer.jsp"%>