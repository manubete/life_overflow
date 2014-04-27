var Vote = {
  init: function() {
    // $('a.vote').on('click', this.upVote);
    $('a.vote').on('ajax:success', VoteView.renderVote);
     $('a.vote').on('ajax:error', console.log("Errors"));
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