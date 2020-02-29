<%@include file="common/header.jsp"%>

<div class="container-fluid">
<div class="container">
    	<div class="row">
        	<div class="col-md-3"><br>
			<h4>Filter</h4>
			
<div class="panel panel-default">
                    <div class="panel-body">
                      <div class="row">
  
  <div class="col-md-12">
  <label>State</label>
            <div class="s2-example">
              <p>
                <select aria-hidden="true" tabindex="-1" class="js-example-basic-multiple js-states form-control select2-hidden-accessible" multiple="multiple">
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
            </div><br>
            
          </div>
 
 
  <div class="col-md-12">
   <label>City</label>
            <div class="s2-example">
              <p>
                <select aria-hidden="true" tabindex="-1" class="js-example-basic-multiple js-states form-control select2-hidden-accessible" multiple="multiple">
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
            </div><br>
            
          </div>
  </br>
 
  <div class="col-md-12">
   <label>Product Name</label>
            <div class="s2-example">
              <p>
                <select aria-hidden="true" tabindex="-1" class="js-example-basic-multiple js-states form-control select2-hidden-accessible" multiple="multiple">
                  <optgroup label="Select your Product">
                  <option value="WT">Maize</option>
                  <option value="RE">Rye</option>
                  <option value="BN">Bran</option>
                  <option value="BR">Bulgar</option>
                  <option value="ST">Spelt</option>
                  <option value="CN">Corn </option>
                  <option value="CR">Cornflour </option>
                  <option value="MT">Millet </option>
                  <option value="WR">Wild Rice </option>
                  <option value="BR">Beer </option>
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


			<div class="col-md-9" >
			<br>
			
			<h4>Farmer Requirement List </h4>
		
				<div class="panel panel-default">
			
			<div class="panel-body">
			
 
				<table data-toggle="table" style="width: 100%;"
					class="table table-bordered ">
					

					<thead>
						<tr>
							<th data-align="center" class="text-center">Farmer Name</th>
							<th data-align="center" class="text-center">City</th>
							<th data-align="center" class="text-center">Contact No.</th>
							<th data-align="center" class="text-center">Product Name</th>
							<th data-align="center" class="text-center">Quantity</th>
							<th data-align="center" class="text-center">Expected Rate</th>
                            <th data-align="center" class="text-center">Action</th>
							
							

						</tr>
					</thead>
					
					<tbody>
					

						<tr class="info">
							
							<td data-align="center" class="text-center">Kisan</td>
							<td data-align="center" class="text-center">Jalna</td>
							<td data-align="center" class="text-center">7620018290</td>
							<td data-align="center" class="text-center">Wheat</td>
							<td data-align="center" class="text-center">50Kg</td>
							<td data-align="center" class="text-center">5000</td>
							
							
								          
								
								
							<td>
								<table>
									<tr>
										<td style="border: 1px #eee;">&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="ViewFarmerReqList.html"><span
												class="glyphicon glyphicon-search"></a></span></td>
										<td style="border: 1px #eee;">&nbsp;<a
											href=""><span
												class="glyphicon glyphicon-arrow-right"></a></span></td>
										<td style="border: 1px #eee;">&nbsp;<a
											href="  /application/remove_company.html?company_id=  "><span
												class="glyphicon glyphicon-remove"></a></span></td>
									</tr>
								</table>
							</td>
							
						</tr>

						
					</tbody>
					</div>
					<tbody>

						<tr class="info">
							
							<td data-align="center"  class="text-center">Murli</td>
							<td data-align="center"  class="text-center">Wardha</td>
							<td data-align="center"  class="text-center">9561667689</td>
							<td data-align="center" class="text-center">Maize</td>
							<td data-align="center" class="text-center">45Kg</td>
							<td data-align="center" class="text-center">5600</td>
							
							
							
								          
								
								
							<td>
								<table>
									<tr>
										<td style="border: 1px #eee;">&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="ViewFarmerReqList.html"><span
												class="glyphicon glyphicon-search"></a></span></td>
										<td style="border: 1px #eee;">&nbsp;<a
											href=""><span
												class="glyphicon glyphicon-arrow-right"></a></span></td>
										<td style="border: 1px #eee;">&nbsp;<a
											href="  /application/remove_company.html?company_id=  "><span
												class="glyphicon glyphicon-remove"></a></span></td>
									</tr>
								</table>
							</td>
						</tr>

						
					</tbody>
					<tbody>

						<tr class="info">
							
							<td data-align="center" class="text-center">damodar</td>
							<td data-align="center" class="text-center">Pune</td>
							<td data-align="center" class="text-center">9890988821</td>
							<td data-align="center" class="text-center">Rice</td>
							<td data-align="center" class="text-center">38Kg</td>
							<td data-align="center" class="text-center">7000</td>
							
							
								          
								
								
							<td>
								<table>
									<tr>
										<td style="border: 1px #eee;">&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="ViewFarmerReqList.html"><span
												class="glyphicon glyphicon-search"></a></span></td>
										<td style="border: 1px #eee;">&nbsp;<a
											href=""><span
												class="glyphicon glyphicon-arrow-right"></a></span></td>
										<td style="border: 1px #eee;">&nbsp;<a
											href="  /application/remove_company.html?company_id=  "><span
												class="glyphicon glyphicon-remove"></a></span></td>
									</tr>
								</table>
							</td>
						</tr>

						
					</tbody>
				
				</table>
				<ul class="pagination pull-right">

					<li><a href="#">&laquo;</a></li>

					<li><a href="#">1</a></li>

					<li><a href="#">2</a></li>

					<li><a href="#">3</a></li>

					<li><a href="#">4</a></li>

					<li><a href="#">5</a></li>

					<li><a href="#">&raquo;</a></li>

				</ul>
				 
			</div>
			
		</div>
		
		
		</div>
    </div>
