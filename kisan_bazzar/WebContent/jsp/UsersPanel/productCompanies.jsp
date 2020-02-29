
<%@include file="common/header.jsp"%>

<%
	String JspPagePathBody = getServletContext().getInitParameter("UsersResources");
%>

<div class="container-fluid search-page" style="background-color:rgb(28, 107, 62);">
	<div class="container">
    	<div class="row search-box">
          <div class="col-md-5">
            <div class="s2-example">
              <p>
                <select aria-hidden="true" tabindex="-1" class="js-example-basic-multiple js-states form-control select2-hidden-accessible" multiple="">
                  <optgroup label="Alaskan/Hawaiian Time Zone">
                  <option value="AK">Alaska</option>
                  <option value="HI">Hawaii</option>
                  <option value="CA">California</option>
                  <option value="NV">Nevada</option>
                  <option value="OR">Oregon</option>
                  <option value="WA">Washington</option>
                  <option value="AZ">Arizona</option>
                  <option value="CO">Colorado</option>
                  <option value="ID">Idaho</option>
                  <option value="MT">Montana</option>
                  <option value="NE">Nebraska</option>
                  <option value="NM">New Mexico</option>
                  <option value="ND">North Dakota</option>
                  <option value="UT">Utah</option>
                  <option value="WY">Wyoming</option>
                  <option value="AL">Alabama</option>
                  <option value="AR">Arkansas</option>
                  <option value="IL">Illinois</option>
                  <option value="IA">Iowa</option>
                  <option value="KS">Kansas</option>
                  <option value="KY">Kentucky</option>
                  <option value="LA">Louisiana</option>
                  <option value="MN">Minnesota</option>
                  <option value="MS">Mississippi</option>
                  <option value="MO">Missouri</option>
                  <option value="OK">Oklahoma</option>
                  <option value="SD">South Dakota</option>
                  <option value="TX">Texas</option>
                  <option value="TN">Tennessee</option>
                  <option value="WI">Wisconsin</option>
                  <option value="CT">Connecticut</option>
                  <option value="DE">Delaware</option>
                  <option value="FL">Florida</option>
                  <option value="GA">Georgia</option>
                  <option value="IN">Indiana</option>
                  <option value="ME">Maine</option>
                  <option value="MD">Maryland</option>
                  <option value="MA">Massachusetts</option>
                  <option value="MI">Michigan</option>
                  <option value="NH">New Hampshire</option>
                  <option value="NJ">New Jersey</option>
                  <option value="NY">New York</option>
                  <option value="NC">North Carolina</option>
                  <option value="OH">Ohio</option>
                  <option value="PA">Pennsylvania</option>
                  <option value="RI">Rhode Island</option>
                  <option value="SC">South Carolina</option>
                  <option value="VT">Vermont</option>
                  <option value="VA">Virginia</option>
                  <option value="WV">West Virginia</option>
                  </optgroup>
                </select>
              </p>
            </div>
            <script type="text/javascript">
  var $states = $(".js-source-states");
  var statesOptions = $states.html();
  $states.remove();

  $(".js-states").append(statesOptions);

  $("[data-fill-from]").each(function () {
    var $this = $(this);

    var codeContainer = $this.data("fill-from");
    var $container = $(codeContainer);

    var code = $.trim($container.html());

    $this.text(code);
    $this.addClass("prettyprint linenums");
  });

  prettyPrint();

  $.fn.select2.amd.require([
    "select2/core",
    "select2/utils",
    "select2/compat/matcher"
  ], function (Select2, Utils, oldMatcher) {
    var $basicSingle = $(".js-example-basic-single");
    var $basicMultiple = $(".js-example-basic-multiple");
    var $limitMultiple = $(".js-example-basic-multiple-limit");

    var $dataArray = $(".js-example-data-array");
    var $dataArraySelected = $(".js-example-data-array-selected");

    var data = [
      { id: 0, text: 'enhancement' },
      { id: 1, text: 'bug' },
      { id: 2, text: 'duplicate' },
      { id: 3, text: 'invalid' },
      { id: 4, text: 'wontfix' }
    ];

    var $ajax = $(".js-example-data-ajax");

    var $disabledResults = $(".js-example-disabled-results");

    var $tags = $(".js-example-tags");

    var $matcherStart = $('.js-example-matcher-start');

    var $diacritics = $(".js-example-diacritics");
    var $language = $(".js-example-language");

    $.fn.select2.defaults.set("width", "100%");

    $basicSingle.select2();
    $basicMultiple.select2();
    $limitMultiple.select2({
      maximumSelectionLength: 2
    });

    function formatState (state) {
      if (!state.id) {
        return state.text;
      }
      var $state = $(
        '<span>' +
          '<img src="vendor/images/flags/' +
            state.element.value.toLowerCase() +
          '.png" class="img-flag" /> ' +
          state.text +
        '</span>'
      );
      return $state;
    };

    $(".js-example-templating").select2({
      templateResult: formatState,
      templateSelection: formatState
    });

    $dataArray.select2({
      data: data
    });

    $dataArraySelected.select2({
      data: data
    });

    function formatRepo (repo) {
      if (repo.loading) return repo.text;

      var markup = "<div class='select2-result-repository clearfix'>" +
        "<div class='select2-result-repository__avatar'><img src='" + repo.owner.avatar_url + "' /></div>" +
        "<div class='select2-result-repository__meta'>" +
          "<div class='select2-result-repository__title'>" + repo.full_name + "</div>";

      if (repo.description) {
        markup += "<div class='select2-result-repository__description'>" + repo.description + "</div>";
      }

      markup += "<div class='select2-result-repository__statistics'>" +
        "<div class='select2-result-repository__forks'><i class='fa fa-flash'></i> " + repo.forks_count + " Forks</div>" +
        "<div class='select2-result-repository__stargazers'><i class='fa fa-star'></i> " + repo.stargazers_count + " Stars</div>" +
        "<div class='select2-result-repository__watchers'><i class='fa fa-eye'></i> " + repo.watchers_count + " Watchers</div>" +
      "</div>" +
      "</div></div>";

      return markup;
    }

    function formatRepoSelection (repo) {
      return repo.full_name || repo.text;
    }

    $ajax.select2({
      ajax: {
        url: "https://api.github.com/search/repositories",
        dataType: 'json',
        delay: 250,
        data: function (params) {
          return {
            q: params.term, // search term
            page: params.page
          };
        },
        processResults: function (data, params) {
          // parse the results into the format expected by Select2
          // since we are using custom formatting functions we do not need to
          // alter the remote JSON data, except to indicate that infinite
          // scrolling can be used
          params.page = params.page || 1;

          return {
            results: data.items,
            pagination: {
              more: (params.page * 30) < data.total_count
            }
          };
        },
        cache: true
      },
      escapeMarkup: function (markup) { return markup; },
      minimumInputLength: 1,
      templateResult: formatRepo,
      templateSelection: formatRepoSelection
    });

    $(".js-example-disabled").select2();
    $(".js-example-disabled-multi").select2();

    $(".js-example-responsive").select2();

    $disabledResults.select2();

    $(".js-example-programmatic").select2();
    $(".js-example-programmatic-multi").select2();

    $eventSelect.select2();

    $tags.select2({
      tags: ['red', 'blue', 'green']
    });

    $(".js-example-tokenizer").select2({
      tags: true,
      tokenSeparators: [',', ' ']
    });

    function matchStart (term, text) {
      if (text.toUpperCase().indexOf(term.toUpperCase()) == 0) {
        return true;
      }

      return false;
    }



    $matcherStart.select2({
      matcher: oldMatcher(matchStart)
    });

    $(".js-example-basic-hide-search").select2({
      minimumResultsForSearch: Infinity
    });

    $diacritics.select2();

    $language.select2({
      language: "es"
    });

    $(".js-example-theme-single").select2({
      theme: "classic"
    });

    $(".js-example-theme-multiple").select2({
      theme: "classic"
    });

    $(".js-example-rtl").select2();
  });
