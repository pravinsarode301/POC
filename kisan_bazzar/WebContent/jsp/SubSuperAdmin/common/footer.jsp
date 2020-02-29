<%
	String JspPagePathFooter = getServletContext().getInitParameter("UsersResources");
%>

<!-- START OF FOOTER SECTION -->

<div class="container-fluid footer-bg"
	style="background-color: #333333;">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<ul class="nav nav-pills nav-stacked footer-pad">
					<li><a href="Aboutus.html"><font>About US</font></a></li>
					<li><a href="Terms.html"><font>Terms</font></a></li>
					<li><a href="Policy.html"><font>Policy</font></a></li>
					<li><a href="Contactus.html"><font>Conatct US</font></a></li>
				</ul>
			</div>
			<div class="col-md-4">
				<br /> <span class="pull-left"><a target="_blank"
					href="https://plus.google.com">
						<div class="google"></div>
				</a></span> <span class="pull-left"><a target="_blank"
					href="https://www.facebook.com">
						<div class="facebooku"></div>
				</a></span> <span class="pull-left"><a target="_blank"
					href="https://in.linkedin.com">
						<div class="linkedin"></div>
				</a></span> <span class="pull-left"><a target="_blank"
					href="https://twitter.com">
						<div class="twittert"></div>
				</a></span> <span class="pull-left"><a target="_blank"
					href="https://in.pinterest.com/">
						<div class="pinterest"></div>
				</a></span> <span class="pull-left"><a target="_blank"
					href="https://www.instagram.com">
						<div class="instagram"></div>
				</a></span>
			</div>
			<div class="col-md-4">
				<div class="fb-page"
					data-href="https://www.facebook.com/pradoinfotech/?ref=hl"
					data-tabs="timeline" data-width="360" data-height="250"
					data-small-header="true" data-adapt-container-width="true"
					data-hide-cover="true" data-show-facepile="true">
					<div class="fb-xfbml-parse-ignore">
						<blockquote cite="https://www.facebook.com/pradoinfotech/?ref=hl">
							<a href="https://www.facebook.com/pradoinfotech/?ref=hl">Prado
								Infotech</a>
						</blockquote>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid footer-bg1">
	<div class="container">
		<div class="row footer-pad">
			<div class="col-md-6">
				<p class="pull-left">
					<span>Copyright &copy; 2016 Shetkari Bazar</span>
				</p>
			</div>
			<div class="col-md-6">
				<p class="pull-right">
					<span>Powered By <a href="http://pradoinfotech.com/"
						target="_blank">Prado Infotech</a>
				</p>
			</div>
		</div>
	</div>
</div>

<!-- END OF FOTTER SECTION -->


<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=JspPagePathFooter%>js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="<%=JspPagePathFooter%>js/ie10-viewport-bug-workaround.js"></script>
<script src="<%=JspPagePathFooter%>js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="<%=JspPagePathFooter%>js/ie10-viewport-bug-workaround.js"></script>
<script src="<%=JspPagePathFooter%>js/bootstrap-datepicker.js"></script>


<!--this code written for the datepicker-->
<!-- Load jQuery from Google's CDN -->
    <!-- Load jQuery UI CSS  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    
    <!-- Load jQuery JS -->
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Load jQuery UI Main JS  -->
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    
    <!-- Load SCRIPT.JS which will create datepicker for input field  -->
    <script src="<%=JspPagePathFooter%>js/script.js"></script>
	<script src="<%=JspPagePathFooter%>js/script2.js"></script>
	<script src="<%=JspPagePathFooter%>js/script3.js"></script>
    
    <link rel="stylesheet" href="runnable.css" />
	<!--this code written for the datepicker-->

</body>
</html>
