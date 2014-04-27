var Vote = {
  init: function() {
    $('a.vote').on('click', this.upVote);
  },

 upVote: function(e) {
  e.preventDefault();
  vote = $(this)
  classes = vote.attr('class').split(' ')
  voteable_type = classes[1]
  type = classes[2]
  voteable_id = vote.attr('data-id')

  vote_data = {
    voteable_type: voteable_type,
    type: type,
    voteable_id: voteable_id
  }
  debugger
  $.ajax({
    type: 'post',
    url: '/votes',
    data: vote_data
  }).done(VoteView.renderVote);
  }
}

var VoteView = {
  renderVote: function(message) {
    console.log("VoteLogged");
  }
}

$(document).ready(function() {
  Vote.init();
})