Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8A92C621D
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Nov 2020 10:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgK0JoQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Nov 2020 04:44:16 -0500
Received: from mail-eopbgr70077.outbound.protection.outlook.com ([40.107.7.77]:40705
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725989AbgK0JoO (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Nov 2020 04:44:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0lOf0tpuH0lY9BAMw1fcIrn05yvrr5fpC2+Q0GmqMKNR5M0ryOo6SUa26fzmrIFE7ntGKTGsbS647mGAOWfdcJEMBwgRilNl5yRvUiyIyLxzRlkhSRfpQCZN0Wb6qUjqKOL9lPaHlqaUo4mx8RWE7TMfvVcc0cEJWQw41Ekf0GzFcSUVUxTxfjcO3X+fh19Evw3NzFDaivT720PqGzOPItYBta+Tq3/NVxA1Z6Ca/4GJuncmD+dAS8d+bi3GlX29F5AV7/Vs3dWzI9lppB8CvWJ7T71larmOv201xA6XQAKtgtcWI12LFUuRe/6qXh578mNJZm25MVwCEAg3pWBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKrNC9fJMfRTqzx/2xnotFUfieuZFKobqdDWXhTOMDI=;
 b=SYuLwL+ngramXB32LLAGxMiYmNiJd1RxsiauE7Y9TzsBzUjTa1NMwgIvyHk7GNZ1PmfLH8YLv2FK5uH58vPbXnKLWRH4qxgDkUb3tsTfJfv577WfbGmKon+XbpGDtlGltprINDz1/BjO4/5IyejGjrXyT05nhO5h8JNBtCeqQ+RZO4QM0oCKX/D+XyfONVS1KHvakVyWNCQMKQfmm0xGT2hOQczcqjwOK2doCp/nmcOG6cCjnV5xPJDd6zHmht7rpmWBNmuFA7S50kGc9EANw8FHh++Pt7f+hTfqafodFYxzIgc2Jg4FNrDQnAQAM5MnS0a6SMNC9AXdxGmYnYSHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKrNC9fJMfRTqzx/2xnotFUfieuZFKobqdDWXhTOMDI=;
 b=AJiLX+I/7j3R8lcZLLny0Wi8Ns5k6KEKsB4E7dD/XPWVo/vuigiIw+3XmYzQWnEL9DuqVl9FA6Vzjon48GJogZjGoFZR2gSqzRgTemxBST5h6S78gLAER0gvUWrVcBFQXUuVjDt2lEq6xVJsvLK4XghJVT4i44MTSzy4D9Zboyg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2892.eurprd03.prod.outlook.com (2603:10a6:7:60::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.28; Fri, 27 Nov 2020 09:44:08 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::ed77:289e:45e8:6bae]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::ed77:289e:45e8:6bae%5]) with mapi id 15.20.3564.038; Fri, 27 Nov 2020
 09:44:08 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWwWDHZJglj3cu602g/c6U2v2JcanbrP0AgAAT74A=
