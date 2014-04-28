var Question = {
  init: function() {
    $('a.new_question').on('click',this.toggleQuestionForm);
    $('.questionform').on('ajax:success', this.appendQuestion);
    $('.questionform').on('ajax:error', this.appendErrors);
  },

  toggleQuestionForm: function(e) {
    e.preventDefault();
    if ($('.questionform').is(':hidden')) {
      $('.questionform').slideDown()
    } else {
      $('.questionform').slideUp()
    }
  },

  appendQuestion: function(event, data) {
    $('#quest_errors').html('')
    $('form#new_question')[0].reset()
    $('#show_questions').append(data);
    $('form#new_question').toggleClass('hidden');
  },

  appendErrors: function(event, xhr, status, error) {
    $('#quest_errors').html('')
    $('#quest_errors').append(xhr.responseText);
  }
}

$(document).ready(function() {
  Question.init();
  $('.questionform').hide()
})