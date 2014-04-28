var Question = {
  init: function() {
    $('a.new_question').on('click',this.toggleQuestionForm);
    $('form#new_question').on('ajax:success', this.appendQuestion);
    $('form#new_question').on('ajax:error', this.appendErrors);
  },

  toggleQuestionForm: function(e) {
    e.preventDefault();
    $('form#new_question').toggleClass('hidden');
  },

  appendQuestion: function(event, data) {
    $('#quest_errors').html('')
    $('form#new_question')[0].reset()
    $('#show_questions').append(data);
    $('form#new_question').toggleClass('hidden');
    Vote.init();
  },

  appendErrors: function(event, xhr, status, error) {
    $('#quest_errors').html('')
    $('#quest_errors').append(xhr.responseText);
  }

}

$(document).ready(function() {
  Question.init();
})