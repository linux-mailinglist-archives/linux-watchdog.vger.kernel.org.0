Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 602BA35EA6
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 16:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbfFEOHA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 10:07:00 -0400
Received: from mail-eopbgr30099.outbound.protection.outlook.com ([40.107.3.99]:52096
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726442AbfFEOHA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 10:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOmbqRprdhOKC9UKClMD8DJWbMbYU8RgxCwhdsb2ExI=;
 b=sfeL0LQRCbwxVcdKDtwi6qxr6Ave63ZYJXFuwrBBozmLcP6BsbBHFx6b6CVSKV5GkLOuQ30Mpfgls2B8RP2nrCOAvzq16Q1XEywItA9NKwyTJ2D8617BdqeofCPyRTibgTUPTrVdGgveDy2bWXmYh44pn6wZgMBUttb6kJE1Ndk=
Received: from VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM (20.178.126.80) by
 VI1PR10MB2382.EURPRD10.PROD.OUTLOOK.COM (20.177.62.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 14:06:52 +0000
Received: from VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8844:426d:816b:f5d5]) by VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8844:426d:816b:f5d5%6]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 14:06:51 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jonathan Corbet <corbet@lwn.net>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Esben Haabendal <esben@haabendal.dk>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Rasmus Villemoes <Rasmus.Villemoes@prevas.se>
Subject: [PATCH v10 2/3] watchdog: introduce CONFIG_WATCHDOG_OPEN_TIMEOUT
Thread-Topic: [PATCH v10 2/3] watchdog: introduce CONFIG_WATCHDOG_OPEN_TIMEOUT
Thread-Index: AQHVG6fnvbmNMtqgXU2ZaYKZCJHrKA==
Date:   Wed, 5 Jun 2019 14:06:43 +0000
Message-ID: <20190605140628.618-3-rasmus.villemoes@prevas.dk>
References: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190605140628.618-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0202CA0034.eurprd02.prod.outlook.com
 (2603:10a6:3:e4::20) To VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8c29bd9-5366-4706-f585-08d6e9bf099c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:VI1PR10MB2382;