</div>
<br>
<br>
<br><br><br><br>
<br><br><br><br><br><br>


<!-- Footer Section -->
<div class="container-fluid footer-bg" style="background-color:#333333;">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
      <ul class="nav nav-pills nav-stacked footer-pad">
          <li><a href="#">  About US</font></a></li>
          <li><a href="#">  Terms</font></a></li>
          <li><a href="#">  Policy</font></a></li>
          <li><a href="#">  Conatct US</font></a></li>
        </ul>
      </div>
      <div class="col-md-4"><br />
        <span class="pull-left"><a target="_blank" href="https://plus.google.com">
        <div class="google"></div>
        </a></span> <span class="pull-left"><a target="_blank" href="https://www.facebook.com">
        <div class="facebooku"></div>
        </a></span> <span class="pull-left"><a target="_blank" href="https://in.linkedin.com">
        <div class="linkedin"></div>
        </a></span> <span class="pull-left"><a target="_blank" href="https://twitter.com">
        <div class="twittert"></div>
        </a></span> <span class="pull-left"><a target="_blank" href="https://in.pinterest.com/">
        <div class="pinterest"></div>
        </a></span> <span class="pull-left"><a target="_blank" href="https://www.instagram.com">
        <div class="instagram"></div>
        </a></span> </div>
        <div class="col-md-4">

<div class="fb-page" data-href="https://www.facebook.com/pradoinfotech/?ref=hl" data-tabs="timeline" data-width="360" data-height="250" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/pradoinfotech/?ref=hl"><a href="https://www.facebook.com/pradoinfotech/?ref=hl">Prado Infotech</a></blockquote></div></div>



        </div>
    </div>
  </div>
</div>
<div class="container-fluid footer-bg1">
  <div class="container">
    <div class="row footer-pad">
      <div class="col-md-6">
        <p class="pull-left"> <span>Copyright &copy; 2016 Shetkari Bazar</span> </p>
      </div>
      <div class="col-md-6">
        <p class="pull-right"> <span>Powered By <a href="http://pradoinfotech.com/" target="_blank">Prado Infotech</a></span> </p>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Farmer Post Reqirement</h4>
      </div>
      <div class="modal-body">
        <form>
        <div class="row">
          <div class="col-md-12">
            <label>Product Name</label>
            <input type="text" class="form-control" />
          </div>
        </div><br />
        <div class="row">
          <div class="col-md-12">
            <label>Quantity</label>
            <input type="text" class="form-control" />
          </div>
        </div><br />
        
        <div class="row">
          <div class="col-md-12">
            <label>Added Date</label>
            <input type="text" class="form-control" />
          </div>
        </div>
		<br />
        <div class="row">
          <div class="col-md-12">
            <label>Expected Amount</label>
            <input type="text" class="form-control" />
          </div>
        </div>
        </div>
      </form>
     
      <div class="modal-footer">
       
        <button type="button" class="btn btn-primary">Reply</button>
      </div>
    </div>
	 </div>
  </div>


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
<%@include file="common/footerBeforeSession.jsp"%>