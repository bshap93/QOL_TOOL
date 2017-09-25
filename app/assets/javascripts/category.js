function QuestionnaireCategory(categoryName, questionsArray) {
  this.categoryName = categoryName;
  this.questionsArray = questionsArray;
  this.toPageView = function() {
    var pageViewHTML = `<h2>${categoryName} Factors</h2><h4>Over the past 7 days, I...</h4>`
    pageViewHTML += `<%= form_for @category_rating, url: record_category_path do |f| %></form>`
    for (var i = 0, l = questionsArray.length; i < l; i++) {
      var question = ``
    }
    return header;
  }
}

$('form').submit(function(event) {
  event.preventDefault();
  var values = $(this).serialize()
  var posting = $.post('/questionnaires/1/category/2', values);
  posting.done(function(data) {
    console.log(data)
    debugger
  })
})
