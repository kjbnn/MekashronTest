object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 186
  Width = 369
  object FDCommand1: TFDCommand
    Connection = FDConnection1
    CommandText.Strings = (
      'CREATE DATABASE IF NOT EXISTS TEST_DB;'
      'USE TEST_DB;'
      'CREATE TABLE IF NOT EXISTS `callback` ('
      #9'`CallBackID` INT(11) NOT NULL AUTO_INCREMENT,'
      #9'`Date` DATETIME NOT NULL,'
      #9'`DID` VARCHAR(20) NOT NULL COLLATE '#39'latin1_swedish_ci'#39','
      #9'`CID` VARCHAR(20) NOT NULL COLLATE '#39'latin1_swedish_ci'#39','
      #9'`Number` VARCHAR(20) NOT NULL COLLATE '#39'latin1_swedish_ci'#39','
      #9'`Confirmed` INT(1) NULL DEFAULT '#39'0'#39','
      #9'`Language` TEXT NOT NULL COLLATE '#39'latin1_swedish_ci'#39','
      #9'`Prefix` TEXT NOT NULL COLLATE '#39'latin1_swedish_ci'#39','
      #9'`isExtracted` INT(1) NULL DEFAULT '#39'0'#39','
      '        `FirstName` varchar(20) NOT NULL,'#10
      '        `LastName` varchar(20) NOT NULL,'#10
      '        `Email` varchar(50) DEFAULT NULL,'
      #9'PRIMARY KEY (`CallBackID`) USING BTREE'
      ')'
      'COLLATE='#39'latin1_swedish_ci'#39
      'ENGINE=MyISAM'
      'AUTO_INCREMENT=16018;'
      '')
    Left = 124
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM TEST_DB.callback ')
    Left = 204
    Top = 32
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=mekashronbusiness'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 44
    Top = 32
  end
  object dsCallback: TDataSource
    DataSet = FDQuery1
    Left = 275
    Top = 32
  end
  object FDCommand2: TFDCommand
    Connection = FDConnection1
    Left = 124
    Top = 88
  end
end
