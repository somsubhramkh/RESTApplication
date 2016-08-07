<%@include file="Header.jsp"%>


  <aside class="callout">
      <div class="text-vertical-center"></div>
    </aside>



<div class="row">
          <div class="col-md-12">
            <h1>Add a New Blog</h1>
          </div>
        </div>
<div ng-app="myApp">
<div ng-controller="BlogController as ctrl">
<div class="well">
	
			   

              <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
               
			   
                <div class="form-group">
                  <label class="control-label">Title</label>
                  <input ng-model="ctrl.blog.blogTitle" id="blogTitle" class="blogTitle form-control" placeholder="Enter Title" type="text" required/>
                </div>
               
                <div class="form-group">
                  <label class="control-label">Content
                  </label>
                  <textarea class="blogContent form-control" placeholder="Enter Content" rows="10" ng-model="ctrl.blog.blogContent" required></textarea>
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

						<th ng-click="sort('title')">Title <span
							class="glyphicon sort-icon" ng-show="sortKey=='name'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th ng-click="sort('content')">Content <span
							class="glyphicon sort-icon" ng-show="sortKey=='price'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th ng-click="sort('user')">User <span
							class="glyphicon sort-icon" ng-show="sortKey=='category'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th ng-click="sort('date')">Date <span
							class="glyphicon sort-icon" ng-show="sortKey=='category'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th>More Info</th>

					</tr>
				</thead>
				<tbody>
					<!-- dynamically generating the table data -->
					<!-- ============================================================================================== -->

					<tr
						ng-repeat="u in ctrl.blogs|orderBy:sortKey:reverse|filter:search">
						<td>{{u.blogTitle}}</td>
						<td>{{u.blogContent}}</td>
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
<script src="<c:url value='/resources/js/blog_service.js' />"></script>
<script src="<c:url value='/resources/js/blog_controller.js' />"></script>            

<%@include file="Footer.jsp"%>
