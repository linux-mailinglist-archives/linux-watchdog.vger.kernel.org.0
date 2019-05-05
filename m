Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0A2F13CC6
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 May 2019 04:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfEECPf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 May 2019 22:15:35 -0400
Received: from mail-eopbgr150087.outbound.protection.outlook.com ([40.107.15.87]:31297
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727314AbfEECPc (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 May 2019 22:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lRq9Skx4F+BiFbJ9UTmSd06o4Rko8cdVr8QBTAyDFQ=;
 b=e8o1oO/Ehmo4hu3xDO80h/48ZfoCIbjSyAnFdOgc4U6+hWLNHEbv1sd4bOJx2Fmi4M5o7pWm0dgkUnLME4napW0Z33uosfYck4rbnbqGexuD2ulpnTYfejc7lyjng82Ntukpe5YToP/p4ncVHIwXPA7zMbk6JCG8R22BDyJFd8U=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3721.eurprd04.prod.outlook.com (52.134.67.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Sun, 5 May 2019 02:15:00 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 02:15:00 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH V3 3/3] watchdog: imx_sc: Add pretimeout support
Thread-Topic: [PATCH V3 3/3] watchdog: imx_sc: Add pretimeout support
Thread-Index: AQHVAuhX3Dci+0ziCkuAahuxTj8vrQ==
Date:   Sun, 5 May 2019 02:15:00 +0000
Message-ID: <1557022189-10993-3-git-send-email-Anson.Huang@nxp.com>
References: <1557022189-10993-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1557022189-10993-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR02CA0145.apcprd02.prod.outlook.com
 (2603:1096:202:16::29) To DB3PR0402MB3916.eurprd04.prod.outlook.com
 (2603:10a6:8:10::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a0221f6-f6d4-4cfb-f637-08d6d0ff79b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3721;
x-ms-traffictypediagnostic: DB3PR0402MB3721:
x-microsoft-antispam-prvs: <DB3PR0402MB3721AF2978B4E371F6B68A90F5370@DB3PR0402MB3721.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(14444005)(2906002)(256004)(86362001)(25786009)(71190400001)(14454004)(76176011)(316002)(2501003)(36756003)(6116002)(3846002)(2201001)(52116002)(478600001)(68736007)(99286004)(66066001)(8936002)(50226002)(71200400001)(6486002)(6436002)(6512007)(53936002)(4326008)(81156014)(7416002)(486006)(305945005)(186003)(73956011)(11346002)(66946007)(2616005)(476003)(66476007)(66556008)(64756008)(66446008)(446003)(102836004)(110136005)(5660300002)(6506007)(386003)(8676002)(81166006)(7736002)(26005)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3721;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /+zuer9pNces6ETef91Xg5b71Vwh8S14uaaiTWEzXP0kIV+9Fwu1//+6GmotyWtE5JXUcLkP168uJSsyw41Yc6Mz5eH7hfAqDcfdD5w5AJiKqfC34+CXUc0npman9N6Qh4jKzyuCRj5C7VozJFnPkbCVHYegOnaAuFqUD68x+cNSfTYZxEjhUXR6jQv6T+S7fdwUIQ3TWjUwdqfQ16lEINixBW4m/i2JLadhkJo1/uEeBPxtnsx21882Rycrfc2hjO6ir0pJMVq03TqA1/1WgSz1limEQqpjVnRA17g4fLh8CtrKXaJypQ2nbxhKE1+X1Y6FAcE4+ypFPsjhH2dlBNyr5HbVJZtYLwYpo5pumQrZEktW8c8D17FigwwvZyngkn4fquEDkh/uTxo7GsdNFgrjmZpueuzLVnisEGrmVT0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0221f6-f6d4-4cfb-f637-08d6d0ff79b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 02:15:00.2296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3721
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

aS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRvZyBjYW4gc3VwcG9ydCBwcmV0aW1lb3V0IElS
UQ0KdmlhIGdlbmVyYWwgU0NVIE1VIElSUSwgaXQgZGVwZW5kcyBvbiBJTVhfU0NVIGFuZCBkcml2
ZXIgTVVTVA0KYmUgcHJvYmVkIGFmdGVyIFNDVSBJUEMgcmVhZHksIHRoZW4gZW5hYmxlIGNvcnJl
c3BvbmRpbmcgU0NVDQpJUlEgZ3JvdXAgYW5kIHJlZ2lzdGVyIFNDVSBJUlEgbm90aWZpZXIsIHdo
ZW4gd2F0Y2hkb2cgcHJldGltZW91dA0KSVJRIGZpcmVzLCBTQ1UgTVUgSVJRIHdpbGwgYmUgaGFu
ZGxlZCBhbmQgd2F0Y2hkb2cgcHJldGltZW91dA0Kbm90aWZpZXIgd2lsbCBiZSBjYWxsZWQgdG8g
aGFuZGxlIHRoZSBldmVudC4NCg0KU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1
YW5nQG54cC5jb20+DQotLS0NCk5vIGNoYW5nZS4NCi0tLQ0KIGRyaXZlcnMvd2F0Y2hkb2cvS2Nv
bmZpZyAgICAgIHwgICAxICsNCiBkcml2ZXJzL3dhdGNoZG9nL2lteF9zY193ZHQuYyB8IDExNCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCiAyIGZpbGVzIGNoYW5n
ZWQsIDk1IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy93YXRjaGRvZy9LY29uZmlnIGIvZHJpdmVycy93YXRjaGRvZy9LY29uZmlnDQppbmRleCBl
MTk5NjBhLi5kYmM3NGUxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy93YXRjaGRvZy9LY29uZmlnDQor
KysgYi9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcNCkBAIC03MTAsNiArNzEwLDcgQEAgY29uZmln
IElNWDJfV0RUDQogY29uZmlnIElNWF9TQ19XRFQNCiAJdHJpc3RhdGUgIklNWCBTQyBXYXRjaGRv
ZyINCiAJZGVwZW5kcyBvbiBIQVZFX0FSTV9TTUNDQw0KKwlkZXBlbmRzIG9uIElNWF9TQ1UNCiAJ
c2VsZWN0IFdBVENIRE9HX0NPUkUNCiAJaGVscA0KIAkgIFRoaXMgaXMgdGhlIGRyaXZlciBmb3Ig
dGhlIHN5c3RlbSBjb250cm9sbGVyIHdhdGNoZG9nDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRj
aGRvZy9pbXhfc2Nfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL2lteF9zY193ZHQuYw0KaW5kZXgg
NDk4NDhiNi4uZDg0OTNhMyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvaW14X3NjX3dk
dC5jDQorKysgYi9kcml2ZXJzL3dhdGNoZG9nL2lteF9zY193ZHQuYw0KQEAgLTQsNiArNCw3IEBA
DQogICovDQogDQogI2luY2x1ZGUgPGxpbnV4L2FybS1zbWNjYy5oPg0KKyNpbmNsdWRlIDxsaW51
eC9maXJtd2FyZS9pbXgvc2NpLmg+DQogI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQogI2luY2x1ZGUg
PGxpbnV4L2luaXQuaD4NCiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQpAQCAtMzMsMTEgKzM0
LDE5IEBADQogDQogI2RlZmluZSBTQ19USU1FUl9XRE9HX0FDVElPTl9QQVJUSVRJT04JMA0KIA0K
KyNkZWZpbmUgU0NfSVJRX1dET0cJCQkxDQorI2RlZmluZSBTQ19JUlFfR1JPVVBfV0RPRwkJMQ0K
Kw0KIHN0YXRpYyBib29sIG5vd2F5b3V0ID0gV0FUQ0hET0dfTk9XQVlPVVQ7DQogbW9kdWxlX3Bh
cmFtKG5vd2F5b3V0LCBib29sLCAwMDAwKTsNCiBNT0RVTEVfUEFSTV9ERVNDKG5vd2F5b3V0LCAi
V2F0Y2hkb2cgY2Fubm90IGJlIHN0b3BwZWQgb25jZSBzdGFydGVkIChkZWZhdWx0PSINCiAJCSBf
X01PRFVMRV9TVFJJTkcoV0FUQ0hET0dfTk9XQVlPVVQpICIpIik7DQogDQorc3RydWN0IGlteF9z
Y193ZHRfZGV2aWNlIHsNCisJc3RydWN0IHdhdGNoZG9nX2RldmljZSB3ZGQ7DQorCXN0cnVjdCBu
b3RpZmllcl9ibG9jayB3ZHRfbm90aWZpZXI7DQorfTsNCisNCiBzdGF0aWMgaW50IGlteF9zY193
ZHRfcGluZyhzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZG9nKQ0KIHsNCiAJc3RydWN0IGFybV9z
bWNjY19yZXMgcmVzOw0KQEAgLTg1LDI0ICs5NCw2NiBAQCBzdGF0aWMgaW50IGlteF9zY193ZHRf
c2V0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RvZywNCiAJcmV0dXJuIHJlcy5h
MCA/IC1FQUNDRVMgOiAwOw0KIH0NCiANCitzdGF0aWMgaW50IGlteF9zY193ZHRfc2V0X3ByZXRp
bWVvdXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RvZywNCisJCQkJICAgICB1bnNpZ25lZCBp
bnQgcHJldGltZW91dCkNCit7DQorCXN0cnVjdCBhcm1fc21jY2NfcmVzIHJlczsNCisNCisJYXJt
X3NtY2NjX3NtYyhJTVhfU0lQX1RJTUVSLCBJTVhfU0lQX1RJTUVSX1NFVF9QUkVUSU1FX1dET0cs
DQorCQkgICAgICBwcmV0aW1lb3V0ICogMTAwMCwgMCwgMCwgMCwgMCwgMCwgJnJlcyk7DQorCWlm
IChyZXMuYTApDQorCQlyZXR1cm4gLUVBQ0NFUzsNCisNCisJd2RvZy0+cHJldGltZW91dCA9IHBy
ZXRpbWVvdXQ7DQorDQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgaW50IGlteF9zY193ZHRf
bm90aWZ5KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsDQorCQkJICAgICB1bnNpZ25lZCBsb25n
IGV2ZW50LCB2b2lkICpncm91cCkNCit7DQorCXN0cnVjdCBpbXhfc2Nfd2R0X2RldmljZSAqaW14
X3NjX3dkZCA9DQorCQkJCSBjb250YWluZXJfb2YobmIsDQorCQkJCQkgICAgICBzdHJ1Y3QgaW14
X3NjX3dkdF9kZXZpY2UsDQorCQkJCQkgICAgICB3ZHRfbm90aWZpZXIpOw0KKw0KKwlpZiAoZXZl
bnQgJiBTQ19JUlFfV0RPRyAmJg0KKwkgICAgKih1OCAqKWdyb3VwID09IFNDX0lSUV9HUk9VUF9X
RE9HKQ0KKwkJd2F0Y2hkb2dfbm90aWZ5X3ByZXRpbWVvdXQoJmlteF9zY193ZGQtPndkZCk7DQor
DQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgdm9pZCBpbXhfc2Nfd2R0X2FjdGlvbih2b2lk
ICpkYXRhKQ0KK3sNCisJc3RydWN0IG5vdGlmaWVyX2Jsb2NrICp3ZHRfbm90aWZpZXIgPSBkYXRh
Ow0KKw0KKwlpbXhfc2N1X2lycV91bnJlZ2lzdGVyX25vdGlmaWVyKHdkdF9ub3RpZmllcik7DQor
CWlteF9zY3VfaXJxX2dyb3VwX2VuYWJsZShTQ19JUlFfR1JPVVBfV0RPRywNCisJCQkJIFNDX0lS
UV9XRE9HLA0KKwkJCQkgZmFsc2UpOw0KK30NCisNCiBzdGF0aWMgY29uc3Qgc3RydWN0IHdhdGNo
ZG9nX29wcyBpbXhfc2Nfd2R0X29wcyA9IHsNCiAJLm93bmVyID0gVEhJU19NT0RVTEUsDQogCS5z
dGFydCA9IGlteF9zY193ZHRfc3RhcnQsDQogCS5zdG9wICA9IGlteF9zY193ZHRfc3RvcCwNCiAJ
LnBpbmcgID0gaW14X3NjX3dkdF9waW5nLA0KIAkuc2V0X3RpbWVvdXQgPSBpbXhfc2Nfd2R0X3Nl
dF90aW1lb3V0LA0KKwkuc2V0X3ByZXRpbWVvdXQgPSBpbXhfc2Nfd2R0X3NldF9wcmV0aW1lb3V0
LA0KIH07DQogDQotc3RhdGljIGNvbnN0IHN0cnVjdCB3YXRjaGRvZ19pbmZvIGlteF9zY193ZHRf
aW5mbyA9IHsNCitzdGF0aWMgc3RydWN0IHdhdGNoZG9nX2luZm8gaW14X3NjX3dkdF9pbmZvID0g
ew0KIAkuaWRlbnRpdHkJPSAiaS5NWCBTQyB3YXRjaGRvZyB0aW1lciIsDQogCS5vcHRpb25zCT0g
V0RJT0ZfU0VUVElNRU9VVCB8IFdESU9GX0tFRVBBTElWRVBJTkcgfA0KLQkJCSAgV0RJT0ZfTUFH
SUNDTE9TRSB8IFdESU9GX1BSRVRJTUVPVVQsDQorCQkJICBXRElPRl9NQUdJQ0NMT1NFLA0KIH07
DQogDQogc3RhdGljIGludCBpbXhfc2Nfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQogew0KKwlzdHJ1Y3QgaW14X3NjX3dkdF9kZXZpY2UgKmlteF9zY193ZGQ7DQorCXN0
cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkb2c7DQogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2
LT5kZXY7DQotCXN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKmlteF9zY193ZGQ7DQogCWludCByZXQ7
DQogDQogCWlteF9zY193ZGQgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmlteF9zY193ZGQp
LCBHRlBfS0VSTkVMKTsNCkBAIC0xMTEsNDIgKzE2Miw2NSBAQCBzdGF0aWMgaW50IGlteF9zY193
ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiANCiAJcGxhdGZvcm1fc2V0
X2RydmRhdGEocGRldiwgaW14X3NjX3dkZCk7DQogDQotCWlteF9zY193ZGQtPmluZm8gPSAmaW14
X3NjX3dkdF9pbmZvOw0KLQlpbXhfc2Nfd2RkLT5vcHMgPSAmaW14X3NjX3dkdF9vcHM7DQotCWlt
eF9zY193ZGQtPm1pbl90aW1lb3V0ID0gMTsNCi0JaW14X3NjX3dkZC0+bWF4X3RpbWVvdXQgPSBN
QVhfVElNRU9VVDsNCi0JaW14X3NjX3dkZC0+cGFyZW50ID0gZGV2Ow0KLQlpbXhfc2Nfd2RkLT50
aW1lb3V0ID0gREVGQVVMVF9USU1FT1VUOw0KKwl3ZG9nID0gJmlteF9zY193ZGQtPndkZDsNCisJ
d2RvZy0+aW5mbyA9ICZpbXhfc2Nfd2R0X2luZm87DQorCXdkb2ctPm9wcyA9ICZpbXhfc2Nfd2R0
X29wczsNCisJd2RvZy0+bWluX3RpbWVvdXQgPSAxOw0KKwl3ZG9nLT5tYXhfdGltZW91dCA9IE1B
WF9USU1FT1VUOw0KKwl3ZG9nLT5wYXJlbnQgPSBkZXY7DQorCXdkb2ctPnRpbWVvdXQgPSBERUZB
VUxUX1RJTUVPVVQ7DQogDQotCXdhdGNoZG9nX2luaXRfdGltZW91dChpbXhfc2Nfd2RkLCAwLCBk
ZXYpOw0KLQl3YXRjaGRvZ19zdG9wX29uX3JlYm9vdChpbXhfc2Nfd2RkKTsNCi0Jd2F0Y2hkb2df
c3RvcF9vbl91bnJlZ2lzdGVyKGlteF9zY193ZGQpOw0KKwl3YXRjaGRvZ19pbml0X3RpbWVvdXQo
d2RvZywgMCwgZGV2KTsNCisJd2F0Y2hkb2dfc3RvcF9vbl9yZWJvb3Qod2RvZyk7DQorCXdhdGNo
ZG9nX3N0b3Bfb25fdW5yZWdpc3Rlcih3ZG9nKTsNCiANCi0JcmV0ID0gZGV2bV93YXRjaGRvZ19y
ZWdpc3Rlcl9kZXZpY2UoZGV2LCBpbXhfc2Nfd2RkKTsNCisJcmV0ID0gZGV2bV93YXRjaGRvZ19y
ZWdpc3Rlcl9kZXZpY2UoZGV2LCB3ZG9nKTsNCiAJaWYgKHJldCkgew0KIAkJZGV2X2VycihkZXYs
ICJGYWlsZWQgdG8gcmVnaXN0ZXIgd2F0Y2hkb2cgZGV2aWNlXG4iKTsNCiAJCXJldHVybiByZXQ7
DQogCX0NCiANCi0JcmV0dXJuIDA7DQorCXJldCA9IGlteF9zY3VfaXJxX2dyb3VwX2VuYWJsZShT
Q19JUlFfR1JPVVBfV0RPRywNCisJCQkJICAgICAgIFNDX0lSUV9XRE9HLA0KKwkJCQkgICAgICAg
dHJ1ZSk7DQorCWlmIChyZXQpIHsNCisJCWRldl93YXJuKGRldiwgIkVuYWJsZSBpcnEgZmFpbGVk
LCBwcmV0aW1lb3V0IE5PVCBzdXBwb3J0ZWRcbiIpOw0KKwkJcmV0dXJuIDA7DQorCX0NCisNCisJ
aW14X3NjX3dkZC0+d2R0X25vdGlmaWVyLm5vdGlmaWVyX2NhbGwgPSBpbXhfc2Nfd2R0X25vdGlm
eTsNCisJcmV0ID0gaW14X3NjdV9pcnFfcmVnaXN0ZXJfbm90aWZpZXIoJmlteF9zY193ZGQtPndk
dF9ub3RpZmllcik7DQorCWlmIChyZXQpIHsNCisJCWlteF9zY3VfaXJxX2dyb3VwX2VuYWJsZShT
Q19JUlFfR1JPVVBfV0RPRywNCisJCQkJCSBTQ19JUlFfV0RPRywNCisJCQkJCSBmYWxzZSk7DQor
CQlkZXZfd2FybihkZXYsDQorCQkJICJSZWdpc3RlciBpcnEgbm90aWZpZXIgZmFpbGVkLCBwcmV0
aW1lb3V0IE5PVCBzdXBwb3J0ZWRcbiIpOw0KKwkJcmV0dXJuIDA7DQorCX0NCisNCisJaW14X3Nj
X3dkdF9pbmZvLm9wdGlvbnMgfD0gV0RJT0ZfUFJFVElNRU9VVDsNCisJcmV0ID0gZGV2bV9hZGRf
YWN0aW9uKGRldiwgaW14X3NjX3dkdF9hY3Rpb24sDQorCQkJICAgICAgJmlteF9zY193ZGQtPndk
dF9ub3RpZmllcik7DQorCXJldHVybiByZXQ7DQogfQ0KIA0KIHN0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgaW14X3NjX3dkdF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQotCXN0cnVj
dCB3YXRjaGRvZ19kZXZpY2UgKmlteF9zY193ZGQgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCisJ
c3RydWN0IGlteF9zY193ZHRfZGV2aWNlICppbXhfc2Nfd2RkID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQogDQotCWlmICh3YXRjaGRvZ19hY3RpdmUoaW14X3NjX3dkZCkpDQotCQlpbXhfc2Nfd2R0
X3N0b3AoaW14X3NjX3dkZCk7DQorCWlmICh3YXRjaGRvZ19hY3RpdmUoJmlteF9zY193ZGQtPndk
ZCkpDQorCQlpbXhfc2Nfd2R0X3N0b3AoJmlteF9zY193ZGQtPndkZCk7DQogDQogCXJldHVybiAw
Ow0KIH0NCiANCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGlteF9zY193ZHRfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikNCiB7DQotCXN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKmlteF9zY193
ZGQgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCisJc3RydWN0IGlteF9zY193ZHRfZGV2aWNlICpp
bXhfc2Nfd2RkID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogDQotCWlmICh3YXRjaGRvZ19hY3Rp
dmUoaW14X3NjX3dkZCkpDQotCQlpbXhfc2Nfd2R0X3N0YXJ0KGlteF9zY193ZGQpOw0KKwlpZiAo
d2F0Y2hkb2dfYWN0aXZlKCZpbXhfc2Nfd2RkLT53ZGQpKQ0KKwkJaW14X3NjX3dkdF9zdGFydCgm
aW14X3NjX3dkZC0+d2RkKTsNCiANCiAJcmV0dXJuIDA7DQogfQ0KLS0gDQoyLjcuNA0KDQo=
