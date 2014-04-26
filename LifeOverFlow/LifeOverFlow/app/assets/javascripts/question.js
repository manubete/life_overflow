var Question = {
  init: function() {
    $('a.new-question').on('click',this.toggleQuestionForm)
  },
  toggleQuestionForm: function(e) {
    e.preventDefault();
    $('form#new_question').toggleClass'hidden');
  }
}

$(document).ready(function() {
  Question.init();
}