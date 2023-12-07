Return-Path: <linux-watchdog+bounces-166-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432CC808DAD
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Dec 2023 17:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A26A7B20B6F
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Dec 2023 16:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F9946B95;
	Thu,  7 Dec 2023 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Jrmj0y0z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39B612E;
	Thu,  7 Dec 2023 08:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuDRbij65RXkaQkPoCgPEFegn5qZCSwjX0ra4iTBNthnPwvCjYk0gjpG/Xg9HL0kQbmh0+r9eml0oWe2kc8JT72MI7rMC4Gch+4wBt7eVhWM01QqOHGoKajmL3rB0DFG8XlGyLQ/bm47k4LbbJQMag0oDSh1hmXkS8t2Wcl+FSm5G2Np7FmqVwTqemg6o7qr8wK37+1n/4ujP3JUxexZR9Zv3t1hpao25aVb+BOKSM3jvSJo5EwFTusxttT943DLKgbcITtSVKOYM+sKIuDAuiksI6r0LbQGA5oSR/8qymTssU1kINf/vDkJOdOEuATFSj7UVFTgy7ZN/LuSVMTQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlYfMLPDBk/uQnmAeCj3deWqE+WCkT2mRuvfvxhZ2hs=;
 b=PBjQ8i4H15PfYTOFGsTPXkCYinPfj68ptTqF2iuTdT23qG2YNhsS9hu9DeL2RJA43A2TWRb9FxFVlkYFnh/CAL4c2CJoUxTZtkmIjd8I5oJ8XaUQdOA3ykodpyByZndFf3uCefqnzgOGPsX1l5LOF7431bihTszniAFY2b8pe0amLMOT+iFTWwEbVJYJM8OCzndlYvQ2Hp22ZA+oraLOekrnZnL+Ko1EASLxRjBHAoPf/hBMMrvJcf0tRKmGf4iEhZp4nY8YreN7rum1ThgsIXSyA997MmdWizV3+7nzwqDhl7AYpXFzz1JGqm4V1y8fYHWeCNrGCqnDVWVKHUrfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlYfMLPDBk/uQnmAeCj3deWqE+WCkT2mRuvfvxhZ2hs=;
 b=Jrmj0y0zhc/DfEH7nax2gP17gx1OEpYgHZVDwBlAcbM5r1r+kQHL+WEAHE0V8XUGtsDPTNHCT/MDT07jFUyTw3C8ZNkpfjqdx0R8lTpUG84jA/XouJWt0Tq3l3+ThkCxzAP7UtlKRV3VSdTh9aj12+4dLvq20U64zMTWRpHoK0Y=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB11939.jpnprd01.prod.outlook.com
 (2603:1096:400:3e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 16:41:32 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7091.010; Thu, 7 Dec 2023
 16:41:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lee Jones
	<lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
CC: Support Opensource <support.opensource@diasemi.com>, Steve Twiss
	<stwiss.opensource@diasemi.com>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Thread-Topic: [PATCH v4 2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Thread-Index: AQHaKFz8TieRQDg5kUKV9s763Haw8bCdf+UAgACHtuA=
Date: Thu, 7 Dec 2023 16:41:32 +0000
Message-ID:
 <TYCPR01MB11269D458652AC88522260268868BA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231206155740.5278-1-biju.das.jz@bp.renesas.com>
 <20231206155740.5278-3-biju.das.jz@bp.renesas.com>
 <a27c0fc9-614d-4207-b087-87b44bc38156@linaro.org>
In-Reply-To: <a27c0fc9-614d-4207-b087-87b44bc38156@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB11939:EE_
x-ms-office365-filtering-correlation-id: 085709ee-f8e5-42c3-f9be-08dbf7435eca
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ObI+EsyHh+zN/ldUAS9GlT9MQTCivYVfSHSf0dmfh1IcJQeviWoOncKEJYLOjL1mtgXO+4DlFOCGc4XoxiYINSVuVK4tVnrkqkgtWhNxzejwLRP7GPufqU4KHgi6Xh/EnT6U5h1xaT/5Uwgb5HJMA9ELTriY1WZhvcrVwd/xbEuADjx5zVExoIw6GgBoEXptlhiMC9P5t2DqnW4Ob2Hum8qSRRbH9CiUHitrUFHQIs5EKdzNu106C0gNkx3MV12c8t4lgdwxWkRzRRyK/ZI2oxr5pHuy2a8TRY+6/UyA/hy3IchvExivir5SW4CUesABYUTFG3fX0KPq0mxSJ9qYxcrA/G7oMt0zQxwyvnnkIBWBa9/VudlRhWRHBwSpkCajxrxegnHZI9IWCuN/HnZMMmSTHbiSgpKAij7k1ZWY+UlcxrUiq+dTPhs5fpGt9ME92WmqjL77Ze+179Gdaps0SpjmcK1MG9daRHhYjejWtWM0YznK8glJxLJzotxRGIk5LTqaFXT71w5Otk129eQE8lue0vNhkz6EnfF10Og7DYiMTHrSlp734BUQlyGEMcEQpLGl1fGJppqByCbvJ64qZqGG1MZvwGtyv1aEZqVkPtQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(41300700001)(7416002)(38100700002)(5660300002)(86362001)(2906002)(33656002)(122000001)(6506007)(53546011)(71200400001)(26005)(7696005)(478600001)(8676002)(52536014)(66946007)(76116006)(4326008)(66556008)(66476007)(64756008)(9686003)(110136005)(54906003)(83380400001)(66446008)(316002)(8936002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXlpNzUwWklSTHpGQzBzVnJIUHBVcTE4NGZWcTdIbnZwWGV1MHRYbzF0N3JV?=
 =?utf-8?B?aXlRdC9qWnJxNjBEclIzRUVtUmJucTdrM05Dd3hLa2wzK29QNVFwOGNTUnkv?=
 =?utf-8?B?Tmwzazlob3lIR1E1NG9lV09IL2ZpZHV3NEhBQ3ZOK2lpY3h4NzY4b3NhVk5w?=
 =?utf-8?B?VzZGL0t3MGpWcG1GbGtBR2RhdFFQempWeXhhZGpsWDdzbWIwQk5UQUlrSGRU?=
 =?utf-8?B?dHdnZEdEeVA3L2hJcUpZYmRsZHFXMzJOY3hqdmhNTWlBQkhPL04yWHcwSHNn?=
 =?utf-8?B?RG0zSjNYakVNNDlvQTVZTmFJYTJ4VEpJemFWRHE5TXVUaEFzaTFvS2svaXJD?=
 =?utf-8?B?ai9IRnI0YWxGYnJoWndkM2Nrd1NQMmNiazYyaTE0SVoyU0RJbWY2SW53RFBz?=
 =?utf-8?B?QkVXZVJjYTRKd2FzRTF2Q2RWV205SjQ5SUtWSzN1N2dUSm1pbGtUbm82WGJP?=
 =?utf-8?B?dS94QWdVamZ6WS9UT3Jrcjc4Tm80V3VoQWRoTTRTYThFYmFIV29LTis2ME04?=
 =?utf-8?B?TysycC8rSituakFpVVlYbUFQU3llYVZJaWJBUnV2QktDdzlsQzh0Y29vN29a?=
 =?utf-8?B?NFV3Q1J6TEVVblFJVGIyWEtVWWxnNTM4UGorT05ZcHliWVZ4T0pOSkwrWkpP?=
 =?utf-8?B?WmQ5NDNCWG1WZ0tteTdRdmc4UU91K1dVNW9od2x4Zmx2Mmh5d042Nk1kMEYv?=
 =?utf-8?B?M1dnakVHVU9WU09EWXIySjIxUmtuajA4eTB0UnMvMW1SM09LMU9iME1TYkM3?=
 =?utf-8?B?VHQ4QUN6MzFNSkpZcUgybzhISG5XNzBqLzFHakxBbjlnWkVFd2xSYTEwVmFR?=
 =?utf-8?B?NEYrVVg4dnAwNFhLUThCWUlIeW9KWDlpNjdKQnVralYyMk9VRDV2Rkc2czJU?=
 =?utf-8?B?VmdRSjdmdFlReXROdUgzdXk1dWFoRU9rdDFYRm1TOE9lMlVYSERVVWZKeGVF?=
 =?utf-8?B?aVgrak1lZDdwUGp5Y2pTZElRcmpxcnBqUXU0MlI1SFkxamtaMW1HTG4vM3lm?=
 =?utf-8?B?ZWw0WFl4cld2NzZ5OU9oclFjdmVycSttZDdSYXlOamdCSktvZnh0ZlQ1VFVa?=
 =?utf-8?B?VjRJOUxMbm9oMmdVUGU4bzEzdllCTklMMGdvVk1ybnZDUGFiNHNzVytkb28x?=
 =?utf-8?B?cEVFMXdxQ3p5NW5mR3p3ZnRJSk1PVTZFdDV1S2N0NkNJK3piZ3ptUEp6NWRi?=
 =?utf-8?B?YmI5N3F4UG9EYnl2OWRvZ0YzZU8xL3FtWXhGQ1JuYkRSamoyR3RtbGJibWdl?=
 =?utf-8?B?OEg4NnlNU1V5SVJ0SzEyZUlSWVpzdHF4UE1sODIxRTdrWHEySFZnMFNhQUF0?=
 =?utf-8?B?by9tVTh6Qlp5bVdNbmtLTmRudDRhTi9uemtKbi9UYjB1Q2ZCWnEwbWJnVFN6?=
 =?utf-8?B?S2Y4NmY2cW1XOU05S0labHNFSlhSbDVveVpDZzVZaGtpMVN1eVNLWVFYS0Rj?=
 =?utf-8?B?eXVXTllmWFA5c3Z3dDNrL2k2RWRsTFgwRnZxQ0pVcDB1ZXhOOFM2WDg3ckFC?=
 =?utf-8?B?ZE5WTklzeXpVeXV6OEczU1ZqSlFIdU5DdkNUT3R0K1Fqc0xZWmlXUGtPdENE?=
 =?utf-8?B?SVdMQnNkL2VGOUlxdmJKNTFabS9WKzd3V2twSUVFTVdqaU9hRVYvb0R1TU9a?=
 =?utf-8?B?cVBNck9Dc0VtNFJJSkRQZzN1MExLd1cvUXdUc25sNmlWWmVEbmYwTXkzVUlS?=
 =?utf-8?B?RGZncUVuN2ExYWtJVkpDYW42eUhGVzA2UEI0VnFFZlZKb05rNi9lU21oNjg1?=
 =?utf-8?B?NzQ4MklqUzV3UGl2UWRBd2hhbUNRblJsa01jVHZCeExHZmpTUk1uQklvYkJB?=
 =?utf-8?B?cWZnVFpJUCt4YzgwWkJHais0RGkxMnUxaldvbGZKTEV4dlpsQUE1NHNEWjli?=
 =?utf-8?B?Q0x1bjZFRk9Nd2Z0RWlMWGRlQjFidXVqVDF0SlVaTHhPM0FHQ3BiaGlQQjJl?=
 =?utf-8?B?bGE0UkJONnl6Skp2bGdKU21ZcmI0UlFUSkVHQ0QxZU56VXdGWnEvU0tNVlBM?=
 =?utf-8?B?ek0yZXpNSVNGWDRNTHZrc0hKUFUvME1PQ3lIVzZpNUJrZWsvTmFzNnI0RDhv?=
 =?utf-8?B?WTJ4NjJxVi95T2EwU09QRm04SkRFdmNZdFRtN2h2WGN2eFJUNFhxc20yTTIx?=
 =?utf-8?B?cnFnbzFkSU5zYWh2SUV3OHRhSWNQZXozYjBsOW9JVlNrMFFCYTlmZjBTVGJq?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085709ee-f8e5-42c3-f9be-08dbf7435eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 16:41:32.8073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sHKmODmswcwPgDDRn9FcMqtqmckDPRwpzZQCoalPGJ2qR1UL+4CMWa8eM8Rf+jGsCzElde1fpwJrO/kNyoFMP8nGu5pyi4gbmjCSv7uiPNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11939

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciA3LCAyMDIzIDg6MzUgQU0NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NCAyLzhdIGR0LWJpbmRpbmdzOiB3YXRjaGRvZzogZGxnLGRhOTA2Mi13
YXRjaGRvZzoNCj4gQWRkIGZhbGxiYWNrIGZvciBEQTkwNjEgd2F0Y2hkb2cNCj4gDQo+IE9uIDA2
LzEyLzIwMjMgMTY6NTcsIEJpanUgRGFzIHdyb3RlOg0KPiA+IFRoZSBEQTkwNjEgd2F0Y2hkb2cg
aXMgaWRlbnRpY2FsIHRvIERBOTA2MiB3YXRjaGRvZywgc28gbm8gZHJpdmVyDQo+ID4gY2hhbmdl
cyBhcmUgcmVxdWlyZWQuIFRoZSBmYWxsYmFjayBjb21wYXRpYmxlIHN0cmluZw0KPiA+ICJkbGcs
ZGE5MDYyLXdhdGNoZG9nIiB3aWxsIGJlIHVzZWQgb24gREE5MDYxIHdhdGNoZG9nLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+IC0tLQ0KPiA+IHYzLT52NDoNCj4gPiAgKiBEcm9wcGVkIGNvbW1lbnQgZm9yIGQ5MDYxIHdh
dGNoZG9nIGZhbGxiYWNrLg0KPiA+ICAqIFJlcGxhY2VkIGVudW0tPmNvbnN0IGZvciBkbGcsZGE5
MDYxLXdhdGNoZG9nIGFuZCBpdHMgZmFsbGJhY2suDQo+ID4gdjItPnYzOg0KPiA+ICAqIE5vIGNo
YW5nZQ0KPiA+IHYyOg0KPiA+ICAqIE5ldyBwYXRjaA0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGlu
Z3Mvd2F0Y2hkb2cvZGxnLGRhOTA2Mi13YXRjaGRvZy55YW1sICAgICAgICAgfCAxMCArKysrKysr
LS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvd2F0Y2hkb2cvZGxnLGRhOTA2Mi13YXRjaGRvZy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZGxnLGRhOTA2Mi13YXRjaGRvZy55YW1s
DQo+ID4gaW5kZXggZjA1ODYyOGJiNjMyLi43YzYzYjk5ZGFjODUgMTAwNjQ0DQo+ID4gLS0tDQo+
ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZGxnLGRhOTA2
Mi13YXRjaGRvZy55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3dhdGNoZG9nL2RsZyxkYTkwNjItd2F0Y2hkb2cueQ0KPiA+ICsrKyBhbWwNCj4gPiBAQCAt
MTQsOSArMTQsMTMgQEAgYWxsT2Y6DQo+ID4NCj4gPiAgcHJvcGVydGllczoNCj4gPiAgICBjb21w
YXRpYmxlOg0KPiA+IC0gICAgZW51bToNCj4gPiAtICAgICAgLSBkbGcsZGE5MDYxLXdhdGNoZG9n
DQo+ID4gLSAgICAgIC0gZGxnLGRhOTA2Mi13YXRjaGRvZw0KPiA+ICsgICAgb25lT2Y6DQo+ID4g
KyAgICAgIC0gaXRlbXM6DQo+IA0KPiBEcm9wIGl0ZW1zLCBqdXN0IGVudW0uIEVhc2llciB0byBy
ZWFkIHNvIHVzdWFsbHkgd2Uga2VlcCBzdWNoIHN5bnRheCBmb3INCj4gY29tcGF0aWJsZXMuDQoN
Ck9LIHdpbGwgZG8uDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiArICAgICAgICAgIC0gZW51
bToNCj4gPiArICAgICAgICAgICAgICAtIGRsZyxkYTkwNjItd2F0Y2hkb2cNCj4gPiArICAgICAg
LSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGRsZyxkYTkwNjEtd2F0Y2hkb2cNCj4g
PiArICAgICAgICAgIC0gY29uc3Q6IGRsZyxkYTkwNjItd2F0Y2hkb2cNCj4gDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=

