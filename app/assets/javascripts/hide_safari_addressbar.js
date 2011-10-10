function run_at_start(){
	var agent = navigator.userAgent.toLowerCase();
	isUAMobile =!!(agent.match(/(iPhone|iPod|blackberry|android 0.5|htc|lg|midp|mmp|mobile|nokia|opera mini|palm|pocket|psp|sgh|smartphone|symbian|treo mini|Playstation Portable|SonyEricsson|Samsung|MobileExplorer|PalmSource|Benq|Windows Phone|Windows Mobile|IEMobile|Windows CE|Nintendo Wii)/i));

	if (isUAMobile) {
	  // When ready...
	console.log("called")
	  window.addEventListener("load",function() {
	  	// Set a timeout...
	  	setTimeout(function(){
	  		// Hide the address bar!
	  		window.scrollTo(0, 1);
	  	}, 0);
	  });
	}
}