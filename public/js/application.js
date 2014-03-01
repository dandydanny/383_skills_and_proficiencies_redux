$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  // edit page AJAX dissociate
  $(".delete-button").click(function(event){
    event.preventDefault();

    console.log("delete clicked");
    var buttonElementId = $(this).attr('value');
    console.log(buttonElementId);

    // $( event.target ).closest( "tr" ).css("display", "none");
    $.ajax({
      type: "POST",
      url: "/dissociate",
      data: {id: buttonElementId}
    }).done(function() {
      $( event.target ).closest( "tr" ).animate({ "opacity": "0" }, "slow" );
    });

  });

  // edit page save changes
    $(".save-button").click(function(event){
      event.preventDefault();
      console.log("save clicked");
      var buttonElementId = $(this).attr('value');
      console.log(buttonElementId);

      // $( "body" ).animate({backgroundColor: "#ff0000" }, "slow");
      $( event.target ).closest( "tr" ).animate({backgroundColor: "#ff0000" }, "slow");
  });
  // $( 'form[name="edit-form"]' ).on( "submit", function(event){
  //   event.preventDefault();
  //   console.log("prepare to serialize");
  //   var form_data = $( 'form' ).serialize();
  //   console.log(form_data);
  // });

  $( 'radio' ).change(function(){
    console.log("I've noticed a change")
  });

});
