USE [ES.Server]
GO

/****** Object:  UserDefinedFunction [dbo].[bims_f_var_to_string]    Script Date: 10/09/2014 14:09:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO



--将变量转换成带边界的字符串，如果是空值，则返回字符串'NULL'    
CREATE function [dbo].[bims_f_var_to_string] (    
        @ssvar sql_variant    
)    
returns nvarchar(4000)    
as    
begin    
        declare @pstrout varchar(4000)    
    
        if @ssvar is null return('NULL')    
    
        declare @basetype sysname    
    
        select @basetype = CAST(SQL_VARIANT_PROPERTY ( @ssvar, 'BaseType' ) as nvarchar(255))    
        if (@ssvar IS NOT NULL and @basetype IS NOT NULL)    
        begin    
                if (lower(@basetype) in ('varchar','nvarchar'))    
                        select @pstrout = N'''' + REPLACE(CAST(@ssvar as nvarchar(4000)), '''', '''''') + N''''    
                else if (lower(@basetype) in ('char','nchar'))    
                        select @pstrout = N'''' + REPLACE(RTRIM(CAST(@ssvar as nvarchar(4000))), '''', '''''') + N''''    
                else if (lower(@basetype) in ('binary','varbinary'))    
                        select @pstrout = master.dbo.fn_varbintohexsubstring(1, CAST(@ssvar as varbinary(8000)), 1, 0)    
                else if (lower(@basetype) in ('bit','bigint','int','smallint','tinyint','float','real','decimal','numeric'))    
                        select @pstrout = CAST(@ssvar as nvarchar(40))    
                else if (lower(@basetype) in ('money','smallmoney'))    
                        select @pstrout = CONVERT(nvarchar(40), @ssvar, 2)    
                else if (lower(@basetype) = 'uniqueidentifier')    
                        select @pstrout = N'''' + CAST(@ssvar as nvarchar(40)) + N''''    
                else if (lower(@basetype) in ('datetime','smalldatetime'))    
                        select @pstrout = N'''' + CONVERT(nvarchar(40), @ssvar, 121) + N''''    
                else    
                        select @pstrout = N'''Invalid Datatype' + lower(@basetype) + N'(' + CAST(@ssvar as nvarchar) + N')'''    
        end    
    
        return(@pstrout)    
    
end    
    
    
   
  
  
 

GO


