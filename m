Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC0940FC22
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 17:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241809AbhIQPX2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 11:23:28 -0400
Received: from mail-db8eur05on2053.outbound.protection.outlook.com ([40.107.20.53]:23281
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243098AbhIQPXL (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 11:23:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmF3TSvte0BsqLJeZ5kSFtWXFPX6T/DNEGeLl1ZVt0EwAEb8sN/eVno3er9Da+wX+HkJML3Ssz0aWaPj5Vnde2kt8/6rboqWINE2o5e6ecHRDcIz71XyxyUK7tIiOTjCOk06qGC08jArdiPU8F3F+YM3gJAUDqm4y2WW1b8TmFdu4IqyFPft6Y7n53emDwqSoAwTi6dOMv5smq7FGjsVwm1ZzWYGipp3gapnIsiI22K+rknP9dlMz1RsnP9tJF/0hRU4Xa6OwR2nmuUm2MUvCH/wmUUa+2oANrk2IOaG9DWSxxNpFet8orVJvVt5hG72C/YImebe8IsS1Ll3hDIzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eK6PTtCJEFSgvFQHjyO/ZC7VrHouhfIbnDlkbMnxR9U=;
 b=HsYBxWUvbDK0ytVToJp0wrMvTLXMLs7jKliPevVy83uDc3qUoWgBU3zl4L17yUnlspW/CuUbU2hykaSeoWZCY0T7gQd045kJc+a8vjxvWKEOMXWBipuxHJFZKR2VVg+M+4Fgr3b6tLctqxbifSmtlljjiYDBXHHIk8gUHrtcKvrMD/QrdvGLA6I/6PDf9h9xFb1x8oHRnVpMbYYO/2jXljeeBLEKZkrKvXbn6GNPq5i3dJNanv1NdQvzo5w21l7ChgGSG3L3ply9hmQONkWppAflBOHXYTdDO0vrQHpg4YBSYm7i0c+AD3TodyCxtRG+m38MYQzUDJMilk2PjTzU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eK6PTtCJEFSgvFQHjyO/ZC7VrHouhfIbnDlkbMnxR9U=;
 b=IheSBRknPDnPn9MWv8pDSaQJxondH1rQBwrYoi1ABN60CNVUPfV9/BX4cA4Zotzqd0PNzZwtAqUKuUDn32YxJbuQBClJOuFtlyQRNpwBenZjw6L7K2GpaXSYEkHfFqNLGFOavAC8tr/oEmI0MPwyLN6r1t9AZYmpQIIcMmeKeYg=
Received: from DU2PR01MB8144.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:27a::19) by DU2PR01MB8031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:274::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 17 Sep
 2021 15:21:45 +0000
Received: from DU2PR01MB8144.eurprd01.prod.exchangelabs.com
 ([fe80::acb7:77c3:7771:874f]) by DU2PR01MB8144.eurprd01.prod.exchangelabs.com
 ([fe80::acb7:77c3:7771:874f%8]) with mapi id 15.20.4500.018; Fri, 17 Sep 2021
 15:21:45 +0000
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] watchdog: add new parameter to start the watchdog on
 module insertion
Thread-Topic: [PATCH v3] watchdog: add new parameter to start the watchdog on
 module insertion
Thread-Index: AQHXqwjFnynnXd78L0SZO8eIjsBnUauoTzcAgAAJcQA=
Date:   Fri, 17 Sep 2021 15:21:44 +0000
Message-ID: <DU2PR01MB8144F50D2FA05CDA18BC6E6AF9DD9@DU2PR01MB8144.eurprd01.prod.exchangelabs.com>
References: <20210916144001.1713508-1-f.suligoi@asem.it>
 <36f5e976-e6d4-7e24-f971-0895ab6b1762@roeck-us.net>
