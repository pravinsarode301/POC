<%@include file="common/header.jsp"%>

<%
	String JspPagePathBody = getServletContext().getInitParameter("UsersResources");
%>


<!-- START OF BODY SECTION -->
<!-- facebook Intigration -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<script>
// Select dropdowns
if ($('select').length) {
    // Traverse through all dropdowns
    $.each($('select'), function (i, val) {
        var $el = $(val);
         
        // If there's any dropdown with default option selected
        // give them `not_chosen` class to style appropriately
        // We assume default option to have a value of '' (empty string)
        if (!$el.val()) {
            $el.addClass("not_chosen");
        }
         
        // Add change event handler to do the same thing,
        // i.e., adding/removing classes for proper
        // styling. Basically we are emulating placeholder
        // behaviour on select dropdowns.
        $el.on("change", function () {
            if (!$el.val())
                $el.addClass("not_chosen");
            else
                $el.removeClass("not_chosen");
        });
         
        // end of each callback
  });
}
</script>


<div class="container-fluid img-slider">
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 home-search-margin">
				<div class="row search-box">
					<div class="col-md-5">
						<div class="s2-example">
							<p>
								<select tabindex="0"
									class="js-example-basic-multiple js-states form-control"
									style="height: 39px;">
									<option value="" selected style="display: none;">Select
										your City</option>
									<option value="AK">Nagpur</option>
									<option value="HI">Pune</option>
									<option value="CA">Mumbai</option>
									<option value="NV">Kolhapur</option>
									<option value="OR">Satara</option>
									<option value="WA">Sangli</option>
									<option value="AZ">Thane</option>
									<option value="CO">Talegaon</option>
									<option value="ID">Jalgaon</option>
									<option value="MT">Akola</option>
									<option value="NE">Amravati</option>
									<option value="NM">Karanja</option>
									<option value="ND">Akot</option>
									<option value="UT">Kondhali</option>
									<option value="WY">Solapur</option>
									<option value="AL">Latur</option>
									<option value="AR">Nashik</option>
									<option value="IL">Lonar</option>
									<option value="IA">Nandura</option>
									<option value="KS">Buldhana</option>
									<option value="KY">Malkapur</option>
									<option value="LA">Washim</option>
									<option value="MN">Chandrapur</option>
									<option value="MS">Morshi</option>
									<option value="MO">Bhandara</option>
									<option value="OK">Umred</option>
									<option value="SD">Shegaon</option>
									<option value="TX">Shirdi</option>
									<option value="TN">Naded</option>
									<option value="WI">Arvi</option>
									<option value="CT">Warora</option>
									<option value="DE">Wardha</option>
									<option value="FL">Gadchiroli</option>
									<option value="GA">Murtijapur</option>
									<option value="IN">Borgaon</option>
									<option value="ME">Risod</option>
									<option value="MD">Ashti</option>
									<option value="MA">Ramtek</option>
									<option value="MI">Telhara</option>
									<option value="NH">Khamgaon</option>
									<option value="NJ">Sakoli</option>
									<option value="NY">Shahpur</option>
									<option value="NC">Dhamangaon</option>
									<option value="OH">Pimpalgaon</option>
									<option value="PA">Chandur</option>
									<option value="RI">Ratnagiri</option>
									<option value="SC">Ahamadnagar</option>
									<option value="VT">Selu</option>
									<option value="VA">Mahabala</option>
									<option value="WV">Khadaki</option>
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
   $(".js-example-placeholder-single").select2({
  placeholder: "Select a state",
  allowClear: true
});
</script>
						<script>
$(document).ready(function () {
                
                $('#example1').datepicker({
                    format: "dd/mm/yyyy"
                });  
            
            });
			</script>

						<script>
$(document).ready(function () {
                
                $('#example2').datepicker({
                    format: "mm/yyyy"
                });  
            
            });
			</script>
						<script>
