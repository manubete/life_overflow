var SignUp = {

  bindEvents: function(){
    console.log("bindin erryday")
    $('a#sign_up_btn').on('click', this.toggleSignUp);
  },

  toggleSignUp: function(e){
    console.log(e)
    console.log("toggle toffle")
  $('div#signup_form').toggleClass('hidden');
  }

}
$(document).ready(function(){
  SignUp.bindEvents();
})