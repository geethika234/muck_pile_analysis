CREATE DEFINER=`Xliconmys0618`@`localhost` PROCEDURE `PythonUpdatePilesPhotos`(
PTrnpilesphotosId int,
Filename varchar(100),
Filepath varchar(500),
PUserby smallint,
PUserdate datetime,
Pflag int(100)

)
BEGIN
 
Declare Logstring text;
Declare LogUserName varchar(500);

Declare PFilepath varchar(500);
Declare PFilename varchar(100);

set PFilepath =Filepath;
set PFilename =Filename;

 
if Pflag=1 then
/*Final Image Update*/
begin
 update trn_pilephotos set Filename_F=PFilename,Filepath_F=PFilepath,
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - Final(_F) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' Filename_F',PFilename,
' Filepath_F ',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
if Pflag=2 then
/*HG Image Update*/
begin
 update trn_pilephotos set Filename_HG=PFilename,Filepath_HG=PFilepath,
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - Histogram(_HG) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' Filename_HG',PFilename,
' Filepath_HG',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
if Pflag=3 then
/*CHG Image Update*/
begin
 update trn_pilephotos set Filename_CHG=PFilename,Filepath_CHG=PFilepath,
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - Histogram(_CHG) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' Filename_CHG',PFilename,
' Filepath_CHG',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
if Pflag=4 then
/*TextFile_HG Image Update*/
begin
 update trn_pilephotos set 
 
 txtFilePath_HG=PFilepath, txtFilename_HG=PFilename,
 
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - TextFile Path Histogram(_HG) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' txtFilePath_HG',PFilename,
' txtFilePath_HG',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
if Pflag=5 then
/*TextFile_CHG Image Update*/
begin
 update trn_pilephotos set  txtFilePath_CHG=PFilepath, txtFilename_CHG=PFilename,
 Modifiedby =PUserby,Modifieddate=now() where TrnpilesphotosId=PTrnpilesphotosId;
 select 'S' as result;
   set LogUserName=(select Email from mst_user where mstuserid=PUserby) ;
 set Logstring=concat(LogUserName," PilesPhotos Update - TextFile Path Histogram(_CHG) ");
 set Logstring=concat_ws(',',Logstring,' PTrnpilesphotosId ',PTrnpilesphotosId,' txtFilePath_CHG',PFilename,
' txtFilePath_HG',PFilepath,' Pflag ',Pflag);
call InsertUserLog(12, '1', PUserby, Logstring);
END;
end if;
End