</script>
          </div>
          <div class="col-md-6">
            <input class="form-control" placeholder="Search for..." type="text">
          </div>
          <div class="col-md-1"> <span class="input-group-btn">
            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
            </span> </div>
        </div>
    </div>
</div>


<div class="container-fluid">
<div class="container" >
<div class="row">
<div class="col-md-12">
<img src="<%=JspPagePathBody%>img/C2.jpg" style="height:245px; width:100%;" class="img-responsive"><a href="submitrequirement.html" button type="button" class="btn btn-success "  style="margin-left: 86%; margin-top: -60px; color: #121010; background-color: #f2f0f9; border-color: #f3f6f3;" >Submit Requirement</button></a>



</div>
</div>
</div>

<div class="container" background="bg1.jpg">
<div class="row">
<div class="col-md-12">
<div class="col-md-3">
<div class="Details" style="margin-top: 20px;">


              
              <div class="panel-body">
			  <h4 style="margin-bottom:20px;">Company Information</h4>
			  <br>
               <label>Parle-G Pvt. Ltd.</label>
                     </div>
                  
                  <div class="panel-body">
                      <label>Plot No.102 MIDC Nagpur</label>
                      </div>
                    
                  
               
                  <div class="panel-body">
                      <label>985652415454</label>
                      </div>
                   
                  
                  
             
