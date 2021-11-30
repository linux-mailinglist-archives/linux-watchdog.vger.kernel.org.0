Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D9A4630EC
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Nov 2021 11:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbhK3K0V (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Nov 2021 05:26:21 -0500
Received: from mail-os0jpn01on2097.outbound.protection.outlook.com ([40.107.113.97]:33185
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231216AbhK3K0V (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Nov 2021 05:26:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxEKAEc30ofYyflBgex4NHjTsrmcL4BfxXMPlRkAiJobhjcm91h+J4sGuYJXpTSTiSN+sCxd+tzwKbs1/0pZRCdw5TzEtv28S4T2nX6A7jb6bMt04fMDzVyIU2321hrqEal2Ho7MY5ePjdrEaxgG9C/eHDtg9h0BjJrOAHq1iel0n/LPH4/Zlv0DT4HXsSz+AapSiAszDD1J0Rn93Iv7AZaUTvaeqro7uWt+NPHin9J6iFSvU9taO+kWGsH7JLD3VFrCN1eT5RmWw+ieLQ08XzIutfTHKAQaTU8gPnwh98ipMWGrAl0Zp5yTv1fCrlNCrIPc3NBSsYA5I4MTEoPM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9avzGl++QUzdXsXu9gnZwinNTisGzY6nftrPPpciaU=;
 b=GZgnYC80r6wMfd1wxRJsmXh/q93N0LXy/o5YXuvmxOlwHgQtIEVTAbD64qrP9l51oZC77G+WnMZui6lfv/BwG05GiScNulcnUeMmWoregh6eV5zsPjZTJJfFH98ZpLAdQ00aH80A2KgYNGgYRkyff/dtdZnqG0dQl08WoVvSmbHuo5mc4CQqtwAoJYfW9qy2pPTw/c7SAjC3INwm7sPljgt6518z4CAsekWP3WL544rErmxABEQWisX9GQcV5haR1VXzTXq/bx6fRa7Vi6RVJkC1k0u7KO0o8bjpdPCOgupF8kxlnrPZL0p6RlAbn0Ejkw96C2orpmeErOhj2chZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9avzGl++QUzdXsXu9gnZwinNTisGzY6nftrPPpciaU=;
 b=dtinnCLX18Bm435PFT4EN2Rg/dVN1kaD6DQp1vBG7iHnScKRTVlHuxlw4SYOAydoWRTSHz7srIPPDonOIVj3ZHzdY51Yf1xfYv2B6mjUNZY9RZVLk9i0oMmgK7L7KABJBYRGv08bYPly/OuXr4uigxpkecXue4TYwmEuL/0DG8E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3731.jpnprd01.prod.outlook.com (2603:1096:604:5b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 10:22:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 10:22:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Topic: [PATCH v3 2/2] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Index: AQHX35UsnQLBgqbeLEa95sXe9P8xg6wbY7IAgAB+F2CAAAPwgIAAApqg
Date:   Tue, 30 Nov 2021 10:22:58 +0000
Message-ID: <OS0PR01MB592239BBD2E96DCE43C0B72886679@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211122113554.15990-1-biju.das.jz@bp.renesas.com>
 <20211122113554.15990-3-biju.das.jz@bp.renesas.com>
 <1c369614-0a8d-dfea-d9b6-2d299b2b60c8@roeck-us.net>
 <OS0PR01MB5922FA2BBB2FBC235E3E8AC286679@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUeOWoD8NYZc+qPPF39eqXC6gyLVuEbVfAfTkm8mLo+1A@mail.gmail.com>
In-Reply-To: <CAMuHMdUeOWoD8NYZc+qPPF39eqXC6gyLVuEbVfAfTkm8mLo+1A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da7cba2c-4444-4f86-ccbe-08d9b3eb61e5
x-ms-traffictypediagnostic: OSAPR01MB3731:
x-microsoft-antispam-prvs: <OSAPR01MB3731713D96214E853142377986679@OSAPR01MB3731.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D7gFlOpT/EN6UIahgE5O2Y5YJ/pSGsSnjNFINtQUPG36HXpvEEEFnqScgBNgxHEHpsWMUakZtXiID6xC9UCZEwcI/NwsLN+PRxyF5k5Amc+E8bwW/QtqZskuUXvBMbjqNPVFgVS51jf9YcUCAIjqga5sD2lxadqDU544WlQbicXTMNBfEpBHm3Wgtj94sPeTS2os47KJE+F+aQYCXMGKJcfuCQwwWOHE9ItvOtqIjeC6C192lbOH6u0CGVl4cZY6HSP6j4ZdON24QO4vTalCCAkBDC3UKRqd3j2UjN7Y0LlkWv50l3xndLMEOLPBq/FqsCnSBlMVYm0t1R3Cjsv7ArxjrIFyV76xtB8M8c3/wEnmioouU8Nl3Z+IGO3FLmynaE3pW2TXgljl2tZRdJlo1cFEY5YRVhfErRex0vPmXdz0HvJUugOEXahX8MpoDBmLq/wpDV3r0x9UV4GAG/GgQR/gwPzkW6JYlTH/08Jcf6rxFg8g/gh8TE70/rWwUmZ8pMe1rNqMVuuCuZgGcevQlnaj5JmIAj8e8q7qpRxnnMBElTAWtMwysWArKnFOd7xMxDL6WpppslF3hYrYpk+i9Rs8hnquRT72Xp3KEea6QgzZixdMoqepv6zGt2JuKnmlvu+n/lcSbC0hi1NmkES8CWNZJf4vISCJHiesUSCS4KJVnVAYaKouaO7ZXTlLsr3S8WofybWZbABJPlYETy0EVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(33656002)(186003)(508600001)(26005)(71200400001)(52536014)(4326008)(8936002)(38070700005)(7696005)(316002)(9686003)(83380400001)(53546011)(54906003)(122000001)(66446008)(64756008)(66476007)(76116006)(66556008)(6916009)(66946007)(6506007)(2906002)(5660300002)(55016003)(38100700002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjlmUzhaazRQNDZ0elB6L2JUTEdmVm9PQTZTaTZFZ0c2TWpZVTEvVWwxU1dG?=
 =?utf-8?B?dmdmVjRsd0NPaU5KdGx5MUNXakt3ZW5rTEwvbkRPWnR1ZjFMWVNUa2x2U3Ni?=
 =?utf-8?B?S1RDM3VaUHJMenhGTE1hWUUvTXhCdTJRSXVzbHlnSy9WNC9UQllTaDJkNlJU?=
 =?utf-8?B?OExvNXN0bEpCK0dJWCtoUFB0K3dBQzhYeERkb1dzcjJvbHA5emF2RWZ4ZktH?=
 =?utf-8?B?RUp5WUNlRUVkWUdOczdlUGxsK2o1OXg1V0M5WVd5alV4aXM3MEI3RmdMYkZ4?=
 =?utf-8?B?R2FPamdmRlFWZDh0citYTDlDTGpiK1R6VUdPbUFpbW8vdXJUWjhhRjJxRkhG?=
 =?utf-8?B?QXEzazVtdS9qamdLallnSFZ6UXJQUFZnTXBhaDUzcm9KOTNhQjg2WnNlMW1z?=
 =?utf-8?B?cm9HZ3VvR3hLVitTWWxzeWpoS2dxcUxHSnlsYnZIR2dGVENIUW1RY1h4RVlW?=
 =?utf-8?B?akNYdmxMOWRaQytlYWpVKzdmWlRGWXkvREY4dGZBcm1GcVJDemtJM2tqeU8r?=
 =?utf-8?B?aDNBQkZGRVFPSk8yYnRkdkdnd3lHU0svZmRnN215Y0hLZGpjdDAvZ3lmZnZt?=
 =?utf-8?B?ZlhaMHpnU1lOWUdCYmRtR0g2MEJ5dFFpWkxaNnBNY2NnYzhDRFZ6aDh6N3ZI?=
 =?utf-8?B?VVlRR0wvQU9DUVdlbHNMYXpVOHJvRFJwOEw5RkRjZ05nQkFGb0dwYUJFWnRt?=
 =?utf-8?B?QkMvMkd5K3c3NTR6RVNhV05VUGJidTF6SHJyTHluN2NkN2ZZYk5FK21jbGlt?=
 =?utf-8?B?SFRTRERpcFh3ci9IUmx6bXpkYVBsamVqdXlZUnBxWFhuczFYSWE4clM3UERV?=
 =?utf-8?B?d1Fsc3prS2F0TnJZSU9jRHd0bCsvbjFGRGdCOFYyTUtTekFWOExlQ1V2eTlR?=
 =?utf-8?B?Z1RYUHorSlIvRnNHUXZEQUpTbHM1U3JzeUVvSjZ0N0czNEd1ZENGa0JZUEpL?=
 =?utf-8?B?a05mcVJEa1p2bEFDaFdmdWQwT1g0UVkxMGhBay9vZWVWS0haam01alIvelVs?=
 =?utf-8?B?bW1tZWREdlRseVQzQzdid3VzWUsybXJPYmd2Z2RaWGphVkZ1ZlZOR0ZITzBl?=
 =?utf-8?B?d1JtWFVDNEFLZzAydlBvVDVJeHVBN3BET1pXL0tKTkxLWXA2Y3l1Smp5cVJC?=
 =?utf-8?B?OGdEc2VCb0xMTTJ4VDNmeGJtYWpWNlIrL0g2c1I5R2xCeHp1QnFaWW94ZUxS?=
 =?utf-8?B?VHZnQTI5dG1ubTJEWm9LcXpCUVRod1FZMlhlZDM2WSsyZ0MxREhPOGh1MVU3?=
 =?utf-8?B?NlE3bjM1K3h4MnBJRk1iTWxlSDc3QzFwNXlRQ2tJZUQzSU5ISHBtUEhpTGNN?=
 =?utf-8?B?Yy9CQmdUTHA0aG5iU091M0JhVG0yQ3kzd0xTd0xzcUYxYUM3L2ZFVjhKNGt6?=
 =?utf-8?B?eDFodk5XRnJZMTRid0QxSTFBODNSb2k3MDB5RzM4ZFZmbWJFanpiWlh0UzJu?=
 =?utf-8?B?dklJbDBUYlFHdzR0UHdmMEk2bFdsMFVkeGhxTjNDMURVMVJlUS83L2IvK2Mx?=
 =?utf-8?B?ZnJCeUFNN3dkYUMydnRROTBRdkFNdlMwKzZFNkp6VFZKblFGajNMTzNyaGJo?=
 =?utf-8?B?dm0rN1hBMWEzcXZ0VjVCZktBOEZLdS9rMDdZd3lEVzNpTS9QaVcybkptei90?=
 =?utf-8?B?SmpWOVJyUk55dWgzTzE2VmdoUFBnNzNPaURUYldIVElzd0dKYjVSSEhKd01G?=
 =?utf-8?B?TVArNXZTTUlCYzJub0xQaGt2UDhhYUpoU3RxNi9Cbm90KzJabEJza3ZOYldk?=
 =?utf-8?B?Zm1WL1JSdjFCWU5tY2VpS25OcWtTVmJqbHJCald6WFdFbW9XNm0wRm5lZ2Fl?=
 =?utf-8?B?S29teXNNTmllc1YreEh5cXFmZHpRMmZjUC9VYzQzZFJtMlkrUjI4anByTXpD?=
 =?utf-8?B?Z0Nrc1hrZzVSbnB5bWVnNXJ6a085K1ljbVYvSmdSTUs0ZFU0ZGVGbFRPVVV1?=
 =?utf-8?B?WXBxZ3IwRUwwaFFTNDN0UWFDUVQ3YkJFdnRKbHFVMTBmdjF1ak81R2s2WEVV?=
 =?utf-8?B?aGtLWUVGdm9FQ0V6cEdYL3FzVzQ1LzVZdFY5dVVrNHJ0ZDRvOHplRmNqNFZH?=
 =?utf-8?B?eWxhUWZJK1pVZGhXUGNMKzd1a3lDRkZ5Ry9jaUFZYkFzQ1hjRmQwSVRhNXpQ?=
 =?utf-8?B?SThiOER5WTBhVGZ5NEtVYWt4TWJSTFg1UnI4dDdhR05pOEhoVUV3c0M4YkV1?=
 =?utf-8?B?cGVMTS9ZUDMwZGY0c2ZZTHhaR1BMYklUcE5ISk1WZldTeVN1T2Exb1crZ2pP?=
 =?utf-8?B?WjRBc1lpUnVMRklqRGRIelBiOFJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7cba2c-4444-4f86-ccbe-08d9b3eb61e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2021 10:22:58.9408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ZTt6mYPTvRfESnXMdCoOCp5XtUsidlrt35ZCq1ujPVgJs/NoiMUiUnPSpat2xHpdgy5s5KdfcLUxkgblmuV8GWjlZlk6L1+dtP6qCijUKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3731
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMi8yXSB3YXRjaGRvZzogQWRkIFdhdGNoZG9nIFRpbWVyIGRyaXZlciBmb3IgUlov
RzJMDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgMTA6NTkg
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi8yXSB3YXRjaGRvZzogQWRkIFdhdGNoZG9nIFRpbWVy
IGRyaXZlciBmb3INCj4gPiA+IFJaL0cyTCBPbiAxMS8yMi8yMSAzOjM1IEFNLCBCaWp1IERhcyB3
cm90ZToNCj4gPiA+ID4gQWRkIFdhdGNoZG9nIFRpbWVyIGRyaXZlciBmb3IgUlovRzJMIFNvQy4N
Cj4gPiA+ID4NCj4gPiA+ID4gV0RUIElQIGJsb2NrIHN1cHBvcnRzIG5vcm1hbCB3YXRjaGRvZyB0
aW1lciBmdW5jdGlvbiBhbmQgcmVzZXQNCj4gPiA+ID4gcmVxdWVzdCBmdW5jdGlvbiBkdWUgdG8g
Q1BVIHBhcml0eSBlcnJvci4NCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBkcml2ZXIgY3VycmVudGx5
IHN1cHBvcnRzIG5vcm1hbCB3YXRjaGRvZyB0aW1lciBmdW5jdGlvbiBhbmQNCj4gPiA+ID4gbGF0
ZXIgd2lsbCBhZGQgc3VwcG9ydCBmb3IgcmVzZXQgcmVxdWVzdCBmdW5jdGlvbiBkdWUgdG8gQ1BV
DQo+ID4gPiA+IHBhcml0eSBlcnJvci4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1i
eTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiANCj4gPiA+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jDQo+ID4g
PiA+IEBAIC0wLDAgKzEsMjU1IEBADQo+ID4gPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiA+ID4gPiArLyoNCj4gPiA+ID4gKyAqIFJlbmVzYXMgUlovRzJMIFdEVCBX
YXRjaGRvZyBEcml2ZXINCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIw
MjEgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3Jwb3JhdGlvbiAgKi8NCj4gPiA+ID4gKyNpbmNsdWRl
IDxsaW51eC9iaXRvcHMuaD4gI2luY2x1ZGUgPGxpbnV4L2Nsay5oPiAjaW5jbHVkZQ0KPiA+ID4g
PiArPGxpbnV4L2RlbGF5Lmg+ICNpbmNsdWRlIDxsaW51eC9pby5oPiAjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+ICNpbmNsdWRlIDxs
aW51eC9vZi5oPiAjaW5jbHVkZQ0KPiA+ID4gPiArPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPiAj
aW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPiAjaW5jbHVkZQ0KPiA+ID4gPiArPGxpbnV4L3Jl
c2V0Lmg+ICNpbmNsdWRlIDxsaW51eC93YXRjaGRvZy5oPg0KPiA+ID4gPiArDQo+ID4gPiA+ICsj
ZGVmaW5lIFdEVENOVCAgICAgICAgICAgICAweDAwDQo+ID4gPiA+ICsjZGVmaW5lIFdEVFNFVCAg
ICAgICAgICAgICAweDA0DQo+ID4gPiA+ICsjZGVmaW5lIFdEVFRJTSAgICAgICAgICAgICAweDA4
DQo+ID4gPiA+ICsjZGVmaW5lIFdEVElOVCAgICAgICAgICAgICAweDBDDQo+ID4gPiA+ICsjZGVm
aW5lIFdEVENOVF9XRFRFTiAgICAgICBCSVQoMCkNCj4gPiA+ID4gKyNkZWZpbmUgV0RUSU5UX0lO
VERJU1AgICAgIEJJVCgwKQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsjZGVmaW5lIFdEVF9ERUZBVUxU
X1RJTUVPVVQgICAgICAgICAgICAgICAgNjBVDQo+ID4gPiA+ICsNCj4gPiA+ID4gKy8qIFNldHRp
bmcgcGVyaW9kIHRpbWUgcmVnaXN0ZXIgb25seSAxMiBiaXQgc2V0IGluIFdEVFNFVFszMToyMF0g
Ki8NCj4gPiA+ID4gKyNkZWZpbmUgV0RUU0VUX0NPVU5URVJfTUFTSyAgICAgICAgICAgICAgICAo
MHhGRkYwMDAwMCkNCj4gPiA+ID4gKyNkZWZpbmUgV0RUU0VUX0NPVU5URVJfVkFMKGYpICAgICAg
ICAgICAgICAoKGYpIDw8IDIwKQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsjZGVmaW5lIEYyQ1lDTEVf
TlNFQyhmKSAgICAgICAgICAgICAgICAgICAgKDEwMDAwMDAwMDAgLyAoZikpDQo+ID4gPiA+ICsj
ZGVmaW5lIFdEVF9DWUNMRV9NU0VDKGYsIHdkdHRpbWUpICgoMTAyNCAqIDEwMjQgKg0KPiA+ID4g
PiArKCgodTY0KXdkdHRpbWUpDQo+ID4gPiArIDEpKSAvIFwNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICgoZikgLyAxMDAwMDAwKSkNCj4gPiA+DQo+ID4gPiBU
aGlzIG1hY3JvIGdlbmVyYXRlcyBhIDY0IGJpdCBkaXZpZGUgb3BlcmF0aW9uIC0gYXMgbm90aWNl
ZCBieSAwLWRheQ0KPiA+ID4gLSBhbmQgd2lsbCBoYXZlIHRvIGJlIHJld3JpdHRlbi4NCj4gPiA+
DQo+ID4NCj4gPiBPSywgd2lsbCByZXdyaXRlIGxpa2UgYmVsb3cgdG8gbWFrZSB0aGUgQVJDSD1t
NjhrIGNvbXBpbGVyIGhhcHB5DQo+ID4NCj4gPiAtI2RlZmluZSBGMkNZQ0xFX05TRUMoZikgICAg
ICAgICAgICAgICAgICAgICAgICAoMTAwMDAwMDAwMCAvIChmKSkNCj4gPiAtI2RlZmluZSBXRFRf
Q1lDTEVfTVNFQyhmLCB3ZHR0aW1lKSAgICAgKCgxMDI0ICogMTAyNCAqICgoKHU2NCl3ZHR0aW1l
KQ0KPiArIDEpKSAvIFwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICgoZikgLyAxMDAwMDAwKSkNCj4gPiArI2RlZmluZSBGMkNZQ0xFX05TRUMoZikgICAgICAg
ICAgICAgICAgKDEwMDAwMDAwMDAgLyAoZikpDQo+ID4gKyNkZWZpbmUgV0RUX0NZQ0xFX01TRUNf
Q09OU1QgICAgICAgICAgICgxMDI0ICogMTAyNCAqICh1NjQpMTAwMDAwMCkNCj4gDQo+IDEwMDAw
MDBVTEwgKGNhc3RzIGFyZSBldmlsIDstKQ0KDQpPSyB3aWxsIGdldCByaWQgb2YgdGhpcyBtYWNy
byBhcyB5b3Ugc3VnZ2VzdGVkIGJlbG93Lg0KPiANCj4gPg0KPiA+ICtzdGF0aWMgdTMyIHJ6ZzJs
X3dkdF9nZXRfY3ljbGVfbXNlYyh1MzIgY3ljbGUsIHUzMiB3ZHR0aW1lKQ0KPiANCj4gY3ljbGUg
PT0gcHJpdi0+b3NjX2Nsa19yYXRlLCBpLmUuIHVuc2lnbmVkIGxvbmc/DQoNCk9LIHdpbGwgbWFr
ZSB1bnNpZ25lZCBsb25nLg0KDQo+IA0KPiA+ICt7DQo+ID4gKyAgICAgICAvKiB0aW1lcl9jeWNs
ZSA9IGNsa19jeWNsZSAqMTAyNCAqMTAyNCAqIChXRFRUSU1FICsgMSkgKi8NCj4gDQo+IENvbW1l
bnQgbm90IG5lZWRlZCBpZiB5b3UgZ2V0IHJpZCBvZiBXRFRfQ1lDTEVfTVNFQ19DT05TVD8NCkFn
cmVlZC4NCg0KPiANCj4gPiArICAgICAgIHU2NCB0aW1lcl9jeWNsZV9tcyA9IFdEVF9DWUNMRV9N
U0VDX0NPTlNUICogKHdkdHRpbWUgKyAxKTsNCj4gPiArICAgICAgIGRvX2Rpdih0aW1lcl9jeWNs
ZV9tcywgY3ljbGUpOw0KPiANCj4gZGl2NjRfdWwoKT8NCg0KT0ssIHdpbGwgZG8gc2luY2UgaXQg
aXMgNjQgYml0IGJ5IDY0IGJpdCBkaXZpc2lvbi4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiANCj4g
PiArDQo+ID4gKyAgICAgICByZXR1cm4gdGltZXJfY3ljbGVfbXM7DQo+ID4gK30NCj4gDQo+IEdy
e29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4g
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
