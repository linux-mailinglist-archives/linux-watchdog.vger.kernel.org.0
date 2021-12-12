Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6CD471A9B
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Dec 2021 15:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhLLOQt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 Dec 2021 09:16:49 -0500
Received: from mail-os0jpn01on2092.outbound.protection.outlook.com ([40.107.113.92]:26490
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229759AbhLLOQt (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 Dec 2021 09:16:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdN5rc8gjA4iCqSPCg8NQf+i0Vi50BBRji5kVVj4PlDlBP3FqGGQmueCbShykld4GX5Ii3OPKsl8e3hH2a7I7qpUWfLPcHxvDPHafKXU9VcqANWjbA5SEw3vicM1JwqiBm+IZIhlTh9mANA2oIIhwM2D2XdjJ1V6CgYNBO0bUeBu7gDb46xxU5LQKLwjeQtOEqgVyz3jxKL+2BB7T+tLBRtHuygje45VcNOXIJuCIEfGorZPSLdtEGQQyY+3qVirjoP796r1SxuZxMtlCbeAtKZXsixk0O/S7eH/isY83frikfCTFBabiCwGfSsz4/B8tpFOv6/r3qVAARdyc9jyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8hJdRv7tnrMT4VgigzIWmx+UXBfxURui7vbpyMJmaY=;
 b=QUDpqCJX4QBKKR0XIxXZ3Y7qj2b7WGGTfkrYMcClR43iosTBUnhhmJ6hEBoMn+tq3eWkLPE/l3wlYTI5mwSEQHXoCHanufwMYeKh84l3rxA4huGBAgSyrM/Bi8VcK+F5z1X9z217qcAxAZ4JetGuePyxrz5o5RT8b14i30hwIIpjJnX0Pny5K53NgnmB83JkjqVagZzS9r/8CBeOnpgiB76kvxs08bJ475YHUuv4aftNvDjyhRukKZgyZl8Uj2FqEapckCfoFjOQHoNZVa+NYXevLkMxJMphu1/r2d2cen4WIDkhWykalDPEiZ86W42LyI542bn9r0XiuiAOWA0YRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8hJdRv7tnrMT4VgigzIWmx+UXBfxURui7vbpyMJmaY=;
 b=U3PNmNLMFZAOoRDQgXN0MSHDmHjMv0HtqTMFubPKbCieAybb4Vt4T0rAfAw5nvBZop/uIfEJVeQJuxldx6OgDBt9euNbIZBmv1CVirthN6oDqMomILvezafYh7mrRCB/QXAzWF5R3Vt2GY1nxyyYjnDyCOlFlnwTOcVk3nbofSE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4083.jpnprd01.prod.outlook.com (2603:1096:604:59::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Sun, 12 Dec
 2021 14:16:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4778.017; Sun, 12 Dec 2021
 14:16:44 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/4] watchdog: rzg2l_wdt: Add error check for
 reset_control_{deassert/reset}
Thread-Topic: [PATCH 2/4] watchdog: rzg2l_wdt: Add error check for
 reset_control_{deassert/reset}
Thread-Index: AQHX7tXC7YvsvGpzZE2T8W5/9tdsYKwt3naAgAEHRUA=
Date:   Sun, 12 Dec 2021 14:16:44 +0000
Message-ID: <OS0PR01MB5922192220E95BA22E19510986739@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
 <20211211212617.19639-2-biju.das.jz@bp.renesas.com>
 <960186bd-8ac8-42d8-edba-90c81eadfac1@roeck-us.net>
In-Reply-To: <960186bd-8ac8-42d8-edba-90c81eadfac1@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af8f4171-d8d4-40e8-ce61-08d9bd7a06b6
x-ms-traffictypediagnostic: OSAPR01MB4083:EE_
x-microsoft-antispam-prvs: <OSAPR01MB4083CE207AE2D2A1960044DD86739@OSAPR01MB4083.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F7uBBGDuMWMk3uXY6fNij48evCdh9mXafy9ZZkTCK/vBH0bSsIK8yBYhEol8swgVjjortFNDhYvWP18SQLndU/z5GgeZqB9V1d+4fAi8NYXIvhqxQypB9brSql3QGqvSTHYxo58wCLDpHxJUZZPINvG24WS+lU/j7U3q+PW8VRb+BzoM2FHre9Z/GrVtBsxb4YI+MzofvsnzVAIdZYS7MQxG0nmNuxvlG7fOWq9ek9dTt4ipYunV6enKbIqgM7wuNcwngSD8USBq6OwqzM46A80d43wGz4lgcon3pMi4UOj0+uQ5nMZ2fCj/6mMe6yBlL1S1fLx/PG8I/qC8no7vvdAXWy8EFEsqrRU291Zci9Ia8lsMjhc47rDgea+b0xQ7Ip8Ud9DdgQlSCGtHhxuuuvBHOC2WvCERBv3npur0T+YXRPX7YuyFAu1vT+Wiqt4B3MBBaAtmqWwEjiiUm16/KC8ve69NKX/J5WGw3LCuKsEnlQ1ZmUDsAVStBXIq9KnJyKaMwkd7y8b2mGYAqYIGjL6NJE7yBqQ9E4ImoyfVYXxoqQkHEVVC4Wh86jdIB4ahq2F2nm5KFvA2RHPwRUWsiLVeFkep0VRGEh4nhAaRbJnPzib2UMBQX95qcWj8TPkX/lDlI08BTCgKbcaldK7zN7J8eBrUyQ+t9Jz4keE6Ksqxhl/fa2131ebmV4e0ADRKPFc4+MIMflwT8A1HrgoXOw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(52536014)(186003)(26005)(66476007)(66556008)(53546011)(66946007)(64756008)(71200400001)(38070700005)(6506007)(76116006)(66446008)(5660300002)(8676002)(316002)(83380400001)(86362001)(4326008)(33656002)(8936002)(55016003)(122000001)(110136005)(38100700002)(54906003)(2906002)(7696005)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVl0UWd0bFhLQlNtcTlpOFJ6SHZ1aVhFWXVMMU9DaUI1bEZVNGUrYlYvMjli?=
 =?utf-8?B?NVNrL0lteFk1Nk9uVktmeUZEY0tyaUh1NmQ0TU9mQSs5MlpYZ1pocDBvYWpK?=
 =?utf-8?B?T0J6QkZxUjhCN3BONVBtZDI3allnNjVqeGhNbTVOcm1JdWNkaDdQNnMxdDJw?=
 =?utf-8?B?cDQxN0sxKzdFazFyVWRvbkU4eDJaMUliU3NPUk92S0hsTlZlY1gyOTFjRFEz?=
 =?utf-8?B?amNTVjdhY3l4T1NPN2o3b3VCczhNemlQeldsZHBNaE5SSGkwOWFZTUFzN05o?=
 =?utf-8?B?bXFQT2l2OWFxZ3JLdVAyTGFsTkhmSk96dVMwWlFKam1lazFQYmVXRFczUThk?=
 =?utf-8?B?RUJxSzcrblRMOGQrY2NyNExKTDE2Rk91Z1VFaXcrTWdsVzdmZWMzU0xKUnRK?=
 =?utf-8?B?OGp2SS9vbjBIbXJyc2dQeEJmK2lUQzZrcXZIYTVmQWE1NGRIN04vRzNKSHor?=
 =?utf-8?B?NzUwdnpsVHFCTUdERG9xOTB0c0lLR3NpTkxHTi9wandCdENEVkZFREV6ZEtB?=
 =?utf-8?B?WlhWUmNLd3MzZGRsSkpHbzYxT254N0N1ZGlSeG9yZnlwZFVFUDl3bHNwL1Yx?=
 =?utf-8?B?M09PdUVadzU4Ri9JaEtya1JQREV4MFhNVnZDYXhHV2ZmaHV0TkdxWGxzSzNo?=
 =?utf-8?B?L1lZRjhSVGFLK2plcSsrQVpQU2d0dkF0anc4TEh6RUxUbWNCdnFIdFhZMlMx?=
 =?utf-8?B?MU1jeFJjNXZnbjBublUwMXpETFhuZTZ1TldITmtrb1ltSElFVC9BTWF6VDJu?=
 =?utf-8?B?a0szYVhjMWFFRTN0Wm5PK1o3V2ZzaG9Cd1hHdTAxSFdsTGNxNUJyV2ZLMmY1?=
 =?utf-8?B?UXdRSHR6SHpFbGF6Qkxpa0tYMnk2eEx2aUhCNzRRR282VXBpWVFmVnoxSzB2?=
 =?utf-8?B?M3g1ZjBuemhiMVYwdXYzODJweFo1SFl5WTJTNnhLejlOc1RoTlV0RWdWOHZp?=
 =?utf-8?B?WDRyN1l1SXpZZDFSTzlKY01oaE15aE5GZEMvdWZoVmYrcTZnSHRGOTVrYzZs?=
 =?utf-8?B?eHNQQ25PZ1hkeWlkYXM5YzFyWnNlQXI1Qjh2N0NxbklTeHdnRTJiL3RBMVRI?=
 =?utf-8?B?Um02azdPZFRxODJDN3lxNzZ1Si9vUVZpaTNLbE82OGJmT0FLU2pDM3YwcU0x?=
 =?utf-8?B?bXdXWHJsNGRFWFF4blBPRDlUZVlQSlM4WVNQVnNzbG0xNC9nbDBMZTNiSTNk?=
 =?utf-8?B?ZVdiUmpNcTFFeVdDWTkrZHlzS1NMUStjQVNLbVZ5dEhGaUdaTkxkY01xOXox?=
 =?utf-8?B?UmtQSW16bWsvODNUellIbVFDT1NIc2JBb1B6YTdPSWVWdlVzWklFcFlBNWEv?=
 =?utf-8?B?VnhwK1JiTmtaVlRaTTBFWDNJMXFCNGQybUEyQUZrYlhXaGlhbUlCOWQ1eUp1?=
 =?utf-8?B?ajVBNlZlNElOaG40R21QT2xJOWYvMWlLZXpLaWIrRXExUVBNOUU2ZkQySngv?=
 =?utf-8?B?SUVwQzNnSHhzMExMNDNpNThSd0laVm9rMmdnMzIrTldlK21MTHdEbzNyK3lI?=
 =?utf-8?B?VWNJbnFqeG1kT3FpWW9UQUtBZ3NMQUY0TlVGMldQUHlDaFkxaVp2RjY2RVlI?=
 =?utf-8?B?aHZrc1M1Wi8xNUJZSVIxSUNaTWx6bXdHdEJyWHBBemY4RDdZeVRybi9aYVg3?=
 =?utf-8?B?d3A1Zi8rMEp4MjU3NFNWam12dzErUUJYNzhVdFBHMEVOUmF6dHVjbGJRUW1n?=
 =?utf-8?B?YmpUWlJVdVV5NGRMSDVSM1orTHVGUDdZaXZ2YWtaUEtDc0diRkRVaXlNRFZz?=
 =?utf-8?B?MmlWTDNBUkN2L25oMnJQRGUvazlPbERlejYrSGNVLzFQYTEydkdDN0VLMklW?=
 =?utf-8?B?OURNLzJXeXRnZ2k4MXpyZFJ2Y2dYL1Y4b3JDQnRTaXdYbmd5QytHZXZVOWtt?=
 =?utf-8?B?Q1lZN2V2SzEwSGo1MkpHaWs0SFNUWnNOYnJHemJFV1BoaFdBdUM3R0NhOTVR?=
 =?utf-8?B?cWU2eW1jcENhcGw0MDhFU2lDU2VQMnBCUFJmSjZFdnBPWWwvY0hrbWdESWVV?=
 =?utf-8?B?OWVXUzVKYXFTSlJ6M0dFekpGSEFVZ1JjbkN5L0dlbnFoQnArdkhXME9XQjZu?=
 =?utf-8?B?amtlekRWOGR6R0REVkNuMGg0S3l0aU9MZVA2dUVjRzV3R2NmODNsckJYTXQ4?=
 =?utf-8?B?K211SitwSmRqdFFWNVB1eTV4SnViR09FVkxaZk0vcnhTelI5NWcranUyWXl5?=
 =?utf-8?B?czV3YktGMmNFL1oxQk5YbGZxL2pwVEIzUVlrU1RiYXhVL2ZkUWRmME13Mmds?=
 =?utf-8?B?TmkrcExJWnM0ZWJINENqbTRsYmxRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8f4171-d8d4-40e8-ce61-08d9bd7a06b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2021 14:16:44.4396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 96QTJMmk6ib2stVodBkcGoOT2wyvRWIyxj3kZDzsRdBFFs/EQJvRPsWl4kJSMsxUsKDEK1qXLAvxuKc6Ks9rqD+kcjSgSMR8y1l1KRJIfgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4083
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciBSb2VjaywNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNF0gd2F0Y2hkb2c6
IHJ6ZzJsX3dkdDogQWRkIGVycm9yIGNoZWNrIGZvcg0KPiByZXNldF9jb250cm9sX3tkZWFzc2Vy
dC9yZXNldH0NCj4gDQo+IE9uIDEyLzExLzIxIDE6MjYgUE0sIEJpanUgRGFzIHdyb3RlOg0KPiA+
IElmIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoKS9yZXNldF9jb250cm9sX3Jlc2V0KCkgZmFpbHMs
IHRoZW4gd2Ugd29uJ3QNCj4gPiBiZSBhYmxlIHRvIGFjY2VzcyB0aGUgZGV2aWNlIHJlZ2lzdGVy
cy4gVGhlcmVmb3JlIGNoZWNrIHRoZSByZXR1cm4NCj4gPiBjb2RlIG9mIHJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQoKS9yZXNldF9jb250cm9sX3Jlc2V0KCkgYW5kIHJldHVybiB0aGUNCj4gPiBlcnJv
ciBjb2RlIHRvIGNhbGxlciBpbiBjYXNlIG9mIGVycm9yLg0KPiA+DQo+ID4gV2hpbGUgYXQgaXQg
cmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZnJvbQ0K
PiA+IHByb2JlKCksIGFzIGl0IHR1cm5zIG9uIHRoZSBjbG9ja3MuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBSZXZp
ZXdlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiANCj4gU2VlIG5v
dGUgYmVsb3csIHRob3VnaC4NCk9LLg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy93YXRj
aGRvZy9yemcybF93ZHQuYyB8IDM3ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMNCj4g
PiBiL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMgaW5kZXggOTZmMmEwMThhYjYyLi41OGZl
NGVmZDlhODkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMNCj4gPiBAQCAtODUsOCArODUs
MTQgQEAgc3RhdGljIHZvaWQgcnpnMmxfd2R0X2luaXRfdGltZW91dChzdHJ1Y3QNCj4gd2F0Y2hk
b2dfZGV2aWNlICp3ZGV2KQ0KPiA+ICAgc3RhdGljIGludCByemcybF93ZHRfc3RhcnQoc3RydWN0
IHdhdGNoZG9nX2RldmljZSAqd2RldikNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgcnpnMmxfd2R0
X3ByaXYgKnByaXYgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZGV2KTsNCj4gPiArCWludCByZXQ7
DQo+ID4gKw0KPiA+ICsJcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChwcml2LT5yc3RjKTsN
Cj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKHdkZXYtPnBhcmVudCwgImZhaWxlZCB0
byBkZWFzc2VydCIpOw0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4NCj4gVGhpcyBw
YXRjaCBpbnRyb2R1Y2VzIGFuIGVycm9yIHJldHVybiBpbnRvIHJ6ZzJsX3dkdF9zdGFydCgpLg0K
PiBJZiBpdCBpcyBpbmRlZWQgbmVjZXNzYXJ5IHRvIGNhbGwgdGhpcyBmdW5jdGlvbiB3aGVuIHNl
dHRpbmcgdGhlIHRpbWVvdXQsDQo+IHRoZSBlcnJvciByZXR1cm4gbmVlZHMgdG8gYmUgY2hlY2tl
ZCB0aGVyZS4NCg0KT0sgd2lsbCBkby4NCg0KQmFzaWNhbGx5IG9uY2Ugd2F0Y2hkb2cgaXMgc3Rh
cnRlZCBpdCBjYW4gYmUgc3RvcHBlZCBvbmx5IGJ5IHJlc2V0Lg0KU28gZm9yIHN0b3BwaW5nIFdE
VCwgd2UgbmVlZCB0byBhc3NlcnQgdGhlIHJlc2V0Lg0KDQpBbHNvIG9uY2UgV0RUIGlzIHN0YXJ0
ZWQsIFVwZGF0aW9uIG9mIFdEVCBjeWNsZSBzZXR0aW5nIHJlZ2lzdGVyKFdEVFNFVCkNCmlzIHBv
c3NpYmxlIG9ubHkgYnkgcmVzZXR0aW5nIFdEVCwgIHRoYXQgaXMgYXNzZXJ0L2RlYXNzZXJ0IGFu
ZCByZWNvbmZpZ3VyZQ0KV0RUU0VUIHdpdGggbmV3IHZhbHVlcy4NCg0KUmVnYXJkcywNCkJpanUN
Cg0KPiANCj4gR3VlbnRlcg0KPiANCj4gPiAtCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocHJpdi0+
cnN0Yyk7DQo+ID4gICAJcG1fcnVudGltZV9nZXRfc3luYyh3ZGV2LT5wYXJlbnQpOw0KPiA+DQo+
ID4gICAJLyogSW5pdGlhbGl6ZSB0aW1lIG91dCAqLw0KPiA+IEBAIC0xMTUsOSArMTIxLDE1IEBA
IHN0YXRpYyBpbnQgcnpnMmxfd2R0X3Jlc3RhcnQoc3RydWN0IHdhdGNoZG9nX2RldmljZQ0KPiAq
d2RldiwNCj4gPiAgIAkJCSAgICAgdW5zaWduZWQgbG9uZyBhY3Rpb24sIHZvaWQgKmRhdGEpDQo+
ID4gICB7DQo+ID4gICAJc3RydWN0IHJ6ZzJsX3dkdF9wcml2ICpwcml2ID0gd2F0Y2hkb2dfZ2V0
X2RydmRhdGEod2Rldik7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+DQo+ID4gICAJLyogUmVzZXQgdGhl
IG1vZHVsZSBiZWZvcmUgd2UgbW9kaWZ5IGFueSByZWdpc3RlciAqLw0KPiA+IC0JcmVzZXRfY29u
dHJvbF9yZXNldChwcml2LT5yc3RjKTsNCj4gPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfcmVzZXQo
cHJpdi0+cnN0Yyk7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X2Vycih3ZGV2LT5wYXJl
bnQsICJmYWlsZWQgdG8gcmVzZXQiKTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiAgIAlwbV9ydW50aW1lX2dldF9zeW5jKHdkZXYtPnBhcmVudCk7DQo+ID4NCj4gPiAg
IAkvKiBzbWFsbGVzdCBjb3VudGVyIHZhbHVlIHRvIHJlYm9vdCBzb29uICovIEBAIC0xNTEsMTIg
KzE2MywxMSBAQA0KPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgd2F0Y2hkb2dfb3BzIHJ6ZzJsX3dk
dF9vcHMgPSB7DQo+ID4gICAJLnJlc3RhcnQgPSByemcybF93ZHRfcmVzdGFydCwNCj4gPiAgIH07
DQo+ID4NCj4gPiAtc3RhdGljIHZvaWQgcnpnMmxfd2R0X3Jlc2V0X2Fzc2VydF9wbV9kaXNhYmxl
X3B1dCh2b2lkICpkYXRhKQ0KPiA+ICtzdGF0aWMgdm9pZCByemcybF93ZHRfcmVzZXRfYXNzZXJ0
X3BtX2Rpc2FibGUodm9pZCAqZGF0YSkNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3Qgd2F0Y2hkb2df
ZGV2aWNlICp3ZGV2ID0gZGF0YTsNCj4gPiAgIAlzdHJ1Y3QgcnpnMmxfd2R0X3ByaXYgKnByaXYg
PSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZGV2KTsNCj4gPg0KPiA+IC0JcG1fcnVudGltZV9wdXQo
d2Rldi0+cGFyZW50KTsNCj4gPiAgIAlwbV9ydW50aW1lX2Rpc2FibGUod2Rldi0+cGFyZW50KTsN
Cj4gPiAgIAlyZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5yc3RjKTsNCj4gPiAgIH0NCj4gPiBA
QCAtMjA0LDEzICsyMTUsMTEgQEAgc3RhdGljIGludCByemcybF93ZHRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gPiAgIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBk
ZXYtPmRldiwgUFRSX0VSUihwcml2LT5yc3RjKSwNCj4gPiAgIAkJCQkgICAgICJmYWlsZWQgdG8g
Z2V0IGNwZyByZXNldCIpOw0KPiA+DQo+ID4gLQlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYt
PnJzdGMpOw0KPiA+ICsJcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChwcml2LT5yc3RjKTsN
Cj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJm
YWlsZWQgdG8gZGVhc3NlcnQiKTsNCj4gPiArDQo+ID4gICAJcG1fcnVudGltZV9lbmFibGUoJnBk
ZXYtPmRldik7DQo+ID4gLQlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCZwZGV2LT5k
ZXYpOw0KPiA+IC0JaWYgKHJldCA8IDApIHsNCj4gPiAtCQlkZXZfZXJyKGRldiwgInBtX3J1bnRp
bWVfcmVzdW1lX2FuZF9nZXQgZmFpbGVkIHJldD0lcGUiLA0KPiBFUlJfUFRSKHJldCkpOw0KPiA+
IC0JCWdvdG8gb3V0X3BtX2dldDsNCj4gPiAtCX0NCj4gPg0KPiA+ICAgCXByaXYtPndkZXYuaW5m
byA9ICZyemcybF93ZHRfaWRlbnQ7DQo+ID4gICAJcHJpdi0+d2Rldi5vcHMgPSAmcnpnMmxfd2R0
X29wczsNCj4gPiBAQCAtMjIyLDcgKzIzMSw3IEBAIHN0YXRpYyBpbnQgcnpnMmxfd2R0X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiAqcGRldikNCj4gPg0KPiA+ICAgCXdhdGNoZG9n
X3NldF9kcnZkYXRhKCZwcml2LT53ZGV2LCBwcml2KTsNCj4gPiAgIAlyZXQgPSBkZXZtX2FkZF9h
Y3Rpb25fb3JfcmVzZXQoJnBkZXYtPmRldiwNCj4gPiAtCQkJCSAgICAgICByemcybF93ZHRfcmVz
ZXRfYXNzZXJ0X3BtX2Rpc2FibGVfcHV0LA0KPiA+ICsJCQkJICAgICAgIHJ6ZzJsX3dkdF9yZXNl
dF9hc3NlcnRfcG1fZGlzYWJsZSwNCj4gPiAgIAkJCQkgICAgICAgJnByaXYtPndkZXYpOw0KPiA+
ICAgCWlmIChyZXQgPCAwKQ0KPiA+ICAgCQlyZXR1cm4gcmV0Ow0KPiA+IEBAIC0yMzUsMTIgKzI0
NCw2IEBAIHN0YXRpYyBpbnQgcnpnMmxfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UN
Cj4gKnBkZXYpDQo+ID4gICAJCWRldl93YXJuKGRldiwgIlNwZWNpZmllZCB0aW1lb3V0IGludmFs
aWQsIHVzaW5nIGRlZmF1bHQiKTsNCj4gPg0KPiA+ICAgCXJldHVybiBkZXZtX3dhdGNoZG9nX3Jl
Z2lzdGVyX2RldmljZSgmcGRldi0+ZGV2LCAmcHJpdi0+d2Rldik7DQo+ID4gLQ0KPiA+IC1vdXRf
cG1fZ2V0Og0KPiA+IC0JcG1fcnVudGltZV9kaXNhYmxlKGRldik7DQo+ID4gLQlyZXNldF9jb250
cm9sX2Fzc2VydChwcml2LT5yc3RjKTsNCj4gPiAtDQo+ID4gLQlyZXR1cm4gcmV0Ow0KPiA+ICAg
fQ0KPiA+DQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByemcybF93ZHRf
aWRzW10gPSB7DQo+ID4NCg0K
