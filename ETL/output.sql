CREATE TABLE main (
    Transaction JSON REFERENCES TRANSACTION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Transaction (
    Event JSON REFERENCES EVENT(ID),
    Document JSON REFERENCES DOCUMENT(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Event (
    EventNumber VARCHAR2(255 BYTE),
    EventVersion VARCHAR2(255 BYTE),
    EventType VARCHAR2(255 BYTE),
    Event VARCHAR2(255 BYTE),
    EntityStatus VARCHAR2(255 BYTE),
    EventTypeShortCode VARCHAR2(255 BYTE),
    JournalDate VARCHAR2(255 BYTE),
    WithUpdatedAccountedDate VARCHAR2(255 BYTE),
    CreatedBy VARCHAR2(255 BYTE),
    OfficeId VARCHAR2(255 BYTE),
    Usecase JSON REFERENCES USECASE(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Usecase (
    UsecaseType VARCHAR2(255 BYTE),
    ModifiedEntities JSON REFERENCES MODIFIEDENTITIES(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ModifiedEntities (
    ModifiedEntities JSON REFERENCES MODIFIEDENTITIES_LIST(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ModifiedEntities_list (
    ElementType VARCHAR2(255 BYTE),
    Action JSON REFERENCES ACTION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Action (
    Action JSON REFERENCES ACTION_LIST(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Action_list (
    Actor VARCHAR2(255 BYTE),
    ActionDetail VARCHAR2(255 BYTE),
    SubAction JSON REFERENCES SUBACTION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE SubAction (
    Description VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Document (
    InternalId VARCHAR2(255 BYTE),
    PrimaryDocumentNbr VARCHAR2(255 BYTE),
    Type VARCHAR2(255 BYTE),
    DocumentOperationalStatus VARCHAR2(255 BYTE),
    IssueIndicator VARCHAR2(255 BYTE),
    TransactionCode VARCHAR2(255 BYTE),
    TransactionType VARCHAR2(255 BYTE),
    NumberOfConjunctiveTickets VARCHAR2(255 BYTE),
    FullRouting VARCHAR2(255 BYTE),
    ValidatingCarrier VARCHAR2(255 BYTE),
    DateOfIssuance VARCHAR2(255 BYTE),
    ValidatingAirlineAllianceCode VARCHAR2(255 BYTE),
    OriginalIssueInfoFreeFlow VARCHAR2(255 BYTE),
    Code VARCHAR2(255 BYTE),
    AcquisitionType VARCHAR2(255 BYTE),
    InvoluntaryIndicator VARCHAR2(255 BYTE),
    IsLafAppliedIndicator VARCHAR2(255 BYTE),
    IsRedemptionTicket VARCHAR2(255 BYTE),
    IsRedemptionWithFareTicket VARCHAR2(255 BYTE),
    IsScheduleChange VARCHAR2(255 BYTE),
    AgencyName VARCHAR2(255 BYTE),
    IssuanceDetails JSON REFERENCES ISSUANCEDETAILS(ID),
    BookingInformation JSON REFERENCES BOOKINGINFORMATION(ID),
    IssuedInExchangeFor JSON REFERENCES ISSUEDINEXCHANGEFOR(ID),
    OriginalIssueInfo JSON REFERENCES ORIGINALISSUEINFO(ID),
    PassengerInformation JSON REFERENCES PASSENGERINFORMATION(ID),
    ItineraryDetails JSON REFERENCES ITINERARYDETAILS(ID),
    PricingDetails JSON REFERENCES PRICINGDETAILS(ID),
    Fares JSON REFERENCES FARES(ID),
    StandardCommission JSON REFERENCES STANDARDCOMMISSION(ID),
    SupplementaryCommission JSON REFERENCES SUPPLEMENTARYCOMMISSION(ID),
    EffectiveCommission JSON REFERENCES EFFECTIVECOMMISSION(ID),
    ReportingInformation JSON REFERENCES REPORTINGINFORMATION(ID),
    Coupon JSON REFERENCES COUPON(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE IssuanceDetails (
    CityPOS VARCHAR2(255 BYTE),
    IssuerSystem VARCHAR2(255 BYTE),
    Channel VARCHAR2(255 BYTE),
    Iata VARCHAR2(255 BYTE),
    OfficeId VARCHAR2(255 BYTE),
    CountryCodeOfIssue VARCHAR2(255 BYTE),
    SASI VARCHAR2(255 BYTE),
    AgentSign VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE BookingInformation (
    PNRIdentification JSON REFERENCES PNRIDENTIFICATION(ID),
    BookingAgencyDetails JSON REFERENCES BOOKINGAGENCYDETAILS(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE PNRIdentification (
    AmadeusRecordLocator JSON REFERENCES AMADEUSRECORDLOCATOR(ID),
    OriginalRecordLocator JSON REFERENCES ORIGINALRECORDLOCATOR(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE AmadeusRecordLocator (
    CompanyCode VARCHAR2(255 BYTE),
    ID VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE OriginalRecordLocator (
    CompanyCode VARCHAR2(255 BYTE),
    ID VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE BookingAgencyDetails (
    IataNumber VARCHAR2(255 BYTE),
    OfficeId VARCHAR2(255 BYTE),
    AgentSine VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE IssuedInExchangeFor (
    PrimaryDocumentNbr VARCHAR2(255 BYTE),
    IssuanceLocalDate VARCHAR2(255 BYTE),
    ExchangedCoupons JSON REFERENCES EXCHANGEDCOUPONS(ID),
    FOP JSON REFERENCES FOP(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ExchangedCoupons (
    ConjunctiveCouponNbr VARCHAR2(255 BYTE),
    ConjunctiveDocumentNbr VARCHAR2(255 BYTE),
    Status VARCHAR2(255 BYTE),
    InvoluntaryIndicator VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE FOP (
    FOP JSON REFERENCES FOP(ID),
    Type VARCHAR2(255 BYTE),
    TicketedType VARCHAR2(255 BYTE),
    CompleteFOP VARCHAR2(255 BYTE),
    AccountableEntity JSON REFERENCES ACCOUNTABLEENTITY(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE AccountableEntity (
    Amount JSON REFERENCES AMOUNT(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Amount (
    AmountType VARCHAR2(255 BYTE),
    Amount VARCHAR2(255 BYTE),
    CurrencyCode VARCHAR2(255 BYTE),
    ConversionRule VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE OriginalIssueInfo (
    PrimaryDocumentNbr VARCHAR2(255 BYTE),
    IssuanceLocalDate VARCHAR2(255 BYTE),
    IataNumber VARCHAR2(255 BYTE),
    CityCode VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE PassengerInformation (
    Surname VARCHAR2(255 BYTE),
    FirstName VARCHAR2(255 BYTE),
    PassengerTypeCode VARCHAR2(255 BYTE),
    FarePassengerTypeCode VARCHAR2(255 BYTE),
    DateOfBirth VARCHAR2(255 BYTE),
    IsStaff VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ItineraryDetails (
    RoutingType VARCHAR2(255 BYTE),
    OneWayIndicator VARCHAR2(255 BYTE),
    FinalDestination VARCHAR2(255 BYTE),
    TODC JSON REFERENCES TODC(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE TODC (
    OriginCityCode VARCHAR2(255 BYTE),
    OriginCityCodeRealItinerary VARCHAR2(255 BYTE),
    DestinationCityCode VARCHAR2(255 BYTE),
    DestinationCityCodeRealItinerary VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE PricingDetails (
    IsRevenuePassenger VARCHAR2(255 BYTE),
    IsITBT VARCHAR2(255 BYTE),
    FareCalculation VARCHAR2(255 BYTE),
    FCMI VARCHAR2(255 BYTE),
    IsNetRemit VARCHAR2(255 BYTE),
    EndorsementText VARCHAR2(255 BYTE),
    CurrencyOfPayment VARCHAR2(255 BYTE),
    FCPI VARCHAR2(255 BYTE),
    FareDescription VARCHAR2(255 BYTE),
    TPMSum VARCHAR2(255 BYTE),
    ProrateFactorSum VARCHAR2(255 BYTE),
    AREI VARCHAR2(255 BYTE),
    RemittanceAmount JSON REFERENCES REMITTANCEAMOUNT(ID),
    TotalDocumentAmount JSON REFERENCES TOTALDOCUMENTAMOUNT(ID),
    RevenueAttributableAgent JSON REFERENCES REVENUEATTRIBUTABLEAGENT(ID),
    FareComponent JSON REFERENCES FARECOMPONENT(ID),
    TKMI VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE RemittanceAmount (
    Amount JSON REFERENCES AMOUNT(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Amount_list (
    AmountType VARCHAR2(255 BYTE),
    Amount JSON REFERENCES AMOUNT(ID),
    ConversionRule VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE TotalDocumentAmount (
    Amount JSON REFERENCES AMOUNT(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE RevenueAttributableAgent (
    AgencyNumber VARCHAR2(255 BYTE),
    CityCode VARCHAR2(255 BYTE),
    AgencyType VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE FareComponent (
    FareComponentNumber VARCHAR2(255 BYTE),
    FareComponentOrigin VARCHAR2(255 BYTE),
    FareComponentDestination VARCHAR2(255 BYTE),
    FareComponentAmount VARCHAR2(255 BYTE),
    FareComponentCurrency VARCHAR2(255 BYTE),
    RelatedCoupon JSON REFERENCES RELATEDCOUPON(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE RelatedCoupon (
    CouponNumber VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Fares (
    Fare JSON REFERENCES FARE(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Fare (
    Fare JSON REFERENCES FARE_LIST(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Fare_list (
    FareDescription VARCHAR2(255 BYTE),
    AccountableEntity JSON REFERENCES ACCOUNTABLEENTITY(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE StandardCommission (
    Commission JSON REFERENCES COMMISSION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Commission (
    CommissionType VARCHAR2(255 BYTE),
    ControlAdjustmentIndicator VARCHAR2(255 BYTE),
    AccountableEntity JSON REFERENCES ACCOUNTABLEENTITY(ID),
    ShareIndicator VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE SupplementaryCommission (
    Commission JSON REFERENCES COMMISSION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE EffectiveCommission (
    Commission JSON REFERENCES COMMISSION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ReportingInformation (
    ReportingInformationSource VARCHAR2(255 BYTE),
    CurrencyOfPayment VARCHAR2(255 BYTE),
    BSPIDorBankCode VARCHAR2(255 BYTE),
    CountryCode VARCHAR2(255 BYTE),
    BillingPeriod VARCHAR2(255 BYTE),
    ReportingPeriod VARCHAR2(255 BYTE),
    ProcessingDate VARCHAR2(255 BYTE),
    ProcessingTime VARCHAR2(255 BYTE),
    FileSequenceNumber VARCHAR2(255 BYTE),
    DynamicRunId VARCHAR2(255 BYTE),
    ReportingWeekNumber VARCHAR2(255 BYTE),
    IsPendingManualValidation VARCHAR2(255 BYTE),
    ReportingMonthNumber VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Coupon (
    Number VARCHAR2(255 BYTE),
    ConjunctiveNumber VARCHAR2(255 BYTE),
    DocumentNbr VARCHAR2(255 BYTE),
    ConjunctiveDocumentNbr VARCHAR2(255 BYTE),
    Status VARCHAR2(255 BYTE),
    NotValidAfter VARCHAR2(255 BYTE),
    IsCodeshare VARCHAR2(255 BYTE),
    IsSurfaceCoupon VARCHAR2(255 BYTE),
    IsRedemptionTicket VARCHAR2(255 BYTE),
    DetailedOperationalStatus VARCHAR2(255 BYTE),
    IsRevenuePassenger VARCHAR2(255 BYTE),
    IsExpired VARCHAR2(255 BYTE),
    IsRerouted VARCHAR2(255 BYTE),
    SegmentInfo JSON REFERENCES SEGMENTINFO(ID),
    CouponDetails JSON REFERENCES COUPONDETAILS(ID),
    CalculatedAmounts JSON REFERENCES CALCULATEDAMOUNTS(ID),
    ProrationDetails JSON REFERENCES PRORATIONDETAILS(ID),
    BaggageAllowance JSON REFERENCES BAGGAGEALLOWANCE(ID),
    ExchangeBalanceCouponLevel JSON REFERENCES EXCHANGEBALANCECOUPONLEVEL(ID),
    SoldFlightDetails JSON REFERENCES SOLDFLIGHTDETAILS(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE SegmentInfo (
    OriginCityCode VARCHAR2(255 BYTE),
    DestinationCityCode VARCHAR2(255 BYTE),
    OriginAirportCode VARCHAR2(255 BYTE),
    DestinationAirportCode VARCHAR2(255 BYTE),
    FlightDate VARCHAR2(255 BYTE),
    DepartureDate VARCHAR2(255 BYTE),
    ArrivalDate VARCHAR2(255 BYTE),
    StopoverIndicator VARCHAR2(255 BYTE),
    DirectionIndicator VARCHAR2(255 BYTE),
    FlightBookingStatus VARCHAR2(255 BYTE),
    CodeshareType VARCHAR2(255 BYTE),
    EquipmentCode VARCHAR2(255 BYTE),
    ChangeOfGaugeFlightIndicator VARCHAR2(255 BYTE),
    ClassDetails JSON REFERENCES CLASSDETAILS(ID),
    CompanyDetails JSON REFERENCES COMPANYDETAILS(ID),
    FlightIdentification JSON REFERENCES FLIGHTIDENTIFICATION(ID),
    FullFlightInformation JSON REFERENCES FULLFLIGHTINFORMATION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ClassDetails (
    BookingClass VARCHAR2(255 BYTE),
    OperatingCabinClass VARCHAR2(255 BYTE),
    MarketingCabinClass VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE CompanyDetails (
    MarketingCarrier VARCHAR2(255 BYTE),
    OperatingCarrier VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE FlightIdentification (
    OperatingFlightNumber JSON REFERENCES OPERATINGFLIGHTNUMBER(ID),
    MarketingFlightNumber JSON REFERENCES MARKETINGFLIGHTNUMBER(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE OperatingFlightNumber (
    FlightNumber VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE MarketingFlightNumber (
    FlightNumber VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE FullFlightInformation (
    FlightDepartureDateTime VARCHAR2(255 BYTE),
    FlightDepartureAirportCode VARCHAR2(255 BYTE),
    FlightArrivalDateTime VARCHAR2(255 BYTE),
    FlightArrivalAirportCode VARCHAR2(255 BYTE),
    FullFlightLegs JSON REFERENCES FULLFLIGHTLEGS(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE FullFlightLegs (
    FullFlightLeg JSON REFERENCES FULLFLIGHTLEG(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE FullFlightLeg (
    FullFlightLeg JSON REFERENCES FULLFLIGHTLEG_LIST(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE FullFlightLeg_list (
    AircraftType VARCHAR2(255 BYTE),
    AircraftRegistrationReference VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE CouponDetails (
    SAC VARCHAR2(255 BYTE),
    FareBasisCode VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE CalculatedAmounts (
    CouponProratedFare JSON REFERENCES COUPONPRORATEDFARE(ID),
    CouponTaxes JSON REFERENCES COUPONTAXES(ID),
    CouponStandardCommission JSON REFERENCES COUPONSTANDARDCOMMISSION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE CouponProratedFare (
    ProrationSource VARCHAR2(255 BYTE),
    AccountableEntity JSON REFERENCES ACCOUNTABLEENTITY(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE AmountType (
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE CouponTaxes (
    RemittanceTaxesCpnLvl JSON REFERENCES REMITTANCETAXESCPNLVL(ID),
    InterlineableTaxes JSON REFERENCES INTERLINEABLETAXES(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE RemittanceTaxesCpnLvl (
    RemittanceTaxCpnLvl JSON REFERENCES REMITTANCETAXCPNLVL(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE RemittanceTaxCpnLvl (
    RemittanceTaxCpnLvl JSON REFERENCES REMITTANCETAXCPNLVL_LIST(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE RemittanceTaxCpnLvl_list (
    Tax JSON REFERENCES TAX(ID),
    RemittanceTaxCalculatedValues JSON REFERENCES REMITTANCETAXCALCULATEDVALUES(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Tax (
    NatureCode VARCHAR2(255 BYTE),
    ISOCode VARCHAR2(255 BYTE),
    TaxDestination VARCHAR2(255 BYTE),
    IsClaimBack VARCHAR2(255 BYTE),
    PointOfApplicationIndicator VARCHAR2(255 BYTE),
    TaxRecipientCategory VARCHAR2(255 BYTE),
    TaxRemittanceIdentifier VARCHAR2(255 BYTE),
    SequenceQualifier VARCHAR2(255 BYTE),
    SequenceNumber VARCHAR2(255 BYTE),
    IsInterlineable VARCHAR2(255 BYTE),
    IsRefundable VARCHAR2(255 BYTE),
    AppliedMethod VARCHAR2(255 BYTE),
    InvoluntaryExchangeMethod VARCHAR2(255 BYTE),
    RelevantDate VARCHAR2(255 BYTE),
    SectorApplication VARCHAR2(255 BYTE),
    IsAlwaysRemitted VARCHAR2(255 BYTE),
    UpdateAtFlown VARCHAR2(255 BYTE),
    AccountableEntity JSON REFERENCES ACCOUNTABLEENTITY(ID),
    Tax JSON REFERENCES TAX_LIST(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE RemittanceTaxCalculatedValues (
    AccountableEntity JSON REFERENCES ACCOUNTABLEENTITY(ID),
    TaxJustification JSON REFERENCES TAXJUSTIFICATION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE TaxJustification (
    Category VARCHAR2(255 BYTE),
    SubCategory VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE InterlineableTaxes (
    Tax JSON REFERENCES TAX(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE Tax_list (
    NatureCode VARCHAR2(255 BYTE),
    ISOCode VARCHAR2(255 BYTE),
    TaxDestination VARCHAR2(255 BYTE),
    IsClaimBack VARCHAR2(255 BYTE),
    PointOfApplicationCode VARCHAR2(255 BYTE),
    PointOfApplicationIndicator VARCHAR2(255 BYTE),
    TaxRecipientCategory VARCHAR2(255 BYTE),
    TaxRecipientId VARCHAR2(255 BYTE),
    TaxRemittanceIdentifier VARCHAR2(255 BYTE),
    SequenceQualifier VARCHAR2(255 BYTE),
    SequenceNumber VARCHAR2(255 BYTE),
    IsInterlineable VARCHAR2(255 BYTE),
    IsRefundable VARCHAR2(255 BYTE),
    AppliedMethod VARCHAR2(255 BYTE),
    InvoluntaryExchangeMethod VARCHAR2(255 BYTE),
    RelevantDate VARCHAR2(255 BYTE),
    SectorApplication VARCHAR2(255 BYTE),
    IsAlwaysRemitted VARCHAR2(255 BYTE),
    UpdateAtFlown VARCHAR2(255 BYTE),
    AccountableEntity JSON REFERENCES ACCOUNTABLEENTITY(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE CouponStandardCommission (
    Commission JSON REFERENCES COMMISSION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ProrationDetails (
    TicketedPointMileage VARCHAR2(255 BYTE),
    ProrateFactor VARCHAR2(255 BYTE),
    ProratedValues JSON REFERENCES PRORATEDVALUES(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ProratedValues (
    ProratedValue JSON REFERENCES PRORATEDVALUE(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ProratedValue (
    ProratedValue JSON REFERENCES PRORATEDVALUE_LIST(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ProratedValue_list (
    ProrationSource VARCHAR2(255 BYTE),
    ProrationCode VARCHAR2(255 BYTE),
    AccountableEntity JSON REFERENCES ACCOUNTABLEENTITY(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE BaggageAllowance (
    Quantity VARCHAR2(255 BYTE),
    WeightUnit VARCHAR2(255 BYTE),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE ExchangeBalanceCouponLevel (
    Amount JSON REFERENCES AMOUNT(ID),
    id NUMBER(10,0) PRIMARY KEY
);
CREATE TABLE SoldFlightDetails (
    OriginCityCode VARCHAR2(255 BYTE),
    DestinationCityCode VARCHAR2(255 BYTE),
    OriginAirportCode VARCHAR2(255 BYTE),
    DestinationAirportCode VARCHAR2(255 BYTE),
    FlightDate VARCHAR2(255 BYTE),
    DepartureDate VARCHAR2(255 BYTE),
    ArrivalDate VARCHAR2(255 BYTE),
    StopoverIndicator VARCHAR2(255 BYTE),
    DirectionIndicator VARCHAR2(255 BYTE),
    CodeshareType VARCHAR2(255 BYTE),
    EquipmentCode VARCHAR2(255 BYTE),
    ChangeOfGaugeFlightIndicator VARCHAR2(255 BYTE),
    ClassDetails JSON REFERENCES CLASSDETAILS(ID),
    CompanyDetails JSON REFERENCES COMPANYDETAILS(ID),
    FlightIdentification JSON REFERENCES FLIGHTIDENTIFICATION(ID),
    FullFlightInformation JSON REFERENCES FULLFLIGHTINFORMATION(ID),
    id NUMBER(10,0) PRIMARY KEY
);
