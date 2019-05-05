Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE4B13CC0
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 May 2019 04:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfEECPc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 May 2019 22:15:32 -0400
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:64838
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726636AbfEECPb (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 May 2019 22:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmoO/TCISfDIYgqg/9LN6RwC+pszocvbN38rrJjOVzQ=;
 b=m1JEQR6K82ROUQNOAHteFNrd0lKVePRuxxmwrbXIFvCC7c2HIS3Ri0DFwWYEXPwxHR4CNERNur3eP8PelqoE2AvZt7Sm+Wvh/GtjNIv3Sjj4MGcsldlvuSgf8YSCN4e0GxqWO/7EADPFVo0K91pNaMYJf3Z3+KuDy/UGX71sW9E=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3721.eurprd04.prod.outlook.com (52.134.67.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Sun, 5 May 2019 02:14:48 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 02:14:48 +0000
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
Subject: [PATCH V3 1/3] dt-bindings: watchdog: move i.MX system controller
 watchdog binding to SCU
Thread-Topic: [PATCH V3 1/3] dt-bindings: watchdog: move i.MX system
 controller watchdog binding to SCU
Thread-Index: AQHVAuhQe2wZP2oZpkWGF/5cltOBfA==
Date:   Sun, 5 May 2019 02:14:47 +0000
Message-ID: <1557022189-10993-1-git-send-email-Anson.Huang@nxp.com>
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
x-ms-office365-filtering-correlation-id: 80309e0c-1025-4b23-3dd2-08d6d0ff7281
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3721;
x-ms-traffictypediagnostic: DB3PR0402MB3721:
x-microsoft-antispam-prvs: <DB3PR0402MB3721E87E81C9BDE4FE1DF66DF5370@DB3PR0402MB3721.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(14444005)(2906002)(256004)(86362001)(25786009)(71190400001)(14454004)(316002)(2501003)(36756003)(6116002)(3846002)(2201001)(52116002)(478600001)(68736007)(99286004)(66066001)(8936002)(50226002)(71200400001)(6486002)(6436002)(6512007)(53936002)(4326008)(81156014)(7416002)(486006)(305945005)(186003)(73956011)(66946007)(2616005)(476003)(66476007)(66556008)(64756008)(66446008)(102836004)(110136005)(5660300002)(6506007)(386003)(8676002)(81166006)(7736002)(26005)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3721;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AFslhTDzMqOIWFBuWe82bQ7JTRW8ukW5HRAYfFi3+jEMAHXgsxiEIXrxirpw4BND7i+ray0CZc9rL2qdQjXMhPZ9WntjD4IjFc1bP1k/4t//i1ngPqtODN/K4WuSj28zxsA9Qcw/WBjXHzaMSJzwFn+A9so/6u/TxI10AQ6ndLjrmXvqBzNcMf6HZb3WiuaQD+2JV+g2MWCYiP2Bfeu4IL4qbNu3TieK0BgZPcasUhZ4kHk4QO1rvBZu93qI3D21UmvXp+hdfHHu19Fa4avIGBu7Z6Vd9922SJ7vhC/lmI0PbvHeYmz3KBrdt/MUkZN2td4TSTsqFfOwAHK7Ya4VxhA7fi9+AWa3SDWS1BBYWs4X/EXpQkAc12fH5xPrt6PjuJBrSzoVVa7I6VZNh1THwTtGebc6wEE8mAkXxN2useE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80309e0c-1025-4b23-3dd2-08d6d0ff7281
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 02:14:47.9707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3721
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

aS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRvZyBkZXBlbmRzIG9uIFNDVSBkcml2ZXIgdG8g
c3VwcG9ydA0KaW50ZXJydXB0IGZ1bmN0aW9uLCBzbyBpdCBuZWVkcyB0byBiZSBzdWJub2RlIG9m
IFNDVSBub2RlIGluIERULA0KYmluZGluZyBkb2Mgc2hvdWxkIGJlIG1vdmVkIHRvIGZzbCxzY3Uu
dHh0IGFzIHdlbGwuDQoNClNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0Bu
eHAuY29tPg0KLS0tDQpDaGFuZ2VzIHNpbmNlIFYyOg0KCS0gbm8gY29udGVudCBjaGFuZ2UsIGp1
c3QgbWVyZ2UgdHdvIGR0LWJpbmRpbmcgcGF0Y2hlcyBhbmQgaW1wcm92ZSB0aGUgY29tbWl0IG1l
c3NhZ2UuDQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxz
Y3UudHh0ICB8IDE1ICsrKysrKysrKysrKysrDQogLi4uL2JpbmRpbmdzL3dhdGNoZG9nL2ZzbC1p
bXgtc2Mtd2R0LnR4dCAgICAgICAgICAgfCAyNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogMiBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCiBkZWxldGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2Zz
bC1pbXgtc2Mtd2R0LnR4dA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KaW5kZXggNzJkNDgxYy4u
OTk2NzIxMiAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KQEAgLTEyMiw2ICsxMjIsMTYgQEAg
UlRDIGJpbmRpbmdzIGJhc2VkIG9uIFNDVSBNZXNzYWdlIFByb3RvY29sDQogUmVxdWlyZWQgcHJv
cGVydGllczoNCiAtIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiZnNsLGlteDhxeHAtc2MtcnRjIjsN
CiANCitXYXRjaGRvZyBiaW5kaW5ncyBiYXNlZCBvbiBTQ1UgTWVzc2FnZSBQcm90b2NvbA0KKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KKw0KK1JlcXVpcmVkIHByb3BlcnRpZXM6DQorLSBjb21wYXRpYmxlOiBzaG91bGQgYmU6DQor
ICAgICAgICAgICAgICAiZnNsLGlteDhxeHAtc2Mtd2R0Ig0KKyAgICAgICAgICAgICAgZm9sbG93
ZWQgYnkgImZzbCxpbXgtc2Mtd2R0IjsNCitPcHRpb25hbCBwcm9wZXJ0aWVzOg0KKy0gdGltZW91
dC1zZWM6IGNvbnRhaW5zIHRoZSB3YXRjaGRvZyB0aW1lb3V0IGluIHNlY29uZHMuDQorDQogRXhh
bXBsZSAoaW14OHF4cCk6DQogLS0tLS0tLS0tLS0tLQ0KIGxzaW9fbXUxOiBtYWlsYm94QDVkMWMw
MDAwIHsNCkBAIC0xNjgsNiArMTc4LDExIEBAIGZpcm13YXJlIHsNCiAJCXJ0YzogcnRjIHsNCiAJ
CQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQogCQl9Ow0KKw0KKwkJd2F0Y2hk
b2cgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0IiwgImZzbCxpbXgtc2Mt
d2R0IjsNCisJCQl0aW1lb3V0LXNlYyA9IDw2MD47DQorCQl9Ow0KIAl9Ow0KIH07DQogDQpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2ZzbC1p
bXgtc2Mtd2R0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRv
Zy9mc2wtaW14LXNjLXdkdC50eHQNCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDJi
ODdlOS4uMDAwMDAwMA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dh
dGNoZG9nL2ZzbC1pbXgtc2Mtd2R0LnR4dA0KKysrIC9kZXYvbnVsbA0KQEAgLTEsMjQgKzAsMCBA
QA0KLSogRnJlZXNjYWxlIGkuTVggU3lzdGVtIENvbnRyb2xsZXIgV2F0Y2hkb2cNCi0NCi1pLk1Y
IHN5c3RlbSBjb250cm9sbGVyIHdhdGNoZG9nIGlzIGZvciBpLk1YIFNvQ3Mgd2l0aCBzeXN0ZW0g
Y29udHJvbGxlciBpbnNpZGUsDQotdGhlIHdhdGNoZG9nIGlzIG1hbmFnZWQgYnkgc3lzdGVtIGNv
bnRyb2xsZXIsIHVzZXJzIGNhbiBPTkxZIGNvbW11bmljYXRlIHdpdGgNCi1zeXN0ZW0gY29udHJv
bGxlciBmcm9tIHNlY3VyZSBtb2RlIGZvciB3YXRjaGRvZyBvcGVyYXRpb25zLCBzbyBMaW51eCBp
Lk1YIHN5c3RlbQ0KLWNvbnRyb2xsZXIgd2F0Y2hkb2cgZHJpdmVyIHdpbGwgY2FsbCBBUk0gU01D
IEFQSSBhbmQgdHJhcCBpbnRvIEFSTS1UcnVzdGVkLUZpcm13YXJlDQotZm9yIHdhdGNoZG9nIG9w
ZXJhdGlvbnMsIEFSTS1UcnVzdGVkLUZpcm13YXJlIGlzIHJ1bm5pbmcgYXQgc2VjdXJlIEVMMyBt
b2RlIGFuZA0KLWl0IHdpbGwgcmVxdWVzdCBzeXN0ZW0gY29udHJvbGxlciB0byBleGVjdXRlIHRo
ZSB3YXRjaGRvZyBvcGVyYXRpb24gcGFzc2VkIGZyb20NCi1MaW51eCBrZXJuZWwuDQotDQotUmVx
dWlyZWQgcHJvcGVydGllczoNCi0tIGNvbXBhdGlibGU6CVNob3VsZCBiZSA6DQotCQkiZnNsLGlt
eDhxeHAtc2Mtd2R0Ig0KLQkJZm9sbG93ZWQgYnkgImZzbCxpbXgtc2Mtd2R0IjsNCi0NCi1PcHRp
b25hbCBwcm9wZXJ0aWVzOg0KLS0gdGltZW91dC1zZWMgOiBDb250YWlucyB0aGUgd2F0Y2hkb2cg
dGltZW91dCBpbiBzZWNvbmRzLg0KLQ0KLUV4YW1wbGVzOg0KLQ0KLXdhdGNoZG9nIHsNCi0JY29t
cGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy13ZHQiLCAiZnNsLGlteC1zYy13ZHQiOw0KLQl0aW1l
b3V0LXNlYyA9IDw2MD47DQotfTsNCi0tIA0KMi43LjQNCg0K
