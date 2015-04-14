$(function () {
    $('#TableName').change(function () {
        if ($(this).children('option:selected').val() == "-1") {
            return;
        }

        $.get("/TranBlobConfigs/GetBlobColumnsByTableName?table=" + $(this).children('option:selected').val(), function(data) {
            $("#ColName").html("");
            if (data) {
                $(data).each(function(item) {
                    $("#ColName").append("<option value='" + this + "'>" + this + "</option>");
                });
            }
        });
    });
})