Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33442356AB
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 08:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfFEGKR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 02:10:17 -0400
Received: from mail-eopbgr30066.outbound.protection.outlook.com ([40.107.3.66]:22503
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726086AbfFEGKR (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 02:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Db72wNwLNCjACW4OkEMkrk1VZIqZQEtqNd6Bqke5ps=;
 b=RFOO1NGiOH0EpWEsHbCOf9B23Afnd4JbOWKdnybs5PZGrZ2enrEeP+GoP69PlsSIJ50TVhOJlKJkV0QL187xpAEr05r3qMbulzUFopOMO8+m/Qx7uccIDLc7XyCB1veVwpVdtXt5Nmpl/Wz5BhpwuENj+LQWQemvOh1E028UmsQ=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3866.eurprd04.prod.outlook.com (52.134.71.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 06:09:12 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::5835:e874:bd94:fec%5]) with mapi id 15.20.1943.023; Wed, 5 Jun 2019
 06:09:12 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
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
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Thread-Topic: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Thread-Index: AQHVCKrxek0Xatu7SEyE08ZoyZ0h7KaLV72wgAFewQCAAAG+sA==
Date:   Wed, 5 Jun 2019 06:09:12 +0000
Message-ID: <DB3PR0402MB39161D679A11B05ADCA8A28BF5160@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
 <DB3PR0402MB39162F3811484D90546B4CC2F5150@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190605060000.GA29853@dragon>
In-Reply-To: <20190605060000.GA29853@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 609bb4ae-5001-4178-9a2b-08d6e97c5485
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3866;
x-ms-traffictypediagnostic: DB3PR0402MB3866:
x-microsoft-antispam-prvs: <DB3PR0402MB3866EA2E70096753F939FC90F5160@DB3PR0402MB3866.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(136003)(396003)(346002)(376002)(13464003)(199004)(189003)(11346002)(2906002)(53936002)(316002)(478600001)(52536014)(99286004)(33656002)(14454004)(5660300002)(55016002)(6246003)(74316002)(7736002)(476003)(6436002)(229853002)(9686003)(7416002)(86362001)(486006)(54906003)(68736007)(73956011)(76176011)(66946007)(81166006)(81156014)(66446008)(8936002)(66066001)(8676002)(64756008)(71200400001)(71190400001)(26005)(186003)(305945005)(256004)(66476007)(66556008)(76116006)(44832011)(4326008)(25786009)(102836004)(6116002)(6506007)(6916009)(53546011)(3846002)(446003)(7696005)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3866;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iBT9eEv4XovsbVCYl6CRe4rURH3wdXD6G/SUcDBmTreCe7VRvctcVtxfxxvNbanGC+uvEMaRsJci2OrJf7JiBwKpyhNz9g1Fn5mwOgmJHY6SR0sjuwO34vVHWlNmHzMi/IAucl61+MeKykNf+GT36ew7ImoBLQOw3p9iSjjWFZVE9bKcY/80sfcSsXhJ4BSNlTyQ4CiqCA/vKokBIL9rHMVKxx6dRbWp5mQhRYxESRwJ8qujznD4bRJyzyZuU4oocCBc6ftrw14GuRUh407hfKfNFwdlrWaNtT/9v9EOhNcl+vcy+Q2rKtaC6bCoq7I7M5mhVOrwL/yPOWTSTbIlAA9y28mZUHCe/o4Hg9XGN3Ir37i5g/FlaM5PEIC44XvZh2t5qbqqrpTKyM5gT6SMID/KN24/vrrubzzHU2w/XpA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609bb4ae-5001-4178-9a2b-08d6e97c5485
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 06:09:12.0913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anson.huang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3866
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIFNoYXduDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhd24g
R3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNSwgMjAx
OSAyOjAwIFBNDQo+IFRvOiBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gQ2M6
IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IHdpbUBsaW51eC13YXRj
aGRvZy5vcmc7DQo+IGxpbnV4QHJvZWNrLXVzLm5ldDsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsg
a2VybmVsQHBlbmd1dHJvbml4LmRlOw0KPiBmZXN0ZXZhbUBnbWFpbC5jb207IEFpc2hlbmcgRG9u
ZyA8YWlzaGVuZy5kb25nQG54cC5jb20+Ow0KPiB1bGYuaGFuc3NvbkBsaW5hcm8ub3JnOyBEYW5p
ZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+OyBQZW5nIEZhbg0KPiA8cGVuZy5mYW5A
bnhwLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0t
DQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBu
eHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJFU0VORCBWNCAyLzNdIGFybTY0OiBkdHM6
IGlteDhxeHA6IE1vdmUgd2F0Y2hkb2cNCj4gbm9kZSBpbnRvIHNjdSBub2RlDQo+IA0KPiBPbiBU
dWUsIEp1biAwNCwgMjAxOSBhdCAwOTowNjoyOEFNICswMDAwLCBBbnNvbiBIdWFuZyB3cm90ZToN
Cj4gPiBIaSwgU2hhd24NCj4gPiAJVGhlIGRyaXZlciBhbmQgYmluZGluZyBkb2MgYXJlIGFscmVh
ZHkgcmV2aWV3ZWQgYW5kIHdhaXRpbmcgZm9yIERUDQo+IHBhdGNoLCB3aWxsIHlvdSBoZWxwIHJl
dmlldyB0aGlzIERUIHBhdGNoPw0KPiANCj4gSSdtIGZpbmUgd2l0aCBpdC4gIFNob3VsZCBJIGp1
c3QgcGljayB0aGlzIHBhdGNoIHVwLCBvciBpcyB0aGVyZSBhbnkgZGVwZW5kZW5jeQ0KPiB3ZSBu
ZWVkIHRvIGhhbmRsZT8NCg0KTm8gZGVwZW5kZW5jeSwgaXQganVzdCBtYWtlcyBtb3JlIHNlbnNl
IHRvIG1vdmUgdGhlIG5vZGUgaW50byBTQ1Ugbm9kZSBhcyBpdCBpcyBOT1cgZGVwZW5kaW5nIG9u
IFNDVQ0KZHJpdmVyLiBPbmNlIHlvdSBwaWNrIHVwIHRoaXMgcGF0Y2ggKGFuZCBtYXliZSB0aGUg
ZHQtYmluZGluZyBwYXRjaCBhcyB3ZWxsPyksIEkgd2lsbCBub3RpZnkgdGhlIHdhdGNoZG9nDQpt
YWludGFpbmVyIHRvIHBpY2sgdXAgdGhlIHdhdGNoZG9nIHBhdGNoIGluIHRoaXMgc2VyaWVzLg0K
DQpUaGFua3MsDQpBbnNvbg0KDQo+IA0KPiBTaGF3bg0KPiANCj4gPg0KPiA+IFRoYW5rcywNCj4g
PiBBbnNvbg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJv
bTogQW5zb24gSHVhbmcNCj4gPiA+IFNlbnQ6IFN1bmRheSwgTWF5IDEyLCAyMDE5IDY6MTEgUE0N
Cj4gPiA+IFRvOiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOw0KPiA+
ID4gd2ltQGxpbnV4LXdhdGNoZG9nLm9yZzsgbGludXhAcm9lY2stdXMubmV0OyBzaGF3bmd1b0Br
ZXJuZWwub3JnOw0KPiA+ID4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJv
bml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207DQo+ID4gPiBBaXNoZW5nIERvbmcgPGFpc2hlbmcu
ZG9uZ0BueHAuY29tPjsgdWxmLmhhbnNzb25AbGluYXJvLm9yZzsgRGFuaWVsDQo+ID4gPiBCYWx1
dGEgPGRhbmllbC5iYWx1dGFAbnhwLmNvbT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsN
Cj4gPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC0NCj4gPiA+IHdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gPiBDYzogZGwtbGludXgtaW14IDxsaW51
eC1pbXhAbnhwLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCBSRVNFTkQgVjQgMi8zXSBhcm02
NDogZHRzOiBpbXg4cXhwOiBNb3ZlIHdhdGNoZG9nDQo+ID4gPiBub2RlIGludG8gc2N1IG5vZGUN
Cj4gPiA+DQo+ID4gPiBpLk1YIHN5c3RlbSBjb250cm9sbGVyIHdhdGNoZG9nIGhhcyBwcmV0aW1l
b3V0IGZ1bmN0aW9uIHdoaWNoDQo+ID4gPiBkZXBlbmRzIG9uIGkuTVggU0NVIGRyaXZlciwgc28g
aXQgc2hvdWxkIGJlIGEgc3Vibm9kZSBvZiBTQ1UuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IE5v
IGNoYW5nZSwganVzdCByZXNlbmQgcGF0Y2ggd2l0aCBjb3JyZWN0IGVuY29kaW5nLg0KPiA+ID4g
LS0tDQo+ID4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpIHwg
MTAgKysrKystLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KPiA+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiA+IGluZGV4IDA2ODNlZTIuLmIxN2MyMmUgMTAwNjQ0
DQo+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kN
Cj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0K
PiA+ID4gQEAgLTE0OSw2ICsxNDksMTEgQEANCj4gPiA+ICAJCXJ0YzogcnRjIHsNCj4gPiA+ICAJ
CQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQo+ID4gPiAgCQl9Ow0KPiA+ID4g
Kw0KPiA+ID4gKwkJd2F0Y2hkb2cgew0KPiA+ID4gKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhx
eHAtc2Mtd2R0IiwgImZzbCxpbXgtc2Mtd2R0IjsNCj4gPiA+ICsJCQl0aW1lb3V0LXNlYyA9IDw2
MD47DQo+ID4gPiArCQl9Ow0KPiA+ID4gIAl9Ow0KPiA+ID4NCj4gPiA+ICAJdGltZXIgew0KPiA+
ID4gQEAgLTUxNyw5ICs1MjIsNCBAQA0KPiA+ID4gIAkJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElN
WF9TQ19SX0dQSU9fNz47DQo+ID4gPiAgCQl9Ow0KPiA+ID4gIAl9Ow0KPiA+ID4gLQ0KPiA+ID4g
LQl3YXRjaGRvZyB7DQo+ID4gPiAtCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXdkdCIs
ICJmc2wsaW14LXNjLXdkdCI7DQo+ID4gPiAtCQl0aW1lb3V0LXNlYyA9IDw2MD47DQo+ID4gPiAt
CX07DQo+ID4gPiAgfTsNCj4gPiA+IC0tDQo+ID4gPiAyLjcuNA0KPiA+DQo=
