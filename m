Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 368B41574A
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2019 03:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfEGB2t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 May 2019 21:28:49 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:62336
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726450AbfEGB2s (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 May 2019 21:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOIRiR5vwE7X1H3TBSlJ90bjqK0SXHYdQy7zVWW4VpA=;
 b=bcMeA2maJU/2sCSzo50qekBEV2Z4Vnjf+Jf8R+4Vvxh9R83pguK91Zd177g90pr8HCThRI/r6A50TXuxFXxJX2ACPuJdXq4f6tRX9Vc75acturA/8E9KQBiDkCO0+ILjK4ThfJ+o1jeLbcJgI3v3JKpTy7HPWYkL4euherdoLjU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3721.eurprd04.prod.outlook.com (52.134.67.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 01:28:26 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 01:28:26 +0000
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
Subject: [PATCH V4 2/3] arm64: dts: imx8qxp: Move watchdog node into scu node
Thread-Topic: [PATCH V4 2/3] arm64: dts: imx8qxp: Move watchdog node into scu
 node
Thread-Index: AQHVBHQm1dC+0FUFL0auwgOAdhy91g==
Date:   Tue, 7 May 2019 01:28:18 +0000
Message-ID: <1557192198-19640-2-git-send-email-Anson.Huang@nxp.com>
References: <1557192198-19640-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1557192198-19640-1-git-send-email-Anson.Huang@nxp.com>
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
x-ms-office365-filtering-correlation-id: f87c6cc9-9736-49a1-83a1-08d6d28b4884
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3721;
x-ms-traffictypediagnostic: DB3PR0402MB3721:
x-microsoft-antispam-prvs: <DB3PR0402MB3721E5E08DCB2B40405778B9F5310@DB3PR0402MB3721.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:514;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(39860400002)(136003)(396003)(376002)(189003)(199004)(316002)(7416002)(4326008)(2501003)(6512007)(14454004)(2906002)(6116002)(81156014)(36756003)(3846002)(305945005)(7736002)(66066001)(2201001)(53936002)(50226002)(8936002)(8676002)(5660300002)(11346002)(486006)(476003)(99286004)(110136005)(2616005)(86362001)(6436002)(26005)(102836004)(6486002)(256004)(76176011)(186003)(52116002)(68736007)(6666004)(4744005)(25786009)(446003)(64756008)(71190400001)(71200400001)(478600001)(73956011)(6506007)(386003)(81166006)(66446008)(66476007)(66946007)(66556008)(32563001)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3721;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q353FUeFFBh14qmoBofLmOISVNAiW3eTD3V3Ch/3CnC5+moqVeDPLwojxD7E8UOdMXf/cNTNNEeYRgD+8KXLpSVHDT8qjCXdYaE9DGHVKkCED2yF13VZ7Eqh0DXHyYed3sXATGzedSapo8UztCMi2WFSYEo84DgIKabp/5ukPNHr2LHORXETtKxIpi3uFB/U8qWHnms9fWjv275FnhpHM4I6WBdFLwsLQoSF8dhNnWjms1WWcFGhIygUWl2WSQ32ql5LhbXjJZdUeqn4j24r7EMR7VFLwB1kmozg/755D96R3c4jftFv9shfDgfzViFLh6vFWgMv6/cgTkcxCWEiuuSk54Ml35CvH2oB8K157tPTZO+/NZgJr2BkvulK2CdHSaXi9ubQpTDDOAZbVQmZSRhfMlNItfG7UYNDZ3DcboY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87c6cc9-9736-49a1-83a1-08d6d28b4884
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 01:28:18.3488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3721
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

aS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRvZyBoYXMgcHJldGltZW91dCBmdW5jdGlvbiB3
aGljaA0KZGVwZW5kcyBvbiBpLk1YIFNDVSBkcml2ZXIsIHNvIGl0IHNob3VsZCBiZSBhIHN1Ym5v
ZGUgb2YgU0NVLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhw
LmNvbT4NCi0tLQ0KTm8gY2hhbmdlLg0KLS0tDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OHF4cC5kdHNpIHwgMTAgKysrKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4cXhwLmR0c2kNCmluZGV4IDA2ODNlZTIuLmIxN2MyMmUgMTAwNjQ0DQotLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KQEAgLTE0OSw2ICsxNDksMTEgQEANCiAJ
CXJ0YzogcnRjIHsNCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQogCQl9
Ow0KKw0KKwkJd2F0Y2hkb2cgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0
IiwgImZzbCxpbXgtc2Mtd2R0IjsNCisJCQl0aW1lb3V0LXNlYyA9IDw2MD47DQorCQl9Ow0KIAl9
Ow0KIA0KIAl0aW1lciB7DQpAQCAtNTE3LDkgKzUyMiw0IEBADQogCQkJcG93ZXItZG9tYWlucyA9
IDwmcGQgSU1YX1NDX1JfR1BJT183PjsNCiAJCX07DQogCX07DQotDQotCXdhdGNoZG9nIHsNCi0J
CWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0IiwgImZzbCxpbXgtc2Mtd2R0IjsNCi0J
CXRpbWVvdXQtc2VjID0gPDYwPjsNCi0JfTsNCiB9Ow0KLS0gDQoyLjcuNA0KDQo=
