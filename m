Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654144896BA
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jan 2022 11:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244237AbiAJKvL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jan 2022 05:51:11 -0500
Received: from mail-tycjpn01on2119.outbound.protection.outlook.com ([40.107.114.119]:56981
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244238AbiAJKvB (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jan 2022 05:51:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOctwHgIFJpi5p99K5Jrmnf7QE6EG9yeqBOYCH1RToZ5no55JPeN5vjffw6hBEm2iPU9clsQvKw15b92a38te0fRiU6SelFUPdbfxmIZTIyXwnScoJSOJcDf4pJyRKeFesbmGtNAOX1Fit3LrJV74RSmO8+iuuGBmeKkDqIvpxxUDCtkZ4I8ehoIifdLtp/sbJBYxeRDR9GToSeJLWQi2Vx4e+eTkxpqR8FctPTuhMq1t4zM98ePs7Ehrgd+LjMzs8VWu3uRSJA9od7KBGdJ+u9Vxmu6h0RxigxBBH4W9wT117ZFY9QAEBgAF9mUds1s3ItmSiyK4H6WUY7XRkZxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LjM4ncpB1SL3UrzNlU6CrU/uBwVSAG3YOfOas8fpU8=;
 b=PfvLeuA9h3/kRECRc9a+VeGm3Tmh3MO0Q9psVx5jTWCsPIZW7u0cju/GfXGEuHgRWvCYF70+kOznMtAts6dHuZSa6qZv78Nm+d8Niio69FosgO9CrZvqCfpjg/bBcKW7+hv5Ry0+ZbzL3Q5cnwAFpkr0w8/p/ezWwebfCh8K3j8X4KKlGMdZP119eFHMMv4/h+jIHwnInIjs6ej+5xyqArXU/I07QfWLoPlVLWAltmkqkNv8BaFzvOpDzGsW6Z/gET42dPT9HgGLFvwcMDtKm1Ab88NeFZ5KmeKyvZ4aOSs54s6ho3McgYThBSGXRX/vgAUjji94Xd8/9LL7nHxZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LjM4ncpB1SL3UrzNlU6CrU/uBwVSAG3YOfOas8fpU8=;
 b=CDKjZNkqg0mNTX6kZYuNXP+s8bnLwLmPS2HfJoAoji8eSV+Q38dQ1Sq7WaayvsapvBAoTW8Q4Y5WRm0PYOu8H0daHG9do7H11HIGr7KbpUxnAPSquWuPGg36Ku/SpY9+zJftr1unqQv2FPOVzLKTc/uzFsQl2f0pWTg23jzL498=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB5224.jpnprd01.prod.outlook.com (2603:1096:604:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 10 Jan
 2022 10:50:58 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 10:50:58 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/4] watchdog: rzg2l_wdt: Use force reset for WDT reset
Thread-Topic: [PATCH v3 2/4] watchdog: rzg2l_wdt: Use force reset for WDT
 reset
Thread-Index: AQHYAZasG7VKN6y6+EmPKW5g0PPE1qxcDByAgAADT+A=
Date:   Mon, 10 Jan 2022 10:50:58 +0000
Message-ID: <OS0PR01MB5922F9FAC00C07568D399F6C86509@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220104181249.3174-1-biju.das.jz@bp.renesas.com>
 <20220104181249.3174-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWYQXsiik3z63UX4fXNfOFqGFt4VnkwOzr9mHkPMZiyWA@mail.gmail.com>
In-Reply-To: <CAMuHMdWYQXsiik3z63UX4fXNfOFqGFt4VnkwOzr9mHkPMZiyWA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5c5cffd-ec6f-492a-3856-08d9d4271620
x-ms-traffictypediagnostic: OSBPR01MB5224:EE_
x-microsoft-antispam-prvs: <OSBPR01MB522467087AE6FE016F0F22E386509@OSBPR01MB5224.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jCHyhsReTlAEN/+XIF6La7mlCg+Zr3HNbwEUEVxU34nBHgA5JREm/Z5DnZG6Qiw+GyzIM8h6bbeUHPbEaBKFaKdswAYnWek1CES5WiF5yO/Nl9dD3TfTjN3Q7ngT8vr6Z8UQWtarp+ZuhlmRQXtoAH9qNWkj5/eMt0Bw9lIAx2Gi+6IR4jIKCwaTmdJbnVOVJ1CFwqP7QpBpGJ8llXyXtphnQNmjSKYmaREnS7R9nKhPl5Zzmz+Vi9eu0diTgVP5QiZOFtW04PtBJKTWj7JjkTXRzSPDhtWPZj6q5+g9gyLoPyVHMll9xJalVBoDp+uf2DHbibk9+Hs4xVQQBVo1m6u81aMrKTzwKLfKV8fw8X0w17gBmoFH+l/WYMka2ZGFYchjTd4FWNjN/UX60D98thq97oRO7HhBTwHbwnu44hVeKXyfk0kate18u07IpsoWp5l5AR79c8A73Nx9D171fMJY7TDo6vydm/IX7INNPGIMO0mOijZY8rt0Rjh20Ra/l9UAQNq6P+QKgeRCP5ayQxreFFzRassmvxxjnbLUFuUpW/DE9SSPoy20XmTHXFPISFHHTDum4OeCtIwc5cUeIfHoP/FYmxGcbfG106Rt3EokufZuonO+tkoAWJAGGLgt7xhXNw/ghSJPFrA1+bUPWtZkCtPDFZomYG7hvFvKRH8/v6wEzP9r2YNRjJGXBBEfvUO2KXv+aaUW11pq2JKdmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(66446008)(2906002)(86362001)(6506007)(33656002)(53546011)(8676002)(52536014)(38070700005)(26005)(7696005)(6916009)(316002)(122000001)(71200400001)(76116006)(5660300002)(64756008)(38100700002)(4326008)(66476007)(66556008)(66946007)(54906003)(9686003)(83380400001)(508600001)(55016003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWtuQ1NMcEoyYWZIbTM1SnJOVEFTZjVxQTBUUUJBR2FSVndnTnFtMEVBNlFD?=
 =?utf-8?B?NXR1eWltK2FFZUZuM3B2NXZSODNzNkRBN1NpNjhpU0RNMkVUVzFHRWNzUmpN?=
 =?utf-8?B?cnd6eEtxWkh2Z2dZZUVoQnZvVk1abCt6blI1T0JMcm5LVVdSL1d2a01HRkh6?=
 =?utf-8?B?VnNEdU1EdXBzOWx0SENVV1dBWnZ4bllROEdEODJ3bjMxeGx3WGpXNDBDVTBI?=
 =?utf-8?B?Q09RNFFtbjVrOFdOVlhDK2tjNTE0VmlqbENGNmFvM1JnZWZpdGlCREJyRFpE?=
 =?utf-8?B?a0RBRUwvTW0yMHJ2Z0ptZDhOMDhoaDFuMkpPUHM3RHJoMHpQSUpwdWg2SnZH?=
 =?utf-8?B?RmNXRU5HdmJnWWFuUlNCMEpFK0FmcHYvN0hocXVQU1J6RkN5ZGRtSkQ1Rlhy?=
 =?utf-8?B?b2xqZXYzY015RWtqNUFKc3E2S2xpSkVQN3p1cWZEQzdCaVAyZFRYeTVxUUps?=
 =?utf-8?B?QnVYOFgyOWRVVm93WFZoVmxhMGJnQjlxNEFPZlMrYkJYREtFb1pGN2pZeDNB?=
 =?utf-8?B?VjZUZ1RVWVBoazBuRE4wbmNJS09WRVB5Z2NrOC9TZ21nOE1zbUx4RmtudFFZ?=
 =?utf-8?B?ZUlXU2x3MGRKTG4ycjBWWkl3bFVMOEJ5TkF2ODRYYUhzSW13akk0ZTVwSURp?=
 =?utf-8?B?elkvOFBaN0pwSk5IYyt3UWpUVVdoYzZmdGRsY29ETEYwZ0xYWEp1V1l6RS9S?=
 =?utf-8?B?UmdEY2E2dnkzUURKdEtZUjNOUmpsTGJIY2EvMElrR3c2SkFFWmRTOUtCVis5?=
 =?utf-8?B?ejBiUGRoNitCWDdwSEZYRzNvSS9ianJ1dTZKd0JpSXVVWm56RGlsU1pLOTVB?=
 =?utf-8?B?RCtPZ2ZSODkwZG1SQ3kwSmhrOFhmb3piaEM3dTVVaDh0ZTIvMDhyakNBclZF?=
 =?utf-8?B?S0psYi9NdHcrT3hadExwWTNHVGJ2dUpKZUdXMmEzaStWVnMwZGwzWC9vREJt?=
 =?utf-8?B?a212Mk83QitjbEIrVm5iQkI1YzNibVF4UkgrbXdNYXAvUVdXR2tiaEpvZHVH?=
 =?utf-8?B?N0F6VnhpZndaWnBkSUplYUlGeVNEMEpMSWJFNFc2WStTaUxybHMwSmk5cUtx?=
 =?utf-8?B?aDgzT3k5dmJ5R295WnU4am1RUkI0YUdBZ3BnWXFVenBEOHNZa2VuR3hyUHEz?=
 =?utf-8?B?UGhzQVF2a1hTSFhybW5CeWxkQVJTL1R6R2NybWljMlczNU05UEw5aUM5SmFo?=
 =?utf-8?B?L2J5NlFBdzRRd2ZDTkFpb0VxdlVqSUllZFRMTnFGRGFtQkRtUTlwcnpadXJJ?=
 =?utf-8?B?MTU0dTdBdE5HaWp1a2xaUG1LVkNZUVZPYTlHdkRacHBxSmNTZW5ldTc0SEJr?=
 =?utf-8?B?Yi9UaTlkU1IrQTZ3dFhKRVlRTGdZdHR3aFBxYW02d3FQL1M4OTA2QmhKelZL?=
 =?utf-8?B?N3lDTTBtWGkwVnRnbDNHdmpuTUJ1MGhaUk9oaXF0YlNHRWYwV1ZEOTB4ZVFs?=
 =?utf-8?B?REFLRDcrWWpoSDcyMzk1aUZxd0tET2FwMndDZWNlZStyVHBjM1QxR2dSRU5j?=
 =?utf-8?B?NkFUcUxEdENqVWQ1WVBpN3FheFg4S29HQWxaK3RpdjBUbVplRDV4QjhuS3c0?=
 =?utf-8?B?cHdwSVFuUzBwWkV6cGM5Z1pzY0krbklYZzc0RHptU3g4MUtib2tKWmQ4TE9M?=
 =?utf-8?B?QjRqTnZaWGRxUzBMbGloelhRUUl2NExHaGR0cnZ3YWRCNkhUVVJLYjlyY1Rq?=
 =?utf-8?B?TkdBdHZMeElqTndHTHBiUmJibmQ1MFBzWnl6NWVxT2lPcGRDNWdHSmx3dFM2?=
 =?utf-8?B?THJvdDQzaUVERkZ5M3lXQ2dEOHhtQVZBWURRQ3JXN2w5OHNlM1Q0cDNhR1Ba?=
 =?utf-8?B?WTBheUJkMUtFbWdTQkhHYlc0cFo0OTlIcm5KMFpsR1VEY1NtWHlFZzJUaktU?=
 =?utf-8?B?bmkvSnBOYndYV0prRlE4UWJRYkttbkRVMDIyS2JqbEIxNzlqekdsTlJiR3F5?=
 =?utf-8?B?Vm43QWdyejdNWVdleWhLSmt2ZEFLNW9vdEN4aXJSSi9VbEwvTnl5eEljZS9n?=
 =?utf-8?B?eWswamxXalBUaGxWRCtPSVlkNFhRb1NDOUhFYTZqMGVsOTg5Q3RrL2Y4UFFs?=
 =?utf-8?B?WWJnN05UTlFQbjNxL0xWU0pyYXVzczdmZ1NPTktGNHdkOGRwcHZxdGdwblNT?=
 =?utf-8?B?Y1R4NUxwSUlsVVcvOFB4YzZqdHV2a1pkNkJSd2pHYS9sU1RoQTlMNkgzOGYv?=
 =?utf-8?B?S01HQ2g2MXNZT3luRGRwYVJ0NlMyR1k1eW1QRlVnUFlzaENnZHI5WVczN3hU?=
 =?utf-8?B?WVlnNkdsbm1vS3pidWJ5c055OFR3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c5cffd-ec6f-492a-3856-08d9d4271620
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 10:50:58.8877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aEXROiMYYiwbhotY/wS0gvA5Eq3MYaEMMfWdVDxEHqpRVr/QKcgP/Mve1CucXEWcpYh+GxzXikWki0ocUz/rp4dGF8I3/tu9EiRjv7Perf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5224
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMi80XSB3YXRjaGRvZzogcnpnMmxfd2R0OiBVc2UgZm9yY2UgcmVzZXQgZm9yIFdE
VA0KPiByZXNldA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgSmFuIDQsIDIwMjIgYXQg
NzoxMiBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IFRoaXMgcGF0Y2ggdXNlcyB0aGUgZm9yY2UgcmVzZXQoV0RUUlNUQikgZm9yIHRyaWdnZXJp
bmcgV0RUIHJlc2V0IGZvcg0KPiA+IHJlc3RhcnQgY2FsbGJhY2suIFRoaXMgbWV0aG9kIGlzIGZh
c3RlciBjb21wYXJlZCB0byB0aGUgb3ZlcmZsb3cNCj4gPiBtZXRob2QgZm9yIHRyaWdnZXJpbmcg
d2F0Y2hkb2cgcmVzZXQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0K
PiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMNCj4gPiArKysgYi9kcml2ZXJz
L3dhdGNoZG9nL3J6ZzJsX3dkdC5jDQo+ID4gQEAgLTIxLDggKzIxLDExIEBADQo+ID4gICNkZWZp
bmUgV0RUU0VUICAgICAgICAgMHgwNA0KPiA+ICAjZGVmaW5lIFdEVFRJTSAgICAgICAgIDB4MDgN
Cj4gPiAgI2RlZmluZSBXRFRJTlQgICAgICAgICAweDBDDQo+ID4gKyNkZWZpbmUgUEVDUiAgICAg
ICAgICAgMHgxMA0KPiA+ICsjZGVmaW5lIFBFRU4gICAgICAgICAgIDB4MTQNCj4gPiAgI2RlZmlu
ZSBXRFRDTlRfV0RURU4gICBCSVQoMCkNCj4gPiAgI2RlZmluZSBXRFRJTlRfSU5URElTUCBCSVQo
MCkNCj4gPiArI2RlZmluZSBQRUVOX0ZPUkNFX1JTVCBCSVQoMCkNCj4gDQo+IFBFRU5fRk9SQ0Us
IGFzIHRoaXMgY2FuIHRyaWdnZXIgZWl0aGVyIGEgcmVzZXQgb3IgaW50ZXJydXB0Pw0KDQpZZXMg
eW91IGFyZSBjb3JyZWN0LCBpdCBzaG91bGQgYmUgUEVFTl9GT1JDRS4NCjEgLS0+IEZvcmNlIHJl
c2V0DQowIC0tPiBCYXNlZCBvbiBvcGVyYXRpb24gb2YgcGFyaXR5IGVycm9yIHJlZ2lzdGVyIGl0
IGNhbiB0cmlnZ2VyIGEgcmVzZXQgb3IgaW50ZXJydXB0Lg0KDQo+IA0KPiA+DQo+ID4gICNkZWZp
bmUgV0RUX0RFRkFVTFRfVElNRU9VVCAgICAgICAgICAgIDYwVQ0KPiA+DQo+ID4gQEAgLTExNiwx
NSArMTE5LDExIEBAIHN0YXRpYyBpbnQgcnpnMmxfd2R0X3Jlc3RhcnQoc3RydWN0DQo+ID4gd2F0
Y2hkb2dfZGV2aWNlICp3ZGV2LCAgew0KPiA+ICAgICAgICAgc3RydWN0IHJ6ZzJsX3dkdF9wcml2
ICpwcml2ID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2Rldik7DQo+ID4NCj4gPiAtICAgICAgIC8q
IFJlc2V0IHRoZSBtb2R1bGUgYmVmb3JlIHdlIG1vZGlmeSBhbnkgcmVnaXN0ZXIgKi8NCj4gPiAt
ICAgICAgIHJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+cnN0Yyk7DQo+ID4gLSAgICAgICBwbV9y
dW50aW1lX2dldF9zeW5jKHdkZXYtPnBhcmVudCk7DQo+IA0KPiBXaHkgYXJlIHRoZXNlIG5vIGxv
bmdlciBuZWVkZWQ/IEJlY2F1c2UgLnByb2JlKCkgdGFrZXMgY2FyZSBvZiB0aGF0Pw0KDQpUaGlz
IGNvZGUgaXMgYWRkZWQgdG8gbW9kaWZ5IFdEVFNFVCByZWdpc3Rlci4gDQpPbmNlIHdhdGNoZG9n
IGlzIHN0YXJ0ZWQsIE9uIHRoZSBmbHksIHdlIHdvbid0IGJlIGFibGUgdG8NCnVwZGF0ZSBXRFRT
RVQgcmVnaXN0ZXIuIEJ5IHJlc2V0dGluZyhhc3NlcnQvZGVhc3NlcnQpIHRoZSBtb2R1bGUNCndl
IGNhbiB1cGRhdGUgdGhlIFdEVFNFVCByZWdpc3Rlci4gSXQgdGFrZXMgMzQgbWlsbGlzZWMgdG8g
dHJpZ2dlciByZXNldC4NCg0KQnV0IHdpdGggUEVFTl9GT1JDRSwgb24gdGhlIGZseSB3ZSBjYW4g
dXBkYXRlIHJlZ2lzdGVyIGFuZCBpdCBpbW1lZGlhdGVseSB0cmlnZ2VycyByZXNldC4NCg0KVGhl
biB3aHkgZG8gLnN0YXJ0KCkgYW5kIC5zdG9wKCkgaGF2ZQ0KPiByZXNldCBhbmQgUnVudGltZSBQ
TSBoYW5kbGluZywgdG9vPw0KDQouc3RhcnQtPiB0dXJucyBvbiB0aGUgQ2xvY2tzIHVzaW5nIFJ1
bnRpbWUgUE0uDQoNCldlIGNhbm5vdCBVcGRhdGUgV0RUU0VUL1dEVEVOIHJlZ2lzdGVycywgb25j
ZSB3YXRjaGRvZyBpcyBzdGFydGVkLg0KQWRkaW5nIHJlc2V0IGFuZCBSdW50aW1lIFBNIGhhbmRs
aW5nIGluIC5zdG9wLCBhbGxvd3MgdG8gc3RvcCB0aGUgd2F0Y2hkb2cuDQoNCi5zdG9wLT4gdHVy
bnMgb2ZmIHRoZSBjbG9jayB1c2luZyBSdW50aW1lIFBNIGFuZCBkb2VzIHRoZSByZXNldChhc3Nl
cnQvZGVhc3NlcnQpIG9mIHRoZSBtb2R1bGUNCiAgICAgICAgaW4gb3JkZXIgdG8gbW9kaWZ5IFdE
VFNFVC9XRFRFTiByZWdpc3RlcnMgYWZ0ZXIgc3RvcCBvcGVyYXRpb24uDQoNCk1heSBiZSBJIHNo
b3VsZCBrZWVwIHBtX3J1bnRpbWVfZ2V0X3N5bmMod2Rldi0+cGFyZW50KSBpbiByZXN0YXJ0IGNh
bGxiYWNrLA0KVG8gdHVybiBvbiB0aGUgY2xvY2tzLCBJZiBzb21lb25lIGNhbGxzIHN0b3AgZm9s
bG93ZWQgYnkgcmVzdGFydCANCg0KUmVnYXJkcywNCkJpanUNCg0KDQoNCj4gDQo+ID4gLQ0KPiA+
IC0gICAgICAgLyogc21hbGxlc3QgY291bnRlciB2YWx1ZSB0byByZWJvb3Qgc29vbiAqLw0KPiA+
IC0gICAgICAgcnpnMmxfd2R0X3dyaXRlKHByaXYsIFdEVFNFVF9DT1VOVEVSX1ZBTCgxKSwgV0RU
U0VUKTsNCj4gPiArICAgICAgIC8qIEdlbmVyYXRlIFJlc2V0IChXRFRSU1RCKSBTaWduYWwgKi8N
Cj4gDQo+IC4uLiBvbiBwYXJpdHkgZXJyb3INCg0KWW91IGFyZSBjb3JyZWN0LCBGb3JjZSBwYXJp
dHkgZXJyb3IgY2F1c2VzIHJlc2V0IGdlbmVyYXRpb24uDQpPSyB3aWxsIHVwZGF0ZSB0aGUgY29t
bWVudC4NCg0KPiANCj4gPiArICAgICAgIHJ6ZzJsX3dkdF93cml0ZShwcml2LCAwLCBQRUNSKTsN
Cj4gPg0KPiA+IC0gICAgICAgLyogRW5hYmxlIHdhdGNoZG9nIHRpbWVyKi8NCj4gPiAtICAgICAg
IHJ6ZzJsX3dkdF93cml0ZShwcml2LCBXRFRDTlRfV0RURU4sIFdEVENOVCk7DQo+ID4gKyAgICAg
ICAvKiBGb3JjZSByZXNldCAoV0RUUlNUQikgKi8NCj4gDQo+IHMvcmVzZXQvcGFyaXR5IGVycm9y
Lw0KDQpPSy4gV2lsbCB1cGRhdGUgdGhlIGNvbW1lbnQuDQoNCg0KUmVnYXJkcywNCkJpanUNCg0K
PiANCj4gPiArICAgICAgIHJ6ZzJsX3dkdF93cml0ZShwcml2LCBQRUVOX0ZPUkNFX1JTVCwgUEVF
Tik7DQo+ID4NCj4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+IA0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0K
PiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1
dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
