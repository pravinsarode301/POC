<%@page import="java.sql.ResultSet"%>
<%@include file="common/header.jsp"%><!-- Search Section -->
<%@page import="com.shetkari_bazzar.dao.ImageLoaderUtility"%>
<div class="container-fluid search-page">
	<div class="container">
		<div class="row search-box">
			<div class="col-md-5">
				<div class="s2-example">
					<p>
						<select aria-hidden="true" tabindex="-1"
							class="js-example-basic-multiple js-states form-control select2-hidden-accessible"
							multiple="multiple">
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
				<input type="text" class="form-control" placeholder="Search for...">
			</div>
			<div class="col-md-1">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
	</div>
</div>
<!-- Search data section -->
<div class="container-fluid">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h4>Filter</h4>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
								<label>State</label>
								<div class="s2-example">
									<p>
										<select aria-hidden="true" tabindex="-1"
											class="js-example-basic-multiple js-states form-control select2-hidden-accessible"
											multiple="multiple">
											<optgroup label="Select your State">
												<option value="MA">Maharatra</option>
												<option value="PB">Panjab</option>
												<option value="MP">Madhya Pradesh</option>
												<option value="GT">Gujarat</option>
												<option value="HA">Hariyana</option>
												<option value="OA">Odisa</option>
												<option value="BL">Bangal</option>
												<option value="BR">Bihar</option>
												<option value="RN">Rajasthan</option>
												<option value="KA">Kerla</option>
											</optgroup>
										</select>
									</p>
								</div>
								<br>
							</div>
							<div class="col-md-12">
								<label>City</label>
								<div class="s2-example">
									<p>
										<select aria-hidden="true" tabindex="-1"
											class="js-example-basic-multiple js-states form-control select2-hidden-accessible"
											multiple="multiple">
											<optgroup label="Select Your City">
												<option value="NR">Nagpur</option>
												<option value="PE">Pune</option>
												<option value="ST">Surat</option>
												<option value="IR">Indor</option>
												<option value="PA">Patana</option>
												<option value="KA">Kalkatta</option>
												<option value="AI">Arvi</option>
												<option value="NK">Nashik</option>
												<option value="BA">Bhandara</option>
												<option value="ND">Nanded</option>
												<option value="AI">Amravati</option>
											</optgroup>
										</select>
									</p>
								</div>
								<br>
							</div>
							</br>
							<div class="col-md-12">
								<label>Product Name</label>
								<div class="s2-example">
									<p>
										<select aria-hidden="true" tabindex="-1"
											class="js-example-basic-multiple js-states form-control select2-hidden-accessible"
											multiple="multiple">
											<optgroup label="Select your Product">
												<option value="WT">Rice</option>
												<option value="RE">Rye</option>
												<option value="BN">Bran</option>
												<option value="BR">Bulgar</option>
												<option value="ST">Spelt</option>
												<option value="CN">Corn</option>
												<option value="CR">Cornflour</option>
												<option value="MT">Millet</option>
												<option value="WR">Wild Rice</option>
												<option value="BR">Beer</option>
												<option value="MF">Montina flour</option>
											</optgroup>
										</select>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-9">
				<h4>Search Information</h4>
				<div class="row ">

					<% if(request.getAttribute("gridSubCategory")!=null){
        	  
        	  
        	ResultSet rt=(ResultSet)request.getAttribute("gridSubCategory");
        	  if(rt!=null){
        		 
        		  while(rt.next()){
        			  
        			  %>

					<div class="col-md-4">
						<div class="panel panel-default">
						<form action="RelevantCompaniesForProduct" method="post">
							<div class="panel-body info">
							
								<img src="data:image/jpg;base64,<%=ImageLoaderUtility.imageHtmlLoader(rt.getString("subProductImagePath")) %>"
									class="img-responsive "> <br /> 
								<p><b><%=rt.getString("subProductName") %></b></p>
								<p>Product Family:<%=rt.getString("mainProductName") %></p>
								<p>Added Date :<%=rt.getDate("addedDate") %></p>
								<p>Mumbai</p>
								
								<br />
								<center>
								
								<input type="hidden" name="subProductName" value="<%=rt.getString("subProductName") %>">
								<input type="hidden" name="subProductId" value="<%=rt.getString("subProductId") %>">
								<button type="submit" class="btn btn-success" >Read More</button>
								
								
								</center>
							</div>
							</form>
						</div>
					</div>


					<%
        		  }
        		  
        		  
        	  }
        	  
          }else{
        	  
        	  %>
					<div class="col-md-4">
						<div class="panel panel-default">
							<div class="panel-body info">
								<strong>No sub category of products available</strong>
							</div>
						</div>
					</div>


					<%
        	  
        	  
          }
					
					%>


				</div>
			</div>
		</div>
	</div>

	<!-- Popup for login Section -->


	<%@include file="common/footerBeforeSession.jsp"%>
	