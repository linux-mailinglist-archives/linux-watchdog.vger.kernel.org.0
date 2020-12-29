Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477BD2E6F14
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Dec 2020 09:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgL2IoX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Dec 2020 03:44:23 -0500
Received: from mail-eopbgr70078.outbound.protection.outlook.com ([40.107.7.78]:35901
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725964AbgL2IoW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Dec 2020 03:44:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URwREVrGp7CpJ1fFtpmjNuNl7TDR0B+cJ1jRy69Wnz0/pnWOZnV93JeClQa/ZNMAY0jBhoY57ds/JjwC9k5lc2KDIFqKPHcpV0AmZgkv00/7A1jjhDaUupiyXE2fZweSoLPNcRSWMuHFlSWHF3Z8ByRDHYjfog4bevx6fkayyb3NGodKvEohZ6W61t9oxMJEYMQQDLxFrJUmjy/kWzP2bH+pLshwkJmfyRZ5xZvukd+zWChDKr3OheXt93fZ4AB5GPA4o1/0RssRn82aRxAD1+srw6W/XgFLZGNjgl3tV+qkUG0Ub850aTmDcATHgjFtY0mH2X+YHx8Rbx1MhhEVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o4JVZ9K1qUMRPzDQ3QCrf5LgUdCW0pMnl1z43K48FA=;
 b=oHs6zBla3em40Q76uXf1I/jlffvNXjozigg/th624y5AJtqH8FdYkUufMPrzCKbSf2C6k5vFm8ZmZztM3QBSBkumUs3JU65t3cqhHkF2pOFyTJQKe04EOUN8h5hIA1BHpjv7iGT5iEuTq6aEqXcMaIHcJlCay+VMyAgrOnMa3PsbdJQu4BBc0I/TNTsDhyZ0x5hT5DTtLLy5OQljpbJmRnKH8RWpf3JBZkWutEWcz/Qa1bxHowKg9cW3O/9/jp1e2Ct6OWyLEPhLnpiJCxfmHWhohpua3mkIDA4e39bTPDekW3WyZ5yBpOjrLNDiySGRF69Rtqz7CxQT/4lY/rOz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o4JVZ9K1qUMRPzDQ3QCrf5LgUdCW0pMnl1z43K48FA=;
 b=j3hIpEC4nfnphZIChJfi7vWqcIY5DN6AwniYdwouRgz30WzNUhaVmLehvjtc9n1ozow2L7Wvv+OIafOyJmxr9P40RmAY91XbCGpdaMuPBhaRqCN6UppLtzSJGl4OG8GtBB0Ffq0g6nMmLtXzbQnyQCQFszQEmMEYMNBeU9sIl7U=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2668.eurprd03.prod.outlook.com (2603:10a6:3:f1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.31; Tue, 29 Dec 2020 08:43:30 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 08:43:29 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWwWDHZJglj3cu602g/c6U2v2JcanbrP0AgAAT74CACBGsgIAACbeAgBdZAYCAEsS6AA==
Date:   Tue, 29 Dec 2020 08:43:29 +0000
Message-ID: <8a6373aa33aa19d850d3802d6579e66b97c8d325.camel@fi.rohmeurope.com>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <20201127083242.GK2455276@dell>
         <6bd4abcb340bdf764fd23b685684d3f984319ed7.camel@fi.rohmeurope.com>
         <20201202125723.GK4801@dell>
         <3bab8bd8c69a878f849a07dd9ea35bfac2006da2.camel@fi.rohmeurope.com>
         <c2949e981014c049571df355501f2af65b3954de.camel@fi.rohmeurope.com>
In-Reply-To: <c2949e981014c049571df355501f2af65b3954de.camel@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21e0d609-ad03-4431-cebe-08d8abd5d13d
x-ms-traffictypediagnostic: HE1PR0302MB2668:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2668113E1D500625ACEA513BADD80@HE1PR0302MB2668.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7sjlSnve5PIVSkVww7a7RqJ8qTA8YUW69FORjrM4Wm/T0IVTt6Yym39IVNsAB70gSi9pVOj+7/SIY4qkZXNZpajgKdyRP6ij9Emq/8QlqZTKZBSp01EpoWA1GSUJLb2L99W4Om7WEdm31DtQXwfBJuWiN81lBKwrKQ3XMglqYQk7SG8mODo+K+37WuMWk2WgjWLC8U23yS2GScpfRJs4hMnyyqfbTQ9SndrTBYNlR+exWlhmMdO4u9OqgI7qrbFHRf9GB4gBZn53Na4q11NCYcME1Tt23/fwppo4eLi22WU60fY2uyvW2sc8/R69Jsbmf9svDtCSZ/dw1a5jHvwUG0EG5CxYgQRVpDS1JdPSTBOtuRHxo4CW5TkSms2VBrsEJHiyDz5SSny7MdT5YH4tNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39840400004)(136003)(366004)(4326008)(71200400001)(83380400001)(8676002)(2906002)(3450700001)(76116006)(64756008)(66446008)(6512007)(66556008)(316002)(66476007)(66946007)(4001150100001)(6486002)(86362001)(5660300002)(54906003)(2616005)(478600001)(6506007)(186003)(26005)(8936002)(109986005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Wm45MzhXaVl1ZzNPZTBtUDgwdlZZdEt5b01rZGVSQ0dybHBZajFObjdWamdN?=
 =?utf-8?B?S2VieGpDQWVBWWRJWlJqRTcrc3NzMDlrSkwvM25oclRLYTFWVHFUVktJbVRR?=
 =?utf-8?B?aDkvZkhkcExuMDN2MkVNLzdLTmpzWW8wcUJ4Qjd3eTVJUnpRM1VwOXJmRGxr?=
 =?utf-8?B?MmRpNy92Tkkra0RBM0hoVndUSHdycDJUVjdhb2M5WGZxM2h5ZzlWUURUUWYv?=
 =?utf-8?B?cmtoekF3c0VoTllwNmFvSWd3TTJNMS9ZSS8rUjNINXk2bDlRWlBocFZaZVJ2?=
 =?utf-8?B?emZxUUdpaWVUdHFwUG5uM1dac2tuSWtzY0ZXcURZQjJrOFhRbnFjMUFwTnFq?=
 =?utf-8?B?bkkwOFBIbzV2aEpzR2tJWXN0dTBLdXoxd0Vzbm9nZk9xRGF3aUlJM3pja1JM?=
 =?utf-8?B?UktvS3k2blRXQ3YwV0w1cTJxNyttenc0b3FLTXh1QktFc0I5Y1FuMFFUdGhS?=
 =?utf-8?B?bmtOYk1YNzRjRmJzVy8xVyt6aWJ2eU5GSFZ4Njl1ZnRhNis2S1NxaHBGa0lX?=
 =?utf-8?B?OXlpVG1USmN0Q3R0UGdXUlYwN2dMeFBuNDZqVjhWb2xMWER3VC92M1dhNVpC?=
 =?utf-8?B?Z0FBamlEY0J1SisxVEY4SmJ4QXNmN1p1TjdDdVpVcjZaWlFoLzhaMGFFQnBS?=
 =?utf-8?B?dGNUUVZ1bFVDVFNHVEt0YVNrRG9QdElEVkE5MnhZNitVQ285aWtsR0M3U1Uv?=
 =?utf-8?B?V25QWlZxUzJOMndrc3gyU3JGTzhNZElWZ1ByUE84Q2QzeEpyZ3VNbmtWU0ZB?=
 =?utf-8?B?eWpzK2ZxQkRxMmo2dGh2TUZLQ0NVNXZyVVNTNlZxdGdmaFNwNk8rTU92WDFI?=
 =?utf-8?B?UlorcXpWRkxxSDdwVTk1cFdXQnRDQ1RGRXdQeFR6UjBSV2JyTk9OdmVMUUdU?=
 =?utf-8?B?a3paTWd3bURkWW5Ia2JPOVJuMTFxMUpUaWlxRDBZYi9SNWl5TmI3cWYxWEFF?=
 =?utf-8?B?YUFMYzhPYVN0Z202TmVCZXNQR1RSaWlWYXJMalBHL1krcjVDQjBYelBzRkVy?=
 =?utf-8?B?WFU1SXllcG1EVXljdXFVZUtLbUZwa0djbCtBRkMxY0dNY3ZoTU9Bc1BzOGta?=
 =?utf-8?B?SkphVm90ZnptZWg3Yms0dysrMTB5VU5TSjE1cDl6QitsTmk2MkNzZnVySlNI?=
 =?utf-8?B?VU1nQlV6ZEN0M1E1c1NlbTgwejlDK3J4OUVacVJjQ3RHeUNUV2tialBZQkcz?=
 =?utf-8?B?QlBpbU80T0xZM2h2Q0d5OFErb3lrY0pmdzBoVlZLcitPZTQ5NkJXdFlMOVox?=
 =?utf-8?B?aFRPamd3TEdabFIvelBYdXkrdFJFYy8yM2F3czIzL0lLNXozZWU0bjhBK1ZJ?=
 =?utf-8?Q?XQAv9OQxLkICiCwLDsnimvlJ+ezAaqX1sR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B0CF7A65EA2A94B9B24BEEDC2283C91@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e0d609-ad03-4431-cebe-08d8abd5d13d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2020 08:43:29.8918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8x4DICio9nkr3lllyU2yUOQdx3LahePhmAWVPLKBHzmtcctirXr40HQrIXRiJ3ej58QQM+8si22+SIiuR4+bMePbs1uxhML/35iUMnHgw0/QPrubLE7spi9CPfVALqiI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2668
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGVsbG8gQWdhaW4gcGVlcHMsDQoNCk9uIFRodSwgMjAyMC0xMi0xNyBhdCAxMjowNCArMDIwMCwg
TWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiBPbiBXZWQsIDIwMjAtMTItMDIgYXQgMTU6MzIgKzAy
MDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiBIZWxsbyBMZWUsDQo+ID4gDQo+ID4gT24g
V2VkLCAyMDIwLTEyLTAyIGF0IDEyOjU3ICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+ID4gPiBP
biBGcmksIDI3IE5vdiAyMDIwLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+ID4gDQo+ID4g
PiA+IEhlbGxvIExlZSwNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIEZyaSwgMjAyMC0xMS0yNyBhdCAw
ODozMiArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1vbiwgMjMgTm92IDIw
MjAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEFkZCBj
b3JlIHN1cHBvcnQgZm9yIFJPSE0gQkQ5NTc2TVVGIGFuZCBCRDk1NzNNVUYgUE1JQ3MNCj4gPiA+
ID4gPiA+IHdoaWNoDQo+ID4gPiA+ID4gPiBhcmUNCj4gPiA+ID4gPiA+IG1haW5seSB1c2VkIHRv
IHBvd2VyIHRoZSBSLUNhciBzZXJpZXMgcHJvY2Vzc29ycy4NCj4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDwNCj4gPiA+ID4gPiA+IG1hdHRp
LnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+
ID4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICAgICAgIHwgIDExICsrKysNCj4gPiA+ID4g
PiA+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArDQo+ID4gPiA+ID4g
PiAgZHJpdmVycy9tZmQvcm9obS1iZDk1NzYuYyAgICAgICAgfCAxMDgNCj4gPiA+ID4gPiA+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ICBpbmNsdWRlL2xpbnV4
L21mZC9yb2htLWJkOTU3eC5oICB8ICA1OSArKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ID4g
IGluY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oIHwgICAyICsNCj4gPiA+ID4gPiA+ICA1
IGZpbGVzIGNoYW5nZWQsIDE4MSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL3JvaG0tYmQ5NTc2LmMNCj4gPiA+ID4gPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvcm9obS1iZDk1N3guaA0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IExvb2tzIGxpa2UgYSBwb3NzaWJsZSBjYW5kaWRhdGUgZm9yICJzaW1wbGUtbWZk
LWkyYyIuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQ291bGQgeW91IGxvb2sgaW50byB0aGF0IHBs
ZWFzZT8NCj4gPiA+ID4gPiANCj4gPiA+ID4gSSBtdXN0IGFkbWl0IEkgZGlkbid0IGtub3cgYWJv
dXQgInNpbXBsZS1tZmQtaTJjIi4gR29vZCB0aGluZw0KPiA+ID4gPiB0bw0KPiA+ID4gPiBrbm93
DQo+ID4gPiA+IHdoZW4gd29ya2luZyB3aXRoIHNpbXBsZSBkZXZpY2VzIDopIElzIHRoaXMgYSBu
ZXcgdGhpbmc/DQo+ID4gPiANCj4gPiA+IFllcywgaXQncyBuZXcuDQo+ID4gPiANCj4gPiA+ID4g
SSBhbSB1bnN1cmUgSSB1bmRlcnN0YW5kIHRoZSBpZGVhIGZ1bGx5LiBTaG91bGQgdXNlcnMgcHV0
IGFsbA0KPiA+ID4gPiB0aGUNCj4gPiA+ID4gZGlmZmVyZW50IHJlZ2FtcCBjb25maWdzIGluIHRo
aXMgZmlsZSBhbmQganVzdCBhZGQgdGhlIGRldmljZQ0KPiA+ID4gPiBJRHMNCj4gPiA+ID4gd2l0
aA0KPiA+ID4gPiBwb2ludGVyIHRvIGNvcnJlY3QgY29uZmlnPyAoQkQ5NTc2IGFuZCBCRDk1NzMg
bmVlZCB2b2xhdGlsZQ0KPiA+ID4gPiByYW5nZXMpLg0KPiA+ID4gPiBBbHNvLCBkb2VzIHRoaXMg
bWVhbiBlYWNoIHN1Yi1kZXZpY2Ugc2hvdWxkIGhhdmUgb3duIG5vZGUgYW5kDQo+ID4gPiA+IG93
bg0KPiA+ID4gPiBjb21wYXRpYmxlIGluIERUIHRvIGdldCBjb3JyZWN0bHkgbG9hZCBhbmQgcHJv
YmVkPyBJIGd1ZXNzIHRoaXMNCj4gPiA+ID4gd291bGQNCj4gPiA+ID4gbmVlZCBhIGJ1eS1pbiBm
cm9tIFJvYiB0b28gdGhlbi4NCj4gPiA+IA0KPiA+ID4gWW91IHNob3VsZCBkZXNjcmliZSB0aGUg
SC9XIGluIERULg0KPiA+IA0KPiA+IFllcy4gQW5kIGl0IGlzIGRlc2NyaWJlZC4gQnV0IEkndmUg
b2NjYXNpb25hbGx5IHJlY2VpdmVkIHJlcXVlc3QNCj4gPiBmcm9tDQo+ID4gRFQgZ3V5cyB0byBh
ZGQgc29tZSBwcm9wZXJ0aWVzIGRpcmVjdGx5IHRvIE1GRCBub2RlIGFuZCBub3QgdG8gYWRkDQo+
ID4gb3duDQo+ID4gc3ViLW5vZGUuIFRoaXMgaXMgd2hhdCBpcyBkb25lIGZvciBleGFtcGxlIHdp
dGggdGhlIEJENzE4MzcvNDcNCj4gPiBjbG9ja3MNCj4gPiAtDQo+ID4gdGhlcmUgaXMgbm8gb3du
IG5vZGUgZm9yIGNsayAtIHRoZSBjbGsgcHJvcGVydGllcyBhcmUgcGxhY2VkDQo+ID4gZGlyZWN0
bHkNCj4gPiBpbiBNRkQgbm9kZSAoYXMgd2FzIHJlcXVlc3RlZCBieSBTdGVwaGVuIGFuZCBSb2Ig
YmFjayB0aGVuIC0gSQ0KPiA+IG9yaWdpbmFsbHkgaGFkIG93biBub2RlIGZvciBjbGspLiBJIHJl
YWxseSBoYXZlIG5vIGNsZWFyIHZpZXcgb24NCj4gPiB3aGVuDQo+ID4gdGhpbmdzIHdhcnJhbnQg
Zm9yIG93biBzdWJub2RlIGFuZCB3aGVuIHRoZXkgZG9uJ3QgLSBidXQgYXMgZmFyIGFzDQo+ID4g
SQ0KPiA+IGNhbiBzZWUgdXNpbmcgc2ltcGxlLW1mZC1pMmMgZm9yY2VzIG9uZSB0byBhbHdheXMg
aGF2ZSBhIHN1Yi1ub2RlIC8NCj4gPiBkZXZpY2UuIEV2ZW4ganVzdCBhIGVtcHR5IG5vZGUgd2l0
aCBub3RoaW5nIGJ1dCB0aGUgY29tcGF0aWJsZSBldmVuDQo+ID4gaWYNCj4gPiBkZXZpY2UgZG9l
cyBub3QgbmVlZCBzdHVmZiBmcm9tIERUPyBBbnl3YXlzLCBJIHRoaW5rIHRoaXMgaXMgbmljZQ0K
PiA+IGFkZGl0aW9uIGZvciBzaW1wbGUgZHJpdmVycy4NCj4gPiANCj4gPiA+ID4gQnkgdGhlIHdh
eSAtIGZvciB1bmVkdWNhdGVkIGV5ZXMgbGlrZSBtaW5lIHRoaXMgZG9lcyBub3QgbG9vaw0KPiA+
ID4gPiBsaWtlDQo+ID4gPiA+IGl0DQo+ID4gPiA+IGhhcyBtdWNoIHRvIGRvIHdpdGggTUZEIGFz
IGEgZGV2aWNlIC0gaGVyZSBNRkQgcmVtaW5kcyBtZSBvZiBhDQo+ID4gPiA+IHNpbXBsZS0NCj4g
PiA+ID4gYnVzIG9uIHRvcCBvZiBJMkMuDQo+ID4gPiANCj4gPiA+IFRoaXMgaXMgZm9yIE1GRCBk
ZXZpY2VzIHdoZXJlIHRoZSBwYXJlbnQgZG9lcyBsaXR0bGUgbW9yZSB0aGFuDQo+ID4gPiBjcmVh
dGUNCj4gPiA+IGEgc2hhcmVkIGFkZHJlc3Mgc3BhY2UgZm9yIGNoaWxkIGRldmljZXMgdG8gb3Bl
cmF0ZSBvbiAtIGxpa2UNCj4gPiA+IHlvdXJzLg0KPiA+ID4gDQo+ID4gPiA+IEFueXdheXMsIHRo
ZSBCRDk1NzYgYW5kIEJEOTU3MyBib3RoIGhhdmUgYSBmZXcgaW50ZXJydXB0cyBmb3INCj4gPiA+
ID4gT1ZEL1VWRA0KPiA+ID4gPiBjb25kaXRpb25zIGFuZCBJIGFtIGV4cGVjdGluZyB0aGF0IEkg
d2lsbCBiZSBhc2tlZCB0byBwcm92aWRlDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiByZWd1bGF0b3Ig
bm90aWZpZXJzIGZvciB0aG9zZS4gUmVhc29uIHdoeSBJIG9taXR0ZWQgdGhlIElSUXMNCj4gPiA+
ID4gZm9yDQo+ID4gPiA+IG5vdyBpcw0KPiA+ID4gPiB0aGF0IHRoZSBIVyBpcyBkZXNpZ25lZCB0
byBrZWVwIHRoZSBJUlEgYXNzZXJ0ZWQgZm9yIHdob2xlDQo+ID4gPiA+IGVycm9yDQo+ID4gPiA+
IGR1cmF0aW9uIHNvIHNvbWUgZGVsYXllZCBhY2sgbWVjaGFuaXNtIHdvdWxkIGJlIG5lZWRlZC4g
SSB3b3VsZA0KPiA+ID4gPiBsaWtlIHRvDQo+ID4gPiA+IGtlZXAgdGhlIGRvb3Igb3BlbiBmb3Ig
YWRkaW5nIElSUXMgdG8gTUZEIGNvcmUuDQo+ID4gPiANCj4gPiA+IFlvdSBtZWFuIHRvIGFkZCBh
biBJUlEgRG9tYWluPw0KPiA+IA0KPiA+IFllcy4gSSBwbGFubmVkIHRvIHVzZSByZWdtYXAtaXJx
IGFuZCBjcmVhdGUgaXJxIGNoaXAgaW4gTUZEIHdoZW4NCj4gPiB0aGUNCj4gPiBvdmVyIC8gdW5k
ZXIgdm9sdGFnZSAvIHRlbXBlcmF0dXJlIC0gbm90aWZpY2F0aW9ucyBvciB3YXRjaGRvZyBJUlFz
DQo+ID4gYXJlDQo+ID4gbmVlZGVkLiANCj4gDQo+IEkgYW0gc29ycnkgaWYgSSBoYXZlIG1pc3Nl
ZCB5b3VyIHJlcGx5LiBUaGUgUk9ITSBlbWFpbCBoYWQgcmVkaXJlY3RlZA0KPiBhbG1vc3QgYWxs
IHBhdGNoIGVtYWlscyB0byBzcGFtICsgSSBhbSBub3Qgc3VyZSBpZiBzb21lIG1haWxzIGFyZQ0K
PiBkcm9wcGluZyA6KA0KPiANCj4gKEkgYW0gY29uc2lkZXJpbmcgbW92aW5nIHRvIGdtYWlsIC0g
YnV0IEknZCByYXRoZXIga2VlcCBhbGwgbWFpbHMgaW4NCj4gb25lIHN5c3RlbSBhbmQgSSBjYW4n
dCB0cmFuc2ZlciB3b3JrIG1haWwgdHJhZmZpYyB0byBnbWFpbC4uLiBJDQo+IHdvbmRlcg0KPiBo
b3cgb3RoZXJzIGFyZSBtYW5hZ2luZyB0aGUgbWFpbHMgLSB3aGljaCBtYWlsIHN5c3RlbSB5b3Ug
YXJlIHVzaW5nPykNCj4gDQo+IEkgdGhpbmsgdGhpcyBzZXJpZXMgaXMgbm93IHBlbmRpbmcgdGhl
IGRlY2lzaW9uIGhvdyB0byBwcm9jZWVkIHdpdGgNCj4gTUZEDQo+IHBhcnQuIElmIHlvdSBzdGls
bCB3YW50IG1lIHRvIHN0YXJ0IHdpdGggInNpbXBsZS1tZmQtaTJjIiwgdGhlbiBJDQo+IHdvdWxk
DQo+IGFwcHJlY2lhdGUgaWYgeW91IHBvaW50ZWQgbWUgaG93IHlvdSB3b3VsZCBsaWtlIHRvIHNl
ZSB0aGUgcmVnbWFwDQo+IGNvbmZpZ3MgYWRkZWQuIEFsdGhvdWdoIEkgYW0gcXVpdGUgcG9zaXRp
dmUgdGhpcyAoZXZlbnR1YWxseSkgZW5kcyB1cA0KPiBiZWluZyBtb3JlIHRoYW4gd2hhdCBzaW1w
bGUtbWZkLWkyYyBpcyBpbnRlbmRlZCBmb3IgKGJlY2F1c2UgYXQgc29tZQ0KPiBwb2ludCBwZW9w
bGUgd2FudCB0byBhZGQgdGhlIHVzZSBvZiB0aGUgaW50ZXJydXB0cykuDQoNCkxvb2tpbmcgYXQg
dGhpcyB0b3BpYyBhZ2Fpbi4gSSBraW5kIG9mIHVuZGVyc3RhbmQgdGhlIGlkZWEgb2YgY29tYmlu
aW5nDQpidW5jaCBvZiBNRkQgZHJpdmVycyBpbnRvIG9uZSBmaWxlLiBNYW55IG9mIHRoZSBST0hN
IFBNSUMgTUZEIGRyaXZlcnMNCmRvIHByb3ZpZGUgc2FtZSBmdW5jdGlvbmFsaXR5LiBSZWdtYXAg
Y29uZmlncywgcmVnbWFwIElSUSBhbmQgTUZEDQpjZWxscy4gU29tZSBkbyBhbHNvIHByb2JlIHRo
ZSBkZXZpY2UuIFNvIGhhdmluZyBvd24gZmlsZSBmb3IgZWFjaCBJQyBpcw0KbGlrZWx5IHRvIG5v
dCBzY2FsZSB3ZWxsIHdoZW4gbW9yZSBkZXZpY2VzIGFyZSBzdXBwb3J0ZWQgKGFuZCBJIGRvIGhv
cGUNCnRoaXMgd2lsbCBiZSB0aGUgY2FzZSBhbHNvIHdpdGggdGhlIFJPSE0gSUNzKS4NCg0KV2hh
dCBidWdzIG1lIHdpdGggdGhlIHNpbXBsZS1tZmQtaTJjIGhlcmUgaXM6DQoxLiBSZXF1aXJpbmcg
dG8gaGF2ZSBvd24gY29tcGF0aWJsZXMgZm9yIHN1Yi1kZXZpY2VzIChyZWd1bGF0b3IgYW5kDQpX
REcpIHRvIGdldCB0aGVtIHByb3Blcmx5IHByb2JlZC4gKDMgY29tcGF0aWJsZXMgZm9yIDEgSUMp
Lg0KMi4gUmVxdWlyaW5nIHRvIGhhdmUgb3duIERUIG5vZGUgZm9yIFdERy4NCjMuIFN1cHBvcnRp
bmcgZGlmZmVyZW5jZXMgYmV0d2VlbiBCRDk1NzYgYW5kIEJEOTU3MyBieSBoYXZpbmcgNg0KY29t
cGF0aWJsZXMgZm9yIDIgSUNzLg0KNC4gQWRkaW5nIGludGVycnVwdCBzdXBwb3J0Lg0KDQpTbyAu
Li4gSG93IGRvIHlvdSBzZWUgYWRkaW5nIEJEOTU3Ni9CRDk1NzMgTUZEIHN0dWZmIGluIEJEOTU3
MS8oQkQ5NTc0KQ0KTUZEIGRyaXZlcj8gVGhlIGRhdGEgc3RydWN0dXJlcyAocmVnbWFwIGNvbmZp
Z3MsIE1GRCBjZWxscywgcmVnbWFwIElSUQ0KcG9ydGlvbiB3aGVuIGFkZGVkKSB3aWxsIGJlIGRp
ZmZlcmVudCBidXQgdGhlIGZ1bmN0aW9ucyBhbmQgbWF5YmUNCmVuZ2luZWVycyBsb29raW5nIGF0
IHRoZXNlIG1heSBiZSBjb21tb24uDQoNCklzIGl0IGp1c3QgcGxhaW4gY29uZnVzaW5nIHRvIGFk
ZCBjb3JlIHN0cnVjdHVyZXMgZm9yIHRlY2huaWNhbGx5DQpkaWZmZXJlbnQgSUNzIGluIHNhbWUg
ZmlsZSAtIG9yIGlzIGl0IHdheSB0byBhdm9pZCBkdXBsaWNhdGluZyBzYW1lDQpjb2RlIGluIG1h
bnkgZmlsZXM/IEkgY2FuIHRyeSBhZGRpbmcgdGhlIEJEOTU3Ni9CRDk1NzMgdG8gdGhlIEJEOTU3
MQ0KY29yZSAtIG9yIEkgY2FuIGRvIHJlc2VuZCB0aGlzIGFzIGlzIChyZWJhc2VkIG9uIDUuMTEp
LiBJIGNhbiBhbHNvIGhhY2sNCnRoaXMgdG8gYmUga2lja2VkIGJ5IHNpbXBsZS1tZmQtaTJjIChh
bHRob3VnaCBJIGhhdmUgdGhlc2Ugc3Ryb25nDQpvYmplY3Rpb25zKSAtIGJ1dCBJIGJldCBpdCB3
aWxsIGluIHRoZSBsb25nIHJ1biBqdXN0IGxlYWQgdG8gYSBzdWItDQpvcHRpbWFsIHNvbHV0aW9u
LiBXaGVuIHRoZSBCRDk1NzYvQkQ5NTczIGxvZ2ljIGJsb2NrcyBhcmUgcmUtdXNlZCBpbg0Kc29t
ZSAibm9uIHNpbXBsZSIgZGVzaWducyBhbmQgcmUtdXNpbmcgdGhlIHN1Yi1kcml2ZXJzIGlzIG5l
ZWRlZCBhbmQvb3INCndoZW4gSVJRcyBhcmUgbmVlZGVkLg0KDQooQlRXIC0gSSBhbSBjdXJyZW50
bHkgd29ya2luZyB3aXRoIEJENzE4MTUvQkQ3MTgxNyAtIGFuZCBhZnRlciB0aGlzDQpkaXNjdXNz
aW9uIEkgd2lsbCBhZGQgdGhlc2UgaW4gQkQ3MTgyOC9CRDcxODc4IE1GRCBjb3JlLiBJIGhhZCBj
cmVhdGVkDQpuZXcgTUZEIGZpbGUgZm9yIHRoZW0gYnV0IHRoaXMgZGlzY3Vzc2lvbiBoYXMgYmVl
biBhIG5pY2Uga2ljayB0byB0aGUNCmJldHRlciBkaXJlY3Rpb24gZm9yIG1lKQ0KDQpCZXN0IFJl
Z2FyZHMNCglNYXR0aSBWYWl0dGluZW4NCg==
