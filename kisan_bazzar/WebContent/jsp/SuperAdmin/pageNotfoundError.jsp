<%@include file="common/header.jsp"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>


<div class="row">
	<div
		class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
		<div id="error-page">

			<div class="row">
				<div class="col s12">
					<div class="browser-window">
						<div class="top-bar">
							<div class="circles">
								<div id="close-circle" class="circle"></div>
								<div id="minimize-circle" class="circle"></div>
								<div id="maximize-circle" class="circle"></div>
							</div>
						</div>
						<div class="content">
							<div class="row">
								<div id="site-layout-example-top" class="col s12">
									<p class="flat-text-logo center white-text caption-uppercase">Sorry
										but we couldn't find this page :</p>
								</div>
								<div id="site-layout-example-right" class="col s12 m12 l12">
									<div class="row center">
										<h1 class="text-long-shadow col s12">HTTP Error 404
											Page not found error</h1>
									</div>
									<div class="row center">
										<p class="center white-text col s12">It seems that this
											page doesn't exist.</p>
										<p class="center s12">
											<button
												onclick= "'window.history.back()'"
												class="btn waves-effect waves-light">Back to login
												page !</button>
											<p>
										</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

		</div>
		<!-- /.col-->
	</div>
	<!-- /.row -->

<%@include file="common/footer.jsp"%>