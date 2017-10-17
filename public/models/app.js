//$(document).ready(function() {
//    $.get("/todos", function(res) {
//        $.each(res.todos, function(index, todo) {
//            $("#todos").append($("<li>").text(todo));
//        });
//    });
//
//    $("button").click(function(event) {
//        $.post("/todos", $("form").serialize(), function(res) {
//            $("form input").val('');
//            $("#todos").append($("<li>").text(res.todo));
//        });
//        event.preventDefault();
//    });
//});
