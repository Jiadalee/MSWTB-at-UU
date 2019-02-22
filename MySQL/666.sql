USE hydroclass;
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/sites.csv'
INTO TABLE sites
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(SiteCode,SiteName,Latitude,Longitude,Elevation,ElevationDatum,State,County,Comments,SiteType);
    
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/variables.csv'
INTO TABLE variables
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(VariableCode,VariableName,VariableType,VariableUnitesID,GeneralCategory);
    
LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/methods.csv'
INTO TABLE method
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(MethodDescription,MethodLink,variables_VariableID);

LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/sources.csv'
INTO TABLE source
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Organization,SourceDescription,SourceLink,ContactName,Phone,Email,Address,City,State,ZipCode);

LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/FlowRatedata.csv'
INTO TABLE datavalues
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(DataValue,UTCOffset,DateTime,Sites_SiteID2,variables_VariableID,MethodID,SourceID,UnitID);

LOAD DATA LOCAL INFILE '/Users/user/Desktop/MySQML/SQL_table/Volumedata.csv'
INTO TABLE datavalues
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(DataValue,UTCOffset,DateTime,Sites_SiteID2,variables_VariableID,MethodID,SourceID,UnitID);




