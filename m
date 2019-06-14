Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF6E45D2B
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2019 14:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbfFNMx3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Jun 2019 08:53:29 -0400
Received: from mail-eopbgr730119.outbound.protection.outlook.com ([40.107.73.119]:6334
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726874AbfFNMx2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Jun 2019 08:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrLeNhTOMV/5b5VUsNtYNMV9IHI5LroPmp/odYruiOA=;
 b=FtuccU556ayc6hnWqXgj/B1T8KdfPMsuV7CpbFJlsRDTPv4i5pcvnCaoVNqyFYDnokx6UaeTOBPqoDjNilSmtiGbaL9Ed+n9D76Ihyf+WWc1RPFxozvNjIIzD06s3vz+Vs/8shlCROG2c/pdufoGMM/8Rib5dnI2Eghcp8MAbuE=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5713.namprd07.prod.outlook.com (20.177.243.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Fri, 14 Jun 2019 12:53:22 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1965.019; Fri, 14 Jun 2019
 12:53:22 +0000
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
Subject: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable watchdog
 on system suspend
Thread-Topic: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Thread-Index: AQHVIrAmpSe7ef5LPkq+gtVGV8yaCA==
Date:   Fri, 14 Jun 2019 12:53:22 +0000
Message-ID: <20190614125310.29458-1-ksloat@aampglobal.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [100.3.71.115]
x-clientproxiedby: BN6PR2001CA0008.namprd20.prod.outlook.com
 (2603:10b6:404:b4::18) To BL0PR07MB4115.namprd07.prod.outlook.com
 (2603:10b6:207:4c::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: defbe8bb-55e7-4ea6-771c-08d6f0c7484e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BL0PR07MB5713;
x-ms-traffictypediagnostic: BL0PR07MB5713:
x-microsoft-antispam-prvs: <BL0PR07MB571385E3D0B3A804456B66F3ADEE0@BL0PR07MB5713.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39850400004)(199004)(189003)(66066001)(305945005)(81166006)(4326008)(6486002)(66946007)(81156014)(80792005)(486006)(8936002)(72206003)(2501003)(7736002)(478600001)(476003)(6916009)(14454004)(2351001)(8676002)(50226002)(2616005)(99286004)(6512007)(68736007)(6436002)(86362001)(15650500001)(66556008)(6116002)(71190400001)(386003)(316002)(66476007)(53936002)(102836004)(3846002)(2906002)(71200400001)(25786009)(5640700003)(36756003)(5660300002)(256004)(1076003)(73956011)(26005)(186003)(66446008)(14444005)(52116002)(64756008)(54906003)(6506007);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR07MB5713;H:BL0PR07MB4115.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tQ3SjGDxPiV0Bm0djYMEuUhQuCYzxUvFDkWyGq0yOeNWanhqqF2ZF5wrQJVhNQYSKUTPUc/vSPA7g7XgPcWDT/A+zBRI/Ylg+pqkdzgqoJsBiw4l9HUtHeo6pR4Osz+HsB2vkB+Z2rhmKw4Mp9XJ6bvRoR0TC1Mj9ssph3nk0bALi7Tyvjs+e5iyYj+Tt9gUGt4d5cGH5d1WBdekUzOu9/r+Ee7NTIzIzBXoyengA/svowvkKqJR/QqxBpwuLK1VADPWIBqNBwAsRQId+D4bNLU0WQKMq9YakeFAjaexDNYatObiX3LjtVg+7LFBKlrCPaVc8UFfSrIWORRKWJC5ySUhy87KCe3Sk8bhAu3cQfT2Yoy0F3tbGIUB8DAQ0Mic9VJrAraGFwg/PgqTMTIGPbIVIq5wSJ369EVvgKAIXcg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defbe8bb-55e7-4ea6-771c-08d6f0c7484e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 12:53:22.6691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5713
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
X-OrganizationHeadersPreserved: BL0PR07MB5713.namprd07.prod.outlook.com
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
bG9hdCA8a3Nsb2F0QGFhbXBnbG9iYWwuY29tPg0KLS0tDQogQ2hhbmdlcyBpbiB2MjoNCiAtQ29u
c29saWRhdGUgcmVzdW1lIGFuZCByZXN1bWUgZWFybHkgc3RhdGVtZW50cy4NCg0KIGRyaXZlcnMv
d2F0Y2hkb2cvc2FtYTVkNF93ZHQuYyB8IDIxICsrKysrKysrKysrKysrKysrKy0tLQ0KIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9zYW1h
NWQ0X3dkdC5jDQppbmRleCAxMTE2OTUyMjNhYWUuLjBkMTIzZjhjYmNjNiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvd2F0Y2hkb2cvc2FtYTVkNF93ZHQuYw0KKysrIGIvZHJpdmVycy93YXRjaGRvZy9z
YW1hNWQ0X3dkdC5jDQpAQCAtMjgwLDcgKzI4MCwxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBzYW1hNWQ0X3dkdF9vZl9tYXRjaFtdID0gew0KIE1PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIHNhbWE1ZDRfd2R0X29mX21hdGNoKTsNCiANCiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQ
DQotc3RhdGljIGludCBzYW1hNWQ0X3dkdF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KK3N0
YXRpYyBpbnQgc2FtYTVkNF93ZHRfc3VzcGVuZF9sYXRlKHN0cnVjdCBkZXZpY2UgKmRldikNCit7
DQorCXN0cnVjdCBzYW1hNWQ0X3dkdCAqd2R0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQorDQor
CWlmICh3YXRjaGRvZ19hY3RpdmUoJndkdC0+d2RkKSkNCisJCXNhbWE1ZDRfd2R0X3N0b3AoJndk
dC0+d2RkKTsNCisNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBpbnQgc2FtYTVkNF93ZHRf
cmVzdW1lX2Vhcmx5KHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQogCXN0cnVjdCBzYW1hNWQ0X3dk
dCAqd2R0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogDQpAQCAtMjkxLDEyICszMDEsMTcgQEAg
c3RhdGljIGludCBzYW1hNWQ0X3dkdF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIAkgKi8N
CiAJc2FtYTVkNF93ZHRfaW5pdCh3ZHQpOw0KIA0KKwlpZiAod2F0Y2hkb2dfYWN0aXZlKCZ3ZHQt
PndkZCkpDQorCQlzYW1hNWQ0X3dkdF9zdGFydCgmd2R0LT53ZGQpOw0KKw0KIAlyZXR1cm4gMDsN
CiB9DQogI2VuZGlmDQogDQotc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHNhbWE1ZDRfd2R0X3Bt
X29wcywgTlVMTCwNCi0JCQkgc2FtYTVkNF93ZHRfcmVzdW1lKTsNCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRldl9wbV9vcHMgc2FtYTVkNF93ZHRfcG1fb3BzID0gew0KKwlTRVRfTEFURV9TWVNURU1f
U0xFRVBfUE1fT1BTKHNhbWE1ZDRfd2R0X3N1c3BlbmRfbGF0ZSwNCisJCQlzYW1hNWQ0X3dkdF9y
ZXN1bWVfZWFybHkpDQorfTsNCiANCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzYW1h
NWQ0X3dkdF9kcml2ZXIgPSB7DQogCS5wcm9iZQkJPSBzYW1hNWQ0X3dkdF9wcm9iZSwNCi0tIA0K
Mi4xNy4xDQoNCg==
