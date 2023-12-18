/* checksum : 77d0e58f48cf5f79f396a2fde226c93e */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.supported.formats : 'atom json xlsx'
service SEPMRA_PROD_MAN {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Währung'
entity SEPMRA_PROD_MAN.I_Currency {
  @sap.text : 'Currency_Text'
  @sap.label : 'Währung'
  @sap.quickinfo : 'Währungsschlüssel'
  @sap.semantics : 'currency-code'
  key Currency : String(5) not null;
  @sap.label : 'Langtext'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Currency_Text : String(40);
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dezimalen'
  @sap.quickinfo : 'Anzahl Dezimalstellen'
  Decimals : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Iso-Code'
  @sap.quickinfo : 'Iso-Code Währung'
  CurrencyISOCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Alternativer Schlüssel'
  @sap.quickinfo : 'Alternativschlüssel fuer Währungen'
  AlternativeCurrencyKey : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'primär'
  @sap.quickinfo : 'primärer SAP-Währungscode zum ISO-Code'
  IsPrimaryCurrencyForISOCrcy : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Verwaltungsdaten für Entwurf'
entity SEPMRA_PROD_MAN.I_DraftAdministrativeData {
  @sap.label : 'Entwurf (techn. ID)'
  @sap.quickinfo : 'Entwurf (technische ID)'
  key DraftUUID : UUID not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Entwurfsentitäts-ID'
  DraftEntityType : String(30);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf angelegt am'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'CreatedByUserDescription'
  @sap.label : 'Entwurf angelegt von'
  CreatedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf zuletzt geändert am'
  LastChangeDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'LastChangedByUserDescription'
  @sap.label : 'Entwurf zuletzt geändert von'
  LastChangedByUser : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Entwurfszugriffstyp'
  DraftAccessType : String(1);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf in Bearbeitung seit'
  ProcessingStartDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'InProcessByUserDescription'
  @sap.label : 'Entwurf wird bearbeitet von'
  InProcessByUser : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Entwurf beibeihalten von Benutzer'
  DraftIsKeptByUser : Boolean;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf gesperrt seit'
  EnqueueStartDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Von mir erstellter Entwurf'
  DraftIsCreatedByMe : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Von mir zuletzt geänderter Entwurf'
  DraftIsLastChangedByMe : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Von mir bearbeiteter Entwurf'
  DraftIsProcessedByMe : Boolean;
  @sap.label : 'Entwurf angelegt von (Beschreibung)'
  CreatedByUserDescription : String(80);
  @sap.label : 'Entwurf zuletzt geändert von (Beschr.)'
  @sap.quickinfo : 'Entwurf zuletzt geändert von (Beschreibung)'
  LastChangedByUserDescription : String(80);
  @sap.label : 'Entwurf wird bearbeitet von (Beschr.)'
  @sap.quickinfo : 'Entwurf wird bearbeitet von (Beschreibung)'
  InProcessByUserDescription : String(80);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Sprache'
entity SEPMRA_PROD_MAN.I_Language {
  @sap.text : 'Language_Text'
  @sap.label : 'Sprachenschlüssel'
  key Language : String(2) not null;
  @sap.label : 'Bezeichnung'
  @sap.quickinfo : 'Bezeichnung der Sprache'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Language_Text : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sprache (ISO 639)'
  @sap.quickinfo : '2-stelliger SAP Language Code'
  LanguageISOCode : String(2);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_CurrencyValueHelp {
  @sap.text : 'Currency_Text'
  @sap.label : 'Währung'
  @sap.quickinfo : 'Währungsschlüssel'
  @sap.semantics : 'currency-code'
  key Currency : String(5) not null;
  @sap.label : 'Langtext'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Currency_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_ContactPerson {
  @sap.display.format : 'UpperCase'
  @sap.text : 'FullName'
  @sap.label : ''
  key ContactPerson : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Geschäftspartner-ID'
  @sap.quickinfo : 'EPM: Geschäftspartner-ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Supplier : String(10);
  @sap.label : 'Vollständiger Name'
  @sap.quickinfo : 'EPM: Vollständiger Name'
  FullName : String(81);
  @sap.label : 'E-Mail'
  @sap.quickinfo : 'EPM: E-Mail-Adresse'
  EmailAddress : String(255);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fax'
  @sap.quickinfo : 'EPM: Faxnummer'
  FaxNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mobiltelefonnummer'
  @sap.quickinfo : 'EPM: Mobiltelefonnummer'
  MobilePhoneNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telefon'
  @sap.quickinfo : 'EPM: Telefonnummer'
  PhoneNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  IsMainContactPerson : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_PoItmCube {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Produkt-ID'
  @sap.quickinfo : 'EPM: Produkt-ID'
  key Product : String(10) not null;
  @sap.attribute.for : 'OrganizationalUnit'
  @sap.label : ''
  key OrgUnitName : String(20) not null;
  PoItmQuantity : Decimal(13, 3);
  @sap.label : 'Maßeinheit'
  @sap.quickinfo : 'EPM: Mengeneinheit'
  @sap.semantics : 'unit-of-measure'
  QuantityUnit : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_Product {
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Product : String(10) not null;
  @sap.label : 'Schlüssel'
  key DraftUUID : UUID not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ist aktiv'
  @sap.sortable : 'false'
  key IsActiveEntity : Boolean not null;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Activation_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Copy_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Copy_new_supplier_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Create_review_post_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Delete_ext_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Edit_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Favorites_add_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Favorites_remove_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Favorites_toggle_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Mycart_add_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Preparation_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Validation_ac : Boolean;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Feldsteuerung'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProductForEdit_fc : Integer;
  @sap.display.format : 'UpperCase'
  @sap.field.control : 'ProductForEdit_fc'
  @sap.text : 'to_ProductTextInOriginalLang/Name'
  @sap.label : ''
  ProductForEdit : String(10);
  @sap.label : ''
  @sap.value.list : 'standard'
  ProductCategory : String(40);
  @sap.label : ''
  @sap.value.list : 'fixed-values'
  MainProductCategory : String(40);
  @sap.unit : 'Currency'
  @sap.label : ''
  Price : Decimal(16, 3);
  @sap.text : 'to_Currency/Currency_Text'
  @sap.label : ''
  @sap.value.list : 'standard'
  @sap.semantics : 'currency-code'
  Currency : String(5);
  @sap.unit : 'DimensionUnit'
  @sap.label : 'Höhe'
  @sap.quickinfo : 'EPM: Höhe'
  Height : Decimal(13, 3);
  @sap.unit : 'DimensionUnit'
  @sap.label : 'Breite'
  @sap.quickinfo : 'EPM: Breite'
  Width : Decimal(13, 3);
  @sap.unit : 'DimensionUnit'
  @sap.label : 'Tiefe'
  @sap.quickinfo : 'EPM: Tiefe'
  Depth : Decimal(13, 3);
  @sap.text : 'to_DimensionUnit/UnitOfMeasure_Text'
  @sap.label : 'Maßeinheit'
  @sap.quickinfo : 'EPM: Maßeinheit'
  @sap.value.list : 'fixed-values'
  @sap.semantics : 'unit-of-measure'
  DimensionUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductPictureURL : String(255);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Supplier/CompanyName'
  @sap.label : ''
  @sap.value.list : 'fixed-values'
  Supplier : String(10);
  @sap.text : 'to_ProductBaseUnit/UnitOfMeasure_Text'
  @sap.label : ''
  @sap.value.list : 'fixed-values'
  @sap.semantics : 'unit-of-measure'
  ProductBaseUnit : String(3);
  @sap.unit : 'WeightUnit'
  @sap.label : 'Gewicht'
  @sap.quickinfo : 'EPM: Gewichtseinheit'
  Weight : Decimal(13, 3);
  @sap.text : 'to_WeightUnit/UnitOfMeasure_Text'
  @sap.label : ''
  @sap.value.list : 'fixed-values'
  @sap.semantics : 'unit-of-measure'
  WeightUnit : String(3);
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OriginalLanguage : String(2);
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Name : String(255);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf angelegt am'
  DraftEntityCreationDateTime : Timestamp;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf zuletzt geändert am'
  DraftEntityLastChangeDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Hat aktives Dokument'
  @sap.sortable : 'false'
  HasActiveEntity : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Hat Entwurf'
  @sap.sortable : 'false'
  HasDraftEntity : Boolean;
  @cds.ambiguous : 'missing on condition?'
  DraftAdministrativeData : Association to SEPMRA_PROD_MAN.I_DraftAdministrativeData {  };
  @cds.ambiguous : 'missing on condition?'
  SiblingEntity : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_Product {  };
  @cds.ambiguous : 'missing on condition?'
  to_CollaborativeReview : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_Review {  };
  @cds.ambiguous : 'missing on condition?'
  to_CollaborativeReviewPost : Association to many SEPMRA_PROD_MAN.SEPMRA_C_PD_ReviewPost {  };
  @cds.ambiguous : 'missing on condition?'
  to_Currency : Association to SEPMRA_PROD_MAN.I_Currency on to_Currency.Currency = Currency;
  @cds.ambiguous : 'missing on condition?'
  to_CurrencyVH : Association to SEPMRA_PROD_MAN.SEPMRA_C_CurrencyValueHelp {  };
  @cds.ambiguous : 'missing on condition?'
  to_DimensionUnit : Association to SEPMRA_PROD_MAN.SEPMRA_I_DimensionUnit on to_DimensionUnit.UnitOfMeasure = DimensionUnit;
  @cds.ambiguous : 'missing on condition?'
  to_MainProductCategory : Association to SEPMRA_PROD_MAN.SEPMRA_I_ProductMainCategory on to_MainProductCategory.MainProductCategory = MainProductCategory;
  @cds.ambiguous : 'missing on condition?'
  to_OriginalLanguage : Association to SEPMRA_PROD_MAN.I_Language {  };
  @cds.ambiguous : 'missing on condition?'
  to_PriceRange : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductPriceRange {  };
  @cds.ambiguous : 'missing on condition?'
  to_ProductBaseUnit : Association to SEPMRA_PROD_MAN.SEPMRA_I_QuantityUnit on to_ProductBaseUnit.UnitOfMeasure = ProductBaseUnit;
  @cds.ambiguous : 'missing on condition?'
  to_ProductCategory : Association to SEPMRA_PROD_MAN.SEPMRA_I_ProductCategory on to_ProductCategory.ProductCategory = ProductCategory;
  @cds.ambiguous : 'missing on condition?'
  to_ProductCategoryVH : Association to SEPMRA_PROD_MAN.SEPMRA_I_ProductCategory {  };
  @cds.ambiguous : 'missing on condition?'
  to_ProductImage : Association to many SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductImage {  };
  @cds.ambiguous : 'missing on condition?'
  to_ProductSalesData : Association to many SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductSalesData {  };
  @cds.ambiguous : 'missing on condition?'
  to_ProductStock : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductStock {  };
  @cds.ambiguous : 'missing on condition?'
  to_ProductText : Association to many SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductText {  };
  @cds.ambiguous : 'missing on condition?'
  to_ProductTextInOriginalLang : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductText {  };
  @cds.ambiguous : 'missing on condition?'
  to_StorageBin : Association to many SEPMRA_PROD_MAN.SEPMRA_C_PD_StorageBinTP {  };
  @cds.ambiguous : 'missing on condition?'
  to_Supplier : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_Supplier on to_Supplier.Supplier = Supplier;
  @cds.ambiguous : 'missing on condition?'
  to_WeightUnit : Association to SEPMRA_PROD_MAN.SEPMRA_I_WeightUnit on to_WeightUnit.UnitOfMeasure = WeightUnit;
} actions {
  action SEPMRA_C_PD_ProductActivation() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductCopy() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductCopy_new_supplier(
    Supplier : String(10)
  ) returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductCreate_review_post(
    Reviewratingvalue : Decimal(4, 2),
    Reviewposttext : LargeString,
    Reviewposttitle : String(60)
  ) returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductDelete_ext() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductEdit(
    PreserveChanges : Boolean
  ) returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductFavorites_add() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductFavorites_remove() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductFavorites_toggle() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductMycart_add() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  action SEPMRA_C_PD_ProductPreparation(
    SideEffectsQualifier : LargeString
  ) returns SEPMRA_PROD_MAN.SEPMRA_C_PD_Product;
  function SEPMRA_C_PD_ProductValidation(
    SideEffectsQualifier : LargeString
  ) returns SEPMRA_PROD_MAN.ValidationFunctionResult;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductImage {
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  key Product : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  key ProductImage : String(70) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  FileName : String(255);
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  MIMEType : String(100);
  @sap.label : 'Dokumenttitel'
  @sap.quickinfo : 'Kurze Beschreibung des Inhaltes'
  Description : String(50);
  CreationDateTime : Decimal(15, 0);
  LastChangedDateTime : Decimal(15, 0);
  @Core.MediaType : 'application/octet-stream'
  blob : LargeBinary;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductPriceRange {
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Product : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_PriceClassification/PriceClassification_Text'
  @sap.label : ''
  @sap.value.list : 'fixed-values'
  PriceClassification : String(10);
  @cds.ambiguous : 'missing on condition?'
  to_PriceClassification : Association to SEPMRA_PROD_MAN.SEPMRA_I_PriceClassification on to_PriceClassification.PriceClassification = PriceClassification;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.semantics : 'aggregate'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductSalesData {
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ID : LargeString not null;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Kundenauftr.-ID'
  @sap.heading : ''
  @sap.quickinfo : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SalesOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Zeile der Position'
  @sap.heading : ''
  @sap.quickinfo : ''
  SalesOrderItem : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : ''
  DeliveryCalendarDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : ''
  DeliveryCalendarYear : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.text : 'DeliveryCalendarMonthT'
  @sap.label : ''
  DeliveryCalendarMonth : String(2);
  @sap.attribute.for : 'DeliveryCalendarMonth'
  @sap.label : 'Monat'
  @sap.heading : ''
  @sap.quickinfo : ''
  DeliveryCalendarMonthT : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductName'
  @sap.label : ''
  Product : String(10);
  @sap.attribute.for : 'Product'
  @sap.label : ''
  ProductName : String(255);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.text : 'SoldToPartyCompanyName'
  @sap.label : 'Geschäftspartner-ID'
  @sap.heading : ''
  @sap.quickinfo : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SoldToParty : String(10);
  @sap.attribute.for : 'SoldToParty'
  @sap.label : 'Firma'
  @sap.heading : ''
  @sap.quickinfo : ''
  SoldToPartyCompanyName : String(80);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.text : 'SoldToPartyCountryName'
  @sap.label : 'Land'
  @sap.heading : ''
  @sap.quickinfo : ''
  SoldToPartyCountry : String(3);
  @sap.attribute.for : 'SoldToPartyCountry'
  @sap.label : 'Landesbezeichnung'
  @sap.heading : ''
  @sap.quickinfo : ''
  SoldToPartyCountryName : String(50);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'Currency'
  @sap.label : 'Nettobetr.'
  @sap.heading : ''
  @sap.quickinfo : ''
  @sap.filterable : 'false'
  NetAmount : Decimal(16, 3);
  @sap.aggregation.role : 'dimension'
  @sap.text : 'CurrencyT'
  @sap.label : ''
  @sap.semantics : 'currency-code'
  Currency : String(5);
  @sap.attribute.for : 'Currency'
  @sap.label : 'Kurztext'
  @sap.heading : ''
  @sap.quickinfo : ''
  CurrencyT : String(15);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductStock {
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  key Product : String(10) not null;
  @sap.unit : 'QuantityUnit'
  @sap.label : 'Menge'
  @sap.quickinfo : 'EPM: Menge'
  Quantity : Decimal(13, 3);
  @sap.text : 'to_QuantityUnit/UnitOfMeasure_Text'
  @sap.label : ''
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  QuantityUnit : String(3);
  @odata.Type : 'Edm.Byte'
  @sap.text : 'to_StockAvailability/StockAvailability_Text'
  @sap.label : ''
  @sap.value.list : 'fixed-values'
  StockAvailability : Integer;
  @sap.unit : 'QuantityUnit'
  @sap.label : 'Mindestbestand'
  @sap.quickinfo : 'EPM: Mindestbestand'
  MinimumStockQuantity : Decimal(13, 3);
  @cds.ambiguous : 'missing on condition?'
  to_QuantityUnit : Association to SEPMRA_PROD_MAN.SEPMRA_I_QuantityUnit on to_QuantityUnit.UnitOfMeasure = QuantityUnit;
  @cds.ambiguous : 'missing on condition?'
  to_StockAvailability : Association to SEPMRA_PROD_MAN.SEPMRA_I_StockAvailability on to_StockAvailability.StockAvailability = StockAvailability;
};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.deletable.path : 'Delete_mc'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductText {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Name'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  key Product : String(10) not null;
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Language : String(2) not null;
  @sap.label : 'Schlüssel'
  key DraftUUID : UUID not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ist aktiv'
  @sap.sortable : 'false'
  key IsActiveEntity : Boolean not null;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Preparation_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Validation_ac : Boolean;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Feldsteuerung'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Description_fc : Integer;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Feldsteuerung'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LanguageForEdit_fc : Integer;
  @sap.label : 'Dyn. Methodensteuerg'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Delete_mc : Boolean;
  @sap.field.control : 'LanguageForEdit_fc'
  @sap.text : 'to_Language/Language_Text'
  @sap.label : ''
  @sap.value.list : 'standard'
  LanguageForEdit : String(2);
  @sap.label : ''
  Name : String(255);
  @sap.field.control : 'Description_fc'
  @sap.label : ''
  Description : String(255);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf angelegt am'
  DraftEntityCreationDateTime : Timestamp;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf zuletzt geändert am'
  DraftEntityLastChangeDateTime : Timestamp;
  @sap.label : 'Schlüssel'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ParentDraftUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Hat aktives Dokument'
  @sap.sortable : 'false'
  HasActiveEntity : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Hat Entwurf'
  @sap.sortable : 'false'
  HasDraftEntity : Boolean;
  @cds.ambiguous : 'missing on condition?'
  to_Product : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_Product {  };
  @cds.ambiguous : 'missing on condition?'
  DraftAdministrativeData : Association to SEPMRA_PROD_MAN.I_DraftAdministrativeData {  };
  @cds.ambiguous : 'missing on condition?'
  SiblingEntity : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductText {  };
  @cds.ambiguous : 'missing on condition?'
  to_Language : Association to SEPMRA_PROD_MAN.I_Language on to_Language.Language = LanguageForEdit;
} actions {
  action SEPMRA_C_PD_ProductTextPreparation(
    SideEffectsQualifier : LargeString
  ) returns SEPMRA_PROD_MAN.SEPMRA_C_PD_ProductText;
  function SEPMRA_C_PD_ProductTextValidation(
    SideEffectsQualifier : LargeString
  ) returns SEPMRA_PROD_MAN.ValidationFunctionResult;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_Review {
  @sap.label : 'Knotenschlüssel'
  @sap.quickinfo : 'EPM: Generischer Knotenschlüssel'
  key ProductReviewUUID : UUID not null;
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.value.list : 'standard'
  Product : String(10);
  @sap.label : 'Durchschn. Bewertung'
  @sap.quickinfo : 'EPM: Überprüfungsbewertungsdurchschnitt'
  AverageRatingValue : Decimal(4, 2);
  @sap.label : 'Anzahl der Prüfungen'
  @sap.quickinfo : 'EPM: Anzahl der Prüfungen'
  NumberOfReviewPosts : Integer;
  @cds.ambiguous : 'missing on condition?'
  to_Product : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_Product {  };
  @cds.ambiguous : 'missing on condition?'
  to_ReviewPost : Association to many SEPMRA_PROD_MAN.SEPMRA_C_PD_ReviewPost on to_ReviewPost.ProductReviewUUID = ProductReviewUUID;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_ReviewPost {
  @sap.label : 'Knotenschlüssel'
  @sap.quickinfo : 'EPM: Generischer Knotenschlüssel'
  key ProductReviewPostUUID : UUID not null;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Delete_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Mark_as_helpful_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Update_ac : Boolean;
  @sap.label : 'Knotenschlüssel'
  @sap.quickinfo : 'EPM: Generischer Knotenschlüssel'
  ProductReviewUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.value.list : 'standard'
  Product : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bewertungstitel'
  @sap.heading : ''
  @sap.quickinfo : ''
  ReviewPostTitle : String(60);
  @sap.label : 'Bewertungstext'
  @sap.heading : ''
  @sap.quickinfo : ''
  ReviewPostText : LargeString;
  @odata.Type : 'Edm.Byte'
  @sap.label : ''
  ReviewRatingValue : Integer;
  @sap.label : ''
  NumberOfAffirmativeAnswers : Integer;
  @sap.label : 'Anzahl d. Reaktionen'
  @sap.quickinfo : 'EPM: Gesamtzahl der Prüfreaktionen'
  TotalNumberOfAnswers : Integer;
  @sap.display.format : 'Date'
  @sap.label : ''
  ReviewDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ContactPerson/FullName'
  @sap.label : ''
  @sap.value.list : 'standard'
  ContactPerson : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  IsReviewOfCurrentUser : Boolean;
  @cds.ambiguous : 'missing on condition?'
  to_ContactPerson : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_ContactPerson on to_ContactPerson.ContactPerson = ContactPerson;
  @cds.ambiguous : 'missing on condition?'
  to_Product : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_Product {  };
} actions {
  action SEPMRA_C_PD_ReviewPostDelete() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_ReviewPost;
  action SEPMRA_C_PD_ReviewPostMark_as_helpful() returns SEPMRA_PROD_MAN.SEPMRA_C_PD_ReviewPost;
  action SEPMRA_C_PD_ReviewPostUpdate(
    ReviewRatingValue : Decimal(4, 2),
    ReviewPostText : LargeString
  ) returns SEPMRA_PROD_MAN.SEPMRA_C_PD_ReviewPost;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_StorageBinTP {
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.value.list : 'standard'
  key Product : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Lagerplatznr.'
  @sap.quickinfo : 'EPM: Lagerplatznummer'
  key Bin : String(10) not null;
  @sap.label : 'Schlüssel'
  key DraftUUID : UUID not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ist aktiv'
  @sap.sortable : 'false'
  key IsActiveEntity : Boolean not null;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Preparation_ac : Boolean;
  @sap.label : 'Dyn. Aktions-Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Validation_ac : Boolean;
  @sap.unit : 'QuantityUnit'
  @sap.label : 'Menge'
  @sap.quickinfo : 'EPM: Menge'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Quantity : Decimal(13, 3);
  @sap.unit : 'QuantityUnit'
  @sap.label : 'Losgröße'
  @sap.quickinfo : 'EPM: Losgröße'
  LotSizeQuantity : Decimal(13, 3);
  @sap.unit : 'QuantityUnit'
  @sap.label : 'Mindestbestand'
  @sap.quickinfo : 'EPM: Mindestbestand'
  MinimumStockQuantity : Decimal(13, 3);
  @sap.text : 'to_QuantityUnit/UnitOfMeasure_Text'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  QuantityUnit : String(3);
  @odata.Type : 'Edm.Byte'
  @sap.text : 'to_StockAvailability/StockAvailability_Text'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  StockAvailability : Integer;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_OrganizationalUnit/OrganizationalUnitName'
  @sap.label : 'OrgEinh.-ID'
  @sap.quickinfo : 'EPM: ID der Organisationseinheit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  OrganizationalUnit : String(10);
  @sap.unit : 'QuantityUnit'
  @sap.label : 'Mindestbestand'
  @sap.quickinfo : 'EPM: Mindestbestand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  DeviationRangeLow : Decimal(13, 3);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ToleranceRangeLow : Decimal(14, 3);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ToleranceRangeHigh : Decimal(17, 3);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  DeviationRangeHigh : Decimal(17, 3);
  @odata.Type : 'Edm.Byte'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MinimumStock : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaximumStock : Decimal(13, 3);
  @sap.unit : 'QuantityUnit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PoItmQuantity : Decimal(13, 3);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf angelegt am'
  DraftEntityCreationDateTime : Timestamp;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Entwurf zuletzt geändert am'
  DraftEntityLastChangeDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Hat aktives Dokument'
  @sap.sortable : 'false'
  HasActiveEntity : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Hat Entwurf'
  @sap.sortable : 'false'
  HasDraftEntity : Boolean;
  @cds.ambiguous : 'missing on condition?'
  to_Product : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_Product {  };
  @cds.ambiguous : 'missing on condition?'
  DraftAdministrativeData : Association to SEPMRA_PROD_MAN.I_DraftAdministrativeData {  };
  @cds.ambiguous : 'missing on condition?'
  SiblingEntity : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_StorageBinTP {  };
  @cds.ambiguous : 'missing on condition?'
  to_OrganizationalUnit : Association to SEPMRA_PROD_MAN.SEPMRA_I_OrganizationalUnit on to_OrganizationalUnit.OrganizationalUnit = OrganizationalUnit;
  @cds.ambiguous : 'missing on condition?'
  to_QuantityUnit : Association to SEPMRA_PROD_MAN.SEPMRA_I_QuantityUnit on to_QuantityUnit.UnitOfMeasure = QuantityUnit;
  @cds.ambiguous : 'missing on condition?'
  to_StockAvailability : Association to SEPMRA_PROD_MAN.SEPMRA_I_StockAvailability on to_StockAvailability.StockAvailability = StockAvailability;
} actions {
  action SEPMRA_C_PD_StorageBinTPPreparation(
    SideEffectsQualifier : LargeString
  ) returns SEPMRA_PROD_MAN.SEPMRA_C_PD_StorageBinTP;
  function SEPMRA_C_PD_StorageBinTPValidation(
    SideEffectsQualifier : LargeString
  ) returns SEPMRA_PROD_MAN.ValidationFunctionResult;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_C_PD_Supplier {
  @sap.display.format : 'UpperCase'
  @sap.text : 'CompanyName'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key Supplier : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  CompanyName : String(80);
  @sap.label : 'E-Mail'
  @sap.quickinfo : 'EPM: E-Mail-Adresse'
  EmailAddress : String(255);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fax'
  @sap.quickinfo : 'EPM: Faxnummer'
  FaxNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telefon'
  @sap.quickinfo : 'EPM: Telefonnummer'
  PhoneNumber : String(30);
  @sap.label : 'URI'
  @sap.quickinfo : 'EPM: Web-Adresse'
  URL : LargeString;
  @cds.ambiguous : 'missing on condition?'
  to_Address : Association to SEPMRA_PROD_MAN.SEPMRA_I_Address {  };
  @cds.ambiguous : 'missing on condition?'
  to_ContactPerson : Association to many SEPMRA_PROD_MAN.SEPMRA_C_PD_ContactPerson {  };
  @cds.ambiguous : 'missing on condition?'
  to_PrimaryContactPerson : Association to SEPMRA_PROD_MAN.SEPMRA_C_PD_ContactPerson {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_Address {
  @sap.label : 'Adress-UUID'
  @sap.quickinfo : 'EPM: Interner Identifikator der Adresse, universal eindeutig'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key AddressUUID : UUID not null;
  @sap.label : 'Ort'
  @sap.quickinfo : 'EPM: Ort'
  CityName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Postleitzahl'
  @sap.quickinfo : 'EPM: Postleitzahl'
  PostalCode : String(10);
  @sap.label : 'Straße'
  @sap.quickinfo : 'EPM: Straße'
  StreetName : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gebäude'
  @sap.quickinfo : 'EPM: Gebäude'
  HouseNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Land'
  @sap.quickinfo : 'EPM: Ländervorwahl'
  Country : String(3);
  @sap.display.format : 'Date'
  @sap.label : 'Gültig ab'
  @sap.quickinfo : 'EPM: Gültigkeitsbeginn'
  AddressValidityStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Gültig bis'
  @sap.quickinfo : 'EPM: Gültigkeitsende'
  AddressValidityEndDate : Date;
  @sap.label : 'Geograf. Breite'
  @sap.quickinfo : 'EPM: geografische Breite'
  Latitude : Decimal(15, 12);
  @sap.label : 'Geograf. Länge'
  @sap.quickinfo : 'EPM: geografische Länge'
  Longitude : Decimal(15, 12);
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FormattedAddress : String(255);
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FullAddress : String(255);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Adressentyp'
  @sap.quickinfo : 'EPM: Adressentyp'
  AddressType : String(2);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_DimensionUnit {
  @sap.text : 'UnitOfMeasure_Text'
  @sap.label : 'Maßeinheit'
  @sap.quickinfo : 'EPM: Maßeinheit'
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Technisch'
  @sap.quickinfo : 'Externe Maßeinheit technische Darstellung (6stellig)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasure_Text : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO-Code'
  @sap.quickinfo : 'ISO-Code Maßeinheit'
  UnitOfMeasureISOCode : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_OrganizationalUnit {
  @sap.display.format : 'UpperCase'
  @sap.text : 'OrganizationalUnitName'
  @sap.label : ''
  key OrganizationalUnit : String(10) not null;
  @sap.attribute.for : 'OrganizationalUnit'
  @sap.label : ''
  OrganizationalUnitName : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_PriceClassification {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PriceClassification_Text'
  @sap.label : ''
  key PriceClassification : String(10) not null;
  @sap.label : 'Kurzbeschreibung'
  @sap.quickinfo : 'Erläuternder Kurztext'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PriceClassification_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_ProductCategory {
  @sap.label : ''
  key ProductCategory : String(40) not null;
  @sap.label : ''
  @sap.value.list : 'fixed-values'
  MainProductCategory : String(40);
  @cds.ambiguous : 'missing on condition?'
  to_MainCategory : Association to SEPMRA_PROD_MAN.SEPMRA_I_ProductMainCategory on to_MainCategory.MainProductCategory = MainProductCategory;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_ProductMainCategory {
  @sap.label : ''
  key MainProductCategory : String(40) not null;
  @cds.ambiguous : 'missing on condition?'
  to_Category : Association to many SEPMRA_PROD_MAN.SEPMRA_I_ProductCategory on to_Category.MainProductCategory = MainProductCategory;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_QuantityUnit {
  @sap.text : 'UnitOfMeasure_Text'
  @sap.label : ''
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Technisch'
  @sap.quickinfo : 'Externe Maßeinheit technische Darstellung (6stellig)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasure_Text : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO-Code'
  @sap.quickinfo : 'ISO-Code Maßeinheit'
  UnitOfMeasureISOCode : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_StockAvailability {
  @odata.Type : 'Edm.Byte'
  @sap.text : 'StockAvailability_Text'
  @sap.label : ''
  key StockAvailability : Integer not null;
  @sap.display.format : 'UpperCase'
  @sap.label : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  StockAvailability_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity SEPMRA_PROD_MAN.SEPMRA_I_WeightUnit {
  @sap.text : 'UnitOfMeasure_Text'
  @sap.label : ''
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Technisch'
  @sap.quickinfo : 'Externe Maßeinheit technische Darstellung (6stellig)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasure_Text : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO-Code'
  @sap.quickinfo : 'ISO-Code Maßeinheit'
  UnitOfMeasureISOCode : String(3);
};

@cds.external : true
type SEPMRA_PROD_MAN.ValidationFunctionResult {
  @sap.label : 'Ist gültig'
  IsValid : Boolean;
};

