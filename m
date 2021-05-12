Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8C437BBDD
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 13:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhELLfs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 07:35:48 -0400
Received: from mail-eopbgr70087.outbound.protection.outlook.com ([40.107.7.87]:5505
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230037AbhELLfs (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 07:35:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhkhZt6ZcA0oFxpqn4OeTjlIybZwkdZ1ndknHjCCS5P/yBruws/ec9pqCTUBSEkV7dnRh81VvK7fh2G1Re7en8nztcHuODGdTQ3ZE4iv40BbYeb4GGJMx/umjB1+hD6wKNzinjEYjAlRiaRN0yjJ4v7dWmtjAb1+8uEh3K9m3VkQ4e0bsnTWHoy9T+igA/DjLbujPgzDwF2KapiSjUfpSxqGTB9nu6m6CoBf7Ur33hqMp0k4Ucc4dl3O2Jb+wBONQzI4jpeAzQf7l5BL69wKYzkSZXS1IN4THkRfoMiMeusg7+jqmpNOLtw/uMujQ0fRjfKn1Jc3euHlRgpGxVUZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PfDdnt/ZtHJVrn6wi4WdqSZZ/3AJdNaTvbIlY0kXQc=;
 b=ZNcETGuh0R9coNPzwCqJLnzApegreciYk3o0NqS19hPGqIXwL2zpGfDC9ONyrg+YJOwvHf45t7N6NXrK1mQAWQkGjekm+0u4X+oBhHdJsDiIIlNGH4qRibGhX1FiMtx8429vsF4M9G0mlaBcUHhfrIQ9sqIWihkHeSJjUFbN8bQCUSr9ku/e2qx8k1nnMd2eIhZo/RrH3kmAA/mSVKSkCcj6opQ+1IueuMKfq5LiyUjsFhQSznR9rQ+LtEQS9V9th7+HqzfPeCF7le6ubBFjSo1zD7n48UMpWGH3mMoluXpWDyDc4NiRxPRxGJiB3uaaaJnp2vfU0jzmnKUOteixgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PfDdnt/ZtHJVrn6wi4WdqSZZ/3AJdNaTvbIlY0kXQc=;
 b=S44Yu6wt5z4ejGkTLAcu6aNGJ0C3k8jtRILM3JFV9abgjOCd/Hh6bpnHKzVSL/6ItFzqBFT81QqZoChn6UfAKZoPIM3xY7HbK3AxcOyNB/jwCMem4zPaalRI198XvJLuU4LGF8jUhouL9v3hcuhuQAmEfP5LedDpNRklGNrom8Y=
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com (2603:10a6:803:127::25)
 by VI1PR04MB6285.eurprd04.prod.outlook.com (2603:10a6:803:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 11:34:37 +0000
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca]) by VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 11:34:37 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] watchdog: imx2_wdt: clear WDOG_HW_RUNNING before
 suspend
Thread-Topic: [PATCH v1] watchdog: imx2_wdt: clear WDOG_HW_RUNNING before
 suspend
Thread-Index: AQHXRhJF8Us7ySGmV06kW0fPHW7nEqrdp+uAgAIKKQA=
Date:   Wed, 12 May 2021 11:34:37 +0000
Message-ID: <VE1PR04MB66889A576AD92D4D789199D489529@VE1PR04MB6688.eurprd04.prod.outlook.com>
References: <1620732032-7675-1-git-send-email-yibin.gong@nxp.com>
 <d5364293-8cba-0d39-aa45-a55c5d6d2af6@roeck-us.net>
