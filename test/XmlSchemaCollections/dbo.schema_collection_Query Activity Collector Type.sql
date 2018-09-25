SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Xml Schema Collection [dbo].[schema_collection_Query Activity Collector Type]
Print 'Create Xml Schema Collection [dbo].[schema_collection_Query Activity Collector Type]'
GO
CREATE XML SCHEMA COLLECTION [dbo].[schema_collection_Query Activity Collector Type] AS
N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="DataCollectorType" targetNamespace="DataCollectorType"><xsd:element name="QueryActivityCollector"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Databases" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:attribute name="IncludeSystemDatabases" type="xsd:boolean" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema>'
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