<br>
<br>

                  <h4> Company Products</h4>
                <div id="carousel-example1-generic" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
				  <li data-target="#carousel-example1-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example1-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example1-generic" data-slide-to="2"></li>
                  </ol>
                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    <div class="item active"> <img src="<%=JspPagePathBody%>img/Grains/Barley1.jpg" alt="..."> </div>
                    <div class="item"> <img src="<%=JspPagePathBody%>img/Grains/Barley2.jpg" alt="..."> </div>
                    <div class="item"> <img src="<%=JspPagePathBody%>img/Grains/Bran.jpg" alt="..."> </div>
					                    <div class="item"> <img src="<%=JspPagePathBody%>img/Grains/Bulgar1.jpg" alt="..."> </div>
                       <div class="item"> <img src="<%=JspPagePathBody%>img/Grains/Wheat1.jpg" alt="..."> </div>
					   <div class="item"> <img src="<%=JspPagePathBody%>img/Grains/Spelt1.jpg" alt="..."> </div>
					   <div class="item"> <img src="<%=JspPagePathBody%>img/Grains/corn3.jpg" alt="..."> </div>
					   <div class="item"> <img src="<%=JspPagePathBody%>img/Grains/Sorghum1.jpg" alt="..."> </div>
                  </div>
                  <!-- Controls -->
                  <a class="left carousel-control" href="#carousel-example1-generic" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#carousel-example1-generic" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>
            
            </div>
			           
					   
					   <br>
					   <br>
                   <h4> Company Images</h4>
                <div id="carousel-example1-generic" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel-example1-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example1-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example1-generic" data-slide-to="2"></li>
                  </ol>
                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    <div class="item active"> <img src="<%=JspPagePathBody%>img/ci5.jpg" alt="..."> </div>
                    <div class="item"> <img src="<%=JspPagePathBody%>img/ci6.jpg" alt="..."> </div>
                    <div class="item"> <img src="<%=JspPagePathBody%>img/ci7.jpg" alt="..."> </div>
					
					<div class="item"> <img src="<%=JspPagePathBody%>img/ci8.jpg" alt="..."> </div>
					<div class="item"> <img src="<%=JspPagePathBody%>img/ci9.jpg" alt="..."> </div>
                  </div>
                  <!-- Controls -->
                  <a class="left carousel-control" href="#carousel-example1-generic" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#carousel-example1-generic" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>
           
            
			</div>
			
			
			
			 <div class="col-md-9">
      	
                 		  
            <div class="row">
          <div class="col-md-6">
		  <h4 style="margin-top: 45px;">&nbsp;&nbsp;&nbsp;Product Of Companies</h4>
		  <br>


 <br/>
		     <div class="col-md-4">
              <img src="<%=JspPagePathBody%>img/Grains/Spelt1.jpg" class="img-responsive " style="width: 130px;">
			 </div>
              <a href="url"><b>Grains</b></a>
                <p style="color:black;">Added Date:01-02-2016</p>
                <p style="color:black;">Quantity Of Product: </p>
                <p style="color:black;">Min.Rate : 10000</p>
				<center><p style="margin-right: 22px;color:black;">Max.Rate : 12000</p></center>
             
                 <a href="url" class="pull-right"><b>Apply</b></a>
			      <br>
				<hr>
				</div>
				</div>
			  
			   <div class="row">
          <div class="col-md-6">
		     <div class="col-md-4">
              <img src="<%=JspPagePathBody%>img/Grains/Spelt1.jpg" class="img-responsive " style="width: 130px;">
			 </div>
              <a href="url"><b>Grains</b></a>
                <p style="color:black;"> Added Date:01-02-2016</p>
                <p style="color:black;">Quantity Of Product:</p>
                <p style="color:black;">Min.Rate : 10000 </p>
				<center><p style="margin-right: 22px; color:black;">Max.Rate : 12000</p></center>
             
                 <a href="url" class="pull-right"><b>Apply</b></a>
			      <br>
				<hr>
				</div>
				</div>
				
             
			 <div class="row">
          <div class="col-md-6">
		     <div class="col-md-4">
              <img src="<%=JspPagePathBody%>img/Grains/Spelt1.jpg" class="img-responsive " style="width: 130px;">
			 </div>
              <a href="url"><b>Grains</b></a>
                <p style="color:black;"> Added Date:01-02-2016</p>
                <p style="color:black;">Quantity Of Product: </p>
                <p style="color:black;">in.Rate : 10000 </p>
				<center><p style="margin-right: 22px; color:black;">Max.Rate : 12000</p></center>
             
                 <a href="url" class="pull-right"><b>Apply</b></a>
			      <br>
				<hr>
				</div>
				</div>
				
				
			   
			  <div class="row">
          <div class="col-md-6">
		     <div class="col-md-4">
              <img src="<%=JspPagePathBody%>img/Grains/Spelt1.jpg" class="img-responsive " style="width: 130px;">
			 </div>
              <a href="url"><b>Grains</b></a>
                <p style="color:black;"> Added Date:01-02-2016</p>
                <p style="color:black;">Quantity Of Product: </p>
                <p style="color:black;">Min.Rate : 10000 </p>
				<center><p style="margin-right: 22px; color:black;"> Max.Rate : 12000</p></center>
             
                 <a href="url" class="pull-right"><b>Apply</b></a>
			      <br>
				<hr>
				</div>
				</div>
			  </div>
			 </div>
			  </div>
			  </div>
			</div>
               



