Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59101342A4
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2019 11:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfFDJGf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Jun 2019 05:06:35 -0400
Received: from mail-eopbgr30062.outbound.protection.outlook.com ([40.107.3.62]:54496
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727033AbfFDJGe (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Jun 2019 05:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uNPxmYFIOIIV+VBRJ1Y41oLlIBoV6G13kNU0BZbpj4=;
 b=IotSr3Tia4Ds1dHIRbm2oOVTuY8anbmc4RjrIinQr0zFvIgipxRL9mcPRqXVQeyMrNW/bdJE/i3k6YEUIUS6GQXfHxdj9NrMf/quEPJJKvlOQmCfyxGs2S+Hn09GxqpkDdLLZb/2L5tHifO4Q+fPhaqw6ZIZ/EGsEwepoGDpRQg=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3723.eurprd04.prod.outlook.com (52.134.72.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 09:06:28 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 09:06:28 +0000
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
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Thread-Topic: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Thread-Index: AQHVCKrxek0Xatu7SEyE08ZoyZ0h7KaLV72w
Date:   Tue, 4 Jun 2019 09:06:28 +0000
Message-ID: <DB3PR0402MB39162F3811484D90546B4CC2F5150@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbab2455-9e5b-45cb-ffc2-08d6e8cbede3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3723;
x-ms-traffictypediagnostic: DB3PR0402MB3723:
x-microsoft-antispam-prvs: <DB3PR0402MB3723941990C3EBC54480B5FBF5150@DB3PR0402MB3723.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(396003)(136003)(346002)(376002)(13464003)(189003)(199004)(186003)(2201001)(2501003)(6506007)(53546011)(102836004)(316002)(26005)(110136005)(6246003)(86362001)(256004)(478600001)(55016002)(53936002)(7416002)(76116006)(11346002)(446003)(68736007)(6436002)(9686003)(66446008)(66556008)(66476007)(66946007)(73956011)(64756008)(3846002)(66066001)(52536014)(5660300002)(71190400001)(229853002)(33656002)(476003)(6116002)(71200400001)(44832011)(76176011)(8676002)(25786009)(7696005)(74316002)(81156014)(99286004)(4326008)(7736002)(8936002)(2906002)(305945005)(486006)(81166006)(14454004)(32563001)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3723;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W/J5pFkoTqq6PAbsMjsZVlo0Xgbq93u0w1T9trf07gkC5N+J+tT+YL99mFPnzCr68369DtWx6xAu5udjHHdZggj0kB890c00Ea/S0Woj4N8Y1nJZapL9TK1FQBWmQ9qX+bUFHMAADy5Zy0O4I0tM+hoSaoGMS/72zJzrAKoTl1MIha2DI1Azq1TGekdkQGG2jwvVY21lXGfi/qxWCwxIXLAgtJ7mP74l/a4qFEPT5jxgWZbj5Ef7y+uSE3WuriczVz/hE+2J8dNZ72fbAXFqMQsjDnmxDQCjmLRmrian6F8KPNsrgVOk4sYCoG91IzFq3DNCIZt/w6YPkzfa0sEIfgOCdyo7QTTl9DPKXOuEeqV20WCMrFHsM7BPWm44XLsDwZ7Oc4lds72PymW0HTr8zf5ABi95zDD5e6CTdaiN6ZA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbab2455-9e5b-45cb-ffc2-08d6e8cbede3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 09:06:28.5012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anson.huang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3723
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIFNoYXduDQoJVGhlIGRyaXZlciBhbmQgYmluZGluZyBkb2MgYXJlIGFscmVhZHkgcmV2aWV3
ZWQgYW5kIHdhaXRpbmcgZm9yIERUIHBhdGNoLCB3aWxsIHlvdSBoZWxwIHJldmlldyB0aGlzIERU
IHBhdGNoPw0KDQpUaGFua3MsDQpBbnNvbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEFuc29uIEh1YW5nDQo+IFNlbnQ6IFN1bmRheSwgTWF5IDEyLCAyMDE5IDY6MTEg
UE0NCj4gVG86IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IHdpbUBs
aW51eC13YXRjaGRvZy5vcmc7DQo+IGxpbnV4QHJvZWNrLXVzLm5ldDsgc2hhd25ndW9Aa2VybmVs
Lm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBm
ZXN0ZXZhbUBnbWFpbC5jb207IEFpc2hlbmcgRG9uZw0KPiA8YWlzaGVuZy5kb25nQG54cC5jb20+
OyB1bGYuaGFuc3NvbkBsaW5hcm8ub3JnOyBEYW5pZWwgQmFsdXRhDQo+IDxkYW5pZWwuYmFsdXRh
QG54cC5jb20+OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47DQo+IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gd2F0
Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcNCj4gQ2M6IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+IFN1YmplY3Q6IFtQ
QVRDSCBSRVNFTkQgVjQgMi8zXSBhcm02NDogZHRzOiBpbXg4cXhwOiBNb3ZlIHdhdGNoZG9nIG5v
ZGUNCj4gaW50byBzY3Ugbm9kZQ0KPiANCj4gaS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRv
ZyBoYXMgcHJldGltZW91dCBmdW5jdGlvbiB3aGljaCBkZXBlbmRzIG9uDQo+IGkuTVggU0NVIGRy
aXZlciwgc28gaXQgc2hvdWxkIGJlIGEgc3Vibm9kZSBvZiBTQ1UuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gLS0tDQo+IE5vIGNoYW5n
ZSwganVzdCByZXNlbmQgcGF0Y2ggd2l0aCBjb3JyZWN0IGVuY29kaW5nLg0KPiAtLS0NCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSB8IDEwICsrKysrLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNp
DQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGluZGV4
IDA2ODNlZTIuLmIxN2MyMmUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhxeHAuZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4cXhwLmR0c2kNCj4gQEAgLTE0OSw2ICsxNDksMTEgQEANCj4gIAkJcnRjOiBydGMgew0K
PiAgCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy1ydGMiOw0KPiAgCQl9Ow0KPiArDQo+
ICsJCXdhdGNoZG9nIHsNCj4gKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0Iiwg
ImZzbCxpbXgtc2Mtd2R0IjsNCj4gKwkJCXRpbWVvdXQtc2VjID0gPDYwPjsNCj4gKwkJfTsNCj4g
IAl9Ow0KPiANCj4gIAl0aW1lciB7DQo+IEBAIC01MTcsOSArNTIyLDQgQEANCj4gIAkJCXBvd2Vy
LWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX0dQSU9fNz47DQo+ICAJCX07DQo+ICAJfTsNCj4gLQ0K
PiAtCXdhdGNoZG9nIHsNCj4gLQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy13ZHQiLCAi
ZnNsLGlteC1zYy13ZHQiOw0KPiAtCQl0aW1lb3V0LXNlYyA9IDw2MD47DQo+IC0JfTsNCj4gIH07
DQo+IC0tDQo+IDIuNy40DQoNCg==