Date:   Fri, 27 Nov 2020 09:44:08 +0000
Message-ID: <6bd4abcb340bdf764fd23b685684d3f984319ed7.camel@fi.rohmeurope.com>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <20201127083242.GK2455276@dell>
In-Reply-To: <20201127083242.GK2455276@dell>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c48efcb-cfa4-4e06-bc11-08d892b8fcc6
x-ms-traffictypediagnostic: HE1PR03MB2892:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB2892A3C3E1F895C4E65A9C50ADF80@HE1PR03MB2892.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kv9NOCuUKGvlHougVZOGLY4qgGDfiYyAA15wFgbwJlS3mIjn7F7er11xWwkUY3XAzgI7eSYQLFAV9HbRQYR3HoWEudSyZb6hlMALgSv8bD/dugaw0zy54AdSgj53B9mgxy6wme9JPevnVa9gAurk7p3j73pNWvkt/Y1UlVM3m/Y8Oxe+ioyzI7YM/2zHCxu/FTGBELuITIu3SqjZMRjD1hx2u5UcY8UUWZfHeYSock/42LQp+iSX4P/AiQHiMyl+6evQ86UtW3l+//xqsqCBOh+HUbYnTY8CDe2z/+VYUkDjFqawSNi9YPftXzLqq9xWahaYb5F2771rm5Z6+kTRbg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(8676002)(54906003)(4326008)(6916009)(316002)(8936002)(6486002)(478600001)(186003)(66556008)(66446008)(2616005)(6512007)(86362001)(76116006)(66476007)(66946007)(64756008)(4001150100001)(3450700001)(5660300002)(2906002)(26005)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TC92UjVLQ2Q2ZlFncXJvdmF0QWNwdFJQQU5KVzB0eTVXaHQwWXRuMGU2Qyt0?=
 =?utf-8?B?UmtPK3o4MDRXdHl3WGN5enk4eWtzWGVLS2xNaVhibjRTSFNXZ2Z6N1ZsSXFk?=
 =?utf-8?B?RFErWWYvdzV2eDZ1L3FPcWplY3VJUklReXZuN2NCNVdOWGpJOUVqcnlmVzhJ?=
 =?utf-8?B?SnJtSElIK0dsU3FNTHoxcGhLbWxtTi9VdUppdUplSFdoMVIvUldodFk5YjIr?=
 =?utf-8?B?a2hOZ2tXUlZ2Rm9aYVQ0aWprZG93WkVpbnpXTnRGRUVOZ3M2cWpTQ0VNY3Nu?=
 =?utf-8?B?RFRheDFvWUV4eWdmUXJySUloK3I2ZytLcVhWbHZxSUI2SkxJWk04azRJRXdE?=
 =?utf-8?B?anVNdlhrTjJrZFFjK2xYV3FzL05tK3Y4VUEwYzNFblF1MWF5NFlnQzhTVlZD?=
 =?utf-8?B?cndoNWs0VFZQUkJDeFE4MFhsNjJ6eFNHN1g0NkZoTGkvbDRSUGR3clFUUjZv?=
 =?utf-8?B?bDNjUHdscFZoTXZmdmRua1lCQWVkRWJQR0lqOVdMaE1uV2VNNGpDVldsRkFC?=
 =?utf-8?B?bzdVNUZuN0lpWG9iWnFFR0JQQXpBdTh0YWY1SnBnZlBOM1FnRitmU1hVRXo3?=
 =?utf-8?B?bFhxQzRnOUJBNmxJSjdQcWNncDlKeDlwbFhsNkU5TFdIMUVLMDRxMG9tWE5w?=
 =?utf-8?B?T0ZzZHY2bXp4OEgrYXJWWFhEb2JyWFhOMW5lWmpZeWpDN1hFd0d3ZTBXZ3Ew?=
 =?utf-8?B?QkF3ekhJY3JSM25uM1hXL0ZqUEZ3TjZLRkxkMThpV0Rqa0ZESksvcVl2dkZi?=
 =?utf-8?B?RmlJb3c0RVJ4eTFMZDE4dFJTT1k0VjZ1UmRXOE1TTHJieWs5T25KMXljY3g2?=
 =?utf-8?B?eUt3ak1YN1V1VmJUQWh1NmZISnVNM1luUHlNOG1VaW5hbVVzYjU3bTJjQW9R?=
 =?utf-8?B?UnpLRUd5TEh2Kzd4bGlJbnhHcERJSTdFTWVheDcwZ2xpcFp2V08yQ003TE1Y?=
 =?utf-8?B?RTg5WTZ0RXdEUEJEWWxJcS9MbUdYOUZVSkpZSDJaZVk5NGhpeEwyUHJuMUlJ?=
 =?utf-8?B?bWFSdjBUZE1VcHNDcnRpcHNOdFV3Q1N4UXNHUThtYjZtMVBPRTd4bUhCVFc0?=
 =?utf-8?B?Z201MElqZlBzTDh6WTI3WlBlMVR1Q0V2YnFnNVowTHE2MjJFaHNpdUp4bkhO?=
 =?utf-8?B?cEVwVEFRRTR5YnhiNThEOGY4YnR6ZHV1MkpZMmY1RGVlaTNBY1pXc1VYTWph?=
 =?utf-8?B?NkhtUGpJK0xZS050clNFWUU4SEFKcHAxMW9JR2U0U3BjNUQzamRyWHk5UVkw?=
 =?utf-8?B?WGtEcXluMjN6bjhYR29xcGFSM0x5VnMzcEhoNmN0dTNtR2NKOXhXci9WZUE5?=
 =?utf-8?Q?EhMjjUba8uMO6qQgHlBUqK6ygjijVRrQHq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91AB2DA2EF4222479E069A9221B0C4C9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c48efcb-cfa4-4e06-bc11-08d892b8fcc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2020 09:44:08.3446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pkh5HwKHZpeuiW2dTakvaPMitEB8+ofZinvJEePdiWYGute9dscncBgea6SH11bQznRPPTFhyJDH2GCQrP2KY1//QVp/sKZE4HZUbbJs0qdb4an3Vk6CxcCt3wSsaZYg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2892
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBGcmksIDIwMjAtMTEtMjcgYXQgMDg6MzIgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gTW9uLCAyMyBOb3YgMjAyMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiANCj4gPiBBZGQgY29yZSBzdXBwb3J0IGZvciBST0hNIEJEOTU3Nk1VRiBhbmQgQkQ5NTczTVVG
IFBNSUNzIHdoaWNoIGFyZQ0KPiA+IG1haW5seSB1c2VkIHRvIHBvd2VyIHRoZSBSLUNhciBzZXJp
ZXMgcHJvY2Vzc29ycy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4g
PG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9tZmQvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMTEgKysrKw0KPiA+ICBkcml2ZXJzL21mZC9N
YWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvbWZkL3JvaG0tYmQ5NTc2
LmMgICAgICAgIHwgMTA4DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
ICBpbmNsdWRlL2xpbnV4L21mZC9yb2htLWJkOTU3eC5oICB8ICA1OSArKysrKysrKysrKysrKysr
Kw0KPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9yb2htLWdlbmVyaWMuaCB8ICAgMiArDQo+ID4gIDUg
ZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbWZkL3JvaG0tYmQ5NTc2LmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvbGludXgvbWZkL3JvaG0tYmQ5NTd4LmgNCj4gDQo+IExvb2tzIGxpa2UgYSBwb3NzaWJsZSBj
YW5kaWRhdGUgZm9yICJzaW1wbGUtbWZkLWkyYyIuDQo+IA0KPiBDb3VsZCB5b3UgbG9vayBpbnRv
IHRoYXQgcGxlYXNlPw0KPiANCkkgbXVzdCBhZG1pdCBJIGRpZG4ndCBrbm93IGFib3V0ICJzaW1w
bGUtbWZkLWkyYyIuIEdvb2QgdGhpbmcgdG8ga25vdw0Kd2hlbiB3b3JraW5nIHdpdGggc2ltcGxl
IGRldmljZXMgOikgSXMgdGhpcyBhIG5ldyB0aGluZz8NCkkgYW0gdW5zdXJlIEkgdW5kZXJzdGFu
ZCB0aGUgaWRlYSBmdWxseS4gU2hvdWxkIHVzZXJzIHB1dCBhbGwgdGhlDQpkaWZmZXJlbnQgcmVn
YW1wIGNvbmZpZ3MgaW4gdGhpcyBmaWxlIGFuZCBqdXN0IGFkZCB0aGUgZGV2aWNlIElEcyB3aXRo
DQpwb2ludGVyIHRvIGNvcnJlY3QgY29uZmlnPyAoQkQ5NTc2IGFuZCBCRDk1NzMgbmVlZCB2b2xh
dGlsZSByYW5nZXMpLg0KQWxzbywgZG9lcyB0aGlzIG1lYW4gZWFjaCBzdWItZGV2aWNlIHNob3Vs
ZCBoYXZlIG93biBub2RlIGFuZCBvd24NCmNvbXBhdGlibGUgaW4gRFQgdG8gZ2V0IGNvcnJlY3Rs
eSBsb2FkIGFuZCBwcm9iZWQ/IEkgZ3Vlc3MgdGhpcyB3b3VsZA0KbmVlZCBhIGJ1eS1pbiBmcm9t
IFJvYiB0b28gdGhlbi4NCg0KQnkgdGhlIHdheSAtIGZvciB1bmVkdWNhdGVkIGV5ZXMgbGlrZSBt
aW5lIHRoaXMgZG9lcyBub3QgbG9vayBsaWtlIGl0DQpoYXMgbXVjaCB0byBkbyB3aXRoIE1GRCBh
cyBhIGRldmljZSAtIGhlcmUgTUZEIHJlbWluZHMgbWUgb2YgYSBzaW1wbGUtDQpidXMgb24gdG9w
IG9mIEkyQy4NCg0KQW55d2F5cywgdGhlIEJEOTU3NiBhbmQgQkQ5NTczIGJvdGggaGF2ZSBhIGZl
dyBpbnRlcnJ1cHRzIGZvciBPVkQvVVZEDQpjb25kaXRpb25zIGFuZCBJIGFtIGV4cGVjdGluZyB0
aGF0IEkgd2lsbCBiZSBhc2tlZCB0byBwcm92aWRlIHRoZQ0KcmVndWxhdG9yIG5vdGlmaWVycyBm
b3IgdGhvc2UuIFJlYXNvbiB3aHkgSSBvbWl0dGVkIHRoZSBJUlFzIGZvciBub3cgaXMNCnRoYXQg
dGhlIEhXIGlzIGRlc2lnbmVkIHRvIGtlZXAgdGhlIElSUSBhc3NlcnRlZCBmb3Igd2hvbGUgZXJy
b3INCmR1cmF0aW9uIHNvIHNvbWUgZGVsYXllZCBhY2sgbWVjaGFuaXNtIHdvdWxkIGJlIG5lZWRl
ZC4gSSB3b3VsZCBsaWtlIHRvDQprZWVwIHRoZSBkb29yIG9wZW4gZm9yIGFkZGluZyBJUlFzIHRv
IE1GRCBjb3JlLg0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0aQ0K
