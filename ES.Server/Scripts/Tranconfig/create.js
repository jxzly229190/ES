function createSql() {
    if ($('input:checked').length > 0) {
        var table = $('#TableName').children('option:selected').val();

        var columns = '';
        var vd = '';
        var vf = '';
        var dd = '';
        $('input:checked').each(function () {
            var col = $(this).val();
            var index = col.indexOf('(Blob)');
            if (index > 0) {
                col = col.slice(0, index);
            }
            
            columns += "[" + col + '],';
            if (index > 0) {
                vd += "0xFF')+,";
                dd += ',[' + col + '] as Blob';
                $("#BlobColumn").val(col);
            } else {
                vd += "'+dbo.bims_f_var_to_string(" + col + ")+',";
            }
            
            vf += "b."+col+" = a."+col+",";
        });

        if (columns.length > 0) {
            columns = columns.slice(0, columns.length - 1);
        }

        if (vd.length > 0) {
            vd = vd.slice(0, vd.length - 3);
        }

        if (vf.length > 0) {
            vf = vf.slice(0, vf.length - 1);
        }

        var header = "if object_id('tempdb..#temp_" + table + "') is not null drop table #temp_" + table +
            ";select top 0 " + columns + " into #temp_" + table + " from [" + table + "](nolock);";

        var detail = "select top $rowCount$ 'insert #temp_" + table + "(" +
            columns + ") select " + vd +
            " as sql,cast(timestamp as bigint) as stamp,[Guid] as Guid" + dd + " from [" + table + "]" +
            " where [timestamp] > cast(cast($lastStamp$ as bigint) as timestamp) " +
            "{templog: And [Guid] not in (Select [guid] from tranferTempLog where TransferNo = '$tranferNo$' and ConfigCode = '$configCode$') :templog} Order by [TimeStamp];";

        var footer = "Update b set "+vf+" from #temp_" + table + " a,[" + table + "] b  where a.Guid = b.Guid;" +
            "if @@error <> 0 begin raiserror 20001 '更新配置出错';  rollback return end;" +
            "insert into [" + table + "](" + columns + ") select " + columns + " from #temp_" + table + " a   where a.Guid not in " +
            "(Select [GUID] From [" + table + "]);if @@error <> 0 begin raiserror 20002 '更新配置出错';rollback return end;";

        $("#HeaderSql").val(header);
        $("#DetailSql").val(detail);
        $("#FooterSql").val(footer);
    } else {
        alert("请选择需要传输的字段。");
    }
}

$(function () {
    $('#TableName').change(function () {
        if ($(this).children('option:selected').val() == "-1") {
            return;
        }

        $.get("/TranConfigs/GetColumnsByTableName?table=" + $(this).children('option:selected').val(), function(data) {
            $("#cols").html("");
            if (data) {
                var i = 0;
                $(data).each(function(item) {
                    $("#cols").append("<input id='ColumnList_" + i + "' name='ColumnList' type='checkbox' checked='true' value='" + this + "'/><label for='ColumnList_" + i + "'>" + this + "</label>&nbsp;&nbsp;&nbsp;&nbsp;");
                    i++;
                });
                $("#cols").append("<input type='button' value='生成Sql脚本' class=‘btn btn-default btn-sm' onclick='createSql()'>");
            }
        });
    });
})