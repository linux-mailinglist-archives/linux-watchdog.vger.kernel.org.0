Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540982A781E
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 08:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgKEHkz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 02:40:55 -0500
Received: from mail-eopbgr20048.outbound.protection.outlook.com ([40.107.2.48]:54759
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725827AbgKEHkz (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 02:40:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkR66oxMI0x5qNaACliI9VOxhivsCJie0iedRZxydDUdGlVNY3l2xkdXxORvrC6KtqX08Wd0xzn20tDuakSuohiIJFZPcQLBcPQ8ZBk6vbsBA2VZrIUCtMDFCR//Ppx9dH0o4QGGBIqMQYnIMSCUctMCkMA6eeT+hQDSDWRVjk276sgnZXGomFTotNFWYWROlsAp8YkG33c0W+dwN0mIABtqAEZ+vcjc2+9urlXTFdITvyFz3/0a1WOEEAZDnqqR9rT3TwvKyQMVr12NzhGORGRdAtinPpAIuwmHHV5vKEBbUxdlkX67XtFj8b8ma++e4aVZCuEIYQf4ECjivoPuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg7vA26L6orbYRFgYXt8t6+6yLQCvxTONjNw8/fkLQk=;
 b=ZrNlZW0LcoL/m5pSG2E01cPFDGVvzuqqgmRGOdi9lReSqKyjQpLWLXirmsarNT3yl3R4zTAjsTHnQYjxC5FlQECaQvT7NCFown/gOJ766OzO7V7bTk9TNP8opKcOzEGCStu5go0T+vB/SiumaeHExfd2AQ6GcSiLEGgH7NneziC5D1Sm0lbMt/5hyMAe3Xo6icNeg5FNPUExKOG8opAJ/CVgDck3RKXW3AN40DAGkeLVjlGkb+l0dvB4pwIPupPpqT8i8F7hMUnGO+wqvR0tJqQB3BlGh2GZacVkiA6opXJ7TLaLX/7LiCsAx2ubNiQMOUeHI+IY+RO3PT4nfkcTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg7vA26L6orbYRFgYXt8t6+6yLQCvxTONjNw8/fkLQk=;
 b=xKW2xwCrvme09QvOnOcFoOVtRqQyly8nCI8kEXEQs2QqpkmHo3vN0W47nHn+jTyh4jJyhPYuafdbhQXhklPhhNWUJ4jxpw0I7ELT1XzRzSZiMBrmmqkqKyek2zyzd7p0swuB4vZXPrkJHf9d6KxAE2/8IyavR3Sjno3JSM8sbVQ=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DBAPR03MB6438.eurprd03.prod.outlook.com (2603:10a6:10:19f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19; Thu, 5 Nov 2020 07:40:48 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107%7]) with mapi id 15.20.3477.038; Thu, 5 Nov 2020
 07:40:48 +0000
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
Thread-Index: AQHWrQ9DwN0nkcfMkkiJSgq2+hhNRam4KrWAgAD53wCAAA83gA==
Date:   Thu, 5 Nov 2020 07:40:47 +0000
Message-ID: <98d3a090462d21a97dd15490ac1e9de011819b35.camel@fi.rohmeurope.com>
References: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <c7a838830b7d5ea1c281e419cf0eff0cc50363e0.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <20201104155153.GQ4488@dell>
         <058913084af32743f2e23228a46944bbfcbd52d2.camel@fi.rohmeurope.com>
In-Reply-To: <058913084af32743f2e23228a46944bbfcbd52d2.camel@fi.rohmeurope.com>
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
x-ms-office365-filtering-correlation-id: 200f175a-df2d-4641-243f-08d8815e1cb9
x-ms-traffictypediagnostic: DBAPR03MB6438:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR03MB643820A6A48BB1AFC2E7F9E2ADEE0@DBAPR03MB6438.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NZJkIQd06Jz7shLY+DRnS3SVXiQYP50813xNjyGwfANWKC9cUlTyAY2nGFvB6VLmzGyaeSUvnANrfeVmTWaFTDoIeaYLFCDxEzuhQAIn//tKZSt7YtyoOUNmw6FQUnwDDNnj8JdUpP2d562GmO2s66R/4eJuhboXddKFKKmIniWIcmtT+UoSKFbBM1M8X0iSOY0IJvn8kGSwlKxbOa4T706QiSvuikEoxlhaL0G3WuAqFc4C9db8sFBIwacBr+C1jLtb3C1AXcKDkknWORQMLTAj7iySy12imufPhdtnAXcErZIGZBH/z6SUbVr3tpyWidxtVMZPXHNae6NXTL6q+9uHXJmVAHdwGz0iOVfR1pPkJNCln0FF3X9CgQNk/3gAL86xXBc34Z1cLjeoyKjJjQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39840400004)(396003)(6506007)(6916009)(6512007)(86362001)(26005)(316002)(6486002)(8936002)(8676002)(2616005)(186003)(54906003)(5660300002)(66946007)(91956017)(2906002)(3450700001)(66556008)(66476007)(66446008)(4326008)(71200400001)(64756008)(966005)(478600001)(76116006)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DYBn02qpUiwkwLgVFhECjRHccytG2vZE83+rYeqafuu5bTS7AGPjhiQP9UdAg523y/4guSpYyeuryh43zwK/oENpsUqaABVpLFaSIy2OhOjPZ3zmA5/dOAfHA1CJHosjdup9QvWHT6MfXiYuo3AMch6GDUSeu93Vz2Or17mc006bPHvPBwTYPu/yFlGMHn48CVzMqnfd5SYd9UsCXyDTUB/mCaLgb/3J0TqOsyNZ7oh+Xn1O9Q9NDs9O/Jziw5/9MevppikgJygDDNbL0xYEGeRULpjOnIqD7rTFD7O3efg4a/vE3Di2+M7Zy4jVdaQlKwjE8TrNWU1odyp4u8nyNk+Lif76GCA8uXjIXQhU+i75b9NqFUvmnQTeCymmWRO3rLU7HKzkbZ8gUzN9m99h2eBTpX12URFuIO967R72zAgj7RWxRCbv+p0EHI9MlOXYmtxAep95q58GkXYG0RPIiwJZsyupdSNHsirRVL4aO2Ddu4spq0/m92HEitf+g8WEmTMWHXYQoLPg7GByjwAMha4RzfbtV7eeyBXMWJHFJX72ogLfVIV/WPzjlaG3+v1aFzgAFHbipqAeWw0tLpBRR/Bg5de85ypB3mT7sTEJ90uJHLg1P5nW3uVEUoorqI6yU/97xeABCI040eRlrYYpXw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <592FFCCBE3BACF42B797212C32C1EA06@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200f175a-df2d-4641-243f-08d8815e1cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 07:40:48.0200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +aMpsnDekehKnhaifb7Apm2DnVEZB9afAeq6Tawu+xSgNT/fUTulKfrqocEOy/ATNRXPjSTTqAqMqqDr4fcuHrLDUFckXKy73BlP42GLN8enu1OTO/2nEKncBhCKw2/V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6438
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiBUaHUsIDIwMjAtMTEtMDUgYXQgMDg6NDYgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gTW9ybmluZyBMZWUsDQo+IA0KPiBUaGFua3MgZm9yIHRha2luZyBhIGxvb2sgYXQgdGhp
cyA6KSBJIHNlZSBtb3N0IG9mIHRoZSBjb21tZW50cyBiZWluZw0KPiB2YWxpZC4gVGhlcmUncyB0
d28gSSB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgdGhvdWdoLi4uDQo+IA0KPiBPbiBXZWQsIDIwMjAt
MTEtMDQgYXQgMTU6NTEgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4gPiBPbiBXZWQsIDI4IE9j
dCAyMDIwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+ID4gDQo+ID4gPiBBZGQgY29yZSBzdXBw
b3J0IGZvciBST0hNIEJEOTU3Nk1VRiBhbmQgQkQ5NTczTVVGIFBNSUNzIHdoaWNoIGFyZQ0KPiA+
ID4gbWFpbmx5IHVzZWQgdG8gcG93ZXIgdGhlIFItQ2FyIHNlcmllcyBwcm9jZXNzb3JzLg0KPiA+
ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5l
bkBmaS5yb2htZXVyb3BlLmNvbQ0KPiA+ID4gPg0KPiA+ID4gLS0tDQo+ID4gPiArCXVuc2lnbmVk
IGludCBjaGlwX3R5cGU7DQo+ID4gPiArDQo+ID4gPiArCWNoaXBfdHlwZSA9ICh1bnNpZ25lZCBp
bnQpKHVpbnRwdHJfdCkNCj4gPiA+ICsJCSAgICBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJmky
Yy0+ZGV2KTsNCj4gPiANCj4gPiBOb3Qgb3Zlcmx5IGtlZW4gb24gdGhpcyBjYXN0aW5nLg0KPiA+
IA0KPiA+IFdoeSBub3QganVzdCBsZWF2ZSBpdCBhcyAodWludHB0cl90KT8NCj4gDQo+IEkgZGlk
bid0IGRvIHNvIGJlY2F1c2Ugb24geDg2XzY0IHRoZSBhZGRyZXNzIHdpZHRoIGlzIHByb2JhYmx5
IDY0DQo+IGJpdHMNCj4gd2hlcmVhcyB0aGUgdW5zaWduZWQgaW50IGlzIGxpa2VseSB0byBiZSAz
MiBiaXRzLiBTbyB0aGUgYXNzaWdubWVudA0KPiB3aWxsIGNyb3AgaGFsZiBvZiB0aGUgdmFsdWUu
IEl0IGRvZXMgbm90IHJlYWxseSBtYXR0ZXIgYXMgdmFsdWVzIGFyZQ0KPiBzbWFsbCAtIGJ1dCBJ
IHdvdWxkIGJlIHN1cnByaXplZCBpZiBubyBjb21waWxlcnMvYW5hbHl6ZXJzIGVtaXR0ZWQgYQ0K
PiB3YXJuaW5nLg0KPiANCj4gSSBtdXN0IGFkbWl0IEkgYW0gbm90IDEwMCUgc3VyZSB0aG91Z2gu
IEkgc3VyZSBjYW4gY2hhbmdlIHRoaXMgaWYgeW91DQo+IGtub3cgaXQgYmV0dGVyPw0KPiANCj4g
PiBXaGF0IGhhcHBlbnMgd2hlbiB5b3UgZG9uJ3QgY2FzdCB0byAodWludHB0cl90KSBmaXJzdD8N
Cj4gDQo+IE9uIHNvbWUgc3lzdGVtcyBhdCBsZWFzdCB0aGUgZ2NjIHdpbGwgd2FybjoNCj4gPiB3
YXJuaW5nOiBjYXN0IGZyb20gcG9pbnRlciB0byBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXplIFst
V3BvaW50ZXItDQo+IHRvLWludC1jYXN0XQ0KPiANCj4gSSBhbSBwcmV0dHkgc3VyZSBJIGRpZCBl
bmQgdXAgdGhpcyBkb3VibGUgY2FzdGluZyB2aWEgdHJpYWwgYW5kIGVycm9yDQo+IDopDQo+ICsN
Cj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBiZDk1N3hfb2ZfbWF0Y2hb
XSA9IHsNCj4gPiA+ICsJew0KPiA+ID4gKwkJLmNvbXBhdGlibGUgPSAicm9obSxiZDk1NzYiLA0K
PiA+ID4gKwkJLmRhdGEgPSAodm9pZCAqKVJPSE1fQ0hJUF9UWVBFX0JEOTU3NiwNCj4gPiA+ICsJ
fSwNCj4gPiA+ICsJew0KPiA+IA0KPiA+IFlvdSBjb3VsZCBwdXQgdGhlIDIgbGluZXMgYWJvdmUg
b24gYSBzaW5nbGUgbGluZS4NCj4gDQo+IEJyYWNlcz8gSSBwdXQgYnJhY2VzIG9uIHNlcGFyYXRl
IGxpbmVzIG9uIHB1cnBvc2UuIEJlZW4gZG9pbmcgdGhpcw0KPiBhZnRlciB3ZSBoYWQgdGhpcyBk
aXNjdXNzaW9uOg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE4MDcwNTA1
NTIyNi5HSjQ5NkBkZWxsLw0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTgwNzA2
MDcwNTU5LkdXNDk2QGRlbGwvDQo+IA0KPiA7KQ0KPiANCj4gSSBjYW4gY2hhbmdlIGl0IGlmIHlv
dSB3aXNoZmVlbCBpdCBpcyBpbXBvcnRhbnQgLSBub3QgYSBwb2ludCBJIGZlZWwNCj4gbGlrZSBm
aWdodGluZyBvdmVyIDspDQo+IA0KDQpBaC4gSSBndWVzcyB5b3UgbWVhbnQ6DQpzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBiZDk1N3hfb2ZfbWF0Y2hbXSA9IHsNCiAgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJyb2htLGJkOTU3NiIsIC5kYXRhID0gKHZvaWQgKilST0hNX0NISVBfVFlQ
RV9CRDk1NzYsIH0sDQogICAgICAgIHsgLmNvbXBhdGlibGUgPSAicm9obSxiZDk1NzMiLCAuZGF0
YSA9ICh2b2lkICopUk9ITV9DSElQX1RZUEVfQkQ5NTczLCB9LA0KICAgICAgICB7fSwNCn07IA0K
DQpGZWVsaW5nICJsaXR0bGUgYml0IiBzdHVwaWQuLi4gOnJvbGxleWVzOg0KDQo+ID4gPiArCQku
Y29tcGF0aWJsZSA9ICJyb2htLGJkOTU3MyIsDQo+ID4gPiArCQkuZGF0YSA9ICh2b2lkICopUk9I
TV9DSElQX1RZUEVfQkQ5NTczLA0KPiA+ID4gKwl9LA0KPiA+ID4gKwl7IH0sDQo+ID4gPiArfTsN
Cj4gPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBiZDk1N3hfb2ZfbWF0Y2gpOw0KPiANCj4g
QmVzdCBSZWdhcmRzDQo+IAlNYXR0aQ0KPiANCj4gLS0NCj4gTWF0dGkgVmFpdHRpbmVuLCBMaW51
eCBkZXZpY2UgZHJpdmVycw0KPiBST0hNIFNlbWljb25kdWN0b3JzLCBGaW5sYW5kDQo+IFNXREMN
Cj4gS2l2aWhhcmp1bmxlbmtraSAxRQ0KPiA5MDIyMCBPVUxVDQo+IEZJTkxBTkQNCj4gDQo+IH5+
fiAiSSBkb24ndCB0aGluayBzbywiIHNhaWQgUmVuZSBEZXNjYXJ0ZXMuIEp1c3QgdGhlbiBoZSB2
YW5pc2hlZA0KPiB+fn4NCj4gDQo+IFNpbW9uIHNheXMgLSBpbiBMYXRpbiBwbGVhc2UuDQo+ICJu
b24gY29naXRvIG1lIiBkaXhpdCBSZW5lIERlc2NhcnRlLCBkZWluZGUgZXZhbmVzY2F2aXQNCj4g
DQo+IChUaGFua3MgZm9yIHRoZSB0cmFuc2xhdGlvbiBTaW1vbikNCj4gDQoNCg==
