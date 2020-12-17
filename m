Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223E12DCF0D
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Dec 2020 11:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgLQKFk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Dec 2020 05:05:40 -0500
Received: from mail-vi1eur05on2056.outbound.protection.outlook.com ([40.107.21.56]:62595
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725930AbgLQKFj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Dec 2020 05:05:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUjF63HfUtZvVYO58C4Hq6VSAtJM9YeTsNryGqybXAlp7/LI4YOM/Oojt6wO+R2B7Cx0g9H/K7OhuB/rBJV6MWDzgUtegcIGHE6ZDEbk/OBk5He7xlI9n5lSVYWeM8sWjuird7j8/II9fCXrFrLf/3yYYwQD7Di12g1Pe3Q4i9wAdVzw1ZMDS/S4JfdaKPaSBVMRYDPgJCdjJYQRx3aR5YH8W2pyp5JSHPdrerKTT2DCkh/RiCwwMChRwKqmYG5NBRouaIkiGO9zvGiixJTu7Hyq5yQn8CPS1J1nyrUTrNGFBwTUPKW0E9XohWTkkHGQGU8IzOt2NYq0ZUE5fOsaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK19+Mr8RPMB66iRM2QPITg/rKX4OUb+LI4C6M+zPjo=;
 b=StockriJr2u2Pc/Sglm9cduFiLqrYzYKlJXIyi8UR2K8sC7LsEHvgbnf+/pEzydcJ64E6T4On1MbXQkoLrwFLanOUiXIFQSrgq1Pm3F4tfMqYj96cuyIBeo7XdYVs4CilU37K8yEJQl9d+It9UUwY9m3srWjaGd0d+SO0cnWaF2JYpDalw6XMQFhzPoH8ulqEfJyG0VQc9uHfVM58aFVgQjK+11gt/R4bMwiPJ6WejGtCJj7HQ33oq8JF5hwJEDXwM5LG4NQC8rg/Gm6C+KOVGjcl0Y4fJ7K0mbaYFLdTMxmaU71oC35gAxkEEWXqPU3VU1Rj71xG26isy/IHF7dlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK19+Mr8RPMB66iRM2QPITg/rKX4OUb+LI4C6M+zPjo=;
 b=mrz8crb/bPdPxs2OT7GPJZd1NiSTivJYbmSBXOwZVg+d8Yy0PT6+mKPdjovvjCTQVbENxORaaL8QEkhBko4ISfKUniR3QBVm9hnyNQ1P+axJ4qwy+bJXHy3wU+pviZQIM9EokZeWPCziTIjXKsplIPA0QHowUOHGDvfZDVSETDQ=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2890.eurprd03.prod.outlook.com (2603:10a6:7:5c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.19; Thu, 17 Dec 2020 10:04:47 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3676.025; Thu, 17 Dec 2020
 10:04:47 +0000
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
Thread-Index: AQHWwWDHZJglj3cu602g/c6U2v2JcanbrP0AgAAT74CACBGsgIAACbeAgBdZAYA=
Date:   Thu, 17 Dec 2020 10:04:46 +0000
Message-ID: <c2949e981014c049571df355501f2af65b3954de.camel@fi.rohmeurope.com>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <20201127083242.GK2455276@dell>
         <6bd4abcb340bdf764fd23b685684d3f984319ed7.camel@fi.rohmeurope.com>
         <20201202125723.GK4801@dell>
         <3bab8bd8c69a878f849a07dd9ea35bfac2006da2.camel@fi.rohmeurope.com>
In-Reply-To: <3bab8bd8c69a878f849a07dd9ea35bfac2006da2.camel@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5e7510d-5c17-4f8e-a4c4-08d8a2732f4e
x-ms-traffictypediagnostic: HE1PR03MB2890:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB2890BDC3139AA0B4D904609DADC40@HE1PR03MB2890.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YXrxb7yoQonM0zn30JJAfM1LO/Jgc7Jj5vxyLWv3Hu1QdeJ2ZdCQMdWLpDJancK2HN+sTN4PoFoMywSDf5UYU7nBXWNDz/jLua5TYyCJpyNygbaF4Kcn5pnIpIM8Fss2Zjh6WCDaqsSQX5iKhIpNuei9wQi0TnbQ2tC4NSd2b9syBvi6g6HuYfxSQM2ieDvYUWPTMfiu9J+tZxEagHlZk9s3BDQ9W/am3b1/jRlXoKpUBryrt4NHK9q+L+5BJQaJ7bJJ2vdYGnOwUR8NaDimc5spnnjvZOsNfJtclxWDHFUq7CkwXLN2G6soiT2XhVvxcPDq5goOpjYCE5OKRcy23w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(39850400004)(396003)(86362001)(2906002)(3450700001)(8936002)(6486002)(4001150100001)(26005)(5660300002)(6506007)(4326008)(8676002)(6512007)(186003)(66476007)(64756008)(6916009)(66446008)(66946007)(316002)(71200400001)(76116006)(54906003)(66556008)(2616005)(478600001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YzhoT1NMcFcrVjNHTnlPN09YYXZ2Qk1kaEh1SWpHRFNIbUFwWmVGb0MxNkR1?=
 =?utf-8?B?ckMwVW5idG9RMkliUzhmczVERDVHTFBJcldBc0RFOCt6d09iTkxHdkdPV0Fr?=
 =?utf-8?B?Sk5CTVd3MmVnOEIzb3dBelV1Z0dJV2VEYmVWTHpHUlpJdXFFZ3R2blhSdENq?=
 =?utf-8?B?YkFYMFVGeWRPemt2ZjNBWXJJbk5Fbk5EWGZGWW95SnBHTzJNRmR3Q1hqWU5E?=
 =?utf-8?B?UkhkbTI2M0d3eEhoOHRVT0plWHA4NjVNWENPak5lUFpIMmZpYW96Z1FGbXFk?=
 =?utf-8?B?SFZkSGZ3Nk5BUGg4akZrTDFNOHExWVIvK2xpTzEzMnRtbmZ3YTJKK1Qwa21r?=
 =?utf-8?B?K3g4R2FuR0lzVVFBejlDd0crUGk0U0QrUFFJOVRNd1VIL1ZaYjR1Mlk0THpq?=
 =?utf-8?B?aGpzaFNNdkVBakNRd0srOVV2bmdSR2grOVpQcXRQOWZaTzJrT3hzL0FmakdT?=
 =?utf-8?B?WGZsN0ZmbUNja2tSVTNjeGhVK3hMQlNVbU8wQnR2MExtTm5sZHRzdUtXNWRU?=
 =?utf-8?B?Y3o3MlJtdzA2WEdCd09WV1ZWdlFzT2daVTVUNXhRRmtza0dWckdPZDQ3dFk3?=
 =?utf-8?B?YjNGa2QxanFURTZsQitKdHRPWFZsMlkvYnRlekovekhLVnZMU0ppbTFEejFs?=
 =?utf-8?B?RTNZL3ZQYW9VYnQ1QWlDaTY0UkpQU1NVTGwvZ2lmU0RUVDEvRjEzdHZXaHZp?=
 =?utf-8?B?UTFXRWJOOXA3djBXRDdmWm1ld3FQckYwUlY1cWY2OS9PRWgra29PbXkzTEgx?=
 =?utf-8?B?N241bUwxanlsSFF4dFdKT3ZUNUZ4aVdkaDEveGVxSHlYZGI2QlVsOExidGZ3?=
 =?utf-8?B?dmxyWlZNZCtLMjNpVEUyM244OFQ5Zk9Tcm5yM0ZYZ0tlbnhIbEpQMHVIVW8w?=
 =?utf-8?B?WjB6SVAyUnJLVXRUS2hBL2hKYW91SkRmVlNYdklVbDF3S2FjdWdrK2F1OGJ6?=
 =?utf-8?B?WHRURVZ0c0JOL250RnAyR0Zwa1R2ZzlwYzdkYlNQWit4Sks0N0lkUmZ3SUxV?=
 =?utf-8?B?YWxNdWtrUkZINVJSc3JTdU13bVVHcG9UR1lET005alRnRHMyNDZVNFV3bGNW?=
 =?utf-8?B?K2Y4VCtiM0FCUGcrZi92RU5Xb0xlQ21xRVVDV1pyUGhIVUZYNlN4dGpxbStT?=
 =?utf-8?B?YmpoUkpxMkN5Y3ZjSUpscVZFcHVmajg0RkVFMWxWRFcvNjVLN2pUM2dLamhQ?=
 =?utf-8?B?OVhDZkJRaW9GZ1RFM09hQStjM0d2RW1uSjR2SWsyWS85bW5uUmVtS2lBdWFt?=
 =?utf-8?B?V2FVRDd4ZzF0bEx4TWtTNUJyUzdUQkdVSW9aU1MrRklMcjBLek1WODVySTVD?=
 =?utf-8?Q?jUPYN4Cz0eyAZJfiQCLXz2kNZaOctnjWKr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15E6461DBF1F54458759C423C261B9DF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e7510d-5c17-4f8e-a4c4-08d8a2732f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 10:04:47.0357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7todYLBaJF3SK8WMu5envo229uH6MjLF6JOIbEwfiuYcf/PDKkBcNpdFuN5QkBjEr3xSJZciI2E88ZXvVR7OusmLrn6yWFHC792/BXJ8E+NaKstCA7aodvJ8EpNmzcFT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2890
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgZGVlZSBIbyBMZWUsDQoNCk9uIFdlZCwgMjAyMC0xMi0wMiBhdCAxNTozMiArMDIwMCwgTWF0
dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiBIZWxsbyBMZWUsDQo+IA0KPiBPbiBXZWQsIDIwMjAtMTIt
MDIgYXQgMTI6NTcgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4gPiBPbiBGcmksIDI3IE5vdiAy
MDIwLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+IA0KPiA+ID4gSGVsbG8gTGVlLA0KPiA+
ID4gDQo+ID4gPiBPbiBGcmksIDIwMjAtMTEtMjcgYXQgMDg6MzIgKzAwMDAsIExlZSBKb25lcyB3
cm90ZToNCj4gPiA+ID4gT24gTW9uLCAyMyBOb3YgMjAyMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3Rl
Og0KPiA+ID4gPiANCj4gPiA+ID4gPiBBZGQgY29yZSBzdXBwb3J0IGZvciBST0hNIEJEOTU3Nk1V
RiBhbmQgQkQ5NTczTVVGIFBNSUNzIHdoaWNoDQo+ID4gPiA+ID4gYXJlDQo+ID4gPiA+ID4gbWFp
bmx5IHVzZWQgdG8gcG93ZXIgdGhlIFItQ2FyIHNlcmllcyBwcm9jZXNzb3JzLg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8DQo+ID4gPiA+ID4g
bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4g
PiA+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgICAgICB8ICAxMSArKysrDQo+ID4gPiA+
ID4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICAgICAgIHwgICAxICsNCj4gPiA+ID4gPiAg
ZHJpdmVycy9tZmQvcm9obS1iZDk1NzYuYyAgICAgICAgfCAxMDgNCj4gPiA+ID4gPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gIGluY2x1ZGUvbGludXgvbWZkL3Jv
aG0tYmQ5NTd4LmggIHwgIDU5ICsrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gIGluY2x1ZGUv
bGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oIHwgICAyICsNCj4gPiA+ID4gPiAgNSBmaWxlcyBjaGFu
Z2VkLCAxODEgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9tZmQvcm9obS1iZDk1NzYuYw0KPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9saW51eC9tZmQvcm9obS1iZDk1N3guaA0KPiA+ID4gPiANCj4gPiA+ID4gTG9va3MgbGlr
ZSBhIHBvc3NpYmxlIGNhbmRpZGF0ZSBmb3IgInNpbXBsZS1tZmQtaTJjIi4NCj4gPiA+ID4gDQo+
ID4gPiA+IENvdWxkIHlvdSBsb29rIGludG8gdGhhdCBwbGVhc2U/DQo+ID4gPiA+IA0KPiA+ID4g
SSBtdXN0IGFkbWl0IEkgZGlkbid0IGtub3cgYWJvdXQgInNpbXBsZS1tZmQtaTJjIi4gR29vZCB0
aGluZyB0bw0KPiA+ID4ga25vdw0KPiA+ID4gd2hlbiB3b3JraW5nIHdpdGggc2ltcGxlIGRldmlj
ZXMgOikgSXMgdGhpcyBhIG5ldyB0aGluZz8NCj4gPiANCj4gPiBZZXMsIGl0J3MgbmV3Lg0KPiA+
IA0KPiA+ID4gSSBhbSB1bnN1cmUgSSB1bmRlcnN0YW5kIHRoZSBpZGVhIGZ1bGx5LiBTaG91bGQg
dXNlcnMgcHV0IGFsbCB0aGUNCj4gPiA+IGRpZmZlcmVudCByZWdhbXAgY29uZmlncyBpbiB0aGlz
IGZpbGUgYW5kIGp1c3QgYWRkIHRoZSBkZXZpY2UgSURzDQo+ID4gPiB3aXRoDQo+ID4gPiBwb2lu
dGVyIHRvIGNvcnJlY3QgY29uZmlnPyAoQkQ5NTc2IGFuZCBCRDk1NzMgbmVlZCB2b2xhdGlsZQ0K
PiA+ID4gcmFuZ2VzKS4NCj4gPiA+IEFsc28sIGRvZXMgdGhpcyBtZWFuIGVhY2ggc3ViLWRldmlj
ZSBzaG91bGQgaGF2ZSBvd24gbm9kZSBhbmQgb3duDQo+ID4gPiBjb21wYXRpYmxlIGluIERUIHRv
IGdldCBjb3JyZWN0bHkgbG9hZCBhbmQgcHJvYmVkPyBJIGd1ZXNzIHRoaXMNCj4gPiA+IHdvdWxk
DQo+ID4gPiBuZWVkIGEgYnV5LWluIGZyb20gUm9iIHRvbyB0aGVuLg0KPiA+IA0KPiA+IFlvdSBz
aG91bGQgZGVzY3JpYmUgdGhlIEgvVyBpbiBEVC4NCj4gDQo+IFllcy4gQW5kIGl0IGlzIGRlc2Ny
aWJlZC4gQnV0IEkndmUgb2NjYXNpb25hbGx5IHJlY2VpdmVkIHJlcXVlc3QgZnJvbQ0KPiBEVCBn
dXlzIHRvIGFkZCBzb21lIHByb3BlcnRpZXMgZGlyZWN0bHkgdG8gTUZEIG5vZGUgYW5kIG5vdCB0
byBhZGQNCj4gb3duDQo+IHN1Yi1ub2RlLiBUaGlzIGlzIHdoYXQgaXMgZG9uZSBmb3IgZXhhbXBs
ZSB3aXRoIHRoZSBCRDcxODM3LzQ3IGNsb2Nrcw0KPiAtDQo+IHRoZXJlIGlzIG5vIG93biBub2Rl
IGZvciBjbGsgLSB0aGUgY2xrIHByb3BlcnRpZXMgYXJlIHBsYWNlZCBkaXJlY3RseQ0KPiBpbiBN
RkQgbm9kZSAoYXMgd2FzIHJlcXVlc3RlZCBieSBTdGVwaGVuIGFuZCBSb2IgYmFjayB0aGVuIC0g
SQ0KPiBvcmlnaW5hbGx5IGhhZCBvd24gbm9kZSBmb3IgY2xrKS4gSSByZWFsbHkgaGF2ZSBubyBj
bGVhciB2aWV3IG9uIHdoZW4NCj4gdGhpbmdzIHdhcnJhbnQgZm9yIG93biBzdWJub2RlIGFuZCB3
aGVuIHRoZXkgZG9uJ3QgLSBidXQgYXMgZmFyIGFzIEkNCj4gY2FuIHNlZSB1c2luZyBzaW1wbGUt
bWZkLWkyYyBmb3JjZXMgb25lIHRvIGFsd2F5cyBoYXZlIGEgc3ViLW5vZGUgLw0KPiBkZXZpY2Uu
IEV2ZW4ganVzdCBhIGVtcHR5IG5vZGUgd2l0aCBub3RoaW5nIGJ1dCB0aGUgY29tcGF0aWJsZSBl
dmVuDQo+IGlmDQo+IGRldmljZSBkb2VzIG5vdCBuZWVkIHN0dWZmIGZyb20gRFQ/IEFueXdheXMs
IEkgdGhpbmsgdGhpcyBpcyBuaWNlDQo+IGFkZGl0aW9uIGZvciBzaW1wbGUgZHJpdmVycy4NCj4g
DQo+ID4gPiBCeSB0aGUgd2F5IC0gZm9yIHVuZWR1Y2F0ZWQgZXllcyBsaWtlIG1pbmUgdGhpcyBk
b2VzIG5vdCBsb29rDQo+ID4gPiBsaWtlDQo+ID4gPiBpdA0KPiA+ID4gaGFzIG11Y2ggdG8gZG8g
d2l0aCBNRkQgYXMgYSBkZXZpY2UgLSBoZXJlIE1GRCByZW1pbmRzIG1lIG9mIGENCj4gPiA+IHNp
bXBsZS0NCj4gPiA+IGJ1cyBvbiB0b3Agb2YgSTJDLg0KPiA+IA0KPiA+IFRoaXMgaXMgZm9yIE1G
RCBkZXZpY2VzIHdoZXJlIHRoZSBwYXJlbnQgZG9lcyBsaXR0bGUgbW9yZSB0aGFuDQo+ID4gY3Jl
YXRlDQo+ID4gYSBzaGFyZWQgYWRkcmVzcyBzcGFjZSBmb3IgY2hpbGQgZGV2aWNlcyB0byBvcGVy
YXRlIG9uIC0gbGlrZQ0KPiA+IHlvdXJzLg0KPiA+IA0KPiA+ID4gQW55d2F5cywgdGhlIEJEOTU3
NiBhbmQgQkQ5NTczIGJvdGggaGF2ZSBhIGZldyBpbnRlcnJ1cHRzIGZvcg0KPiA+ID4gT1ZEL1VW
RA0KPiA+ID4gY29uZGl0aW9ucyBhbmQgSSBhbSBleHBlY3RpbmcgdGhhdCBJIHdpbGwgYmUgYXNr
ZWQgdG8gcHJvdmlkZSB0aGUNCj4gPiA+IHJlZ3VsYXRvciBub3RpZmllcnMgZm9yIHRob3NlLiBS
ZWFzb24gd2h5IEkgb21pdHRlZCB0aGUgSVJRcyBmb3INCj4gPiA+IG5vdyBpcw0KPiA+ID4gdGhh
dCB0aGUgSFcgaXMgZGVzaWduZWQgdG8ga2VlcCB0aGUgSVJRIGFzc2VydGVkIGZvciB3aG9sZSBl
cnJvcg0KPiA+ID4gZHVyYXRpb24gc28gc29tZSBkZWxheWVkIGFjayBtZWNoYW5pc20gd291bGQg
YmUgbmVlZGVkLiBJIHdvdWxkDQo+ID4gPiBsaWtlIHRvDQo+ID4gPiBrZWVwIHRoZSBkb29yIG9w
ZW4gZm9yIGFkZGluZyBJUlFzIHRvIE1GRCBjb3JlLg0KPiA+IA0KPiA+IFlvdSBtZWFuIHRvIGFk
ZCBhbiBJUlEgRG9tYWluPw0KPiANCj4gWWVzLiBJIHBsYW5uZWQgdG8gdXNlIHJlZ21hcC1pcnEg
YW5kIGNyZWF0ZSBpcnEgY2hpcCBpbiBNRkQgd2hlbiB0aGUNCj4gb3ZlciAvIHVuZGVyIHZvbHRh
Z2UgLyB0ZW1wZXJhdHVyZSAtIG5vdGlmaWNhdGlvbnMgb3Igd2F0Y2hkb2cgSVJRcw0KPiBhcmUN
Cj4gbmVlZGVkLiANCg0KSSBhbSBzb3JyeSBpZiBJIGhhdmUgbWlzc2VkIHlvdXIgcmVwbHkuIFRo
ZSBST0hNIGVtYWlsIGhhZCByZWRpcmVjdGVkDQphbG1vc3QgYWxsIHBhdGNoIGVtYWlscyB0byBz
cGFtICsgSSBhbSBub3Qgc3VyZSBpZiBzb21lIG1haWxzIGFyZQ0KZHJvcHBpbmcgOigNCg0KKEkg
YW0gY29uc2lkZXJpbmcgbW92aW5nIHRvIGdtYWlsIC0gYnV0IEknZCByYXRoZXIga2VlcCBhbGwg
bWFpbHMgaW4NCm9uZSBzeXN0ZW0gYW5kIEkgY2FuJ3QgdHJhbnNmZXIgd29yayBtYWlsIHRyYWZm
aWMgdG8gZ21haWwuLi4gSSB3b25kZXINCmhvdyBvdGhlcnMgYXJlIG1hbmFnaW5nIHRoZSBtYWls
cyAtIHdoaWNoIG1haWwgc3lzdGVtIHlvdSBhcmUgdXNpbmc/KQ0KDQpJIHRoaW5rIHRoaXMgc2Vy
aWVzIGlzIG5vdyBwZW5kaW5nIHRoZSBkZWNpc2lvbiBob3cgdG8gcHJvY2VlZCB3aXRoIE1GRA0K
cGFydC4gSWYgeW91IHN0aWxsIHdhbnQgbWUgdG8gc3RhcnQgd2l0aCAic2ltcGxlLW1mZC1pMmMi
LCB0aGVuIEkgd291bGQNCmFwcHJlY2lhdGUgaWYgeW91IHBvaW50ZWQgbWUgaG93IHlvdSB3b3Vs
ZCBsaWtlIHRvIHNlZSB0aGUgcmVnbWFwDQpjb25maWdzIGFkZGVkLiBBbHRob3VnaCBJIGFtIHF1
aXRlIHBvc2l0aXZlIHRoaXMgKGV2ZW50dWFsbHkpIGVuZHMgdXANCmJlaW5nIG1vcmUgdGhhbiB3
aGF0IHNpbXBsZS1tZmQtaTJjIGlzIGludGVuZGVkIGZvciAoYmVjYXVzZSBhdCBzb21lDQpwb2lu
dCBwZW9wbGUgd2FudCB0byBhZGQgdGhlIHVzZSBvZiB0aGUgaW50ZXJydXB0cykuDQoNCkJlc3Qg
UmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
