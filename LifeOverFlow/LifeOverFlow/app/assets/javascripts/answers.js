var Ajax ={
  bindEvents: function(){
    $('a.new-answer').on('click', this.toggleAnswerForm);
  },

  toggleAnswerForm: function (e){
      $('div.answer-question').toggle()
  }
}



$(document).ready(function(){

 Ajax.bindEvents();

// toggleAnswerForm: function(e) {
//     e.preventDefault();
//     $('form#new_menu').toggleClass('hidden')
//   }


})