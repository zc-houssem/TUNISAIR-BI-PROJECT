CREATE TABLE Amount (
    AmountType VARCHAR2(255 BYTE),
    Amount VARCHAR2(255 BYTE),
    CurrencyCode VARCHAR2(255 BYTE),
    ConversionRule VARCHAR2(255 BYTE)
);
CREATE TABLE Amount_list (
    AmountType VARCHAR2(255 BYTE),
    Amount INT REFERENCES AMOUNT(ID),
    ConversionRule VARCHAR2(255 BYTE)
);
CREATE TABLE AccountableEntity (
    Amount INT REFERENCES AMOUNT(ID)
);
CREATE TABLE Commission (
    CommissionType VARCHAR2(255 BYTE),
    ControlAdjustmentIndicator VARCHAR2(255 BYTE),
    AccountableEntity INT REFERENCES ACCOUNTABLEENTITY(ID),
    ShareIndicator VARCHAR2(255 BYTE)
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
    AccountableEntity INT REFERENCES ACCOUNTABLEENTITY(ID),
    Tax INT REFERENCES TAX_LIST(ID)
);
CREATE TABLE FullFlightLeg_list (
    AircraftType VARCHAR2(255 BYTE),
    AircraftRegistrationReference VARCHAR2(255 BYTE)
);
CREATE TABLE FullFlightLeg (
    FullFlightLeg INT REFERENCES FULLFLIGHTLEG_LIST(ID)
);
CREATE TABLE FullFlightLegs (
    FullFlightLeg INT REFERENCES FULLFLIGHTLEG(ID)
);
CREATE TABLE FullFlightInformation (
    FlightDepartureDateTime VARCHAR2(255 BYTE),
    FlightDepartureAirportCode VARCHAR2(255 BYTE),
    FlightArrivalDateTime VARCHAR2(255 BYTE),
    FlightArrivalAirportCode VARCHAR2(255 BYTE),
    FullFlightLegs INT REFERENCES FULLFLIGHTLEGS(ID)
);
CREATE TABLE MarketingFlightNumber (
    FlightNumber VARCHAR2(255 BYTE)
);
CREATE TABLE OperatingFlightNumber (
    FlightNumber VARCHAR2(255 BYTE)
);
CREATE TABLE FlightIdentification (
    OperatingFlightNumber INT REFERENCES OPERATINGFLIGHTNUMBER(ID),
    MarketingFlightNumber INT REFERENCES MARKETINGFLIGHTNUMBER(ID)
);
CREATE TABLE CompanyDetails (
    MarketingCarrier VARCHAR2(255 BYTE),
    OperatingCarrier VARCHAR2(255 BYTE)
);
CREATE TABLE ClassDetails (
    BookingClass VARCHAR2(255 BYTE),
    OperatingCabinClass VARCHAR2(255 BYTE),
    MarketingCabinClass VARCHAR2(255 BYTE)
);
CREATE TABLE FOP (
    FOP INT REFERENCES FOP(ID),
    Type VARCHAR2(255 BYTE),
    TicketedType VARCHAR2(255 BYTE),
    CompleteFOP VARCHAR2(255 BYTE),
    AccountableEntity INT REFERENCES ACCOUNTABLEENTITY(ID)
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
    ClassDetails INT REFERENCES CLASSDETAILS(ID),
    CompanyDetails INT REFERENCES COMPANYDETAILS(ID),
    FlightIdentification INT REFERENCES FLIGHTIDENTIFICATION(ID),
    FullFlightInformation INT REFERENCES FULLFLIGHTINFORMATION(ID)
);
CREATE TABLE ExchangeBalanceCouponLevel (
    Amount INT REFERENCES AMOUNT(ID)
);
CREATE TABLE BaggageAllowance (
    Quantity VARCHAR2(255 BYTE),
    WeightUnit VARCHAR2(255 BYTE)
);
CREATE TABLE ProratedValue_list (
    ProrationSource VARCHAR2(255 BYTE),
    ProrationCode VARCHAR2(255 BYTE),
    AccountableEntity INT REFERENCES ACCOUNTABLEENTITY(ID)
);
CREATE TABLE ProratedValue (
    ProratedValue INT REFERENCES PRORATEDVALUE_LIST(ID)
);
CREATE TABLE ProratedValues (
    ProratedValue INT REFERENCES PRORATEDVALUE(ID)
);
CREATE TABLE ProrationDetails (
    TicketedPointMileage VARCHAR2(255 BYTE),
    ProrateFactor VARCHAR2(255 BYTE),
    ProratedValues INT REFERENCES PRORATEDVALUES(ID)
);
CREATE TABLE CouponStandardCommission (
    Commission INT REFERENCES COMMISSION(ID)
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
    AccountableEntity INT REFERENCES ACCOUNTABLEENTITY(ID)
);
CREATE TABLE InterlineableTaxes (
    Tax INT REFERENCES TAX(ID)
);
CREATE TABLE TaxJustification (
    Category VARCHAR2(255 BYTE),
    SubCategory VARCHAR2(255 BYTE)
);
CREATE TABLE RemittanceTaxCalculatedValues (
    AccountableEntity INT REFERENCES ACCOUNTABLEENTITY(ID),
    TaxJustification INT REFERENCES TAXJUSTIFICATION(ID)
);
CREATE TABLE RemittanceTaxCpnLvl_list (
    Tax INT REFERENCES TAX(ID),
    RemittanceTaxCalculatedValues INT REFERENCES REMITTANCETAXCALCULATEDVALUES(ID)
);
CREATE TABLE RemittanceTaxCpnLvl (
    RemittanceTaxCpnLvl INT REFERENCES REMITTANCETAXCPNLVL_LIST(ID)
);
CREATE TABLE RemittanceTaxesCpnLvl (
    RemittanceTaxCpnLvl INT REFERENCES REMITTANCETAXCPNLVL(ID)
);
CREATE TABLE CouponTaxes (
    RemittanceTaxesCpnLvl INT REFERENCES REMITTANCETAXESCPNLVL(ID),
    InterlineableTaxes INT REFERENCES INTERLINEABLETAXES(ID)
);
CREATE TABLE AmountType (
);
CREATE TABLE CouponProratedFare (
    ProrationSource VARCHAR2(255 BYTE),
    AccountableEntity INT REFERENCES ACCOUNTABLEENTITY(ID)
);
CREATE TABLE CalculatedAmounts (
    CouponProratedFare INT REFERENCES COUPONPRORATEDFARE(ID),
    CouponTaxes INT REFERENCES COUPONTAXES(ID),
    CouponStandardCommission INT REFERENCES COUPONSTANDARDCOMMISSION(ID)
);
CREATE TABLE CouponDetails (
    SAC VARCHAR2(255 BYTE),
    FareBasisCode VARCHAR2(255 BYTE)
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
    ClassDetails INT REFERENCES CLASSDETAILS(ID),
    CompanyDetails INT REFERENCES COMPANYDETAILS(ID),
    FlightIdentification INT REFERENCES FLIGHTIDENTIFICATION(ID),
    FullFlightInformation INT REFERENCES FULLFLIGHTINFORMATION(ID)
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
    SegmentInfo INT REFERENCES SEGMENTINFO(ID),
    CouponDetails INT REFERENCES COUPONDETAILS(ID),
    CalculatedAmounts INT REFERENCES CALCULATEDAMOUNTS(ID),
    ProrationDetails INT REFERENCES PRORATIONDETAILS(ID),
    BaggageAllowance INT REFERENCES BAGGAGEALLOWANCE(ID),
    ExchangeBalanceCouponLevel INT REFERENCES EXCHANGEBALANCECOUPONLEVEL(ID),
    SoldFlightDetails INT REFERENCES SOLDFLIGHTDETAILS(ID)
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
    ReportingMonthNumber VARCHAR2(255 BYTE)
);
CREATE TABLE EffectiveCommission (
    Commission INT REFERENCES COMMISSION(ID)
);
CREATE TABLE SupplementaryCommission (
    Commission INT REFERENCES COMMISSION(ID)
);
CREATE TABLE StandardCommission (
    Commission INT REFERENCES COMMISSION(ID)
);
CREATE TABLE Fare_list (
    FareDescription VARCHAR2(255 BYTE),
    AccountableEntity INT REFERENCES ACCOUNTABLEENTITY(ID)
);
CREATE TABLE Fare (
    Fare INT REFERENCES FARE_LIST(ID)
);
CREATE TABLE Fares (
    Fare INT REFERENCES FARE(ID)
);
CREATE TABLE RelatedCoupon (
    CouponNumber VARCHAR2(255 BYTE)
);
CREATE TABLE FareComponent (
    FareComponentNumber VARCHAR2(255 BYTE),
    FareComponentOrigin VARCHAR2(255 BYTE),
    FareComponentDestination VARCHAR2(255 BYTE),
    FareComponentAmount VARCHAR2(255 BYTE),
    FareComponentCurrency VARCHAR2(255 BYTE),
    RelatedCoupon INT REFERENCES RELATEDCOUPON(ID)
);
CREATE TABLE RevenueAttributableAgent (
    AgencyNumber VARCHAR2(255 BYTE),
    CityCode VARCHAR2(255 BYTE),
    AgencyType VARCHAR2(255 BYTE)
);
CREATE TABLE TotalDocumentAmount (
    Amount INT REFERENCES AMOUNT(ID)
);
CREATE TABLE RemittanceAmount (
    Amount INT REFERENCES AMOUNT(ID)
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
    RemittanceAmount INT REFERENCES REMITTANCEAMOUNT(ID),
    TotalDocumentAmount INT REFERENCES TOTALDOCUMENTAMOUNT(ID),
    RevenueAttributableAgent INT REFERENCES REVENUEATTRIBUTABLEAGENT(ID),
    FareComponent INT REFERENCES FARECOMPONENT(ID),
    TKMI VARCHAR2(255 BYTE)
);
CREATE TABLE TODC (
    OriginCityCode VARCHAR2(255 BYTE),
    OriginCityCodeRealItinerary VARCHAR2(255 BYTE),
    DestinationCityCode VARCHAR2(255 BYTE),
    DestinationCityCodeRealItinerary VARCHAR2(255 BYTE)
);
CREATE TABLE ItineraryDetails (
    RoutingType VARCHAR2(255 BYTE),
    OneWayIndicator VARCHAR2(255 BYTE),
    FinalDestination VARCHAR2(255 BYTE),
    TODC INT REFERENCES TODC(ID)
);
CREATE TABLE PassengerInformation (
    Surname VARCHAR2(255 BYTE),
    FirstName VARCHAR2(255 BYTE),
    PassengerTypeCode VARCHAR2(255 BYTE),
    FarePassengerTypeCode VARCHAR2(255 BYTE),
    DateOfBirth VARCHAR2(255 BYTE),
    IsStaff VARCHAR2(255 BYTE)
);
CREATE TABLE OriginalIssueInfo (
    PrimaryDocumentNbr VARCHAR2(255 BYTE),
    IssuanceLocalDate VARCHAR2(255 BYTE),
    IataNumber VARCHAR2(255 BYTE),
    CityCode VARCHAR2(255 BYTE)
);
CREATE TABLE ExchangedCoupons (
    ConjunctiveCouponNbr VARCHAR2(255 BYTE),
    ConjunctiveDocumentNbr VARCHAR2(255 BYTE),
    Status VARCHAR2(255 BYTE),
    InvoluntaryIndicator VARCHAR2(255 BYTE)
);
CREATE TABLE IssuedInExchangeFor (
    PrimaryDocumentNbr VARCHAR2(255 BYTE),
    IssuanceLocalDate VARCHAR2(255 BYTE),
    ExchangedCoupons INT REFERENCES EXCHANGEDCOUPONS(ID),
    FOP INT REFERENCES FOP(ID)
);
CREATE TABLE BookingAgencyDetails (
    IataNumber VARCHAR2(255 BYTE),
    OfficeId VARCHAR2(255 BYTE),
    AgentSine VARCHAR2(255 BYTE)
);
CREATE TABLE OriginalRecordLocator (
    CompanyCode VARCHAR2(255 BYTE),
    ID VARCHAR2(255 BYTE)
);
CREATE TABLE AmadeusRecordLocator (
    CompanyCode VARCHAR2(255 BYTE),
    ID VARCHAR2(255 BYTE)
);
CREATE TABLE PNRIdentification (
    AmadeusRecordLocator INT REFERENCES AMADEUSRECORDLOCATOR(ID),
    OriginalRecordLocator INT REFERENCES ORIGINALRECORDLOCATOR(ID)
);
CREATE TABLE BookingInformation (
    PNRIdentification INT REFERENCES PNRIDENTIFICATION(ID),
    BookingAgencyDetails INT REFERENCES BOOKINGAGENCYDETAILS(ID)
);
CREATE TABLE IssuanceDetails (
    CityPOS VARCHAR2(255 BYTE),
    IssuerSystem VARCHAR2(255 BYTE),
    Channel VARCHAR2(255 BYTE),
    Iata VARCHAR2(255 BYTE),
    OfficeId VARCHAR2(255 BYTE),
    CountryCodeOfIssue VARCHAR2(255 BYTE),
    SASI VARCHAR2(255 BYTE),
    AgentSign VARCHAR2(255 BYTE)
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
    IssuanceDetails INT REFERENCES ISSUANCEDETAILS(ID),
    BookingInformation INT REFERENCES BOOKINGINFORMATION(ID),
    IssuedInExchangeFor INT REFERENCES ISSUEDINEXCHANGEFOR(ID),
    OriginalIssueInfo INT REFERENCES ORIGINALISSUEINFO(ID),
    PassengerInformation INT REFERENCES PASSENGERINFORMATION(ID),
    ItineraryDetails INT REFERENCES ITINERARYDETAILS(ID),
    PricingDetails INT REFERENCES PRICINGDETAILS(ID),
    Fares INT REFERENCES FARES(ID),
    StandardCommission INT REFERENCES STANDARDCOMMISSION(ID),
    SupplementaryCommission INT REFERENCES SUPPLEMENTARYCOMMISSION(ID),
    EffectiveCommission INT REFERENCES EFFECTIVECOMMISSION(ID),
    ReportingInformation INT REFERENCES REPORTINGINFORMATION(ID),
    Coupon INT REFERENCES COUPON(ID)
);
CREATE TABLE SubAction (
    Description VARCHAR2(255 BYTE)
);
CREATE TABLE Action_list (
    Actor VARCHAR2(255 BYTE),
    ActionDetail VARCHAR2(255 BYTE),
    SubAction INT REFERENCES SUBACTION(ID)
);
CREATE TABLE Action (
    Action INT REFERENCES ACTION_LIST(ID)
);
CREATE TABLE ModifiedEntities_list (
    ElementType VARCHAR2(255 BYTE),
    Action INT REFERENCES ACTION(ID)
);
CREATE TABLE ModifiedEntities (
    ModifiedEntities INT REFERENCES MODIFIEDENTITIES_LIST(ID)
);
CREATE TABLE Usecase (
    UsecaseType VARCHAR2(255 BYTE),
    ModifiedEntities INT REFERENCES MODIFIEDENTITIES(ID)
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
    Usecase INT REFERENCES USECASE(ID)
);
CREATE TABLE Transaction (
    Event INT REFERENCES EVENT(ID),
    Document INT REFERENCES DOCUMENT(ID)
);
CREATE TABLE main (
    Transaction INT REFERENCES TRANSACTION(ID)
)