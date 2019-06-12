Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A891B42A2C
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Jun 2019 17:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407148AbfFLPCM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Jun 2019 11:02:12 -0400
Received: from mail-eopbgr690135.outbound.protection.outlook.com ([40.107.69.135]:28719
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2407156AbfFLPCM (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Jun 2019 11:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sY91n2gfH7ELNe0tEiB3wb8cFi0Ou6TTCX3TC4csU8g=;
 b=MjnrJWbgYaLdZOJ/0j9RBsmgiXzc7vJI8VODsHv+4b5Kl7vo7BuwcPi25BL6EVMlu1DC7e6WBoUMQif/PJ1lDnOHITWWc6ItMhB9L3JAA8ohNKQ8WtKG5UCQV9euO9T+aww3Hmqd0X1beSsCDKQHVp9US3TjxNwtedP7xPP6ZNg=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5555.namprd07.prod.outlook.com (20.177.242.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Wed, 12 Jun 2019 15:02:06 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 15:02:06 +0000
From:   Ken Sloat <KSloat@aampglobal.com>
To:     "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>
CC:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Ken Sloat <KSloat@aampglobal.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable watchdog
 on system suspend
Thread-Topic: [PATCH v1 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Thread-Index: AQHVIS/MMKNdMTqzC02O6HgdHPA8iA==
Date:   Wed, 12 Jun 2019 15:02:05 +0000
Message-ID: <20190612150154.16778-1-ksloat@aampglobal.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [100.3.71.115]
x-clientproxiedby: BN6PR11CA0065.namprd11.prod.outlook.com
 (2603:10b6:404:f7::27) To BL0PR07MB4115.namprd07.prod.outlook.com
 (2603:10b6:207:4c::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74876760-2732-4621-1172-08d6ef46eedb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BL0PR07MB5555;
x-ms-traffictypediagnostic: BL0PR07MB5555:
x-microsoft-antispam-prvs: <BL0PR07MB55551D75AC67AD69AECE387FADEC0@BL0PR07MB5555.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(136003)(366004)(346002)(396003)(376002)(189003)(199004)(2616005)(50226002)(80792005)(25786009)(73956011)(6916009)(186003)(86362001)(6506007)(486006)(15650500001)(478600001)(54906003)(476003)(386003)(4326008)(53936002)(256004)(102836004)(26005)(1076003)(66946007)(66476007)(66556008)(64756008)(66446008)(14444005)(5660300002)(72206003)(8676002)(2351001)(6436002)(6512007)(68736007)(52116002)(66066001)(3846002)(36756003)(99286004)(316002)(305945005)(8936002)(2906002)(7736002)(71200400001)(5640700003)(14454004)(6486002)(81166006)(2501003)(71190400001)(81156014)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR07MB5555;H:BL0PR07MB4115.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3aG4yUbVaHbPcLxmuKXLGisxqILGlaVSpGI3cHHHE6phpkoCF8XAQrc0YUffq6/OLusB/IvbC4Ytip9BK2EFsEVkhxMdhd3ZGxz661xs+dzUS/uxk6k6Dc3xTOnpXeeIlbYr4Z6wexxYratFYuHIrggd2W6tHZ3gDcwexyabWJ3FVnPhVaz/x0FgkSYY73Yup1xE0ncs3fm8UjN132dypByDgGech3g7zHFdadZ0fGfE/v/xGjeoAfSXSYEZQUb34m3PC1FQUEsqiIudskfSiztGKWyTteGpMkB8MCrrDcM37yyJ8LyUBIQljRWuEgV3PWZVHdwn7TaVMrV89cNUGfdokjKaOn+Zds0xSBHq+yJ5rB4hpqFYMySxZJkHK22BS4jgqzeGtqKj8Gh2nru1frJjiGQgnp/cuKDP/pzsgvQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74876760-2732-4621-1172-08d6ef46eedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 15:02:06.2951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5555
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 06
X-MS-Exchange-CrossPremises-AuthSource: BL0PR07MB4115.namprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-TransportTrafficSubType: 
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-mapi-admin-submission: 
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 100.3.71.115
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-transporttrafficsubtype: 
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: BL0PR07MB5555.namprd07.prod.outlook.com
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogS2VuIFNsb2F0IDxrc2xvYXRAYWFtcGdsb2JhbC5jb20+DQoNCkN1cnJlbnRseSwgdGhl
IGF0bWVsLXNhbWE1ZDQtd2R0IGNvbnRpbnVlcyB0byBydW4gYWZ0ZXIgc3lzdGVtIHN1c3BlbmQu
DQpVbmxlc3MgdGhlIHN5c3RlbSByZXN1bWVzIHdpdGhpbiB0aGUgd2F0Y2hkb2cgdGltZW91dCBw
ZXJpb2Qgc28gdGhlDQp1c2Vyc3BhY2UgY2FuIGtpY2sgaXQsIHRoZSBzeXN0ZW0gd2lsbCBiZSBy
ZXNldC4gVGhpcyBjaGFuZ2UgZGlzYWJsZXMNCnRoZSB3YXRjaGRvZyBvbiBzdXNwZW5kIGlmIGl0
IGlzIGFjdGl2ZSBhbmQgcmUtZW5hYmxlcyBvbiByZXN1bWUuIFRoZXNlDQphY3Rpb25zIG9jY3Vy
IGR1cmluZyB0aGUgbGF0ZSBhbmQgZWFybHkgcGhhc2VzIG9mIHN1c3BlbmQgYW5kIHJlc3VtZQ0K
cmVzcGVjdGl2ZWx5IHRvIG1pbmltaXplIGNoYW5jZXMgd2hlcmUgYSBsb2NrIGNvdWxkIG9jY3Vy
IHdoaWxlIHRoZQ0Kd2F0Y2hkb2cgaXMgZGlzYWJsZWQuDQoNClNpZ25lZC1vZmYtYnk6IEtlbiBT
bG9hdCA8a3Nsb2F0QGFhbXBnbG9iYWwuY29tPg0KLS0tDQogZHJpdmVycy93YXRjaGRvZy9zYW1h
NWQ0X3dkdC5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0
X3dkdC5jDQppbmRleCAxMTE2OTUyMjNhYWUuLjg0ZWI0ZGIyMzk5MyAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvd2F0Y2hkb2cvc2FtYTVkNF93ZHQuYw0KKysrIGIvZHJpdmVycy93YXRjaGRvZy9zYW1h
NWQ0X3dkdC5jDQpAQCAtMjgwLDYgKzI4MCwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBzYW1hNWQ0X3dkdF9vZl9tYXRjaFtdID0gew0KIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIHNhbWE1ZDRfd2R0X29mX21hdGNoKTsNCiANCiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQor
c3RhdGljIGludCBzYW1hNWQ0X3dkdF9zdXNwZW5kX2xhdGUoc3RydWN0IGRldmljZSAqZGV2KQ0K
K3sNCisJc3RydWN0IHNhbWE1ZDRfd2R0ICp3ZHQ7DQorDQorCXdkdCA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOw0KKw0KKwlpZiAod2F0Y2hkb2dfYWN0aXZlKCZ3ZHQtPndkZCkpDQorCQlzYW1hNWQ0
X3dkdF9zdG9wKCZ3ZHQtPndkZCk7DQorDQorCXJldHVybiAwOw0KK30NCisNCiBzdGF0aWMgaW50
IHNhbWE1ZDRfd2R0X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KIAlzdHJ1Y3Qgc2Ft
YTVkNF93ZHQgKndkdCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KQEAgLTI5MywxMCArMzA1LDI1
IEBAIHN0YXRpYyBpbnQgc2FtYTVkNF93ZHRfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCiAN
CiAJcmV0dXJuIDA7DQogfQ0KKw0KK3N0YXRpYyBpbnQgc2FtYTVkNF93ZHRfcmVzdW1lX2Vhcmx5
KHN0cnVjdCBkZXZpY2UgKmRldikNCit7DQorCXN0cnVjdCBzYW1hNWQ0X3dkdCAqd2R0Ow0KKw0K
Kwl3ZHQgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCisNCisJaWYgKHdhdGNoZG9nX2FjdGl2ZSgm
d2R0LT53ZGQpKQ0KKwkJc2FtYTVkNF93ZHRfc3RhcnQoJndkdC0+d2RkKTsNCisNCisJcmV0dXJu
IDA7DQorfQ0KICNlbmRpZg0KIA0KLXN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhzYW1hNWQ0X3dk
dF9wbV9vcHMsIE5VTEwsDQotCQkJIHNhbWE1ZDRfd2R0X3Jlc3VtZSk7DQorc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZfcG1fb3BzIHNhbWE1ZDRfd2R0X3BtX29wcyA9IHsNCisJU0VUX1NZU1RFTV9T
TEVFUF9QTV9PUFMoTlVMTCwgc2FtYTVkNF93ZHRfcmVzdW1lKQ0KKwlTRVRfTEFURV9TWVNURU1f
U0xFRVBfUE1fT1BTKHNhbWE1ZDRfd2R0X3N1c3BlbmRfbGF0ZSwNCisJCQlzYW1hNWQ0X3dkdF9y
ZXN1bWVfZWFybHkpDQorfTsNCiANCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzYW1h
NWQ0X3dkdF9kcml2ZXIgPSB7DQogCS5wcm9iZQkJPSBzYW1hNWQ0X3dkdF9wcm9iZSwNCi0tIA0K
Mi4xNy4xDQoNCg==