In-Reply-To: <36f5e976-e6d4-7e24-f971-0895ab6b1762@roeck-us.net>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 947f390c-4587-47b7-0e87-08d979eedc2d
x-ms-traffictypediagnostic: DU2PR01MB8031:
x-microsoft-antispam-prvs: <DU2PR01MB80318987D77DFA5AE00F283AF9DD9@DU2PR01MB8031.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LC/11bvgeFhIkJhX4x2bPwC7E01sJd0m4PeqkALLunMfOL7wR6e2rsELa8JOTEt75xODbBFKdBAHNVL3hXa1oddvxTHp/TDTIdwDM/tQLT10wsC8eGlE59trQj+oR9R4utxwh6DSPwX21XNwJo5j2MqqRSnGR9xCLQF6axTs3FOVXMRUatPmGzs+WRhbzI7/cL8RlM+o0u4ba1byEO38BKAYTJvTe7dgdj0BszydvgnchVoPwuZ77g1OnMnSeR435JecPjcLd315YOuq7aYXXK9PS5nMGDCR1x/ypyYf2mHJ52scecUtztLdWXZLbAh0ALmrCJF8nCzOEJAhw0ckmUjbguXeKh0KNg6vVhfz7cgRx87To1lBaE1OywTaf9i+Mieg8o3cZhqoMuH5jYBKpA/bjs6WbDrn/vQsuxLmdDM11M/0O9AG4u7yCozISIUJYU3Ssg+Y+LdkHE/fnvidwNlGhzVruzjkKQefxUuegByaAmgqgpi6qtyzyUnfxGr2o9G9AUE5wOq6oup0b48Mv/s4USHNphd8OuzmVzLc7ZyfoBk0yD8dVwYTqx8xM6dpweUI53vbv5DlDR+HWidorw44Z1GuwEFppnAR0buid3yrDXGymwsS+OcRfUcZfjad9P2dgC1UEQHA3TeYA0ZffPGOZxYQLnPoA9G91QQdaK2oAZKWmktYBWf31Q6vvhaDiBOc/CtFHLrS0qi30bCrrg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8144.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(376002)(39850400004)(346002)(396003)(136003)(366004)(7696005)(316002)(83380400001)(186003)(38070700005)(33656002)(38100700002)(110136005)(86362001)(71200400001)(52536014)(26005)(54906003)(8676002)(66476007)(64756008)(6506007)(66556008)(5660300002)(9686003)(55016002)(66446008)(8936002)(2906002)(122000001)(66946007)(76116006)(4326008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVlMMi9yZGw1OFlQc1J4Q3Zlb0ZYOVhJN0hMeHhiKzU1K2FMeHZoNURhbngw?=
 =?utf-8?B?cmNyTWM5NmRPWDE5eXdOSnV6VDUvOTU0SnhoRzVPMk5YdldiUWg2cUhad0lW?=
 =?utf-8?B?WUVhSyswSExpU1JUUVRQNnh1U002bjN6LzNVb1d3Mk91WGdhZFZ0OCtyeSta?=
 =?utf-8?B?dXF3SkxCTTRHSkNMWGNWY1NtelY3U2l5TVl0K1lDYVMyZHR4Qys1cldrclhi?=
 =?utf-8?B?c1JydW9lb216UlpRTkw0WXFBYnFaT3h6ZUJzWlR0VGNOaG9pa1pxQlk5NFg3?=
 =?utf-8?B?ODFFc01teVNXWlN4MFBFOWFFY29Na05OeGhHM1AralhLRlRSdjB3N0VuZ3hy?=
 =?utf-8?B?WkVxVWMweGpFcDh6T2tpdGFkZjlOcDQvdUpRZFZZRWdhY0MvRE1SY2Evd3ZY?=
 =?utf-8?B?VitBNDdoRkdCRkpNTnZNWkRObHVDZGRWWWV1RmtQMGpURGF1YXc1Y0xXTW1m?=
 =?utf-8?B?WXZkSDFxYXV4R0F2dGs5aEp6cVRiK2pZNWxnLzRPdmJFRFZ5cUcrSWxvS0Za?=
 =?utf-8?B?MVBYMTliWTM5T1AxZitST28zQzhlcXhQMVhmYjkraVRkV1Z5VTVMNU05ZXVn?=
 =?utf-8?B?Nmt4WWJxR3MyU2xWc045VnZVVUxzMkRjV2NKd1ArQWtneW1ObWYxT0pyd3Ni?=
 =?utf-8?B?YVNPYldhR0QvNHlUNDM5djM5a2o1WkhmOGVBaUtHcmppWFVyYXMybG1KMERJ?=
 =?utf-8?B?WWIwTmMxS1FmeENlR1pDLzdBTUVNZFpVTm9ZT3IwU0xxMGJpU3ZLZjhMaXlo?=
 =?utf-8?B?Y1pzSGZGamNHV1hPRzlLSXNFNkFFMm9NMUZ0byt6Y1FMenBGVFJEZldYaWtD?=
 =?utf-8?B?VHhOSG1YbVlYdEgxbUdBZjlJNGIvWWRSOTZPczRLWUxnTVN2OUhORUk0RUQ5?=
 =?utf-8?B?S2d5a1d3cktvelhrVHBITWYwc1k4Ynk5OHVmWWZYREhZY3BydHBhaFBaQnN5?=
 =?utf-8?B?MWRPakU4UE4xNUtNOVBCcGN4Wituc1Y3djVVZlFLSm9xWkxTRjA0UmFCWWJW?=
 =?utf-8?B?TWZRNzl5WkZNYlYwZWVuUTRBUGFjaC9NNnNZM1plWEZpZ2ZhWThVRG0wUWQ1?=
 =?utf-8?B?bC9yVmhQYmVqYmJTbk9VaE16YVdndDBLVUZnRzJwTTMxY0NYaDNxS09zcVlB?=
 =?utf-8?B?NHlMdlVzUmVwTFUrVHhUSit3RXIvVm04aG5DWWlNTG1rT0ZiRDRlNnQ2WmQw?=
 =?utf-8?B?OCs5QndCd3p0S2N1dEc0eERHaWRCT2ZXYjhWWDB5UTFSZXhHOTQ2a0Ryd2dJ?=
 =?utf-8?B?VURJNExKNm5MRG50SW5kOWJ4OWNtLzVUYldXa0kwWEs1WUVGVXJoeVRERUVv?=
 =?utf-8?B?WmxQZ0o1VlhvaDNpalluWHpReGJVTktJMjdjeGFPSDZRaDk0U2doYitONjdX?=
 =?utf-8?B?R1ZIMW5SVU1ROElJSEp4MzhzUjhvR3RyT0krYTZyRVZkL3pxRWt5Q1YwZWVn?=
 =?utf-8?B?K1B5MkRGOHlxY2I5d01TcWYrckFvQmJjcGVHMFE3eG11bXZ3NGE5NFR0V3Z4?=
 =?utf-8?B?TlRnZ3FwbTBBNGxKWFUrNlpTWlh6Z2RRUXJmc2wwWURVeE14MDIrRUs5eTI1?=
 =?utf-8?B?QXBDZzVkRmZkT3R5c1R6d2pJbG85ZU5nM1JGRUR1cjlMWnFaTzY4WTNPa0Fu?=
 =?utf-8?B?bFE3b2UvSXhTT3NlemZ1TW1RQ1c1U1lvZmlETDBVYzN1MXZJdkFscDhpT0t0?=
 =?utf-8?B?a09ydlNMNndnY0ZnM3hyaGFOakxuMUhwQzRlYng1dzYxcG1xUnZtVnBISkRP?=
 =?utf-8?Q?nK3/6Bt1KkIiws/8SY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8144.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947f390c-4587-47b7-0e87-08d979eedc2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 15:21:45.1678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FEY/3CMahZqJTpZ/C2ZGUdYCN2HXbsdfN+d4aEHAADdm30+ZnYNqUJOxfnuExBoGUQTBaogHmAd4/XAixbe0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8031
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciwNCg0KLi4uDQo+ID4gdjM6IC0gYWRkIGNoZWNrIGZvciB0aGUgcmV0dXJuZWQg
ZXJyb3Igb2Ygd2RvZyBzdGFydCBmdW5jdGlvbg0KPiA+IHYyOiAtIGNoZWNrIFdET0dfSFdfUlVO
TklORyBiZWZvcmUgc3RhcnRpbmcgd2F0Y2hkb2c7DQo+ID4gICAgICAtIHJlbW92ZSB1c2VsZXNz
IGNvbW1lbnRzIGluIGNvbW1pdCB0ZXh0LCB3YXRjaGRvZy1wYXJhbWV0ZXJzLnJzdCBhbmQNCj4g
PiAgICAgICAgS2NvbmZpZzsNCj4gPiB2MTogLSBmaXJzdCB2ZXJzaW9uOw0KPiA+DQo+ID4gICBE
b2N1bWVudGF0aW9uL3dhdGNoZG9nL3dhdGNoZG9nLXBhcmFtZXRlcnMucnN0IHwgIDMgKysrDQo+
ID4gICBkcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDkg
KysrKysrKysrDQo+ID4gICBkcml2ZXJzL3dhdGNoZG9nL3dhdGNoZG9nX2NvcmUuYyAgICAgICAg
ICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKw0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi93YXRjaGRv
Zy93YXRjaGRvZy1wYXJhbWV0ZXJzLnJzdA0KPiBiL0RvY3VtZW50YXRpb24vd2F0Y2hkb2cvd2F0
Y2hkb2ctcGFyYW1ldGVycy5yc3QNCj4gPiBpbmRleCAyMjNjOTkzNjFhMzAuLjc3ODBkMGMxZmI0
YSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3dhdGNoZG9nL3dhdGNoZG9nLXBhcmFt
ZXRlcnMucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi93YXRjaGRvZy93YXRjaGRvZy1wYXJh
bWV0ZXJzLnJzdA0KPiA+IEBAIC0yMSw2ICsyMSw5IEBAIHdhdGNoZG9nIGNvcmU6DQo+ID4gICAJ
dGltZW91dC4gU2V0dGluZyB0aGlzIHRvIGEgbm9uLXplcm8gdmFsdWUgY2FuIGJlIHVzZWZ1bCB0
byBlbnN1cmUgdGhhdA0KPiA+ICAgCWVpdGhlciB1c2Vyc3BhY2UgY29tZXMgdXAgcHJvcGVybHks
IG9yIHRoZSBib2FyZCBnZXRzIHJlc2V0IGFuZCBhbGxvd3MNCj4gPiAgIAlmYWxsYmFjayBsb2dp
YyBpbiB0aGUgYm9vdGxvYWRlciB0byB0cnkgc29tZXRoaW5nIGVsc2UuDQo+ID4gKyAgICBzdGFy
dF9lbmFibGVkOg0KPiA+ICsJV2F0Y2hkb2cgaXMgc3RhcnRlZCBvbiBtb2R1bGUgaW5zZXJ0aW9u
LiBUaGlzIG9wdGlvbiBjYW4gYmUgYWxzbw0KPiA+ICsJc2VsZWN0ZWQgYnkga2VybmVsIGNvbmZp
ZyAoZGVmYXVsdD1rZXJuZWwgY29uZmlnIHBhcmFtZXRlcikuDQo+ID4NCj4gPiAgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgYi9kcml2ZXJzL3dhdGNoZG9nL0tjb25m
aWcNCj4gPiBpbmRleCBiODFmZTRmN2Q0MzQuLjE5YmU3MDllMDFhYyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3dhdGNoZG9nL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL0tj
b25maWcNCj4gPiBAQCAtNDcsNiArNDcsMTUgQEAgY29uZmlnIFdBVENIRE9HX05PV0FZT1VUDQo+
ID4gICAJICBnZXQga2lsbGVkLiBJZiB5b3Ugc2F5IFkgaGVyZSwgdGhlIHdhdGNoZG9nIGNhbm5v
dCBiZSBzdG9wcGVkIG9uY2UNCj4gPiAgIAkgIGl0IGhhcyBiZWVuIHN0YXJ0ZWQuDQo+ID4NCj4g
PiArY29uZmlnIFdBVENIRE9HX1NUQVJUX0VOQUJMRUQNCj4gPiArCWJvb2wgIlN0YXJ0IHdhdGNo
ZG9nIG9uIG1vZHVsZSBpbnNlcnRpb24iDQo+ID4gKwloZWxwDQo+ID4gKwkgIFNheSBZIGlmIHlv
dSB3YW50IHRvIHN0YXJ0IHRoZSB3YXRjaGRvZyBhdCB0aGUgc2FtZSB0aW1lIHdoZW4gdGhlDQo+
ID4gKwkgIGRyaXZlciBpcyBsb2FkZWQuDQo+ID4gKwkgIFRoaXMgZmVhdHVyZSBpcyB2ZXJ5IHVz
ZWZ1bCBpbiBlbWJlZGRlZCBzeXN0ZW1zLCB0byBhdm9pZCBjYXNlcyB3aGVyZQ0KPiA+ICsJICB0
aGUgc3lzdGVtIGNvdWxkIGhhbmcgYmVmb3JlIHJlYWNoaW5nIHVzZXJzcGFjZS4NCj4gPiArCSAg
VGhpcyBwYXJhbWV0ZXIgYXBwbGllcyB0byBhbGwgd2F0Y2hkb2cgZHJpdmVycy4NCj4gPiArDQo+
ID4gICBjb25maWcgV0FUQ0hET0dfSEFORExFX0JPT1RfRU5BQkxFRA0KPiA+ICAgCWJvb2wgIlVw
ZGF0ZSBib290LWVuYWJsZWQgd2F0Y2hkb2cgdW50aWwgdXNlcnNwYWNlIHRha2VzIG92ZXIiDQo+
ID4gICAJZGVmYXVsdCB5DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hk
b2dfY29yZS5jDQo+IGIvZHJpdmVycy93YXRjaGRvZy93YXRjaGRvZ19jb3JlLmMNCj4gPiBpbmRl
eCAzZmU4YTdlZGMyNTIuLmNiNTMwYjA5NzIyMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3dh
dGNoZG9nL3dhdGNoZG9nX2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hk
b2dfY29yZS5jDQo+ID4gQEAgLTQ0LDYgKzQ0LDExIEBAIHN0YXRpYyBpbnQgc3RvcF9vbl9yZWJv
b3QgPSAtMTsNCj4gPiAgIG1vZHVsZV9wYXJhbShzdG9wX29uX3JlYm9vdCwgaW50LCAwNDQ0KTsN
Cj4gPiAgIE1PRFVMRV9QQVJNX0RFU0Moc3RvcF9vbl9yZWJvb3QsICJTdG9wIHdhdGNoZG9ncyBv
biByZWJvb3QNCj4gKDA9a2VlcCB3YXRjaGluZywgMT1zdG9wKSIpOw0KPiA+DQo+ID4gK3N0YXRp
YyBib29sIHN0YXJ0X2VuYWJsZWQgPQ0KPiBJU19FTkFCTEVEKENPTkZJR19XQVRDSERPR19TVEFS
VF9FTkFCTEVEKTsNCj4gPiArbW9kdWxlX3BhcmFtKHN0YXJ0X2VuYWJsZWQsIGJvb2wsIDA0NDQp
Ow0KPiA+ICtNT0RVTEVfUEFSTV9ERVNDKHN0YXJ0X2VuYWJsZWQsICJTdGFydCB3YXRjaGRvZyBv
biBtb2R1bGUgaW5zZXJ0aW9uDQo+IChkZWZhdWx0PSINCj4gPiArDQo+IAlfX01PRFVMRV9TVFJJ
TkcoSVNfRU5BQkxFRChDT05GSUdfV0FUQ0hET0dfU1RBUlRfRU5BQkwNCj4gRUQpKSAiKSIpOw0K
PiA+ICsNCj4gPiAgIC8qDQo+ID4gICAgKiBEZWZlcnJlZCBSZWdpc3RyYXRpb24gaW5mcmFzdHJ1
Y3R1cmUuDQo+ID4gICAgKg0KPiA+IEBAIC0yNTIsNiArMjU3LDE3IEBAIHN0YXRpYyBpbnQgX193
YXRjaGRvZ19yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0DQo+IHdhdGNoZG9nX2RldmljZSAqd2RkKQ0K
PiA+ICAgCSAqIGNvcnJ1cHRlZCBpbiBhIGxhdGVyIHN0YWdlIHRoZW4gd2UgZXhwZWN0IGEga2Vy
bmVsIHBhbmljIQ0KPiA+ICAgCSAqLw0KPiA+DQo+ID4gKwkvKiBJZiByZXF1aXJlZCwgc3RhcnQg
dGhlIHdhdGNoZG9nIGltbWVkaWF0ZWx5ICovDQo+ID4gKwlpZiAoc3RhcnRfZW5hYmxlZCAmJiAh
d2F0Y2hkb2dfaHdfcnVubmluZyh3ZGQpKSB7DQo+ID4gKwkJc2V0X2JpdChXRE9HX0hXX1JVTk5J
TkcsICZ3ZGQtPnN0YXR1cyk7DQo+ID4gKwkJcmV0ID0gd2RkLT5vcHMtPnN0YXJ0KHdkZCk7DQo+
ID4gKwkJaWYgKHJldCA9PSAwKSB7DQo+ID4gKwkJCXByX2luZm8oIldhdGNoZG9nIGVuYWJsZWRc
biIpOw0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCXJldHVybiByZXQ7DQo+ID4gKwkJfQ0KPiAN
Cj4gVGhpcyBzaG91bGQgYmUNCj4gCQlpZiAocmV0KQ0KPiAJCQlyZXR1cm4gcmV0Ow0KPiAJCXBy
X2luZm8oIldhdGNoZG9nIGVuYWJsZWRcbiIpOw0KPg0KDQpSaWdodCwgaXQgaXMgc2ltcGxlciEh
ISDwn5iKDQoNCj4gQWxzbywgdGhpcyBuZWVkcyBhbiBlcnJvciBoYW5kbGVyIHRvIHN0b3AgdGhl
IHdhdGNoZG9nIGlmIGRyaXZlciByZWdpc3RyYXRpb24NCj4gZmFpbHMgKGlmIHRoZSBkcml2ZXIg
c3VwcG9ydHMgc3RvcHBpbmcgdGhlIHdhdGNoZG9nKS4NCg0KT2ssIEknbGwgdGhpbmsgaG93IHRv
IGRvIHRoaXMuDQoNCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRlcg0KPiANCj4gPiArCX0NCj4gPiAr
DQo+ID4gICAJLyogVXNlIGFsaWFzIGZvciB3YXRjaGRvZyBpZCBpZiBwb3NzaWJsZSAqLw0KPiA+
ICAgCWlmICh3ZGQtPnBhcmVudCkgew0KPiA+ICAgCQlyZXQgPSBvZl9hbGlhc19nZXRfaWQod2Rk
LT5wYXJlbnQtPm9mX25vZGUsICJ3YXRjaGRvZyIpOw0KPiA+DQoNCkZsYXZpbw0KDQo=
