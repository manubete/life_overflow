var Answers ={
  bindEvents: function(){
    $('a.new-answer').on('click', this.toggleAnswerForm);
    $('form#new_answer').on('ajax:success', this.appendAnswer)
  },

  toggleAnswerForm: function (e){
     console.log("wasup")
      $('form#new_answer').toggleClass('hidden');
  },

  appendAnswer: function(e,data) {
    $('form#new_answer')[0].reset()
     $('div#all_answers').append(data);
     $('form#new_answer').toggleClass('hidden');
  }
}



$(document).ready(function(){

 Answers.bindEvents();


})