<br>




<!-- Popup for login Section -->

<!-- Button trigger modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Login</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>




<!-- Button trigger modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Login</h4>
      </div>
      <div class="modal-body">
      <form>
        <div class="row">
          <div class="col-md-12">
            <label>Username</label>
            <input type="text" class="form-control" />
          </div>
        </div><br />
        <div class="row">
          <div class="col-md-12">
            <label>Passward</label>
            <input type="text" class="form-control" />
          </div>
        </div><br />
        <div class="row">
          <div class="col-md-12">
            <input type="checkbox" name="" value="">
            Remember Me</div>
        </div><br />
        <div class="row">
          <div class="col-md-6">
          		<a href="#" data-toggle="modal" data-target="#registration">Registration</a>
          </div>
          <div class="col-md-6">
          		<a href="#" data-toggle="modal" data-target="#forgetpassword" class="pull-right"> Forget Password</a>
          </div>
        </div>
        
        </div>
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
        <a href="indexnext.html" class="btn btn-success">Login</a>
      </div>
    </div>
  </div>
</div>
</div>
<!--Modal-->
<div class="modal fade" id="registration" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="registration">Register</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="row mar-5">
            <div class="col-md-6">
              <label>First Name:</label>
              <input type="text" class="form-control" />
            </div>
			<div class="col-md-6">
              <label>Last Name:</label>
              <input type="text" class="form-control" />
            </div>
          </div>
		   <div class="row mar-5">
            <div class="col-md-6">
              <label>Password:</label>
              <input type="password" class="form-control" />
            </div>
			<div class="col-md-6">
              <label>Confirm Password:</label>
              <input type="text" class="form-control" />
            </div>
          </div>
          <div class="row mar-5">
            <div class="col-md-12">
              <label>Email ID:</label>
              <input type="text" class="form-control" />
            </div>
          </div>
          <div class="row mar-5">
            <div class="col-md-12">
              <label>Contact No.:</label>
              <input type="text" class="form-control" />
            </div>
          </div>
         
          <div class="row">
            <div class="col-md-6"> <a href="#" data-toggle="modal" data-target="#myModal">Login</a> </div>
            <div class="col-md-6"> <a href="#" data-toggle="modal" data-target="#forgetpassword" class="pull-right"> Forget Password</a> </div>
          </div><br />
        </form>
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-success">Submit</button>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="common/footerBeforeSession.jsp"%>