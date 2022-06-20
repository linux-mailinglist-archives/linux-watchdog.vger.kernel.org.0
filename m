Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C02B0551202
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 10:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238800AbiFTIAr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 04:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239668AbiFTIAq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 04:00:46 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E66C10FFC;
        Mon, 20 Jun 2022 01:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdmtahrYJQ8ShYKhsEMTKvnGyLtA+h1qhLbn2RM/w9qnOtR2ylOKu+SPf+VHiTZuPo6cxapwDXu+UJQi0dQBC1i9mVxN6kgpv5iA4ooQDKHb2KbPN9M0AzIxWRvNXOalJ7moN3AEtX8KO3JOoBCrsiFlB3ZFjy/6x0unH578ZP/7LQCPmQA4uRmZXdMnm49CbTk77sFbs6zKPv2+uaYxerFTA0ODL2xweeyRV8CQmQPtgCMsPBVljqBpDRldYspuM4rmloD7wEBBdnAXZRLC8Ns06WIfCxaqD3aX++h9P8NDKdfN3LKw8n7XcgxedtbzWoS0olGaImc6xH+4r+I+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tot1QsgQk/91aJYDreTNvs6tiWa8ay4T1ud/1LGkf18=;
 b=UkueSd02V8LGQPT1quNuS6jYqz0pXijHU7EyuoPilCwpbOxr3it9P4e9vdQrY40adbWxZzbTLqugmWiKb4imGErC+pBfs8X8zOb2wwEpkHYh69RxbB0LaEvqSp0G4pDUfOJ1ub5X5sXPSDHXSisPLdfC6UY55h6QEPtCEQIQ4UUnypZcv8lX/sxakAMSMZYbvvgmM1hXQljJVP8rKxNqgjNsg27Y+8gqFtACHTV5XvtSisq7rtxTsGidE+68dJPzqg4xGi5CVYkRMIb3WQG+8YG4wnaj8tPCdDgKgj1chmMfpQPBpw725HEwk6MGON3N8oSR9rYQCgZp4kStErMTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tot1QsgQk/91aJYDreTNvs6tiWa8ay4T1ud/1LGkf18=;
 b=oXZNhR/E6x+EDm2GhJ/VOq2fhEwYMXPrO9m4t8I0FNteSF3NGYaznMgmHINFmwAm9HBcm+EVuMhRPPZMm0RTa5DsAE/qYHI6tvolZwVg1cJ2ZZzzCbbCpuVoRnALwx6q6zwvwFBdpp0CqYkVOI+cd1DZIU2aBlNsuX/5SA/wVpY=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSBPR01MB1463.jpnprd01.prod.outlook.com (2603:1096:603:1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Mon, 20 Jun
 2022 08:00:42 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 08:00:42 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Thread-Topic: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
Thread-Index: AQHYfzcft58rlb42yU2OAXZ5VYwIca1X7EUAgAAMhlA=
Date:   Mon, 20 Jun 2022 08:00:42 +0000
Message-ID: <TYYPR01MB7086500E57971D76579E9174F5B09@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220613150550.70334-1-phil.edworthy@renesas.com>
 <20220613150550.70334-2-phil.edworthy@renesas.com>
 <CAMuHMdUiXh3duootbNXKE0aWRAGZwOHx63PZN4c0tPT8TLGcvg@mail.gmail.com>
In-Reply-To: <CAMuHMdUiXh3duootbNXKE0aWRAGZwOHx63PZN4c0tPT8TLGcvg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8015dc82-5710-44b2-8c7a-08da5292f904
x-ms-traffictypediagnostic: OSBPR01MB1463:EE_
x-microsoft-antispam-prvs: <OSBPR01MB1463FE919F5D39F200ED4196F5B09@OSBPR01MB1463.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lNQUEtRBGdt83CvPU6Jeu0cFQMhh7N4meh+5v5rYEK+owKEsVnK+kOX8LmGwHuFNKkXGnRHZIvNt1jJFjLlDEQT/dnvK51VeCgjXaAI8alHu+oNaUuUDj7oWKQs7VFR5dj9xGQYhLngy6Kc7wXiQxT9ctkKaP/Tbr8rh7bM6No7ycrnm6Np5gXp6h7xqlvxiTRjbGBoUyzrw6tw1b7GKT2iUu1k3ffP9BwW/b46oUBfWkqUEpiC2yFuyMpMJnDFxeeaFobfHw0MLrPF3xDazmx0tcbmVJWixUJjHsy2swiUdmEWoo3gonTopMnojhj5YnKTgyOVtCenzLiRjYE2dQC3STWUpBY8ANmjloUob2LbTmCG+zap7YXQLlh2irPfNM3FpOoe/TJpKdpFF3wn9IKoMFgKZhMlozFGdVRaHGddDzF1IZ1d87labgJ0EDR7lMI/GH55S+OgWKFgYMlI1rXIerAil+4YJ+cjE1hONii9U5YwqFcgGCMPNrVqPVq+x8BqP5HXLj14kRq1UE88IB7Y+b3Fa4HrKA0P3PluO44OwFaZkCEV2iEWvdBfcZPjWM3LvJquPQ/HXkixKRQXdbSQlSa1xtB7q2i9KqNNItSSljq6RpV6NnG30b4pE+33MxknAAbUAFHgyJ+vQZli4Wxw4wnN2HZ5BghGtS5NZ8TEBLusbBmr6iF4LbLvQ96Di3cGz0e5NmCFj/q/sw0CBlg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(498600001)(5660300002)(26005)(71200400001)(9686003)(38100700002)(54906003)(316002)(6916009)(6506007)(186003)(52536014)(64756008)(76116006)(86362001)(66556008)(66946007)(8936002)(44832011)(7416002)(4744005)(2906002)(7696005)(83380400001)(53546011)(107886003)(4326008)(66446008)(66476007)(55016003)(122000001)(8676002)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXFWcVpLSk9Cc2g0MjJXdmNrRVdPSzBCeTlhSnpkcVEreDE0SWdlTGlDdGdv?=
 =?utf-8?B?RFBXcnNlZUlSbEo5WDFENVgyMTZPOVcrTyt2YU05c1VTSEs2THZtSitjQXAy?=
 =?utf-8?B?Y2l4bzRWc0NrZkFvNUJRa01qS0pyMm41a3dZWTYxbzV3dVBNUFlZeVIwK1BP?=
 =?utf-8?B?YVl2ZTdEVTFCNjJwb3h1YWtjREwzU2Q1d21JM3FJbFIxUkJVa1lJckxYaTR2?=
 =?utf-8?B?ays2U29RdGkzSTkwa3NoL2htSEFNWTdUL25Ta1F5KzEzQlR5NXBQMXUvVW5y?=
 =?utf-8?B?K3pQTGh2ZzhQcFhCamVTZGI1WXdrZHczSG0rTGgzZm5TMFB3THNRSEp4MWN4?=
 =?utf-8?B?UG9HVlVJeG1jUk1jQ3luZXQ2RDMvM0lYU0Jza202UFpuMURHMXcrYXQvQW5I?=
 =?utf-8?B?a0xVQ0F1dEk2Z3AydUczMWpFa1ZIdnd5ZXZKa1FUVXhBbUdiS2lWd1E1OTlj?=
 =?utf-8?B?TlVJc3g0VGJobkdYSGJhUEtCWjkrK29KVEh3VlgreHBENUZMQzhYanFERWg1?=
 =?utf-8?B?WDR5UDFMWnFwYndlTExDRHc5THZMenBQZUFyMTlkaW1DZENRQnVpMlNOUy8w?=
 =?utf-8?B?eTdHbjVNLzM3L3g4UWk1Tkh3M1JKalZxeHM2aGpkeW9aNW9TaEduQlFkOTBF?=
 =?utf-8?B?aXFEWmRzYWM1dW51ZnVib2d3bDVOUjdEZ1ZMV1NJN1Rkc0xUSmFlb2REREFW?=
 =?utf-8?B?cG4xdFRvTWNOckk3Vy96WFJrVFpEOGlYeHBJcU1vTDd1dVpiazhTeHlIZFYw?=
 =?utf-8?B?Y1dGZmtSWThobTcvUUUvcHdlb0NOSWlIbDBReFA2MXRTUlJZUkFOam9QL3hP?=
 =?utf-8?B?dFJjd2RqZ0JhZVd6U1JaQzF5engyZWszZWkvUVV5T0xiOG1ld0VjN3FVRHlZ?=
 =?utf-8?B?bXQwTUpIV0NBUVFaRnFYNys2UWZaZjRmcG40bHcvQUdORUR3K0dXRGo0SVdq?=
 =?utf-8?B?UTNhbUJEaFp6TjFoSFA5blVnZWthSzVQTXZMeC95eFNUc1dWclE0akhUS2tx?=
 =?utf-8?B?cWVxN0RyVzYyOElKMUJXT2IrY09JcmF4L3dWdDZxc09TallTc3lyMWs0V1dl?=
 =?utf-8?B?SkxsaXpZM1lGaTlPbGVpSDgyZUhkUlJMdUFPdlZSaXJwSUpkVWhGSlBBSkRw?=
 =?utf-8?B?dE1FK2dMRDUvL1paaTdOVS9PeDVzNERvMkMzVzFET1BwQ1ErQmxSdnNQd0NT?=
 =?utf-8?B?NTdzZ2paTUdzckg2SGRKSU82MmlsWmtyQ3JQVmp3dW11TFZKc0NjRUwrK2NL?=
 =?utf-8?B?OVN5YktYUXV4dlBNYWh0MXFGYVhZRWdMMWJSemlsYzN3UGZ0SWs5OVZ4TnBn?=
 =?utf-8?B?SjdIRjZFUURnaHpNcjRZQ256NzBQREtxSmNQUDZJbS9NODBqWTJFUG1zWFkr?=
 =?utf-8?B?djVzdDVxVjNNem9ERDhEZ2RyazdsZVl6QldFZ292V0hiR2ZsU2tyQUdLQUdx?=
 =?utf-8?B?VGJ3WkFHMTBtUXZqOGZpSGowdDRMcG1VbTg2TjA4VWFnVEkrR0luUlRxbnBQ?=
 =?utf-8?B?bVJNbTNDMWZCWlRHcmJ0L0hVdzliWkdoeDFqTVpHRElqeTFCZktTWXF3b2I2?=
 =?utf-8?B?TTRwWTY1MjFyR1hVWmNFdXpGSEdqbCtRSGxnTFhIRjBpVnpVVXhRbzhCa1dW?=
 =?utf-8?B?TG4xTmtjcGlSTXVYY2F3VE5YZmxmajBzdnVJMmJnY0lVNjVaWXllM3pmdmJq?=
 =?utf-8?B?eHgrcFEzeXVOcTgxVUt6Mkk1VlBiS0hOaTRYV28zaHNmemVCRjJWb3hNTWFL?=
 =?utf-8?B?RlI3QzFPZ2xYYnkzSW5sdStDWThOZGpqSGdhOFVhNmEwbVNxYVRjaW84am1H?=
 =?utf-8?B?ODNYYjBPRkpMbG11bUh1WWxvdnI1OVNlbUJXTURKd1VWNDluWjBWRHYrOVox?=
 =?utf-8?B?cGNVdzZDamdaRTVtcis5WFpKcGI4Vk1pNlNpWHl2ZjlneHJWUE85enRTZnlJ?=
 =?utf-8?B?Q3YvMUloVnZRZ1pTTk4vZ1NwR1F0RENDYjNXcHkwSUJjTzlnVy9VNU00RmlV?=
 =?utf-8?B?TVFNckEzVUdMb0hNZEgvY2NoWFFCT01DVzVCVmxMeXpaQVdJcWVGQjAxREZC?=
 =?utf-8?B?bkVzeXNsVFd0bk5UMmpUWWpjZzJpQjBxY2pvM0krTjMzWjNyekdRaWVvQ0k3?=
 =?utf-8?B?T1BlM01HZFl2ZlJzZzQ3eGZoQ0lHVDl1KzNhY2k5TzZWUHJRdkl2dXBBeC9I?=
 =?utf-8?B?eldyMnBzRDFUdWd0dUlYSmdpZ3FEQUgyNm9uV29XTWJEK1pRZ2J5K20wcXlP?=
 =?utf-8?B?MlVyMUdhUmo4elJSWGEyS2VKYldmRkZjRW56RmZiRmZZVnFSVndQaDhIRXFQ?=
 =?utf-8?B?OUdCblJWd3h4UTU0eDFLd0hHVTZwZGlTRWQ1Z0RmU2FZSlhQRlArbDZtMmE1?=
 =?utf-8?Q?xsMzQDpaZQ3kDhN4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8015dc82-5710-44b2-8c7a-08da5292f904
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 08:00:42.2405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4i12j+2IlnVf425zjEnx7WmU2zqqOllB027m/2fWdL0Q3l/4ltOPSvdQ127ytXUWEodfqRh73cr2mHItpu8DsLArQZArNh5MCpgtAae1Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1463
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDIwIEp1bmUgMjAyMiAwODoxNCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IE9uIE1vbiwgSnVuIDEzLCAyMDIyIGF0IDU6MDYgUE0gUGhpbCBFZHdvcnRoeSB3cm90
ZToNCj4gPiBBZGQgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoZSByOWEwOWcwMTEgU29DLCBidXQg
aW4gZG9pbmcgc28gYWxzbw0KPiA+IHJlb3JnYW5pc2UgdGhlIGRvYyB0byBtYWtlIGl0IGVhc2ll
ciB0byByZWFkLg0KPiA+IEFkZGl0aW9uYWxseSwgbWFrZSB0aGUgYmluZGluZyByZXF1aXJlIGFu
IGludGVycnVwdCB0byBiZSBzcGVjaWZpZWQuDQo+ID4gV2hpbHN0IHRoZSBkcml2ZXIgZG9lcyBu
b3QgbmVlZCBhbiBpbnRlcnJ1cHQsIGFsbCBvZiB0aGUgU29DcyB0aGF0IHVzZQ0KPiA+IHRoaXMg
YmluZGluZyBhY3R1YWxseSBwcm92aWRlIG9uZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBo
aWwgRWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoN
Cj4gPiAgLSBBZGRlZCBtaW5JdGVtcyBmb3IgaW50ZXJydXB0LW5hbWVzIGFuZCBjbG9jay1uYW1l
cw0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBPbmUgbWlub3Ig
bml0OiB5b3UgaGF2ZSBsb3N0IHRoZSBjaGVjayB0aGF0IHRoZXJlIGlzIG9ubHkgb25lIGludGVy
cnVwdA0KPiBvbiBlLmcuIFItQ2FyIEgzLCBzbyAibWFrZSBkdGJzX2NoZWNrIiBubyBsb25nZXIg
Y29tcGxhaW5zIGlmIEkgYWRkDQo+IGEgc2Vjb25kIGludGVycnVwdCB0byB0aGUgd2R0IG5vZGUg
aW4gcjhhNzc5NTEuZHRzaS4NCkFoLCByaWdodCwgc2FtZSBmb3IgY2xvY2tzLg0KSSdsbCBhZGQg
YW4gZWxzZSB3aXRoIG1heEl0ZW1zOjEgZm9yIHRoZXNlDQoNClRoYW5rcw0KUGhpbA0K
