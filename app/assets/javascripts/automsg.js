$(document).ready(function(){
	var order_status_checker=function(){
		// console.log('just post, and rails will know who the user is');
      	var url='/api/v1/orders/updatestatus';
      	// console.log(url);
        $.get( url, {}, function(data){
            console.log(data['msg']);
            if(data['msg']==""){

            }else{
            	$('#msgtoshow').html(data['msg']);
			    $('#hidemsg').stop().fadeIn(100).animate({'top':'100px'},400);            	
            }
        }, 'json' );
	}
	setInterval(order_status_checker,15000);
	$('#msgclose').click(function(e){

		$('#hidemsg').stop().animate({'top':'-300px'},400).fadeOut(100);
	});      
});