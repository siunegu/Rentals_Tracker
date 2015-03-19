function ready() {
// Push Menu
	var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
		showLeftPush = document.getElementById( 'showLeftPush' ),
		mainContent = document.getElementById( 'main-content' )
		body = document.body;


	showLeftPush.onclick = function() {
		console.log('clicked');
		classie.toggle( this, 'active' );
		classie.toggle( mainContent, 'cbp-spmenu-push-toright' );
		classie.toggle( menuLeft, 'cbp-spmenu-open' );
		disableOther( 'showLeftPush' );
	};


	function disableOther( button ) {
		if( button !== 'showLeftPush' ) {
			classie.toggle( showLeftPush, 'disabled' );
		}
	}
} 

$(document).ready(ready);	
$(document).on('page:load', ready);
