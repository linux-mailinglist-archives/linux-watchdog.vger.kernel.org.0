Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2FE55133
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Jun 2019 16:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728155AbfFYOLQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 Jun 2019 10:11:16 -0400
Received: from mail-eopbgr30071.outbound.protection.outlook.com ([40.107.3.71]:54798
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726532AbfFYOLP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 Jun 2019 10:11:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=ZTnUaj7tnqHpWsIyRs8y/yXSArDjwxyKHFFQURwoYPWsDFCJ8BA0bORgvWetDL3SU4PQQGI1gV7OdJKjd0092uF8jnfl6O9u4F8Uwq8tg3V3/l3CpfDX1iykqBH0+t7YwRPGW6MAzCULkixFbIOe3lJXMU5pTfMupE3zp22YBMs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=licgEvuWqSKKRsnZwwdFp8zA58TFSt8Dggk/QNsUy8g=;
 b=ezCvpK9wkAVG62h8elUScqIby7hPrje4v5TN1ods3V28fCKf2vQDXfT2jmwbhB90S/4/V5mCE9m+7Ov86eclUUZo4mBgHTCZm20ZSU3jihaXQ6EF2q/K8TgPBVi/7/nB66zKSRtCyxBOuy/l7NV/HMDQibKugaYiX/P6Eb+sLpw=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=licgEvuWqSKKRsnZwwdFp8zA58TFSt8Dggk/QNsUy8g=;
 b=fTv1c/bkqBVgGsejLn1mE6yEI1zud1aleBJIJ5bxQinVCGW8X0uDTD5r3wdK1HTDiAhGTRUTu89yuvuv4cFmPmqmi59pZj9fUwCD1YVIK0rY1uyJm61IXSzJdMuh38wpakX8XzUmqmH9yZxRdBZ66ZKoTFMc0LolEmXHgVKlPR0=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB6001.eurprd06.prod.outlook.com (20.178.112.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 14:11:12 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::5590:e3b3:5416:e9eb]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::5590:e3b3:5416:e9eb%5]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 14:11:11 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH] watchdog: cadence: Support all available prescaler values
Thread-Topic: [PATCH] watchdog: cadence: Support all available prescaler
 values
