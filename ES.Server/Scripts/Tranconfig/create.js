$(function () {
    $('#TableNames').change(function () {
        if ($(this).children('option:selected').val() == "-1") {
            return;
        }

        $.get("GetColumnsByTableName?table=" + $(this).children('option:selected').val(), function (data) {
            $("#cols").html("");
            if (data) {
                var i = 0;
                $(data).each(function (item) {
                    $("#cols").append("<input id='ColumnList_" + i + "__Selected' name='ColumnList' type='checkbox' value='"+this+"'/><label for='ColumnList_" + i + "__Selected'>" + this + "</label>&nbsp;&nbsp;&nbsp;&nbsp;");
                    i++;
                })
            }
        })
    });
})