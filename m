Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F401574E
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2019 03:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfEGB2q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 May 2019 21:28:46 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:62336
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726567AbfEGB2p (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 May 2019 21:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGEyKjT5niGlOGsT70lxgchAWxhxVlxQwmJ6N4w9rwI=;
 b=jX/gflz6EdwJPKJ2FGGuKNaehS+ct1iT6mWTGuszw2gtCwJ5TzdFPSS4mHCZjjnsS4dfYADKaRM62uM4dHLhSCWYm1ncOuhC80kiJMiuLhLTWJSSAj+b6fWG1Q2tuYhVkCXjNfGh+Jn0ik/D6uGekzSBmNqQMHfpW2sfAMOoyGg=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3721.eurprd04.prod.outlook.com (52.134.67.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 01:28:13 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 01:28:12 +0000
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
        Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH V4 1/3] dt-bindings: watchdog: move i.MX system controller
 watchdog binding to SCU
Thread-Topic: [PATCH V4 1/3] dt-bindings: watchdog: move i.MX system
 controller watchdog binding to SCU
Thread-Index: AQHVBHQjKWAFOCupfkukg2hzYg0wgw==
Date:   Tue, 7 May 2019 01:28:12 +0000
Message-ID: <1557192198-19640-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0084.apcprd03.prod.outlook.com
 (2603:1096:203:72::24) To DB3PR0402MB3916.eurprd04.prod.outlook.com
 (2603:10a6:8:10::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75ad983b-87f3-47e7-5e4c-08d6d28b4547
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3721;
x-ms-traffictypediagnostic: DB3PR0402MB3721:
x-microsoft-antispam-prvs: <DB3PR0402MB372187CBFCD64E44419D4B3DF5310@DB3PR0402MB3721.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(39860400002)(136003)(396003)(376002)(189003)(199004)(316002)(7416002)(4326008)(2501003)(6512007)(14454004)(2906002)(6116002)(81156014)(36756003)(3846002)(305945005)(7736002)(66066001)(2201001)(53936002)(50226002)(8936002)(8676002)(5660300002)(486006)(476003)(99286004)(110136005)(2616005)(86362001)(6436002)(26005)(102836004)(6486002)(14444005)(256004)(186003)(52116002)(68736007)(25786009)(64756008)(71190400001)(71200400001)(478600001)(73956011)(6506007)(386003)(81166006)(66446008)(66476007)(66946007)(66556008)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3721;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eom1AXKWm7Umak5xhOauqGWpeZ97XzuQHbNTFY516a/4uwoN3dYHWy3KGUTKYwRt1Ubo8+1QHn4l66CcNUFQHDxzjuac28KXjaOzvfFRA3Ankq8l/1koYJqvi+ht/uc12nlyZIM3IN06xh+NO59AlsNDkUsK+kVu9TKTSk/MbWMA/JxgVnB0uhM5MxE/kKGtGQPdst2LG3Qo4QGFlFB1wQghPOGF7rJvG9sbyUrRT8g5utjZaPD9JpxP1e0FMGahpD9koNSnHv1nNHLwfGUMxEmdjlNVGlMdOasnd4ZYGTkim13FqOecd+f0o9aqFpi5PEU4mK6DImbfuqY5vvmfnwV0CL/YrcXvUqYzNs9Dp40cS6W9Gxc8bN25bP0tZv9w/eUvOYI+ylNHvYdlNXKPNQbnAJFCdxzVYJzlScmkLVw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ad983b-87f3-47e7-5e4c-08d6d28b4547
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 01:28:12.8659
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
eHAuY29tPg0KLS0tDQpObyBjaGFuZ2UuDQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0ICB8IDE1ICsrKysrKysrKysrKysrDQogLi4uL2JpbmRp
bmdzL3dhdGNoZG9nL2ZzbC1pbXgtc2Mtd2R0LnR4dCAgICAgICAgICAgfCAyNCAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyNCBkZWxl
dGlvbnMoLSkNCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3dhdGNoZG9nL2ZzbC1pbXgtc2Mtd2R0LnR4dA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4
dA0KaW5kZXggNWQ3ZGJhYi4uMWI1NjU1NyAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KQEAg
LTEzMyw2ICsxMzMsMTYgQEAgUlRDIGJpbmRpbmdzIGJhc2VkIG9uIFNDVSBNZXNzYWdlIFByb3Rv
Y29sDQogUmVxdWlyZWQgcHJvcGVydGllczoNCiAtIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiZnNs
LGlteDhxeHAtc2MtcnRjIjsNCiANCitXYXRjaGRvZyBiaW5kaW5ncyBiYXNlZCBvbiBTQ1UgTWVz
c2FnZSBQcm90b2NvbA0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KKw0KK1JlcXVpcmVkIHByb3BlcnRpZXM6DQorLSBjb21wYXRp
YmxlOiBzaG91bGQgYmU6DQorICAgICAgICAgICAgICAiZnNsLGlteDhxeHAtc2Mtd2R0Ig0KKyAg
ICAgICAgICAgICAgZm9sbG93ZWQgYnkgImZzbCxpbXgtc2Mtd2R0IjsNCitPcHRpb25hbCBwcm9w
ZXJ0aWVzOg0KKy0gdGltZW91dC1zZWM6IGNvbnRhaW5zIHRoZSB3YXRjaGRvZyB0aW1lb3V0IGlu
IHNlY29uZHMuDQorDQogRXhhbXBsZSAoaW14OHF4cCk6DQogLS0tLS0tLS0tLS0tLQ0KIGFsaWFz
ZXMgew0KQEAgLTE4NSw2ICsxOTUsMTEgQEAgZmlybXdhcmUgew0KIAkJcnRjOiBydGMgew0KIAkJ
CWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2MtcnRjIjsNCiAJCX07DQorDQorCQl3YXRjaGRv
ZyB7DQorCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy13ZHQiLCAiZnNsLGlteC1zYy13
ZHQiOw0KKwkJCXRpbWVvdXQtc2VjID0gPDYwPjsNCisJCX07DQogCX07DQogfTsNCiANCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZnNsLWlt
eC1zYy13ZHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9n
L2ZzbC1pbXgtc2Mtd2R0LnR4dA0KZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMmI4
N2U5Li4wMDAwMDAwDQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0
Y2hkb2cvZnNsLWlteC1zYy13ZHQudHh0DQorKysgL2Rldi9udWxsDQpAQCAtMSwyNCArMCwwIEBA
DQotKiBGcmVlc2NhbGUgaS5NWCBTeXN0ZW0gQ29udHJvbGxlciBXYXRjaGRvZw0KLQ0KLWkuTVgg
c3lzdGVtIGNvbnRyb2xsZXIgd2F0Y2hkb2cgaXMgZm9yIGkuTVggU29DcyB3aXRoIHN5c3RlbSBj
b250cm9sbGVyIGluc2lkZSwNCi10aGUgd2F0Y2hkb2cgaXMgbWFuYWdlZCBieSBzeXN0ZW0gY29u
dHJvbGxlciwgdXNlcnMgY2FuIE9OTFkgY29tbXVuaWNhdGUgd2l0aA0KLXN5c3RlbSBjb250cm9s
bGVyIGZyb20gc2VjdXJlIG1vZGUgZm9yIHdhdGNoZG9nIG9wZXJhdGlvbnMsIHNvIExpbnV4IGku
TVggc3lzdGVtDQotY29udHJvbGxlciB3YXRjaGRvZyBkcml2ZXIgd2lsbCBjYWxsIEFSTSBTTUMg
QVBJIGFuZCB0cmFwIGludG8gQVJNLVRydXN0ZWQtRmlybXdhcmUNCi1mb3Igd2F0Y2hkb2cgb3Bl
cmF0aW9ucywgQVJNLVRydXN0ZWQtRmlybXdhcmUgaXMgcnVubmluZyBhdCBzZWN1cmUgRUwzIG1v
ZGUgYW5kDQotaXQgd2lsbCByZXF1ZXN0IHN5c3RlbSBjb250cm9sbGVyIHRvIGV4ZWN1dGUgdGhl
IHdhdGNoZG9nIG9wZXJhdGlvbiBwYXNzZWQgZnJvbQ0KLUxpbnV4IGtlcm5lbC4NCi0NCi1SZXF1
aXJlZCBwcm9wZXJ0aWVzOg0KLS0gY29tcGF0aWJsZToJU2hvdWxkIGJlIDoNCi0JCSJmc2wsaW14
OHF4cC1zYy13ZHQiDQotCQlmb2xsb3dlZCBieSAiZnNsLGlteC1zYy13ZHQiOw0KLQ0KLU9wdGlv
bmFsIHByb3BlcnRpZXM6DQotLSB0aW1lb3V0LXNlYyA6IENvbnRhaW5zIHRoZSB3YXRjaGRvZyB0
aW1lb3V0IGluIHNlY29uZHMuDQotDQotRXhhbXBsZXM6DQotDQotd2F0Y2hkb2cgew0KLQljb21w
YXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXdkdCIsICJmc2wsaW14LXNjLXdkdCI7DQotCXRpbWVv
dXQtc2VjID0gPDYwPjsNCi19Ow0KLS0gDQoyLjcuNA0KDQo=
