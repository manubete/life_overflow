var SignUp = {

  bindEvents: function(){
    $('a#sign_up_btn').on('click', this.toggleSignUp);
  },

  toggleSignUp: function(e){
    console.log(e)
    console.log("toggle toffle")
  $('div#signup_form').toggleClass('hidden');
  },
  appendSignUp: function(event, data) {
      $('.error_messages').html('')
      $('form#user')[0].reset()
      $('#signup_form').append(data);
      $('form#new_user').toggleClass('hidden');
    },

    appendErrors: function(event, xhr, status, error) {
      $('.error_messages').html('')
      $('.error_messages').append(xhr.responseText);
    }
}
$(document).ready(function(){
  SignUp.bindEvents();
})