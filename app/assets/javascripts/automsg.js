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
              $('#jump2order').attr("href",data['url']);              
              open_modal();                  
            }
        }, 'json' );

	}
  var open_modal=function(){
    $("#msgModal").modal();
    // console.log($("#msgModal").css('marginTop'))
    $("#msgModal").animate({
      'marginTop' : "100px" //moves down
    });
  }
  // setInterval(open_modal,2000);  
  // should ensure user is login!!
	setInterval(order_status_checker,2000);
	$('#msgclose').click(function(e){

		$('#hidemsg').stop().animate({'top':'-300px'},400).fadeOut(100);
	});      
});