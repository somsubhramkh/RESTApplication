<%@include file="Header.jsp"%>


  <aside class="callout">
      <div class="text-vertical-center"></div>
    </aside>



<div class="row">
          <div class="col-md-12">
            <h1>Add a New Forum</h1>
          </div>
        </div>
<div ng-app="myApp">
<div ng-controller="ForumController as ctrl">
<div class="well">
	
			   

              <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
               
               <div class="form-group">
                  <label class="control-label">Category</label>
                  <select ng-model="ctrl.forum.category" ng-options="c for c in categories"></select>
                </div>
			   
                <div class="form-group">
                  <label class="control-label">Title</label>
                  <input ng-model="ctrl.forum.postTitle" id="postTitle" class="postTitle form-control" placeholder="Enter Title" type="text" required/>
                </div>
               
                <div class="form-group">
                  <label class="control-label">Content
                  </label>
                  <textarea class="postContent form-control" placeholder="Enter Content" rows="10" ng-model="ctrl.forum.postContent" required></textarea>
                </div>
               
                <button type="submit" class="btn btn-default">Post</button>
              </form>
            </div>
            
            
<div class="section">
	<div class="container">
	




		

		<!-- Textbox used to implement search option using Angular -->
		<!-- ============================================================================================== -->

		<div class="bs-component">

			<form class="form-inline">
				<div class="form-group">
					<label>Search</label> <input type="text" ng-model="search"
						class="form-control" placeholder="Search">
				</div>
			</form>


			<!-- table to show data coming from the JSON file -->
			<!-- ============================================================================================== -->


			<table class="table table-striped table-hover">
				<thead>
					<tr>

						<!-- Performing sort functionality using angular both in ascending and descending manner -->
						<!-- ============================================================================================== -->
						<th ng-click="sort('category')">Category <span
							class="glyphicon sort-icon" ng-show="sortKey=='category'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						
						<th ng-click="sort('title')">Title <span
							class="glyphicon sort-icon" ng-show="sortKey=='title'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th ng-click="sort('content')">Content <span
							class="glyphicon sort-icon" ng-show="sortKey=='content'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th ng-click="sort('username')">Username <span
							class="glyphicon sort-icon" ng-show="sortKey=='category'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th ng-click="sort('creationDate')">Post Creation Date <span
							class="glyphicon sort-icon" ng-show="sortKey=='creationDate'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th>More Info</th>

					</tr>
				</thead>
				<tbody>
					<!-- dynamically generating the table data -->
					<!-- ============================================================================================== -->

					<tr
						ng-repeat="u in ctrl.forums|orderBy:sortKey:reverse|filter:search">
						<td>{{u.category}}</td>
						<td>{{u.postTitle}}</td>
						<td>{{u.postContent}}</td>
						<td>{{u.username}}</td>
						<td>{{u.creationDate|date:'medium'}}</td>


						<!-- Info button that maps to the ProductDetails view. Required Info for ProductDetails view is passed through request parameters -->
						<!-- ============================================================================================== -->

						<td><a
							href="/musichub/ProductDetails?id={{product.id}}&name={{product.name}}&desc={{product.desc}}&brand={{product.brand}}&price={{product.price}}"><i
								class="fa fa-3x fa-fw fa-exclamation-circle"></i></a></td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>
</div>
</div>
</div>
<script src="<c:url value='/resources/js/app.js' />"></script>
<script src="<c:url value='/resources/js/forum_service.js' />"></script>
<script src="<c:url value='/resources/js/forum_controller.js' />"></script>            

<%@include file="Footer.jsp"%>
