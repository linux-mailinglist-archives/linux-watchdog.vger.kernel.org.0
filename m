Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2E72A7B33
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 11:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgKEKAc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 05:00:32 -0500
Received: from mail-eopbgr140071.outbound.protection.outlook.com ([40.107.14.71]:65350
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726179AbgKEKAc (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 05:00:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvtyBHPxYhf8YoeiPUVpV+tuf6WKD6g5S3VJedOFjXUrodSSRpQqFKjT5pHLYF+2xOTfGJB1CwOjY/iEk2XnsjO/RAmL6PzrWfuUb+NaJkbjugRLna1pNHEKrP2MMJYiXoTbmNugExRrBzgTx7QAQiOzFW7MmeBamM9rgO9aIU10sT692BTwS5F05+qFcniz9r5DkZiiKevswUb7Ezsea2w/OHkSA8UhbElEaIDRGR8IAK7kvWqiPy3TquwyLW70uE/NY1nIhIEebgwSFGREyynW17XEZfuzSIelrF4lV1d75G/wl2g6DlwGjD9AMiLewGPt6mLPHPEknhLRvk7Vew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgZTPNooSmsemtbE3c0fimfUE2VtvRfVnzCJq8tn3ro=;
 b=MgCYIUTNbvbwPovvRSvVJ9IqguPeH0yZdMghyDHN/ip1RlNeZjGGf8/p+K6jc6KYCbZVlB3Ti1o6+7OtKemLa9f0Nai+fFhVWx6puciUqWZESiOstokKVRED6M57VExBDF83WSaaYcLcvBatXxHJS1aEuoDGqZE5LmcP9ZDJaYZ1JIW8E3vkciZOZysGat3YFC4pt5VHcaNRN3Zis3o/YMMBAYjDi2NyssFDa2k1uQWg7nk5xl9GjldnHvqnqehhpud1RqXujdEoDkJ8LFQL7fIa8sEJ8eF4tvldlD1KPwcmcLwDq4dxWgZtg+/Pc/JXMBCw65w/36DBUknLkJ6Oqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgZTPNooSmsemtbE3c0fimfUE2VtvRfVnzCJq8tn3ro=;
 b=oxZD01Kik3A2pr9MRVCPtnpZfPGMEekq8tKek8wtB6ReBOu4ag4NtU11mtPJay+Dre/2XnZo8KPkqufc/3sjLAx21lrl0jv2Wl52xPPtfVJULd5oum275JOJzwrEoUcF5pQ6MxH81NylZL9RQoKaVAXjWT/nc2AxrOD6ceYc3a8=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DB8PR03MB6137.eurprd03.prod.outlook.com (2603:10a6:10:133::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Thu, 5 Nov 2020 10:00:21 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107%7]) with mapi id 15.20.3477.038; Thu, 5 Nov 2020
 10:00:21 +0000
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
Subject: Re: [PATCH v4 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH v4 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWrQ9DwN0nkcfMkkiJSgq2+hhNRam4KrWAgAD53wCAAA83gIAAC2AAgAAJuoCAAACOAIAAEV4A
Date:   Thu, 5 Nov 2020 10:00:21 +0000
Message-ID: <ebba1fc0685e8f259033f05c9b6a905280f1a95e.camel@fi.rohmeurope.com>
References: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <c7a838830b7d5ea1c281e419cf0eff0cc50363e0.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <20201104155153.GQ4488@dell>
         <058913084af32743f2e23228a46944bbfcbd52d2.camel@fi.rohmeurope.com>
         <98d3a090462d21a97dd15490ac1e9de011819b35.camel@fi.rohmeurope.com>
         <20201105082122.GU4488@dell>
         <c969857d70c3fea3e5369651d09aa4ba668418f7.camel@fi.rohmeurope.com>
         <20201105085810.GD4488@dell>
In-Reply-To: <20201105085810.GD4488@dell>
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
x-ms-office365-filtering-correlation-id: c410d415-757c-4069-3b0f-08d881719bc3
x-ms-traffictypediagnostic: DB8PR03MB6137:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR03MB6137DE9D1A6FF609A1902E9BADEE0@DB8PR03MB6137.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vL9zHkmz70NKp681KJVkh1n2KBN4yQKGgLHnB+3Y3/TOSwP4tOGkuj99fHmH/Ms8JuN8XHzb7Yuo7Iex/EQK/AeUejj9pNJX0CFuThixNWnDkI2X2AOMyzB2S7xaS5AwBzmlyTzOvLGa8MYstiIf58kQm6s/eV+T9QgaNK3LO/hSvInk4CUspG07fE1nZtg98Z3lUCQAOEqt4ixXkYVtZhttI9JkG8RazhmNJPwsHS/dOVOuMMfQ8PAOM/c4+Oa1cF2CJzRqNFgOYPBp7vLODh8nKgs82UZ71VOpubc7kHYLCNtWhvP8jEwvtWbBsedS6cbvhUciHvgfzWzH5JGuCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39850400004)(66446008)(2906002)(4326008)(8676002)(66946007)(3450700001)(91956017)(66556008)(86362001)(8936002)(64756008)(83380400001)(6512007)(66476007)(76116006)(5660300002)(186003)(6486002)(26005)(6506007)(54906003)(6916009)(71200400001)(2616005)(316002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7OJSQZGEFwiomc6wWHsl27tJegqDVmKdnQMMriU/2mSwnBp9hzH4x4Hlt1hLZXN/YXyNT/yEbChSBElvhoMy51GCSZ8UpjWF4ju4JUrH1zToO1pN+YvZMzeWUhnr06AnBxqIrKcHnLbV0m8bZOMXIYMzJCh458zFUohtG98T6GbBV/eiI84Z/TStlcTXkXC+e3YcSCWpsM17OzGSr1w5rOrglWiuTwAsRBUP9OePuQeZzEskcO4nMhfvhxDzOq/vzrLvDq1LpG4ufMxVs2CFbnLJynC0NmTTkIMXEBHS/IfJOe79mVwku4taha/VM4pOhG4oTdXFc7VN5hAQO8xdVgLBkB5BEuU2YqPcBfU2Cci79+FIr+AjFO5O70yqS/ARHccZ5Y1sK9g4B6oh5uaDoG+VQw9yJz3BrNzh2PiZDgpt/0bFKXysJ7yesYW+ctWWN7lB/4iO6fAp+1VnWnlQXRBJrleOwWcUKPb9Y/cdxolVmLiA8JzD5b7B3NNaa1f+r4eZaQ8spVEDkvCTKuxgWUJa0aDfq29fb6xtMD3q6RjtC41FMISWt33Lr252zsIuct9i4sgrCWQpQfYhLeOvXbNMNIzeDLGp1xGzYr19kmdFTKbzxR3eo22bif7wrEiXFW+J+JB+dEvayLlnb9RS1Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAFB17880676774C85A6FC5415BCEA65@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c410d415-757c-4069-3b0f-08d881719bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 10:00:21.7046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7Gdi3qXD3ocwTOnVFCHzkyyJlKfFBj0GquIWIkGEngUTexZxLNmV6/zqlDR99WZXc5sNEuwRI338y3u8b3GDWBE6J6LRRSeKfjHRkGGu8CtuWM6T9+0uE8ySglhpLb7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6137
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiBUaHUsIDIwMjAtMTEtMDUgYXQgMDg6NTggKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gVGh1LCAwNSBOb3YgMjAyMCwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToNCj4gDQo+ID4gT24g
VGh1LCAyMDIwLTExLTA1IGF0IDA4OjIxICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+ID4gPiBP
biBUaHUsIDA1IE5vdiAyMDIwLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+ID4gDQo+ID4g
PiA+IE9uIFRodSwgMjAyMC0xMS0wNSBhdCAwODo0NiArMDIwMCwgTWF0dGkgVmFpdHRpbmVuIHdy
b3RlOg0KPiA+ID4gPiA+IE1vcm5pbmcgTGVlLA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoYW5r
cyBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGlzIDopIEkgc2VlIG1vc3Qgb2YgdGhlDQo+ID4gPiA+
ID4gY29tbWVudHMNCj4gPiA+ID4gPiBiZWluZw0KPiA+ID4gPiA+IHZhbGlkLiBUaGVyZSdzIHR3
byBJIHdvdWxkIGxpa2UgdG8gY2xhcmlmeSB0aG91Z2guLi4NCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiBPbiBXZWQsIDIwMjAtMTEtMDQgYXQgMTU6NTEgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
PiA+ID4gPiA+IE9uIFdlZCwgMjggT2N0IDIwMjAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBBZGQgY29yZSBzdXBwb3J0IGZvciBST0hNIEJEOTU3
Nk1VRiBhbmQgQkQ5NTczTVVGIFBNSUNzDQo+ID4gPiA+ID4gPiA+IHdoaWNoDQo+ID4gPiA+ID4g
PiA+IGFyZQ0KPiA+ID4gPiA+ID4gPiBtYWlubHkgdXNlZCB0byBwb3dlciB0aGUgUi1DYXIgc2Vy
aWVzIHByb2Nlc3NvcnMuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0aSBWYWl0dGluZW4gPA0KPiA+ID4gPiA+ID4gPiBtYXR0aS52YWl0dGluZW5AZmku
cm9obWV1cm9wZS5jb20NCj4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ICsJdW5zaWdu
ZWQgaW50IGNoaXBfdHlwZTsNCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiArCWNoaXBf
dHlwZSA9ICh1bnNpZ25lZCBpbnQpKHVpbnRwdHJfdCkNCj4gPiA+ID4gPiA+ID4gKwkJICAgIG9m
X2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmaTJjLT5kZXYpOw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiBOb3Qgb3Zlcmx5IGtlZW4gb24gdGhpcyBjYXN0aW5nLg0KPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiBXaHkgbm90IGp1c3QgbGVhdmUgaXQgYXMgKHVpbnRwdHJfdCk/DQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gSSBkaWRuJ3QgZG8gc28gYmVjYXVzZSBvbiB4ODZfNjQgdGhlIGFkZHJlc3Mg
d2lkdGggaXMNCj4gPiA+ID4gPiBwcm9iYWJseSA2NA0KPiA+ID4gPiA+IGJpdHMNCj4gPiA+ID4g
PiB3aGVyZWFzIHRoZSB1bnNpZ25lZCBpbnQgaXMgbGlrZWx5IHRvIGJlIDMyIGJpdHMuIFNvIHRo
ZQ0KPiA+ID4gPiA+IGFzc2lnbm1lbnQNCj4gPiA+ID4gPiB3aWxsIGNyb3AgaGFsZiBvZiB0aGUg
dmFsdWUuIEl0IGRvZXMgbm90IHJlYWxseSBtYXR0ZXIgYXMNCj4gPiA+ID4gPiB2YWx1ZXMNCj4g
PiA+ID4gPiBhcmUNCj4gPiA+ID4gPiBzbWFsbCAtIGJ1dCBJIHdvdWxkIGJlIHN1cnByaXplZCBp
ZiBubyBjb21waWxlcnMvYW5hbHl6ZXJzDQo+ID4gPiA+ID4gZW1pdHRlZCBhDQo+ID4gPiA+ID4g
d2FybmluZy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJIG11c3QgYWRtaXQgSSBhbSBub3QgMTAw
JSBzdXJlIHRob3VnaC4gSSBzdXJlIGNhbiBjaGFuZ2UNCj4gPiA+ID4gPiB0aGlzIGlmDQo+ID4g
PiA+ID4geW91DQo+ID4gPiA+ID4ga25vdyBpdCBiZXR0ZXI/DQo+ID4gPiANCj4gPiA+IFdoYXQg
aWYgeW91IHVzZWQgJ2xvbmcnLCB3aGljaCBJIGJlbGlldmUgY2hhbmdlZCB3aXRoIHRoZQ0KPiA+
ID4gYXJjaGl0ZWN0dXJlJ3MgYnVzIHdpZHRoIGluIExpbnV4Pw0KPiA+IA0KPiA+IEkgdGhpbmsg
dGhpcyBpcyBleGFjdGx5IHdoYXQgdWludHB0cl90IHdhcyBjcmVhdGVkIGZvci4gVG8gcHJvdmlk
ZQ0KPiA+IHR5cGUNCj4gPiB3aGljaCBhc3N1cmVzIGEgcG9pbnRlciBjb252ZXJzaW9uIHRvIGlu
dGVnZXIgYW5kIGJhY2sgd29ya3MuDQo+ID4gDQo+ID4gSSBndWVzcyBJIGNhbiBjaGFuZ2UgdGhl
DQo+ID4gDQo+ID4gdW5zaWduZWQgaW50IGNoaXBfdHlwZTsNCj4gPiANCj4gPiB0byB1aW50cHRy
X3QgYW5kIGdldCBhd2F5IHdpdGggc2luZ2xlIGNhc3QgaWYgaXQgbG9va3MgYmV0dGVyIHRvDQo+
ID4geW91Lg0KPiA+IEZvciBtZSB0aGUgZG91YmxlIGNhc3QgZG9lcyBub3QgbG9vayB0aGF0IGJh
ZCB3aGVuIGl0IGFsbG93cyB1c2Ugb2YNCj4gPiBuYXRpdmUgaW50IHNpemUgdmFyaWFibGUgLSBi
dXQgaW4gdGhpcyBjYXNlIGl0J3MgcmVhbGx5IGp1c3QgYQ0KPiA+IG1hdHRlcg0KPiA+IG9mIHRh
c3RlLiBCb3RoIHNob3VsZCB3b3JrIGZpbmUuDQo+IA0KPiBJIGRvIHNlZSBwZW9wbGUgY2FzdGlu
ZyB0byB1aW50cHRyIGFuZCBwbGFjaW5nIHRoZSByZXN1bHQgaW50byBhDQo+IGxvbmcuDQoNClRo
YXQgc2hvdWxkIHdvcmsgYmVjYXVzZSBsb25nIGlzIHNhbWUgc2l6ZSBhcyBhZGRyZXNzIG9uIGFy
Y2hpdGVjdHVyZXMNCnN1cHBvcnRlZCBieSBMaW51eC4gQnV0IGl0IHN0aWxsIGRvZXMgbm90ICJm
ZWVsIGNvcnJlY3QiIHRvIG1lLiBXaHkNCmJvdGhlcmluZyB0byB1c2UgdGhlIHVpbnRwdHJfdCBp
biBmaXJzdCBwbGFjZSB0aGVuPw0KDQpTbyAuLi4gSSBiZWxpZXZlIGl0IHNob3VsZCAqd29yayog
b24gYWxsIGN1cnJlbnRseSBzdXBwb3J0ZWQNCmFyY2hpdGVjdHVyZXMgaWYgSSBkbzoNCg0KdW5z
aWduZWQgbG9uZyBjaGlwX3R5cGU7DQoNCmNoaXBfdHlwZSA9ICh1bnNpZ25lZCBsb25nKW9mX2Rl
dmljZV9nZXRfbWF0Y2hfZGF0YSgmaTJjLT5kZXYpOw0KDQphbHRob3VnaCBmYWN0IGl0IHdvcmtz
IGRvZXMgbm90IG1ha2UgaXQgKnJpZ2h0KiA6XQ0KDQpCdXQgY2FzdGluZyB0byBzb21ldGhpbmcg
KHVpbnRwdHJfdCkgYW5kIHRoZW4gYXNzaWduaW5nIHRvIHNvbWV0aGluZw0KZWxzZSAodW5zaWdu
ZWQgbG9uZykganVzdCB0cnVzdGluZyB0aGF0IGl0ICp3b3JrcyogZG9lcyBmZWVsIHNsaWdodGx5
DQpmaXNoeSB3aGVuIHdlIGNvdWxkIHVzZSBzYW1lIHR5cGUgZm9yIHZhcmlhYmxlIGFuZCBjYXN0
Lg0KDQpCdXQgYWdhaW4gLSBpZiANCg0KdW5zaWduZWQgbG9uZyBjaGlwX3R5cGU7DQouLi4NCmNo
aXBfdHlwZSA9ICh1bnNpZ25lZA0KbG9uZylvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJmkyYy0+
ZGV2KTsNCg0KaXMgd2hhdCB5b3UgcHJlZmVyIC0gSSBjYW4gZG8gdGhhdCB0b28uIEVzcGVjaWFs
bHkgaW4gdGhpcyBjYXNlIHdoZXJlIEkNCmV4cGVjdCB0aGUgaGlnaGVzdCBudW1iZXIgdG8gZGVm
aW5pdGVseSBzdGF5IGxlc3MgdGhhbiB0aHJlZSBkaWdpdHMuIElmDQp3ZSBzb21lIGRheSBoaXQg
dG8gYXJjaGl0ZWN0dXJlIHdoZXJlIGFkZHJlc3NlcyBhcmUgbm90IG9mIHNhbWUgc2l6ZSBhcw0K
bG9uZ3MsIHRoZW4gdGhpcyBpcyBqdXN0IG9uZSBtaW5vciBjb252ZXJzaW9uIHRvIGRvLi4uDQoN
Ci0tTWF0dGkNCg==
