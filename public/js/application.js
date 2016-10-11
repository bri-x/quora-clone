$(document).ready( function() {
	$('.need-login-form').submit(function(event) {
		event.preventDefault();
		$('#loginPopup').modal({
			overlayClose:true,
			onClose: function (dialog) {
			dialog.data.fadeOut('slow', function () {
				dialog.container.hide('slow', function () {
					dialog.overlay.slideUp('slow', function () {
						$.modal.close();
						});
					});
				});
			},
			onOpen: function (dialog) {
			dialog.overlay.fadeIn('slow', function () {
				dialog.container.slideDown('slow', function () {
					dialog.data.fadeIn('slow');
					});
				});
			}});

	}); // end of need login form submit

		$('.need-login-ask').click(function(event) {
		event.preventDefault();
		$('#loginPopup').modal({
			overlayClose:true,
			onClose: function (dialog) {
			dialog.data.fadeOut('slow', function () {
				dialog.container.hide('slow', function () {
					dialog.overlay.slideUp('slow', function () {
						$.modal.close();
						});
					});
				});
			},
			onOpen: function (dialog) {
			dialog.overlay.fadeIn('slow', function () {
				dialog.container.slideDown('slow', function () {
					dialog.data.fadeIn('slow');
					});
				});
			}});

	}); // end of need login to ask question

	 	var showChar = 150;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = "Show more >";
    var lesstext = "";
    

    $('.more').each(function() {
        var content = $(this).html();
 
        if(content.length > showChar) {
 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
 
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
 
    });
 
    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });

	// $(".voting-form").submit(function( event ) {
	//   event.preventDefault();

 //  	$.ajax({
 //  		method: 'POST',
 //  		url: $(this).attr("action"),
 //  		// dataType: 'json',
 //  		success: function(data){
 //  			debugger;
 //  		}

 //  	});

	// }); // end of voting form

}); // end of document ready

$(document).on("click", ":submit", function(e){
    e.preventDefault();

    current = $(this).parents("form")

    $.ajax({
  	method: 'POST',
  	url: $(this).parents("form").attr("action"),
  	data: $(this).val(),
  	beforeSend: function() {
  		current.children().first().prop("value", "Voting...");
  	},
  	success: function(data){
  		current.children().first().prop("value", "Upvote | ".concat(data));
  	}

  });
});