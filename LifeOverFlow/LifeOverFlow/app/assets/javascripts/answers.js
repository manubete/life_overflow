var Answers ={
  bindEvents: function(){
    $('a.new-answer').on('click', this.toggleAnswerForm);
    $('form#new_answer').on('ajax:success', this.appendAnswer)
  },

  toggleAnswerForm: function (e){
     console.log("wasup")
      $('form#new_answer').toggleClass('hidden');
  },

  appendAnswer: function(e) {
    console.log("its working")
  }
}



$(document).ready(function(){

 Answers.bindEvents();


})