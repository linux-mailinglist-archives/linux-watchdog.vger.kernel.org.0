Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E7A4560F3
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 17:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhKRQ4B (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 11:56:01 -0500
Received: from mail-tycjpn01on2137.outbound.protection.outlook.com ([40.107.114.137]:47299
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229662AbhKRQ4B (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 11:56:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjz8LyyjEMi+IH9KeJpn9Vt4UO83sLE67KKklHxGZ+NeXptkXyqSCSjoFIYMnqwbmfKK46G65lILolNGrvIU0c2CVjIuj9AgIH7YdHaAr5Jw7KmyJ89PiZBb3Hr2sayMh9dnns67xYHF+5Ea5ypGjqZddfWif3Of+OpUykd+M/J9K4ov1t11dxrYZMEINc5wWfXtBrPFnyL2iM77jb7HM55DuXsZxt0E0t7jsrQaeY4U6nZxgqEZSKrvEFNfrurnuas+tytz9J9tqqPyp7HC7E7K8WKZAgxiZzygdKDti7Zg6c4clHI0036SdOUIrT5mS96PwyToLwlgpw2j751LxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpqBIlw71LsjVhxLhRnas+zSPtmMI54euHVleLpR47Y=;
 b=A512ovbaPrfHB4TqUNwDathLi8k5336TFiDQmHLj4r9aGSP8h0BIi0qR8K4wFPOgIsnrgyPUnu59aofUqXeUji4IKFC/xwPgkINRxOOxlGjX6dSxMNtYDgkE1pW/ujkCUkWlqpnUTd8fAczAaqYB6C5CkXkm1HJnSIUGMiVMRSZlvr5JM4r965VbvSbtdss0jIYsXwmcfMDBs/wZB336iwbA4WqmYdVDIhJjymzL9WREdoDlTUFyNX2/YWR8DBzz6pjAq1RKszWpc2slqO8WB7rfh2Rxbt7X0QKJANmTEqZg7kwlXeEEWUqC4GR+GrUWm7wjmjktam3ENbYmvNRSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpqBIlw71LsjVhxLhRnas+zSPtmMI54euHVleLpR47Y=;
 b=LHE922bNCxp4PfgvVxBZujyXc4Rg6t5+WLrMjGxwflN00EH1MwaCT3Dj4MJxxlVYP9msA8thmmIlyHfLLjiB0m28Lk+kG5fgGPShpgXNAvkJUVbFFLQTcRf1cnghsTCzSbpOz34F+N+osaHwE5GVUUJH5KrucQ5Fyt3fxqmsH0A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7081.jpnprd01.prod.outlook.com (2603:1096:604:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 16:52:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 16:52:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
Thread-Topic: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
Thread-Index: AQHX1vLnlfB1SUBaW0CHFGqbJXktJKwG4nSAgACCKpCAAaF/AIAAdJswgAAFE4CAAAdIYA==
Date:   Thu, 18 Nov 2021 16:52:57 +0000
Message-ID: <OS0PR01MB592294E00CE862C8C1B0341D869B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
 <20211111115427.8228-2-biju.das.jz@bp.renesas.com>
 <OSZPR01MB70196F7398C5DA1E940E79CAAA9A9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922F6D7662F86089833F326869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUmCCc3UCQe=b_GrFOkZW_tiL1bpsqiTcQRW5TU2GkDNA@mail.gmail.com>
 <OS0PR01MB592263674F271F4B58B9BFF7869B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVzADe1zGoQgWXGJG7uDvAt9o+0C074HkN7EPp+7Mf6Og@mail.gmail.com>
In-Reply-To: <CAMuHMdVzADe1zGoQgWXGJG7uDvAt9o+0C074HkN7EPp+7Mf6Og@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbd18e45-f62d-4a33-b721-08d9aab3df72
x-ms-traffictypediagnostic: OSZPR01MB7081:
x-microsoft-antispam-prvs: <OSZPR01MB7081F428E0F365C3AED5B9F7869B9@OSZPR01MB7081.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QbzjhH0RY4cgMadXett/LYMFercJvODJ4/u1T0TweKtk0pKlKEU4bPWCkgjuf3b/nr5eSYhtleo0NJOdHgq8InU5treyKZDfSXP5FGgvG2C83xxdmIMaDaak7wMVvoEP/kclJgpyDkhf7V0KQze0MUGaKbZuVXNshg+jz6+x7BCsQjclcS4rOWsT+zNIE5QnW5DIODWTMit4Pp3eN7tOo6pH19/HcLN7gytFyq6rEohXa92D1W+zSxGKbUeZuRRSbJbzGdxrh6hSbbwgw/P3r/juSpC1AJiwrubpXMtl1eWtzkrXhGqiT8xRxXARrmM4xP20XWCYGaRyoPXvoUDyI6AcKpXIIMRBYyoe70HQsVcii+qcK4qEVs1hIl78FNaTVYFBAD+Ci1zhbXUIiqaHs0G+1JDi61unhUQf4d4eufbzJpTm9YYrcXzcvsl7EDozs2ZBfSi9iwdfa3HlYu85KDBeLmQOXzsT1nh0xop253Rwn/QjPKS5Ir5JcQ2ts5UwKZEZt+nifS6k62ap3Y8/S79K3mbW31n19VaY4knU1MJdRjx+ahjsqZjE4qJRFfOt5sVR9g1pTtlwy4w1jmziGO0S8CxL53ihTjNrDEQicFwedewdZYlBL3PILVC332QrBhjRhjBVTJ1Pr3mUQZBey4/NouS1fo3DKapFntBSUq/sc61R3zmgua07V6aIH/0xiUl4v2HRVLR9w26ilfwS9TCRl/Q8dSTRFH4FZB95jVw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(76116006)(86362001)(66476007)(508600001)(66946007)(66556008)(66446008)(316002)(54906003)(7696005)(2906002)(71200400001)(4326008)(26005)(52536014)(38100700002)(8936002)(33656002)(122000001)(186003)(9686003)(64756008)(107886003)(38070700005)(8676002)(6916009)(5660300002)(83380400001)(55016002)(171213001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3E3ZFFiOGxUZy9jcFJRZ09IYmlQQU00enJXUVhDUXNodmt5MHhIRThwVWRJ?=
 =?utf-8?B?SUJMYWJSNnp3MXJEVmVsa3l0RFNXTjB2UFNuVFFmRk85eEZUSW9xMnI2bTRt?=
 =?utf-8?B?bTRZRjBWN1dSOG9kOWo4aThncVlMRG9vNDF2M3RTd2I5ZENWNjZrNEJWSElQ?=
 =?utf-8?B?aTFkREtROXlSVlhYbnkvaDR0QkVWNFNGRVczZjZqaEdHbTJybUoxWG9Wbjdp?=
 =?utf-8?B?dUFsVGZSZnRTUTFFV285N0h4cElWNVlqODBKNjFKRUFHckJEZXFDWVJJaGw5?=
 =?utf-8?B?VmM0dUQ1QjFGMFI4RHRCak1WTlRxMGd0d0pSOG9iVC9BSE1kd29qdlhibUw5?=
 =?utf-8?B?ZGdyNnBwdkRxMllTQ3VOaEsxVFdtOE4wVk1XUURrdEpTc2tOTjRtdkdFRmx3?=
 =?utf-8?B?RnVVblJPazBuNjBGL05yTFd4ZWgvZ3h3OXNtQ0Q4WGVhRHhsZ3RrMXVPRGtr?=
 =?utf-8?B?QU1lWDFrY2tIYjdIYlQzNittRTM4ZXZDQlR2c2Izem9DaHZEeDFHZTJ3SUtB?=
 =?utf-8?B?ajdqZmxsSzlJc2tDZlNXMlR2ejJyZ2VUdEgrM0c0eTM4dFdmVkNsWGtOM3ht?=
 =?utf-8?B?bWtSVVRxSEJYQ09ZMXZWZmw4d253dE5ZcW85NjhTc1dYd0dsTmh0UlE2czNN?=
 =?utf-8?B?azJRd0dtTWtaTVdYaXdFRy9XTmZJcVgvZ3dCWFR6anEvWHFrbXovQnhZRElE?=
 =?utf-8?B?TkNwbHVBNHRvUTVPc1lxOGdJMno2cmszTGdkODJpUWhqRnlTRkpHQVdnbTVw?=
 =?utf-8?B?UGk4QnduRGdxV09QVGc5NjNUNUJKZEp6MTgvcTlqV0ZRQllDNFFSa0VEODJy?=
 =?utf-8?B?bnhUVmw5cWFHTjNEenMxWk54YjRidnYvOWRvZFhVWnArT2FoRWQwYkUyc3F6?=
 =?utf-8?B?M3RXYmZxcXVYWTgvNkhuSGMvV3FORklJajBFcEZMaU9MOWJabGNjcHUrcFZU?=
 =?utf-8?B?RWh4cWRhMFFJa256SGtpbytMUC85c2FJOWluYVR0TDFRd0k0UjE1WHkxL0lz?=
 =?utf-8?B?NWYrMnpXL3Qwc05NRklXMUlnemNLVUJraDZvcE9PV3paZkRRc0duR3drVjRR?=
 =?utf-8?B?ZVhmVzYwMThMdTN1d1dOb09OQ2lna0FpaVRmdHl6Y1lWSFNPZXRKTmFMNEtp?=
 =?utf-8?B?NE9Tcis2M1FwUndpR1FkRWNJOTNhbzRSZzFMRjlHUmJCR0llTytSa3Y1SmFt?=
 =?utf-8?B?R2hlRU5SZE9uR0NwMWhZay8rOVllWGt1YkEySndZcmFTdnV1c0U1aHppMlJM?=
 =?utf-8?B?NnhIOC9DaWIwMndXczJqMGxNNjYyRjc1dmJKbUhRdkUxVmxBNmdEcTQrM2E2?=
 =?utf-8?B?ZTBPTmZIQm5zUkJkOTZUZDNyMUNBWkhHQlZTdTl0ZVJBR281cWdxeWdwVHh2?=
 =?utf-8?B?VEF0MndhVVRSaVdVYTZDNkR3Rm9SMXNWMFpJZHdMNWREck0vTThSZUZtTWx1?=
 =?utf-8?B?dDRCdW1wNXpGbjcwTjZVSlhWL2FHUnhtZ1F5RnB4Wk5XQjE4SG9JYmd3R3pR?=
 =?utf-8?B?TTUwZjd6RFk2Q3NJYTZYYzZOR1prOUQxR1QwLzVrOW9DOTZyREdFaGRRU0lD?=
 =?utf-8?B?QVBMM0o2Vmd4Z1VxNWlTQkpjOXc4NGhud0kwd21rdmxHajUrY1ZBZFppYVRh?=
 =?utf-8?B?Q0hHK3hQckR5ZHl1S2JjK2FzWFpsdEtNMExGczNieXI1akNPTUNYZzZobmdM?=
 =?utf-8?B?RXZraWRVZ1loeUpocjU2cHY3a0toQTFXV1M4TEViek8vTVVyRkhTS3RVWUJt?=
 =?utf-8?B?M1lKYTJZRkwyZU9LQVRzbU8zUUNBaW9JYThxUG9KZlBXcUtPVWM0N1B6K2lv?=
 =?utf-8?B?U0RWS0dZZTc0b0JwL3hxSWdqbTI3aGo0K09ZY0ZNdWJhc29pMVl6ekE1bjcv?=
 =?utf-8?B?ODhGOXRWZVByNmd5eVhzSXFrUmY1K0ZtaHhTTmNWTmtOWkM4ZGxDV3AzVTl1?=
 =?utf-8?B?aElRWS84VGF1ZnJDS0txb0NtbkJEUWFYWVUxeFpUajc5VndHRVpzcllocmpO?=
 =?utf-8?B?ZWZ3Y1JNQTBaT0xEQ09LQjdvcXVmY1ZtdkhHZFB4T2pLMGpZN0llcjNPUVlK?=
 =?utf-8?B?a01hVHh5SFBCNGRXcmVVdzJ0VGZ5SmhQSFJIWVNtT2JEMDRSMldib3lHemIv?=
 =?utf-8?B?eU5pTm5ZcDIvNDJXSEVac0JuYnFRVEVwZWhlLzBpYmw4Qy9rK3hiRnBtQS9V?=
 =?utf-8?B?TVA3YTFDM0ozRGkvb0RBQUY0ampvbThlZDBFcS9Hd01ackRsVXhRUkl3aHhx?=
 =?utf-8?B?cGxPZCtKYy95Z1dLU01RdVVmN3l3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd18e45-f62d-4a33-b721-08d9aab3df72
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 16:52:57.2269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOakRLzdwouTgznZQYlEWtKYBmqQzYdNGXOG6mTp1BKhxSDRWofBpNStflV0iN+7kXjYrxvrMrECvtiRPnamtCqRmj4Iht/jBGoGSNZW9/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7081
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIGNsazogcmVuZXNhczog
cnpnMmw6IEFkZCBzdXBwb3J0IGZvciB3YXRjaGRvZw0KPiByZXNldCBzZWxlY3Rpb24NCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIE5vdiAxOCwgMjAyMSBhdCA1OjAxIFBNIEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDEvM10gY2xrOiByZW5lc2FzOiByemcybDogQWRkIHN1cHBvcnQgZm9yDQo+
ID4gPiB3YXRjaGRvZyByZXNldCBzZWxlY3Rpb24gT24gV2VkLCBOb3YgMTcsIDIwMjEgYXQgOToy
MSBBTSBCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
d3JvdGU6DQo+ID4gPiA+IE9uIHRoZSwgbmV4dCB2ZXJzaW9uIEkgYW0gcGxhbm5pbmcgdG8gaW50
cm9kdWNlIHRoZSBiZWxvdyBjb2RlIGZvcg0KPiA+ID4gPiBSZXNldCBzZWxlY3Rpb24gYmFzZWQg
b24gZGV2aWNlIGF2YWlsYWJpbGl0eSwgaW5zdGVhZCBvZiBzZWxlY3RpbmcNCj4gPiA+ID4gYWxs
IHRoZSBjaGFubmVscy4gSXMgaXQgdGhlIHJpZ2h0IHdheSB0byBkbyA/IHBsZWFzZSBsZXQgbWUg
a25vdy4NCj4gPiA+ID4NCj4gPiA+ID4gbm9kZSA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1lIChOVUxM
LCBOVUxMLCAid2F0Y2hkb2dAMTI4MDA4MDAiKTsgaWYNCj4gPiA+ID4gKG5vZGUgJiYgb2ZfZGV2
aWNlX2lzX2F2YWlsYWJsZShub2RlKSB7DQo+ID4gPiA+ICAgICAgICAgLy8gc2V0IHJlc2V0IHNl
bGVjdGlvbiBmb3IgdGhhdCBjaGFubmVsDQo+ID4gPiA+ICAgICAgICAgb2Zfbm9kZV9wdXQobm9k
ZSk7DQo+ID4gPiA+IH0NCj4gPiA+ID4NCj4gPiA+ID4gbm9kZSA9IG9mX2ZpbmRfbm9kZV9ieV9u
YW1lIChOVUxMLCBOVUxMLCAid2F0Y2hkb2dAMTI4MDBjMDAiKTsgaWYNCj4gPiA+ID4gKG5vZGUg
JiYgb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShub2RlKSB7DQo+ID4gPiA+ICAgICAgICAgLy8gc2V0
IHJlc2V0IHNlbGVjdGlvbiBmb3IgdGhhdCBjaGFubmVsDQo+ID4gPiA+ICAgICAgICAgb2Zfbm9k
ZV9wdXQobm9kZSk7DQo+ID4gPiA+IH0NCj4gPiA+ID4NCj4gPiA+ID4gbm9kZSA9IG9mX2ZpbmRf
bm9kZV9ieV9uYW1lIChOVUxMLCBOVUxMLCAid2F0Y2hkb2dAMTI4MDA0MDAiKTsgaWYNCj4gPiA+
ID4gKG5vZGUgJiYgb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShub2RlKSB7DQo+ID4gPiA+ICAgICAg
ICAgLy8gc2V0IHJlc2V0IHNlbGVjdGlvbiBmb3IgdGhhdCBjaGFubmVsDQo+ID4gPiA+ICAgICAg
ICAgb2Zfbm9kZV9wdXQobm9kZSk7DQo+ID4gPiA+IH0NCj4gPiA+DQo+ID4gPiBNYXRjaGluZyBv
biBub2RlIG5hbWVzIGlzIHZlcnkgZnJhZ2lsZS4NCj4gPg0KPiA+IEFncmVlZC4NCj4gPg0KPiA+
ICAgQW5kIHdoYXQgaWYgdGhlIHdhdGNoZG9nIG5vZGUgaXMNCj4gPiA+IGVuYWJsZWQgaW4gRFQs
IGJ1dCB0aGUgd2F0Y2hkb2cgZHJpdmVyIGlzIG5vdCBhdmFpbGFibGU/DQo+ID4gV2Ugd2lsbCBq
dXN0IGNvbmZpZ3VyZSwgYnV0IHNpbmNlIHRoZXJlIGlzIG5vIHdhdGNoIGRyaXZlciBhdmFpbGFi
bGUuDQo+ID4gSSBndWVzcyBub3RoaW5nIHdpbGwgaGFwcGVuLg0KPiA+DQo+ID4gPiBNb3Jlb3Zl
ciwgdGhpcyBsb29rcyBsaWtlIGl0IHNob3VsZCBub3QgYmUgY29udHJvbGxlZCBmcm9tIHRoZSBj
bG9jaw0KPiA+ID4gZHJpdmVyLCBidXQgZnJvbSB0aGUgd2F0Y2hkb2cgZHJpdmVyIGluc3RlYWQu
DQo+ID4NCj4gPiBJIGhhdmUgcmVmZXJyZWQgY29uZmlndXJlIG9wdGlvbiBmcm9tIHJlc2V0IGRy
aXZlciBmb3IgUi1DYXIsIHdoZXJlDQo+ID4gV0RUIGlzIGNvbmZpZ3VyZWQgaW4gcmVzZXQgYmxv
Y2sgYXMgc2ltaWxhciByZWdpc3RlciBpcyBsb2NhdGVkIGluIHJlc2V0DQo+IGJsb2NrIHJhdGhl
ciB0aGUgd2F0Y2hkb2cgZHJpdmVyLg0KPiA+DQo+ID4gTWF5IGJlIEkgc2hvdWxkIG5vdCB1c2Ug
TWF0Y2hpbmcgb24gbm9kZSBuYW1lcywgcmF0aGVyIHVzZSBiaXRtYXNrIG9mDQo+IGJpdHMgYXMg
eW91IHN1Z2dlc3RlZC4NCj4gPg0KPiA+IFBsZWFzZSBzaGFyZSB5b3VyIHZpZXdzLg0KPiANCj4g
T24gUi1DYXIgR2VuMiBhbmQgUlovRzEgU29DcywgdGhpcyBpcyBpbmRlZWQgY29uZmlndXJlZCBi
eSB0aGUgcmNhci1yc3QNCj4gZHJpdmVyLCBiZWNhdXNlIHRoZSBzdXBwb3J0IHdhcyBhZGRlZCBs
YXRlci4gSW5pdGlhbCBSLUNhcg0KPiBHZW4yIHJldmlzaW9ucyBoYWQgaGFyZHdhcmUgcXVpcmtz
IHByZXZlbnRpbmcgcHJvcGVyIG9wZXJhdGlvbi4NCj4gT24gUi1DYXIgR2VuMyBhbmQgb3RoZXIg
UlovRzIgU29DcywgdGhpcyBpcyBjb25maWd1cmVkIGJ5IHRoZSBib290IGxvYWRlciwNCj4gYW5k
IGl0IHdvdWxkIGJlIGdyZWF0IGlmIG5ldyBTb0NzIChSLUNhciBWM1UsIFItQ2FyIFM0LTgsIGFu
ZCBSWi9HMkwpDQo+IHdvdWxkIGhhbmRsZSB0aGlzIHRoZSBzYW1lIHdheS4NCg0KQWdyZWVkLCB3
aWxsIG1vdmUgdG8gYm9vdGxvYWRlci4gT24gUi1DYXIgaXQgaXMgZG9uZSBpbiBURi1BKGJsMl9w
bGF0X3NldHVwKS4NCldpbGwgZG8gdGhlIHNhbWUgZm9yIFJaL0cyTCBhcyB3ZWxsLg0KDQpSZWdh
cmRzLA0KQmlqdQ0K
