var Answer = {
  init: function(){
    $('a.new-answer').on('click', this.toggleAnswerForm);
  }
}







$(document).ready(function(){
  Answer.init();
})