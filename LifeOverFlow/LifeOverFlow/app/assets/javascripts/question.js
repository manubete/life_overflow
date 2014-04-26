var Question = {
  init: function() {
    $('a.new_question').on('click',this.toggleQuestionForm);
    $('form#new_question').on('ajax:success', this.appendQuestion)
  },

  toggleQuestionForm: function(e) {
    e.preventDefault();
    $('form#new_question').toggleClass('hidden');
  },

  appendQuestion: function(event, data) {

  }
}

$(document).ready(function() {
  Question.init();
})