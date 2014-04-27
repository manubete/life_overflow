var Comment = {
  init: function() {
    $('a.new_comment_on_question').on('click', this.toggleCommentForm);
    $('form#new_comment').on('ajax:success', this.appendComment);
    $('form#new_comment').on('ajax:error', this.appendErrors);
  },

  toggleCommentForm: function(e) {
    e.preventDefault();
    $('form#new_comment').toggleClass('hidden');
  },

  appendComment: function(event, data) {
    console.log("BBBBBAHHHH");
    $('#show_comments').append(data);
    $('form#new_comment').toggleClass('hidden');
  },

  appendErrors: function(event, xhr, status, error) {
    console.log("YEEEHAW");
  }
}

$(document).ready(function() {
  Comment.init();
})