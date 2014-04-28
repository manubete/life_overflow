var Question = {
  init: function() {
    $('a.new_question').on('click',this.toggleQuestionForm);
    $('.questionform').on('ajax:success', this.appendQuestion);
    $('.questionform').on('ajax:error', this.appendErrors);
    $('#recent').on('ajax:success', this.sortQByRecent);
    $('#upVotes').on('ajax:success', this.sortQByUpVotes);
  },
  sortQByUpVotes: function(e,data){
   console.log("VOTED SHIT")
    $('div.question').remove()
    $('div#show_questions').append(data).hide().fadeIn(1300)
  },

  sortQByRecent: function(e,data) {
    console.log("RECENT SHIT")
    $('div.question').remove()
    $('div#show_questions').append(data).hide().fadeIn(1300)
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
    Vote.init();
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