$(document).ready(function () {
                
                $('#example3').datepicker({
                    format: "mm/yyyy"
                });  
            
            });
			</script>

					</div>
					<div class="col-md-6">
						<input type="text" class="form-control"
							placeholder="Search By Product Name...">
					</div>
					<div class="col-md-1">
						<span class="input-group-btn"> <a href="search.html"
							class="btn btn-default"><span
								class="glyphicon glyphicon-search"></span></a>
						</span>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<div class="container-fluid  img-slider1">
	<div class="container" style="background-color: #FFFFFF;">
		<div class="row">
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default" style="margin-top: 20px;">
							<div class="panel-heading" style="background-color: #e1e8f3;">
								Search deal by</div>
							<div class="panel-body">
								<form>
									<div class="row" style="margin: 5px 0;">
										<div class="col-md-12">
											<label>Week</label> <input type="text" placeholder="Week"
												class="form-control" id="datepicker" />
										</div>
									</div>
									<br>
									<div class="row" style="margin: 5px 0;">
										<div class="col-md-12">
											<label>Month</label> <input type="text" placeholder="Month"
												class="form-control" id="datepicker1" />
										</div>
									</div>
									<br>
									<div class="row" style="margin: 5px 0;">
										<div class="col-md-12">
											<label>Year</label> <input type="text" placeholder="Year"
												id="datepicker2" class="form-control" />
										</div>
									</div>
									<br>
									<div class="row" style="margin: 5px 0;">
										<div class="col-md-12">
											<center>
												<button class="btn btn-success">Search</button>
											</center>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="background-color: #e1e8f3;">
								Big deal in Week</div>
							<div class="panel-body">
								<div id="carousel-example1-generic" class="carousel slide"
									data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#carousel-example1-generic" data-slide-to="0"
											class="active"></li>
										<li data-target="#carousel-example1-generic" data-slide-to="1"></li>
										<li data-target="#carousel-example1-generic" data-slide-to="2"></li>
									</ol>
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<div class="item active">
											<img src="<%=JspPagePathBody%>img/12.jpg" alt="...">
										</div>
										<div class="item">
											<img src="<%=JspPagePathBody%>img/13.jpg" alt="...">
										</div>
										<div class="item">
											<img src="<%=JspPagePathBody%>img/20.jpg" alt="...">
										</div>
									</div>
									<!-- Controls -->
									<a class="left carousel-control"
										href="#carousel-example1-generic" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example1-generic" role="button"
										data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="background-color: #e1e8f3;">
								Reach Farmers</div>
							<div class="panel-body">
								<div id="carousel-example1-generic" class="carousel slide"
									data-ride="carousel">
									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#carousel-example1-generic" data-slide-to="0"
											class="active"></li>
										<li data-target="#carousel-example1-generic" data-slide-to="1"></li>
										<li data-target="#carousel-example1-generic" data-slide-to="2"></li>
									</ol>
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<div class="item active">
											<img src="<%=JspPagePathBody%>img/12.jpg" alt="...">
										</div>
										<div class="item">
											<img src="<%=JspPagePathBody%>img/13.jpg" alt="...">
										</div>
										<div class="item">
											<img src="<%=JspPagePathBody%>img/20.jpg" alt="...">
										</div>
									</div>
									<!-- Controls -->
									<a class="left carousel-control"
										href="#carousel-example1-generic" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example1-generic" role="button"
										data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8" style="margin-top: 20px;">
				<div class="row">
					<div class="col-md-4">
						<div class="img-product">
							<a href="GrainsSubCat.html"> <img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/grains.png"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Grains</h4>
						</a>
					</div>
					<div class="col-md-4">
						<div class="img-product">
							<a href="Vegetable.html"> <img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/vegetables.jpg"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Vegetables</h4>
						</a>
					</div>
					<div class="col-md-4">
						<div class="img-product">
							<a href="Fruits.html"> <img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/fruits.jpg"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Fruits</h4>
						</a>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-4">
						<div class="img-product">
							<a href="Pulses.html"> <img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/pulses.jpg"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Pulses</h4>
						</a>
					</div>
					<div class="col-md-4">
						<div class="img-product">
							<a href="Cereals.html"> <img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/cereals.jpg"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Cereals</h4>
						</a>
					</div>
					<div class="col-md-4">
						<div class="img-product">
							<a href="Beans.html"> <img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/beans.jpg"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Beans</h4>
						</a>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-4">
						<div class="img-product">
							<a href="Oilseed.html"><img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/oilseeds1.jpg"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Oil Seeds</h4>
						</a>
					</div>
					<div class="col-md-4">
						<div class="img-product">
							<a href="Cotton.html"> <img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/cotton.jpg"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Cotton</h4>
						</a>
					</div>
					<div class="col-md-4">
						<div class="img-product">
							<a href="Spices.html"> <img
								src="<%=JspPagePathBody%>img/Shetakari Bazar Images/spices1.jpg"
								class="img-circle img-responsive" />
						</div>
						<h4 class="text-center">Spices</h4>
						</a>
					</div>
				</div>
				<br />
			</div>
		</div>
	</div>
</div>
</div>

<!-- END OF BODY SECTION -->
<%@include file="common/footer.jsp"%>