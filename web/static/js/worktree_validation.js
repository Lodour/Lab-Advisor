/**
 * Created by Pealing on 2017/5/30.
 */
$(document).ready(function ($) {
// 添加一个工作结点
    $('#addWorkNode').click(function () {
        var name = $('#nodeNames').val();
        if (name == "")
            return;
        var h = $('<button type="button" class="btn btn-warning" style="max-width: 300px; margin-top:5%;">' + name + '</button></br>');
        h.attr({
            id: name,
        });
        $('#workTree').append(h);
    });
    //完成一个结点
    $("#nodeComplete").click(function () {
        var name = $('#panel_nodeName').text();
        $("#" + name).attr("class", "btn btn-success");
    });
    //过程一个结点
    $("#nodeProgress").click(function () {
        var name = $('#panel_nodeName').text();
        $("#" + name).attr("class", "btn btn-warning");
    });
    //删除一个结点
    $("#nodeDelete").click(function () {
        var name = $('#panel_nodeName').text();
        var h = "#" + name;
        $(h).slideUp("slow", function () {//slide up
            $(this).remove();//then remove from the DOM
        });
    });
});