x-ms-traffictypediagnostic: VI1PR10MB2382:
x-microsoft-antispam-prvs: <VI1PR10MB2382BECA74FE79B1E9E1F0008A160@VI1PR10MB2382.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(39850400004)(346002)(396003)(136003)(189003)(199004)(43544003)(6436002)(66066001)(76176011)(5660300002)(52116002)(478600001)(107886003)(71200400001)(71190400001)(6486002)(74482002)(3846002)(6116002)(44832011)(72206003)(2501003)(6512007)(54906003)(6666004)(486006)(2906002)(102836004)(73956011)(110136005)(8976002)(6506007)(99286004)(7736002)(386003)(53936002)(64756008)(446003)(316002)(476003)(66946007)(66556008)(81156014)(8676002)(81166006)(66446008)(11346002)(66476007)(4326008)(14454004)(50226002)(25786009)(2616005)(305945005)(26005)(36756003)(68736007)(42882007)(186003)(256004)(8936002)(14444005)(1076003);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR10MB2382;H:VI1PR10MB2639.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qhmKc3aqmsF29MGOHd2j5hy8u1MM5oOB2Iyhn4RrbhWtQUBD6FPekVEGjE6U+v/uCLjE+HJFh43xr8SASR8Mx3eFLsYAz+ddUl3ZPiRIZ4DJfI4WUbln68qkBtJeGPSlcvLxQlXuXL36gQS4HHLyRCM3aXDXt8UYxDH5Juo9AvCHHujV9iWXC1sEKsrN/LFXIGMuVb78xyLm8F4+45Qb80sZIxyzIWGed8BOGvBrl9y5Xa6eFhM7gqeqEB+ChAAW0nZ0tbforAoptKeVCYscWmL6j97+kxPQm3BfwsQt+kflXiLXqfVm6OYmeum2n7QgIOd/1jO8xoyDMzFX6dLUtMPCzpmke2A5IiXBBccf27FqQ4CVtLK8skqIYmKz3mqOltX9a1Xm67cGWaJU90i6FfWDDO7wMzcX4BnYFBBj3tE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c29bd9-5366-4706-f585-08d6e9bf099c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 14:06:43.1668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rasmus.Villemoes@prevas.dk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2382
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhpcyBhbGxvd3Mgc2V0dGluZyBhIGRlZmF1bHQgdmFsdWUgZm9yIHRoZSB3YXRjaGRvZy5vcGVu
X3RpbWVvdXQNCmNvbW1hbmRsaW5lIHBhcmFtZXRlciB2aWEgS2NvbmZpZy4NCg0KU29tZSBCU1Bz
IGFsbG93IHJlbW90ZSB1cGRhdGluZyBvZiB0aGUga2VybmVsIGltYWdlIGFuZCByb290IGZpbGUN
CnN5c3RlbSwgYnV0IHVwZGF0aW5nIHRoZSBib290bG9hZGVyIHJlcXVpcmVzIHBoeXNpY2FsIGFj
Y2Vzcy4gSGVuY2UsIGlmDQpvbmUgaGFzIGEgZmlybXdhcmUgdXBkYXRlIHRoYXQgcmVxdWlyZXMg
cmVsYXhpbmcgdGhlDQp3YXRjaGRvZy5vcGVuX3RpbWVvdXQgYSBsaXR0bGUsIHRoZSB2YWx1ZSB1
c2VkIG11c3QgYmUgYmFrZWQgaW50byB0aGUNCmtlcm5lbCBpbWFnZSBpdHNlbGYgYW5kIGNhbm5v
dCBjb21lIGZyb20gdGhlIHUtYm9vdCBlbnZpcm9ubWVudCB2aWEgdGhlDQprZXJuZWwgY29tbWFu
ZCBsaW5lLg0KDQpCZWluZyBhYmxlIHRvIHNldCB0aGUgaW5pdGlhbCB2YWx1ZSBpbiAuY29uZmln
IGRvZXNuJ3QgY2hhbmdlIHRoZSBmYWN0DQp0aGF0IHRoZSB2YWx1ZSBvbiB0aGUgY29tbWFuZCBs
aW5lLCBpZiBwcmVzZW50LCB0YWtlcyBwcmVjZWRlbmNlLCBhbmQgaXMNCm9mIGNvdXJzZSBpbW1l
bnNlbHkgdXNlZnVsIGZvciBkZXZlbG9wbWVudCBwdXJwb3NlcyB3aGlsZSBvbmUgaGFzDQpjb25z
b2xlIGFjY2Nlc3MsIGFzIHdlbGwgYXMgdXNhYmxlIGluIHRoZSBjYXNlcyB3aGVyZSBvbmUgY2Fu
IG1ha2UgYQ0KcGVybWFuZW50IHVwZGF0ZSBvZiB0aGUga2VybmVsIGNvbW1hbmQgbGluZS4NCg0K
U2lnbmVkLW9mZi1ieTogUmFzbXVzIFZpbGxlbW9lcyA8cmFzbXVzLnZpbGxlbW9lc0BwcmV2YXMu
ZGs+DQotLS0NCiBEb2N1bWVudGF0aW9uL3dhdGNoZG9nL3dhdGNoZG9nLXBhcmFtZXRlcnMudHh0
IHwgOCArKysrLS0tLQ0KIGRyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgfCA5ICsrKysrKysrKw0KIGRyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hkb2dfZGV2LmMgICAg
ICAgICAgICAgICAgfCA1ICsrKy0tDQogMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi93YXRjaGRvZy93
YXRjaGRvZy1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vd2F0Y2hkb2cvd2F0Y2hkb2ct
cGFyYW1ldGVycy50eHQNCmluZGV4IDMyZDM2MDZjYWE2NS4uZWM5MTlkYzg5NWZmIDEwMDY0NA0K
LS0tIGEvRG9jdW1lbnRhdGlvbi93YXRjaGRvZy93YXRjaGRvZy1wYXJhbWV0ZXJzLnR4dA0KKysr
IGIvRG9jdW1lbnRhdGlvbi93YXRjaGRvZy93YXRjaGRvZy1wYXJhbWV0ZXJzLnR4dA0KQEAgLTEx
LDEwICsxMSwxMCBAQCBtb2R1bGVzLg0KIFRoZSB3YXRjaGRvZyBjb3JlIHBhcmFtZXRlciB3YXRj
aGRvZy5vcGVuX3RpbWVvdXQgaXMgdGhlIG1heGltdW0gdGltZSwNCiBpbiBzZWNvbmRzLCBmb3Ig
d2hpY2ggdGhlIHdhdGNoZG9nIGZyYW1ld29yayB3aWxsIHRha2UgY2FyZSBvZiBwaW5naW5nDQog
YSBydW5uaW5nIGhhcmR3YXJlIHdhdGNoZG9nIHVudGlsIHVzZXJzcGFjZSBvcGVucyB0aGUgY29y
cmVzcG9uZGluZw0KLS9kZXYvd2F0Y2hkb2dOIGRldmljZS4gQSB2YWx1ZSBvZiAwICh0aGUgZGVm
YXVsdCkgbWVhbnMgYW4gaW5maW5pdGUNCi10aW1lb3V0LiBTZXR0aW5nIHRoaXMgdG8gYSBub24t
emVybyB2YWx1ZSBjYW4gYmUgdXNlZnVsIHRvIGVuc3VyZSB0aGF0DQotZWl0aGVyIHVzZXJzcGFj
ZSBjb21lcyB1cCBwcm9wZXJseSwgb3IgdGhlIGJvYXJkIGdldHMgcmVzZXQgYW5kIGFsbG93cw0K
LWZhbGxiYWNrIGxvZ2ljIGluIHRoZSBib290bG9hZGVyIHRvIHRyeSBzb21ldGhpbmcgZWxzZS4N
CisvZGV2L3dhdGNoZG9nTiBkZXZpY2UuIEEgdmFsdWUgb2YgMCBtZWFucyBhbiBpbmZpbml0ZSB0
aW1lb3V0LiBTZXR0aW5nDQordGhpcyB0byBhIG5vbi16ZXJvIHZhbHVlIGNhbiBiZSB1c2VmdWwg
dG8gZW5zdXJlIHRoYXQgZWl0aGVyIHVzZXJzcGFjZQ0KK2NvbWVzIHVwIHByb3Blcmx5LCBvciB0
aGUgYm9hcmQgZ2V0cyByZXNldCBhbmQgYWxsb3dzIGZhbGxiYWNrIGxvZ2ljDQoraW4gdGhlIGJv
b3Rsb2FkZXIgdG8gdHJ5IHNvbWV0aGluZyBlbHNlLg0KIA0KIA0KIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL3dh
dGNoZG9nL0tjb25maWcgYi9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcNCmluZGV4IGZmZTc1NDUz
OWY1YS4uYThiZDYyMWUxMmY4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy93YXRjaGRvZy9LY29uZmln
DQorKysgYi9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcNCkBAIC01OCw2ICs1OCwxNSBAQCBjb25m
aWcgV0FUQ0hET0dfSEFORExFX0JPT1RfRU5BQkxFRA0KIAkgIHRoZSB3YXRjaGRvZyBvbiBpdHMg
b3duLiBUaHVzIGlmIHlvdXIgdXNlcnNwYWNlIGRvZXMgbm90IHN0YXJ0IGZhc3QNCiAJICBlbm91
Z2ggeW91ciBkZXZpY2Ugd2lsbCByZWJvb3QuDQogDQorY29uZmlnIFdBVENIRE9HX09QRU5fVElN
RU9VVA0KKwlpbnQgIlRpbWVvdXQgdmFsdWUgZm9yIG9wZW5pbmcgd2F0Y2hkb2cgZGV2aWNlIg0K
KwlkZWZhdWx0IDANCisJaGVscA0KKwkgIFRoZSBtYXhpbXVtIHRpbWUsIGluIHNlY29uZHMsIGZv
ciB3aGljaCB0aGUgd2F0Y2hkb2cgZnJhbWV3b3JrIHRha2VzDQorCSAgY2FyZSBvZiBwaW5naW5n
IGEgaGFyZHdhcmUgd2F0Y2hkb2cuICBBIHZhbHVlIG9mIDAgbWVhbnMgaW5maW5pdGUuIFRoZQ0K
KwkgIHZhbHVlIHNldCBoZXJlIGNhbiBiZSBvdmVycmlkZGVuIGJ5IHRoZSBjb21tYW5kbGluZSBw
YXJhbWV0ZXINCisJICAid2F0Y2hkb2cub3Blbl90aW1lb3V0Ii4NCisNCiBjb25maWcgV0FUQ0hE
T0dfU1lTRlMNCiAJYm9vbCAiUmVhZCBkaWZmZXJlbnQgd2F0Y2hkb2cgaW5mb3JtYXRpb24gdGhy
b3VnaCBzeXNmcyINCiAJaGVscA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hk
b2dfZGV2LmMgYi9kcml2ZXJzL3dhdGNoZG9nL3dhdGNoZG9nX2Rldi5jDQppbmRleCBlNGI1MWRi
NDhmMGUuLjMzNGI4MTBkYjJjZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hk
b2dfZGV2LmMNCisrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hkb2dfZGV2LmMNCkBAIC04OCw3
ICs4OCw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3RocmVhZF93b3JrZXIgKndhdGNoZG9nX2t3b3JrZXI7
DQogc3RhdGljIGJvb2wgaGFuZGxlX2Jvb3RfZW5hYmxlZCA9DQogCUlTX0VOQUJMRUQoQ09ORklH
X1dBVENIRE9HX0hBTkRMRV9CT09UX0VOQUJMRUQpOw0KIA0KLXN0YXRpYyB1bnNpZ25lZCBvcGVu
X3RpbWVvdXQ7DQorc3RhdGljIHVuc2lnbmVkIG9wZW5fdGltZW91dCA9IENPTkZJR19XQVRDSERP
R19PUEVOX1RJTUVPVVQ7DQogDQogc3RhdGljIGJvb2wgd2F0Y2hkb2dfcGFzdF9vcGVuX2RlYWRs
aW5lKHN0cnVjdCB3YXRjaGRvZ19jb3JlX2RhdGEgKmRhdGEpDQogew0KQEAgLTEyMTQsNCArMTIx
NCw1IEBAIE1PRFVMRV9QQVJNX0RFU0MoaGFuZGxlX2Jvb3RfZW5hYmxlZCwNCiANCiBtb2R1bGVf
cGFyYW0ob3Blbl90aW1lb3V0LCB1aW50LCAwNjQ0KTsNCiBNT0RVTEVfUEFSTV9ERVNDKG9wZW5f
dGltZW91dCwNCi0JIk1heGltdW0gdGltZSAoaW4gc2Vjb25kcywgMCBtZWFucyBpbmZpbml0eSkg
Zm9yIHVzZXJzcGFjZSB0byB0YWtlIG92ZXIgYSBydW5uaW5nIHdhdGNoZG9nIChkZWZhdWx0PTAp
Iik7DQorCSJNYXhpbXVtIHRpbWUgKGluIHNlY29uZHMsIDAgbWVhbnMgaW5maW5pdHkpIGZvciB1
c2Vyc3BhY2UgdG8gdGFrZSBvdmVyIGEgcnVubmluZyB3YXRjaGRvZyAoZGVmYXVsdD0iDQorCV9f
TU9EVUxFX1NUUklORyhDT05GSUdfV0FUQ0hET0dfT1BFTl9USU1FT1VUKSAiKSIpOw0KLS0gDQoy
LjIwLjENCg0K
