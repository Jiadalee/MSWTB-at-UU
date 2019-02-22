USE hydroclass;

#load sites
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/sites.csv'
INTO TABLE sites
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(SiteCode,SiteName,Latitude,Longitude,Elevation,ElevationDatum,State,County,Comments,SiteType);
 
#load variables
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/variables.csv'
INTO TABLE variables
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(VariableCode,VariableName,VariableType,VariableUnitesID,GeneralCategory);

#load methods    
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/methods.csv'
INTO TABLE method
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(MethodDescription,MethodLink,variables_VariableID);

#load sources 
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/sources.csv'
INTO TABLE source
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Organization,SourceDescription,SourceLink,ContactName,Phone,Email,Address,City,State,ZipCode);

#load datavalues-Mflow 
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/MFlowRatedata.csv'
INTO TABLE datavalues
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(DataValue,UTCOffset,DateTime,Sites_SiteID2,variables_VariableID,MethodID,SourceID,UnitID);

#load datavalue-Eflow
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/EFlowRatedata.csv'
INTO TABLE datavalues
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(DataValue,UTCOffset,DateTime,Sites_SiteID2,variables_VariableID,MethodID,SourceID,UnitID);




