var Comment = {
  init: function() {
    $('a.new_comment_on_question').on('click', this.toggleQuestionCommentForm);
    $('a.new_comment_on_answer').on('click', this.toggleAnswerCommentForm);
    $('.questionCommentForm').on('ajax:success', this.appendQuestionComment);
    $('.questionCommentForm').on('ajax:error', this.appendErrors);
    $('.answerCommentForm').on('ajax:success', this.appendAnswerComment);
    $('.answerCommentForm').on('ajax:error', this.appendErrors);
  },

  toggleQuestionCommentForm: function(e) {
    e.preventDefault();
    if ($('.questionCommentForm').is(':hidden')) {
      $('.questionCommentForm').slideDown()
    } else {
      $('.questionCommentForm').slideUp()
    }
  },

  toggleAnswerCommentForm: function(e) {
    e.preventDefault();
    var answer_form = $(this.nextElementSibling)

    if (answer_form.is(':hidden')) {
      console.log("BOOYAO")
      answer_form.slideDown()
    } else {
      answer_form.slideUp()
    }
  },

  appendQuestionComment: function(event, data) {
    $('.questionCommentForm').hide()
    $('.questionCommentForm')[0].reset();
    $('#show_question_comments').append(data);
  },

  appendAnswerComment: function(event, data) {
    $('.answerCommentForm').hide()
    $('.answerCommentForm')[0].reset();
    $('#show_answer_comments').append(data);
  },

  appendErrors: function(event, xhr, status, error) {
    $('#comment_question_errors').append(xhr.responseText);
  }
}

$(document).ready(function() {
  Comment.init()
  $('.questionCommentForm').hide()
  $('.answerCommentForm').hide()
});