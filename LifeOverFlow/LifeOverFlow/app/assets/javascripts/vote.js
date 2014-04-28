var Vote = {
  init: function() {
    $('a.vote').on('ajax:complete', this.renderVote );
    $('a.vote').on('ajax:error', function (){ console.log("Errors") } );
  },

  renderVote: function(e, data) {
     $(this).parents('.votes_container').children('.vote_count').html(data.responseText)
  },
  renderError: function(e) {
  }
}


$(document).ready(function() {
  Vote.init();
})