In-Reply-To: <d5364293-8cba-0d39-aa45-a55c5d6d2af6@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [101.224.53.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 740ae9dc-5e4b-4bee-105c-08d91539ecba
x-ms-traffictypediagnostic: VI1PR04MB6285:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB62856BA78068410FB231CA0B89529@VI1PR04MB6285.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L8Aj9jPsXx3z4J6J1mEthALSxTWLaPT8oExXVzKonDsoYLm1kJLOGAROfCHCg5vK/skXTRUKw+fcF4BtS0XDNNvlYyLDLC4JdOdTw0/T2VnzMzXdtTy5bLkuL7aGgapWZiwT5ak3vFAaX8rzjeF2FzHSqAZE5fYf8AsMpBgpxpN/eLQ0VqPGSdKSuxyiy7AVGq//OueD0aRuIMKcj9+cQvywJyQAMmHtyujJWwyIPoy2GLLFRJwzIAFg5DbuOz6ngeHCrQeAaAbAFnQZlaVFgDwSbvmslD+Z2s3UjXJdB0VQWeTZxTu0ZHZc0Qty4bG/MP7NoO8jFnI6gQBdzNzUw1F9xk5IJL6U9Dc5QulQkDb6hz4qBEK3q46kV8JYOm2Q3mzlMQKGOZ0rmhnGd2N1p34BkrnVXyBv9Px6n3HSyRW4Vm3DnwS+YB3WYCQovG7wKYOr27oz3F23vnvPqRNJ9pMwWmOA34Qjk4GSzRzRTre9pUka4OHSMzizFQuP13TQF9XIb1UYmXvpBPgyAyhHnvAX54crgQDMzYvC50K/4fVjgjTAczEM22O/N5uBk1ZX3r2EChCPnRRHyNjKj8Ubv1GEIZN6F3P2852kenZwsgc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(83380400001)(38100700002)(122000001)(54906003)(8676002)(64756008)(66476007)(66946007)(5660300002)(66556008)(52536014)(110136005)(76116006)(186003)(8936002)(478600001)(316002)(53546011)(6506007)(26005)(4326008)(55016002)(71200400001)(86362001)(7696005)(2906002)(33656002)(9686003)(66446008)(15650500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SjhJWU8yQ3lDY1NMUmhWU3Q3OEVDaDJGQm8rNk01ZjVxSnZlZHJxQlRmR1dV?=
 =?utf-8?B?dERuY2t0dXIzaVFzTUpKN080VkJsbXJROGlGTXZ4SXdTdHRuZm5kaFRGdHIr?=
 =?utf-8?B?TFRma05rQnYwRUYzVDBreXlhbWt4SGIxWTFlWUJWdEJHM09qOHVPVFhXQlFY?=
 =?utf-8?B?elhVcFdyZVE4dkZVMVhadTVoeHJOQVJPN1NEMlMrc2puTWFkRy9TVHFmNmtW?=
 =?utf-8?B?VjVMU1V1amVmcmlFUFgweTV5ZFZ5MTY0T0xReEdKWjBzMTJ1RU56RURXbndQ?=
 =?utf-8?B?OGt0V0NheHY5dE5ZVlVlcVhFclZZY1JRemRrUzA4MWI3Y1pJZS9XTFpvL21t?=
 =?utf-8?B?bW5vR2dxUlVleURBNjNGbFowSExVdHRPelBsRjhTdEs1QTI3VFJlVkthbU1D?=
 =?utf-8?B?TVJDaDdKdWx5NUlYSEYxWXpxQ1lJUDBGenVSRFNMdVBLbklGZENOeFFyR2Yz?=
 =?utf-8?B?R2tYWHF3VDROY0xwNERsNkRxTlZOQUNzclhiNkdLNFhpSGs1c211dXhZOFBL?=
 =?utf-8?B?ckVDNlZJaUJ1S0JLNFNNNVIrRmFrajJLd1pEY3BwbTNjcnRtcUw0UWgwVjd4?=
 =?utf-8?B?bDA4ck9HN2FybkdWTEZCTHBaUmNTZ3NNeElSQnBDR3NHazVrcVE1WXRIaHFO?=
 =?utf-8?B?S0JrRmpDY0VObkE4Rk5CSWRoNFYwTGdDWml6YVZvYkRmTUlha0kwZ0RoY2N4?=
 =?utf-8?B?MUp5SENkaTNPUk5tV2Fac2JGeG1Pb25XSGZMMW1ScjYyY3M3VEFXMldaRjZT?=
 =?utf-8?B?S09oLzBlOFVCalJEb2hrNmV3cWU4eEFteWVLUy9EN25Ib29qS0gzWHBCcU1t?=
 =?utf-8?B?Qmd6UW9ySVJHL0tXSk92azY3OTdzd3FrdEVOVXllNzN5ZGM3T2Z0Mm40anVz?=
 =?utf-8?B?V3NVM0U2cnE3MStWc1Z2azBzblZpbXhTNzZtbDdiSC81YmdCc2c4VDlVQ0tq?=
 =?utf-8?B?cU51RFZwNWdhVE5mNk9rUWZwdzlNV084OEdaY2Y4dTd4QTZqSXkyc1RhTlU1?=
 =?utf-8?B?SlMvaGFtN1B3TVg1anZHWnBISGJ0dEZXQTJrWldCZzZsZFN1b2dYT09CVHF5?=
 =?utf-8?B?ZUJSZnlLK21xeGlNYzg0ZTlhdHN4RDl2M1QxWjllZnVuczBIRVhWdTBBdkFP?=
 =?utf-8?B?ZlRLbFVRMWpzYTVTdDVCRVozYmlyMFVsWEY5RVdITkZPc0dKOVQwRXF0MGRB?=
 =?utf-8?B?M1pkVk1WN3cwNElUV29qZjYyaGs1dlN2WUMyMnlZRG5ZMEZjMEpsVFEreXpE?=
 =?utf-8?B?N0NhQW4vb0w0WmRxbDBaL3BTakFpcmwzTkVwMDU1WTlkY2ZNR3d3cit6ZzQw?=
 =?utf-8?B?bjMzUU96L0lHNTNoMGhxZjVmWTFFT3JHNzNRZDVyZ2g5Rjd2dzF6ekRyOG8r?=
 =?utf-8?B?UCtsQWJka0hGcC9FNzVnMnliYzFEZ0lnZVJrcDV0alF0TGpIVTFFR21Ia1ll?=
 =?utf-8?B?RGl5Y3IxOWxXWFU3cGVlcllvbnpJSHlFeXorVGV0a0QyeVJkWUtLZ1BuU0FI?=
 =?utf-8?B?eGlNRisra3ZDY0pramhnVXcwcWtaaWZwb1diSTFoeUZ6V3cxSXBVKzZ2bXVz?=
 =?utf-8?B?S2p4YlZ1RmY5ejlZOSt1V21VenhPTTJ2ekUvb3pySGRKRFc4cDcwaDFPcVJv?=
 =?utf-8?B?dXI4S05pTFVBcHRkUGczK1hzZlU2bEJkb2JVS3FwVndmc0lFMFdGYWQzOEc0?=
 =?utf-8?B?RG5idC9QTVQycUk5UitSVEE3SGVBb1ZrMzNqd3NZd215aXR0UytPVWx4Y2Yw?=
 =?utf-8?Q?W9lw0gTnU0Oic9Unhw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740ae9dc-5e4b-4bee-105c-08d91539ecba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 11:34:37.6982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHGDDoqyQ5nuf0kMg9wSwHoqZdFY5fGyEDYfaGlgsKAJzEGXpwI/09fBY4P8TygV4JnNNB1PDhh6+wc3czbMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6285
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gMjAyMS8wNS8xMSAxMTo1OSBHdWVudGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gd3Jv
dGU6IA0KPiBPbiA1LzExLzIxIDQ6MjAgQU0sIFJvYmluIEdvbmcgd3JvdGU6DQo+ID4gU2luY2Ug
d2F0Y2hkb2dfcGluZ193b3JrIGlzIG5vdCBmcmVlemFibGUgc28gdGhhdCBpdCBtYXliZSBzY2hl
ZHVsZWQNCj4gPiBiZWZvcmUgaW14Ml93ZHRfcmVzdW1lIHdoZXJlIHdhdGNoZG9nIGNsb2NrIGVu
YWJsZWQsIGhlbmNlLCBrZXJuZWwNCj4gPiB3aWxsIGhhbmcgaW4gaW14Ml93ZHRfcGluZyB3aXRo
b3V0IGNsb2NrLCBhbmQgdGhlbiB3YXRjaGRvZyByZXNldA0KPiA+IGhhcHBlbi4gUHJldmVudCB0
aGUgYWJvdmUgY2FzZSBieSBjbGVhcmluZyBXRE9HX0hXX1JVTk5JTkcgYmVmb3JlDQo+ID4gc3Vz
cGVuZCwgYW5kIHJlc3RvcmUgaXQgd2l0aCBwaW5nIGluIGlteDJfd2R0X3Jlc3VtZS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFJvYmluIEdvbmcgPHlpYmluLmdvbmdAbnhwLmNvbT4NCj4gPiAt
LS0NCj4gPiAgIGRyaXZlcnMvd2F0Y2hkb2cvaW14Ml93ZHQuYyB8IDggKysrKysrKysNCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3dhdGNoZG9nL2lteDJfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL2lteDJfd2R0LmMN
Cj4gPiBpbmRleCBiODRmODBmLi5kMzc1MWU5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0
Y2hkb2cvaW14Ml93ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvaW14Ml93ZHQuYw0K
PiA+IEBAIC0zNTcsNiArMzU3LDEzIEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQNCj4gaW14
Ml93ZHRfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICAJCSAqLw0KPiA+ICAgCQlf
X2lteDJfd2R0X3NldF90aW1lb3V0KHdkb2csIElNWDJfV0RUX01BWF9USU1FKTsNCj4gPiAgIAkJ
aW14Ml93ZHRfcGluZyh3ZG9nKTsNCj4gPiArDQo+ID4gKwkJLyoNCj4gPiArCQkgKiBjbGVhciBX
RE9HX0hXX1JVTk5JTkcgdG8gcHJldmVudCB3YXRjaGRvZ19waW5nX3dvcmsNCj4gcnVubmluZw0K
PiA+ICsJCSAqIGJlZm9yZSBpbXgyX3dkdF9yZXN1bWUgd2hlcmUgY2xvY2sgZW5hYmxlZCwgb3Ro
ZXJ3aXNlIGtlcm5lbA0KPiA+ICsJCSAqIHdpbGwgaGFuZyBhbmQgd2F0Y2hkb2cgcmVzZXQgaGFw
cGVuIHRoZW4uDQo+ID4gKwkJICovDQo+ID4gKwkJY2xlYXJfYml0KFdET0dfSFdfUlVOTklORywg
Jndkb2ctPnN0YXR1cyk7DQo+ID4gICAJfQ0KPiA+DQo+ID4gICAJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKHdkZXYtPmNsayk7DQo+ID4gQEAgLTM4Niw2ICszOTMsNyBAQCBzdGF0aWMgaW50IF9fbWF5
YmVfdW51c2VkIGlteDJfd2R0X3Jlc3VtZShzdHJ1Y3QNCj4gZGV2aWNlICpkZXYpDQo+ID4gICAJ
aWYgKGlteDJfd2R0X2lzX3J1bm5pbmcod2RldikpIHsNCj4gPiAgIAkJaW14Ml93ZHRfc2V0X3Rp
bWVvdXQod2RvZywgd2RvZy0+dGltZW91dCk7DQo+ID4gICAJCWlteDJfd2R0X3Bpbmcod2RvZyk7
DQo+ID4gKwkJc2V0X2JpdChXRE9HX0hXX1JVTk5JTkcsICZ3ZG9nLT5zdGF0dXMpOw0KPiA+ICAg
CX0NCj4gPg0KPiA+ICAgCXJldHVybiAwOw0KPiA+DQo+IEkgcmVhbGx5IGRvbid0IGxpa2UgdGhp
czsgaXQgZGVwZW5kcyBvbiBhc3N1bXB0aW9ucyBob3cgdGhlIHdhdGNoZG9nIGNvcmUNCj4gd29y
a3MsIGFuZCBpdCBtaXN1c2VzIFdET0dfSFdfUlVOTklORyB0byBpbmRpY2F0ZSB0aGF0IHRoZSBj
bG9jayBpcw0KPiBzdG9wcGVkIChvciB0aGF0IHRoZSBkcml2ZXIgaXMgaW4gc3VzcGVuZCBtb2Rl
KS4NCj4gDQo+IElmIHBpbmcgZG9lc24ndCB3b3JrIHdpdGggdGhlIGNsb2NrIHN0b3BwZWQsIEkg
dGhpbmsgaXQgd291bGQgYmUgbXVjaCBiZXR0ZXIgdG8NCj4gaGF2ZSBhIGZsYWcgaW5kaWNhdGlu
ZyB0aGF0IHRoZSBjbG9jayBpcyBzdG9wcGVkLCBhbmQgaGF2ZSB0aGUgcGluZyBmdW5jdGlvbiBk
bw0KPiBub3RoaW5nIGlmIGl0IGlzIGNhbGxlZCB3aXRoIHN0b3BwZWQgY2xvY2sgKGllIGlmIHN1
c3BlbmRlZCkuDQo+IA0KVW5kZXJzdG9vZCwgYnV0IEkgdGhpbmsgdGhhdCBjb3JuZXIgY2FzZSBz
aG91bGQgYmUgYSBjb21tb24gcG90ZW50aWFsIGlzc3VlDQppbiBhbGwgd2F0Y2hkb2cgZHJpdmVy
cyB3aGljaCBkaXNhYmxlIGNsb2NrIGluIHN1c3BlbmQgd2l0aCBXRE9HX0hXX1JVTk5JTkcuDQpT
byBjb21tb24gd2F5IGxvb2tzIGJldHRlciB0aGFuIG1hbnkgZGlmZmVyZW50IHNwZWNpZmljIGZs
YWdzIGluIHN1Y2ggZGlmZmVyZW50DQp3YXRjaGRvZyBkcml2ZXIgd2l0aCB0aGUgc2ltaWxhciBp
bnRlbnRpb24/DQoNCkJUVywgZm9yIGkubXgyX3dkdCB3aGljaCB3YXRjaGRvZyBjYW4ndCBiZSBz
dG9wIHVubGVzcyBrZXJuZWwgZW50ZXIgaW50byBzdXNwZW5kLA0KdGhhdCBzZWVtcyBsaWtlIHdh
dGNoZG9nIHN0b3AgYWZ0ZXIgc3VzcGVuZCBhbmQgY2xlYXIgV0RPR19IV19SVU5OSU5HIG1ha2Vz
DQpzZW5zZT8gDQoNCg==
