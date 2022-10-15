class ServiceAgreementMask {
  ServiceAgreementMask({
    this.serviceAgreementID,
    this.serviceAgreementMaskID,
    this.serviceAgreementType,
    this.serviceAgreementCommodity,
    this.serviceAgreementStatus,
    this.revenueClassCode,
    this.revenueClassDesc,
    this.streetAddress1,
    this.city,
    this.zip,
    this.accountID,
    this.accountMaskID,
  });

  factory ServiceAgreementMask.fromJson(Map<String, dynamic> json) {
    return ServiceAgreementMask(
      serviceAgreementID: json['ServiceAgreementID'] as String?,
      serviceAgreementMaskID: json['ServiceAgreementMaskID'] as String?,
      serviceAgreementType: json['ServiceAgreementType'] as String?,
      serviceAgreementCommodity: json['ServiceAgreementCommodity'] as String?,
      serviceAgreementStatus: json['ServiceAgreementStatus'] as String?,
      revenueClassCode: json['RevenueClassCode'] as String?,
      revenueClassDesc: json['RevenueClassDesc'] as String?,
      streetAddress1: json['StreetAddress1'] as String?,
      city: json['City'] as String?,
      zip: json['Zip'] as String?,
      accountID: json['AccountID'] as String?,
      accountMaskID: json['AccountMaskID'] as String?,
    );
  }
  String? serviceAgreementID;
  String? serviceAgreementMaskID;
  String? serviceAgreementType;
  String? serviceAgreementCommodity;
  String? serviceAgreementStatus;
  String? revenueClassCode;
  String? revenueClassDesc;
  String? streetAddress1;
  String? city;
  String? zip;
  String? accountID;
  String? accountMaskID;
}
