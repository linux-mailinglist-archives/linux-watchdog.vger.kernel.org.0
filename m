Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24516276CC8
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Sep 2020 11:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgIXJGm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Sep 2020 05:06:42 -0400
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:1613
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727290AbgIXJGm (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Sep 2020 05:06:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCX70TJ3Mgq7rbx4cUZGChkotJwfWKapfGTwdoiy1NmKuAbZiK20kIfQj3FQQii+XE2+Zy+DNXqfWMsj/TXHoD9ff5aOXs1hFCLDgeZJIMBfpHOJiWUJ6Gew+2VlqSHO3nAa4aVYNabpL/lJHGiJUimxKJvVMHinbVDrCooPURuAAKbUblfBNSv4t9uaTC6/tmvwI863sp4UHbSHDHwXkdD1HnvfzlHD9xEb1gy1f6sweOyGz8C1ABEgN8+g21wQu/5sQLotRarEGDOJ+4iuGr91QhoiT8KKNfSV8a1F39mbDMmF1Vprxv2EJM3LiuwVuHA9ykZC9Tv4wYQ1EZKm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfDLoFICfBo0bvcgW/y1S8VfgQAo26EUsqgy01ClqFQ=;
 b=iHllA+p+X5wZy320Vnb8wyMfbt8tRNU3UuQKdxSFLbJkvfmHGLaPsEa0LEsXdwsf6xVY6Oxytezrnapcz86cH9hOK6w1grNU7EvINAg85X80IssMHPWy7IEMhqX0hIVJ3TwGbV99b+Lq6udz9grav0NOA24HG+n/4xRSy6XC977o3dda7fGuSGMClNTLT1nXoINwuGI1WegBQMK+KdFsqlVoMsVHGUurkoLoq7ZAZsT9fn67+YeTBQylzYWuj7URUTFaTnjbBSuumxkLdN2bHssf9tpXiKyCeIK8nkdxCRjcXBQxBAQTrr+YAwOUgeLxm6I3GtiDH0qisBRFu2SGyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfDLoFICfBo0bvcgW/y1S8VfgQAo26EUsqgy01ClqFQ=;
 b=B8rs2E47N4xspItptTvRlvPYPVKDYXQqUQcwzcTiBejviPLWkzRKvDlOnOYiS3DC44XsdPltWqMzZUZOBLasbDqm/6C1zHNQoUPRV5NM9Y0FZO2J3lf+QYbSZp4p/UKdgyvHkM+hdk+HUF5VLegI2aB8hVvuFSwyJeEc8wcrx+0=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2475.eurprd03.prod.outlook.com (2603:10a6:3:69::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Thu, 24 Sep 2020 09:06:37 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a453:11f5:60d4:4c7b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a453:11f5:60d4:4c7b%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 09:06:37 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 1/6] dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF
 PMICs
Thread-Topic: [PATCH v1 1/6] dt_bindings: mfd: Add ROHM BD9576MUF and
 BD9573MUF PMICs
Thread-Index: AQHWjMjU7MMEh5w2yk6ePDUVLvRJkaluqLMAgAEysICABnZKgIABCBwAgAAwoYA=
Date:   Thu, 24 Sep 2020 09:06:37 +0000
Message-ID: <c390476e4279d8b75de53271e9fb8948d8854528.camel@fi.rohmeurope.com>
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
         <434579d4cddf891f8fa0f50a152c098b113fa2fb.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
         <20200918172834.GA3819336@bogus>
         <06961c1a52e7ed08b970745a64705df83bceeb31.camel@fi.rohmeurope.com>
         <CAL_JsqLj-JqnfH7eh=sR0=izK5NRBusXmwGiuDmX89cn3KA2+A@mail.gmail.com>
         <e5a5f3cb4844af421101d04bcff8534d7758c254.camel@fi.rohmeurope.com>
In-Reply-To: <e5a5f3cb4844af421101d04bcff8534d7758c254.camel@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce1de442-c842-4424-4a02-08d8606924b4
x-ms-traffictypediagnostic: HE1PR0301MB2475:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB24758612843244B0B5AED6CFAD390@HE1PR0301MB2475.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: npt32YH2L7b59ZyI4qkl4RGmbi1WoTmlh/EBnHqrEjz5rBd9B5JC1FGEiQ9bkZysF3lGLed3SEwwCYi8HSSBYlON5v5Nclq1QbA273kvqxEU5i2bSiBWycdm/ZnKN5NbBWxuO3pvwcRar2HdxCIoJS49DHDbbqqZ707TK1O6oyxL/UxZwWjT6H0k0XZsy4rE3s+Lgel6nXGJYwB/7NY65mdn7vl41ECFzIyVMwc5tpQzzQ7/UvNLnWeGgzrnASMkQcidDPF5VqK07jHN+yIeTIeqS3ACFot+r2s5O8KzK6Nq7MQHnDhy41GyFUxNWniG/crrwAr2qG+/KylNc+PLeMjQGXYZswajTv9Xfy6+tj+TP8azCdILegHNFa8I3yP3ZhSUpuMd+wHl/BUaKgccxgJO1setoJiJFV3vcWO24Ow6jDMsOVRA6uYYAwzov8M0BaAJJ6W8ld98AEeuaPkpAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(366004)(136003)(8676002)(478600001)(966005)(76116006)(66476007)(64756008)(186003)(26005)(6916009)(6486002)(3450700001)(66946007)(66556008)(8936002)(2906002)(71200400001)(53546011)(2616005)(66446008)(4326008)(6506007)(54906003)(83380400001)(316002)(86362001)(5660300002)(7416002)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: c5f+HLFsRRUfd8Og9dbV3vnTJx+RRnraT7ksyQLxew8qcpHShBSJZV5RVpWr8f/TMsdd07WU6eKu5zz9a26/dkmPaBp4hg/oZ+V5qgCW3qCRRLf11eCpci9s29Gb1pydbGdLTWhH+MHwWjRpO3MWpEnaVr6PN5RenWS3U3hlvG1MBCtsdqPvJfTyP3Zr9TPzdut+c5XfHOjG1YtNOP0YvpkP9NHpAnwzkRrMtbkGL2pmc6z+1ZJW8VdK+HTIZoc2WZl5KIOBt6gmyIXRxf3vB3s4qNjrEGxS7DXFQsWw7BzvvAOwPCQF+G6cbyXL4BDSQiYrMF/R3mH+quaAvvSEPDXCnIIwLpEdIEhVeTCbaTjh385LSuLuYuVR0UB9JSp1T/L7APGEde3tWF2axp8wVCSsNO94zb8nn2/5kIWg46Au1s+hdGbk/R3zDDMPiTDqOvXyPi3Ala1LabnAcZaGoXc8Ay+w+qQ7C8TlqRzqC+lUOIwFwjtsZN4adiTvLp7VSKWS/Y2KWA0IZ5W+LtfXjSIcdwwjoZQgOqIrVA8YLftTxhGDrLg7yx24rhKx1LXKGZjG/OwlIrWlY6yiAoT9B2JTZUFSQgIwuUnOhXmVV8RT4n1cAmOTA0Zpscf4L6WYMmW014UdhM8mZ8SwZ+sOpg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <E631AA6C806FAF4792440FDE540798D6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1de442-c842-4424-4a02-08d8606924b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 09:06:37.5723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HbZorwyIxnDKepSa+jizG1t2niLQzE1A5YczpkVeobmNTvAzHWljUlIIbBfoIuOw1F6Lifzky0I75+ccex8DU3N1qBDh8VWkMiBWISzHlvfFdHd/d0UK1hlBqXi39WJm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2475
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgZGVlIEhvIHBlZXBzIQ0KDQpPbiBUaHUsIDIwMjAtMDktMjQgYXQgMDk6MTIgKzAzMDAsIE1h
dHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gT24gV2VkLCAyMDIwLTA5LTIzIGF0IDA4OjI3IC0wNjAw
LCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiBPbiBTYXQsIFNlcCAxOSwgMjAyMCBhdCA1OjQ2IEFN
IFZhaXR0aW5lbiwgTWF0dGkNCj4gPiA8TWF0dGkuVmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29t
PiB3cm90ZToNCj4gPiA+IFRoYW5rcyBSb2IgZm9yIHRha2luZyBhIGxvb2sgYXQgdGhpcyENCj4g
PiA+IA0KPiA+ID4gT24gRnJpLCAyMDIwLTA5LTE4IGF0IDExOjI4IC0wNjAwLCBSb2IgSGVycmlu
ZyB3cm90ZToNCj4gPiA+ID4gT24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMTE6MDE6NTJBTSArMDMw
MCwgTWF0dGkgVmFpdHRpbmVuDQo+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+IEFkZCBiaW5kaW5n
cyBmb3IgUk9ITSBCRDk1NzZNVUYgYW5kIEJEOTU3M01VRiBQTUlDcy4gVGhlc2UNCj4gPiA+ID4g
PiBQTUlDcyBhcmUgcHJpbWFyaWx5IGludGVuZGVkIHRvIGJlIHVzZWQgdG8gcG93ZXIgdGhlIFIt
Q2FyDQo+ID4gPiA+ID4gc2VyaWVzDQo+ID4gPiA+ID4gcHJvY2Vzc29ycy4gVGhleSBwcm92aWRl
IDYgcG93ZXIgb3V0cHV0cywgc2FmZXR5IGZlYXR1cmVzIGFuZA0KPiA+ID4gPiA+IGENCj4gPiA+
ID4gPiB3YXRjaGRvZyB3aXRoIHR3byBmdW5jdGlvbmFsIG1vZGVzLg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8DQo+ID4gPiA+ID4gbWF0dGku
dmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICAu
Li4vYmluZGluZ3MvbWZkL3JvaG0sYmQ5NTc2LXBtaWMueWFtbCAgICAgICAgfCAxMjkNCj4gPiA+
ID4gPiArKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyOSBp
bnNlcnRpb25zKCspDQo+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcm9obSxiZDk1NzYtcG1pYy55YW1s
DQoNCi8vIFNuaXANCg0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICBod19tYXJnaW5fbXM6DQo+
ID4gPiA+IA0KPiA+ID4gPiBOZWVkcyBhIHZlbmRvciBwcmVmaXguDQo+ID4gPiA+IA0KPiA+ID4g
PiBzL18vLS8NCj4gPiA+ID4gDQo+ID4gPiA+ID4gKyAgICBtaW5pbXVtOiA0DQo+ID4gPiA+ID4g
KyAgICBtYXhpbXVtOiA0NDE2DQo+ID4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogV2F0Y2hvZyB0
aW1lb3V0IGluIG1pbGxpc2Vjb25kcw0KPiA+ID4gPiANCj4gPiA+ID4gTWF5YmUgdGhlIHdvcmRz
IGluIHRoZSBkZXNjcmlwdGlvbiBzaG91bGQgYmUgaW4gdGhlIHByb3BlcnR5DQo+ID4gPiA+IG5h
bWUNCj4gPiA+ID4gYXMNCj4gPiA+ID4gSSBkb24ndCBzZWUgaG93ICdoL3cgbWFyZ2luJyByZWxh
dGVzIHRvICd3YXRjaGRvZyB0aW1lb3V0Jy4NCj4gPiA+IA0KPiA+ID4gVGhlIGh3X21hcmdpbl9t
cyBpcyBhbiBleGlzdGluZyBwcm9wZXJ0eS4gQXMgSSB3cm90ZSB0byBHdWVudGVyOg0KPiA+ID4g
Imh3X21hcmdpbl9tcyIgaXMgYW4gZXhpc3RpbmcgYmluZGluZyBmb3Igc3BlY2lmeWluZyB0aGUg
bWF4aW11bQ0KPiA+ID4gVE1PIGluDQo+ID4gPiBIVyAoaWYgSSB1bmRlcnN0b29kIGl0IGNvcnJl
Y3RseSkuIChJdCBpcyB1c2VkIGF0IGxlYXN0IGJ5IHRoZQ0KPiA+ID4gZ2VuZXJpZw0KPiA+ID4g
R1BJTyB3YXRjaGRvZykgSSB0aG91Z2h0IGl0J3MgYmV0dGVyIHRvIG5vdCBpbnZlbnQgYSBuZXcg
dmVuZG9yDQo+ID4gPiBzcGVjaWZpYyBiaW5kaW5nIHdoZW4gd2UgaGF2ZSBhIGdlbmVyaWMgb25l
Lg0KPiA+ID4gDQo+ID4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS45LXJj
Mi9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2dwaW8t
d2R0LnR4dA0KPiA+IA0KPiA+IFRoYXQgb25lIGlzIG9kZCBhbmQgSSBoYXZlbid0IGZvdW5kIGFu
IGFjdHVhbCB1c2VyIG9mIGl0LiBJdCB3b3VsZA0KPiA+IG1ha2UgbW9yZSBzZW5zZSBhcyBhIGNv
bGxlY3Rpb24gb2YgcHJvcGVydGllcyBkZXZpY2VzIGNvdWxkIHVzZQ0KPiA+IHJhdGhlcg0KPiA+
IHRoYW4gYSB2aXJ0dWFsIGRldmljZS4NCj4gPiANCj4gPiBJIHRoaW5rIEknZCBkbyBzb21ldGhp
bmcgbGlrZSAnd2F0Y2hkb2ctcGluZy10aW1lLW1zZWMnIHRoYXQgY2FuIGJlDQo+ID4gZWl0aGVy
ICc8bWluPiA8bWF4Picgb3IgJzxtYXg+Jy4NCj4gDQo+IFlvdXIgc3VnZ2VzdGlvbiBsb29rcyBn
b29kIHRvIG1lLiBJZiB3ZSBpbnRyb2R1Y2Ugc3VjaCB0aGVuIGl0IHdvdWxkDQo+IG1ha2Ugc2Vu
c2UgdG8gYWRkIGhhbmRsaW5nIGZvciB0aGlzIGluIEdQSU8gd2F0Y2hkb2cgdG9vLg0KPiANCj4g
V2hhdCBJIGRvIHdvbmRlciBpcyBob3cgImh3X21hcmdpbl9tcyIgaXMgdW51c2VkPyBJIHNlZSBp
dCBpcyBhDQo+IHJlcXVpcmVkIHByb3BlcnR5IGZvciBHUElPIHdhdGNoZG9nLiBUaGUgR1BJTyBX
REcgcHJvYmUgc2VlbXMgdG8NCj4gYWN0dWFsbHkgZXJyb3Igb3V0IGlmIHJlYWRpbmcgdGhpcyBw
cm9wZXJ0eSBmYWlscyB3aXRoIGFueSBlcnJvci4gSQ0KPiB3b3VsZCBhc3N1bWUgdGhlIEdQSU8g
V0RHIGlzIHVzZWQgc29tZXdoZXJlPyBIZW5jZSBJIGFtIGEgYml0IGFmcmFpZA0KPiBvZg0KPiB0
b3VjaGluZyBpdC4gQnJlYWtpbmcgZXhpc3Rpbmcgc2V0dXBzIHdvdWxkIG5vdCBiZSBuaWNlLg0K
PiANCj4gR3VlbnRlciAtIGhvdyBkbyB5b3Ugc2VlIHRoaXM/IFNob3VsZCB3ZSBsZWF2ZSBHUElP
IFdERyBhcyBpdCBpcywNCj4gY29udmVydCBpdCB0byB1c2UgdGhpcyBuZXcgYmluZGluZyBSb2Ig
c3VnZ2VzdGVkIC0gb3Igc3VwcG9ydCBib3RoDQo+IHRoZQ0KPiBvbGQgYW5kIG5ldyAoYXQgbGVh
c3QgZm9yIHNvbWUgdGltZSkgaW4gdGhlIGRyaXZlciAtIGFuZCBwb3NzaWJseQ0KPiBwcmludA0K
PiBhIHdhcm5pbmcgd2hlbiBvbGQgaXMgdXNlZD8NCg0KQW5kIG9uZSB0aGluZyBtb3JlIC0gSSBk
b24ndCB0aGluayB0aGUgJ3dhdGNoZG9nLXBpbmctdGltZS1tc2VjJyBpcw0KYmVzdCBjYW5kaWRh
dGUgYXMgaXQgc291bmRzIGxpa2UgdGhlIHRpbWUgd2hlbiBvbmUgc2hvdWxkIHBpbmcgdGhlIFdE
Rw0KKFNXIGZlYXR1cmUpLiBXZSBhbHJlYWR5IGhhdmUgdGhlIHRpbWVvdXQtc2VjIGRlZmluZWQg
Zm9yIHRoYXQuIFRoaXMNCm5ldyBwcm9wZXJ0eSBpcyB0byBjb25maWd1cmUvYWR2ZXJ0aWNlIHRo
ZSBIVyB0aW1lIGxpbWl0IC0gRWcsIHRpbWUNCndoZW4gV0RHIHRha2VzIGFjdGlvbiBpZiBpdCBo
YXMgbm90IGJlZW4gcGluZ2VkIChmb3IgbWF4KSBvciB0YWtlcw0KYWN0aW9uIGlmIFdERyBpcyBw
aW5nZWQgdG9vIHF1aWNrbHkgKG1pbikuIFRodXMgSSBsaWtlZCBody1tYXJnaW4NCmJldHRlciB0
aGFuIHBpbmctdGltZS4gKEZvciBleGFtcGxlIHdpdGggaHctbWFyZ2luIDw1MDBtcz4gLi4uIDw0
MDAwbXM+DQp0aGUgcGluZy10aW1lIDEwMDAgbXMgd291bGQgYmUganVzdCBmaW5lLg0KDQpDb3Vw
bGUgb2YgdGhpbmdzIEkgd291bGQgbGlrZSB0byBnZXQgb3BpbmlvbnMgZm9yIC4uLiANCg0KMS4g
Q29yZWN0IGxvY2F0aW9uIGZvciB0aGlzIGJpbmRpbmcgLSBhbmQgc2hvdWxkIGl0IGJlIHZlbmRv
ciBzcGVjaWZpYw0Kb3IgZ2VuZXJpYz8NCiAtIEkgd29uZGVyIGlmIEkgc2hvdWxkIHB1dCB0aGlz
IG5ldyBwcm9wZXJ0eSBpbiByb2htLWJkOTU3Ni55YW1sPyANCiAtIFNob3VsZCBpdCBiZSB2ZW5k
b3Igc3BlY2lmaWM/IA0KIC0gT3Igc2hvdWxkIEkgcHV0IGl0IGluIHdhdGNoZG9nLnlhbWwgYW5k
IG1ha2UgaXQgZ2VuZXJpYz8NCg0KSSB0aGluayBpdCBzaG91bGQgYmUgZ2VuZXJpYyBhcyBtYW55
IHdkZyBjaGlwcyBpbXBsZW1lbnQgdGhlIHRpbWVvdXQNCmNvbmZpZ3VyYXRpb24uDQoNCjIuIFNo
b3VsZCB3ZSBleHRlbmQgV0RHIGNvcmUgdG8gcGFyc2UgdGhpcyBwcm9wZXJ0eSBpZiBpdCBpcyBw
bGFjZWQgaW4NCndhdGNoZG9nLnlhbWw/DQoyYSkgQW5kIHNob3VsZCB3ZSBleHRlbmQgd2F0Y2hk
b2cgY29yZSB0byBjYWxsIHRoZSBkcml2ZXIgY2FsbGJhY2sgZm9yDQpzZXR0aW5nIHRpbWVvdXQg
aWYgaXQgZmluZHMgdGhlIDxtYXg+IHRtbz8NCjJiKSBTaG91bGQgd2UgZXh0ZW5kIGRyaXZlciBJ
RiB0byBhbGxvdyBjYWxsYmFjayBmb3Igc2V0dGluZyBtaW4gdG1vPw0KMmMpIEN1cnJlbnQgdG1v
IHNldHRpbmcgY2FsbGJhY2sgdXNlcyB1bml0cyBvZiBzZWNvbmRzLiBTaG91bGQgd2UNCnN1cHBv
cnQgc2V0dGluZyBUTU8gaW4gbXM/IEkgdGhpbmsgaXQgbWlnaHQgbWFrZSBzZW5zZSBmb3IgZmV3
IHNwZWNpZmljDQpMaW51eCBzZXR1cHMuIChJIGtub3cgcGVvcGxlIHVzZSBMaW51eCBmb3IgdGhp
bmdzIHRoYXQgYXJlIGFsbW9zdCBSVCAtDQpubyBtYXR0ZXIgaG93IGNsZXZlciB0aGF0IGlzLiBT
byBzb21lIG1pZ2h0IGJlbmVmaXQgZnJvbSBzdWItc2Vjb25kDQpzY2FsZSB3ZGcgd2luZG93KS4N
Cg0KVGhvdWdodHM/DQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0KDQoNCi0tDQpN
YXR0aSBWYWl0dGluZW4sIExpbnV4IGRldmljZSBkcml2ZXJzDQpST0hNIFNlbWljb25kdWN0b3Jz
LCBGaW5sYW5kIFNXREMNCktpdmloYXJqdW5sZW5ra2kgMUUNCjkwMjIwIE9VTFUNCkZJTkxBTkQN
Cg0Kfn5+ICJJIGRvbid0IHRoaW5rIHNvLCIgc2FpZCBSZW5lIERlc2NhcnRlcy4gSnVzdCB0aGVu
IGhlIHZhbmlzaGVkIH5+fg0KDQpTaW1vbiBzYXlzIC0gaW4gTGF0aW4gcGxlYXNlLg0KIm5vbiBj
b2dpdG8gbWUiIGRpeGl0IFJlbmUgRGVzY2FydGUsIGRlaW5kZSBldmFuZXNjYXZpdA0KDQooVGhh
bmtzIGZvciB0aGUgdHJhbnNsYXRpb24gU2ltb24pDQoNCg==