Thread-Index: AQHVK1/XA87KPv3AR0aVKfsrVv0YIA==
Date:   Tue, 25 Jun 2019 14:11:11 +0000
Message-ID: <20190625141048.99479-1-tomas.melin@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::17) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.2
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18dd0b3c-04e6-473d-7168-08d6f976fa05
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB6001;
x-ms-traffictypediagnostic: AM0PR06MB6001:
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-microsoft-antispam-prvs: <AM0PR06MB600186B29E310E0E70EE4400FDE30@AM0PR06MB6001.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39850400004)(366004)(346002)(376002)(136003)(189003)(199004)(66066001)(71190400001)(71200400001)(99286004)(52116002)(2906002)(5660300002)(36756003)(14454004)(256004)(305945005)(7736002)(2501003)(316002)(107886003)(50226002)(66946007)(478600001)(8936002)(81156014)(81166006)(3846002)(68736007)(25786009)(2616005)(66556008)(4326008)(66476007)(64756008)(110136005)(66446008)(54906003)(6486002)(73956011)(53936002)(102836004)(8676002)(486006)(26005)(1076003)(386003)(6506007)(186003)(86362001)(476003)(6436002)(6116002)(6512007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB6001;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3ld5uJMaokSprDQnNPL8/MHuXE85vgIP3RaX+glWnwWOnoK3RVVO37hBO1QOSljBe0Efz2DySf1j6+GccT8fFBsa+Yrfv4CESXCaGuArcwvfdQSNOhdaWDnxmeC3JPx5X8EycfsoeBDox2LQExeAfHYL3tgC1CuNBB+jXLUARf2OQQrAFH0PNdnLMXe1JNyDKmQxdEZSbD4bvjAgnaTDRGFey2E7SPHO5csIw3ldPK1Q2lBRTWjsXSXbOs9zhjR7fKRrKt06VWJ+j7O2JUc7wltGfB4uNuRHFdJRCKOW4wBtuGTWxnmGE+DSNrmM7Aq+PF+9udv13Z4HR+iQRSlJDaIr6awzStM3nWexFDSIOFH446p8DQCp93eVXi4hlZ9bV1lOocZ/WJJzyw3C+t+Pg9fRzhfJ5G+Pt9kkrlPGsco=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dd0b3c-04e6-473d-7168-08d6f976fa05
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 14:11:11.9229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6001
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Q2FkZW5jZSB3YXRjaGRvZyBIVyBzdXBwb3J0cyBwcmVzY2FsZXIgdmFsdWVzIG9mDQo4LCA2NCwg
NTEyIGFuZCA0MDk2LiBGb3IgbG93IGZyZXF1ZW5jeSBpbnB1dCBjbG9ja3MsIHRoZSBzbWFsbGVy
DQpwcmVzY2FsZXIgdmFsdWVzIGFyZSBwcmVmZXJyYWJsZSB0byBpbXByb3ZlIHRoZSBncmFudWxh
cml0eSBhbmQNCmV4dGVuZCB0aGUgdGltZW91dCByYW5nZSB0b3dhcmRzIHRoZSBsb3dlciBlbmQu
DQoNClByZXNjYWxlciBsb2dpYyBpcyBleHRlbmRlZCB0byBzdXBwb3J0IHRpbWVvdXQgdmFsdWVz
IFsxcyAtIDQwOTVzXSwNCndpdGggcHJlc2NhbGVyIHNlbGVjdGVkIGJhc2VkIG9uIGlucHV0IGNs
b2NrIGZyZXF1ZW5jeS4NCkZvciBjbG9jayBmcmVxdWVuY2llcyBoaWdoZXIgdGhhbiB+MiBNSHos
IHRoZSBsYXJnZXN0IHByZXNjYWxlcg0KdmFsdWUgaXMgdXNlZC4NCg0KU2lnbmVkLW9mZi1ieTog
VG9tYXMgTWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KLS0tDQogZHJpdmVycy93YXRj
aGRvZy9jYWRlbmNlX3dkdC5jIHwgMTUgKysrKysrKysrKystLS0tDQogMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3dhdGNoZG9nL2NhZGVuY2Vfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL2NhZGVuY2Vfd2R0LmMN
CmluZGV4IGMzOTI0MzU2ZDE3My4uNjUxOTExODNlY2Q4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy93
YXRjaGRvZy9jYWRlbmNlX3dkdC5jDQorKysgYi9kcml2ZXJzL3dhdGNoZG9nL2NhZGVuY2Vfd2R0
LmMNCkBAIC0zMiwxNiArMzIsMTcgQEANCiAjZGVmaW5lIENETlNfV0RUX0NPVU5URVJfVkFMVUVf
RElWSVNPUiAweDEwMDANCiANCiAvKiBDbG9jayBwcmVzY2FsZXIgdmFsdWUgYW5kIHNlbGVjdGlv
biAqLw0KKyNkZWZpbmUgQ0ROU19XRFRfUFJFU0NBTEVfOAk4DQogI2RlZmluZSBDRE5TX1dEVF9Q
UkVTQ0FMRV82NAk2NA0KICNkZWZpbmUgQ0ROU19XRFRfUFJFU0NBTEVfNTEyCTUxMg0KICNkZWZp
bmUgQ0ROU19XRFRfUFJFU0NBTEVfNDA5Ngk0MDk2DQorI2RlZmluZSBDRE5TX1dEVF9QUkVTQ0FM
RV9TRUxFQ1RfOAkwDQogI2RlZmluZSBDRE5TX1dEVF9QUkVTQ0FMRV9TRUxFQ1RfNjQJMQ0KICNk
ZWZpbmUgQ0ROU19XRFRfUFJFU0NBTEVfU0VMRUNUXzUxMgkyDQogI2RlZmluZSBDRE5TX1dEVF9Q
UkVTQ0FMRV9TRUxFQ1RfNDA5NgkzDQogDQotLyogSW5wdXQgY2xvY2sgZnJlcXVlbmN5ICovDQot
I2RlZmluZSBDRE5TX1dEVF9DTEtfMTBNSFoJMTAwMDAwMDANCi0jZGVmaW5lIENETlNfV0RUX0NM
S183NU1IWgk3NTAwMDAwMA0KKy8qIEJhc2UgaW5wdXQgY2xvY2sgZnJlcXVlbmN5ICovDQorI2Rl
ZmluZSBDRE5TX1dEVF9DTEtfMzJLSFoJMzI3NjgNCiANCiAvKiBDb3VudGVyIG1heGltdW0gdmFs
dWUgKi8NCiAjZGVmaW5lIENETlNfV0RUX0NPVU5URVJfTUFYIDB4RkZGDQpAQCAtMzQ4LDcgKzM0
OSwxMyBAQCBzdGF0aWMgaW50IGNkbnNfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQogCX0NCiANCiAJY2xvY2tfZiA9IGNsa19nZXRfcmF0ZSh3ZHQtPmNsayk7DQotCWlm
IChjbG9ja19mIDw9IENETlNfV0RUX0NMS183NU1IWikgew0KKwlpZiAoY2xvY2tfZiA8PSBDRE5T
X1dEVF9DTEtfMzJLSFopIHsNCisJCXdkdC0+cHJlc2NhbGVyID0gQ0ROU19XRFRfUFJFU0NBTEVf
ODsNCisJCXdkdC0+Y3RybF9jbGtzZWwgPSBDRE5TX1dEVF9QUkVTQ0FMRV9TRUxFQ1RfODsNCisJ
fSBlbHNlIGlmIChjbG9ja19mIDw9IENETlNfV0RUX0NMS18zMktIWiAqIENETlNfV0RUX1BSRVND
QUxFXzgpIHsNCisJCXdkdC0+cHJlc2NhbGVyID0gQ0ROU19XRFRfUFJFU0NBTEVfNjQ7DQorCQl3
ZHQtPmN0cmxfY2xrc2VsID0gQ0ROU19XRFRfUFJFU0NBTEVfU0VMRUNUXzY0Ow0KKwl9IGVsc2Ug
aWYgKGNsb2NrX2YgPD0gQ0ROU19XRFRfQ0xLXzMyS0haICogQ0ROU19XRFRfUFJFU0NBTEVfNjQp
IHsNCiAJCXdkdC0+cHJlc2NhbGVyID0gQ0ROU19XRFRfUFJFU0NBTEVfNTEyOw0KIAkJd2R0LT5j
dHJsX2Nsa3NlbCA9IENETlNfV0RUX1BSRVNDQUxFX1NFTEVDVF81MTI7DQogCX0gZWxzZSB7DQot
LSANCjIuMTcuMg0KDQo=
