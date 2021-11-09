Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDF644A842
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 09:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241660AbhKIIZC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 03:25:02 -0500
Received: from mail-eopbgr1410138.outbound.protection.outlook.com ([40.107.141.138]:58763
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239099AbhKIIZC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 03:25:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvVfHY+FWsxo2gEHMPEwlrDCtVc5ofCmyNno4RAbkattAQf18x+xvcDpVLANis7k1PUdGmTouSfpiVerjMm6RjBbwLhPTELT7pVtbwJhnzVedwxgLoweX2kt5K5S4bTTrWqF/cjElBhSBMiPTGYHmNfcxvUAW5hUbMPjeLzJWaGQL5TrLg1PUrbwMpkyMhV5EAeFbKOKsKlC8ZT7/Z+dMidVK0i0B1TRdiTicfFrzHVMfR3oSICxybDPuWpT07LKwOeCdkGvTFfyQyuyUZ+v0vYQ1Vh7Gig7kGG32wgHkJ5AIa4UU/Ib6l21M1f1WR1NtJRS8nUzCJzoc8JPuwN01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/f3/QCSZXQFVYvlXmrVXXWMICpzLCjqaDdyH/IOFY38=;
 b=PXcTwCN1DDhIWfOcF137gFRj3hDKZ45zqcr/aV0cigFwsBWW/DLtwwpV1uvBqgcbWvtm86dHWQI2wKm2AmYmhfge7QjE4Sa6tqkqYbr381Zo7chlwlWaRpHYeQeDQJNCpTQd2y5WRj0RwTtY9lmEvIvOY/dTIt1plLnHFIXzxvGJWBAfVyOFzMv+uCl21PJhynr6ErGNQITur9FqLlQr1f1O6Sb7rnXOgwN5rb0toOho+ebtkvZxvlGH+PzjGXYQzvshH6h6XLEP7NvsVEumPg+LlEMKhj8VuwUXoz8zW8780aasBR9ecrc/GlFoNit0XFcYPR7VMFlOro6mIbee4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f3/QCSZXQFVYvlXmrVXXWMICpzLCjqaDdyH/IOFY38=;
 b=OzQCk040ONKXlF33QWID3jPRuLMcqgSK3WhrXZ/XW3Wg8emVoghTEKO7Gh1T7a+hqw/mmRf4endVnZjAu6FazBQ4XD/cqHJf5AKxEvaOC+Bm0gcm4VACl6xnLWaJKPkAoKJBrrRIlfMt1z1L6mls6/w9Z0eU6FrVqdXb4eXdH7w=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2801.jpnprd01.prod.outlook.com (2603:1096:603:3b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 08:22:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 08:22:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Topic: [RFC 4/4] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Index: AQHX0ZZR7vE/pMRgFEu2TDzTbftJH6v5/IMAgADhBwCAAAHnkA==
Date:   Tue, 9 Nov 2021 08:22:13 +0000
Message-ID: <OS0PR01MB59222E6080E92731DD66A03586929@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com>
 <20211104160858.15550-5-biju.das.jz@bp.renesas.com>
 <70ba0c57-aca5-4822-631b-1eb7e7b9b3a2@roeck-us.net>
 <CAMuHMdXrqkowJnQAT2DvcJx6jsEoMcrEUN6k=NNcqoxc8-aKFw@mail.gmail.com>
In-Reply-To: <CAMuHMdXrqkowJnQAT2DvcJx6jsEoMcrEUN6k=NNcqoxc8-aKFw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42e6030f-b65b-4e72-1c65-08d9a35a0879
x-ms-traffictypediagnostic: OSAPR01MB2801:
x-microsoft-antispam-prvs: <OSAPR01MB2801641BCCAA451BAD18CE9786929@OSAPR01MB2801.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JcLcNKz4et64hwRC0roPdxLVvu0hh/drFlngyzBpMq5f3fpZUIP5e7eiS+5CEdjfSzI5R79szeIGAu3wbY0t+izRSUg/IykM0wuSdW2Z/WxczAwKbyCCzKgBds7hW3yVZuA1j4ZnifUhr6Sj0I0c5rGtKA1QBDSpaOSY05q0pI87/HlcArJcj1hRsBWDsYmniFO5wl765XQKbbezRq8txrMNhE9fe6d9eMMGR3L8cv4pqM74d9J5ITIidRRUTBUsKKb+wGAtIgTZCimAC2vCrn+FkHCS2Lk+2iSzQL8j+mN9R8/AqyX3Be+kdO59hah5eXz+pp5lUgo24GJREY5iB52YAPM6yax72dYpsq5u4Dcig9vlzVPdtck8CuBYUcuhcZMJG/oAP8AqunWaQCINTqnNkEaW+CWz+2LaSSakVEqmn+rbCfM1ly4Ow3mBcZ1yfHWnPibJr9mNO2GidgFjIa6B5wQKAaodHDUSsbEN6wW763Su5vAdpPkl9qlKxGvUOQNlRBMaFLufg1Aio0cqNdbGyGwOeLCCuKnYZBDecMW/RskMlOFS8g/Bg6L9JRaJRJkrdlnyBtbYdvZB9Uzp/t383/pi5b+r2aD6cxiMqdPtyEh5br7lig90VvKoniC/A6ZmciI3f+h8CsFa6US8epWE0OuZ/JNVOMr4J3fgO4/SECfWNVu1wTv0MAN4mhTbw5jHDjZj9ipSClHOLKNy7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(7696005)(53546011)(66946007)(83380400001)(6506007)(8676002)(2906002)(38100700002)(8936002)(122000001)(71200400001)(76116006)(186003)(5660300002)(508600001)(55016002)(86362001)(26005)(66446008)(52536014)(54906003)(316002)(64756008)(66556008)(66476007)(110136005)(38070700005)(9686003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1Z3ZjllUjZzSmJ0V21TbEVxSGdaRjZreDJlV3RoUXpYbDF3aFUzRndJeVVP?=
 =?utf-8?B?bkZhYzQ5aTYyaCswa3VMQjlHNGZTUlJEYnR4bXNuUnh3ZmgyT3FrWXBDVG9F?=
 =?utf-8?B?TVpqam5RSGZPZXl1TGp3SGZ2Z09xdW41RmoyYjFFNXFkRlhMbFVKTldqMTZy?=
 =?utf-8?B?VGsxWW1VK0ZYQy9NcGo0eDE3SFNKNStoRDg5RWp3ZS82MVQxcDdoMllTaGxr?=
 =?utf-8?B?V0hFbXFwM08rQ2JJbGZRN1BTYXgwd2JRRjdZamtYVmxOQ0xJSVhlRk52YkZ2?=
 =?utf-8?B?dUdrMDRyWURTRDZqeXZmT2U5R1QzTVlMZUJlbDA5MFFXd1lkckxRc1pXVFRX?=
 =?utf-8?B?VGl1UGNLYWdPUGpyYm9DNStvNHplQnczaGxERFdiVjFrRWJFYVUxQVBZWnVz?=
 =?utf-8?B?VS9YaHRIYWovOW1VeDgrYi9Ldmw3WC9PV0R3Q1puVWtLRWlnWlBEdG4yMUhH?=
 =?utf-8?B?ejNnTWhGRVhOU2ZxeUkrUlRlOUhQTDVabXBYd1B1U0daUFp4VkZpelJhbG1O?=
 =?utf-8?B?cjI4R2JHelFOWlJKbG0xbHdOb0k1K0VpODIzdHlSQWNhZGpBaG5hM0VkbTF1?=
 =?utf-8?B?a0t6Vm1kV2tiSldqOThEa3ZGVGd1a1NMQ0tMSlBla3VDOWdxQUdSeG84bFJX?=
 =?utf-8?B?UDlQUUF2bGd3OU1FcmtpT2hKc1pFaGRyMVE0Z1ZKMFhlb1IvWC9sQktUYy9E?=
 =?utf-8?B?eUNuV0FRYVlBUThzVlFxU2Zzd0E2dzJVdlk2Y0l2Wi8vd0doM2RPRDg5d1Zw?=
 =?utf-8?B?MnBrNXN0Z3BBMENSTG5VbENHU3VZZWJVV0wzQjUvOXpSb2NoRWNIbm5USEVq?=
 =?utf-8?B?OVFjR1FHMmtZYlpEUjBOZGtJbXY5U2UwcHJwMTY4WlpoZnlHQnRRZGg0b3l1?=
 =?utf-8?B?eCt6aFJYR002blpqRzFpR2l4NEE1Ull1SWd5TXp3M1F4N3hmWTVyd2J2NEo0?=
 =?utf-8?B?UFVpN0lRWk9PNzVnOGY1U1B6TWppSGZiTjNKME9GdFh4c3VwaE5CZTJ3RlVM?=
 =?utf-8?B?WDFFaXlPQjVtZWRhZW9xV3k1TWNwaXdxVW5QakVtakdNV0VucFhRZkZ2TEcz?=
 =?utf-8?B?Njd5WFRLNFlQclRWMy9nS2ZLL1B2UXVsUmxUbWxrVTI5cDlXa1E2Nm9iQlY0?=
 =?utf-8?B?OWFrODRKRjVIa2hObmVzeXlvVGsyb0hLVHhKUXErZTd1Tk9ZdFFQQm1IdFR0?=
 =?utf-8?B?UnVuNUlvWm16SXpKNGUzMzZ4czR1b3AvNy9ZNGJWK1BNT3J4OGtQeWlUZHRT?=
 =?utf-8?B?L2FyT1dNR0RScFZUZmhZL0phNzJvMi94T0wzRG9UTmV5SlNBQjJvRUd0U2JU?=
 =?utf-8?B?VDBQS00rOGo1eXZRay9iOHRuakVUbk91aCtLc2JHVi8yTmR4eVpKamZnUmZv?=
 =?utf-8?B?WlFobEwveDNESTRGOTB2R29pMFhicVIzK2p3SjRMS1J5VlQvSktZQy8rQSs5?=
 =?utf-8?B?TzZSVzRaa2xQNW9MdVRGTXZBbnllb2UzNmxtWVV0TnJXYkE0L3d6YVR4UFhl?=
 =?utf-8?B?WlF4S3p6NUdDNWdDRGVDMU4yRkF2bDFsdE55WHBsZG9mNm9LZllMTENwN2dS?=
 =?utf-8?B?QlRKMHZGcnRaRFNFWFlMY2d5bTFQV203d0I0T2xFZVhuUkx6cGw3Um9pLzFI?=
 =?utf-8?B?OHErdFhYV3dYdnh2WExxbWRHTEdoN0JNVUJyYU02Qk56ZEp5b0huSHlKZy9i?=
 =?utf-8?B?YmpYendXNldkOTVtNUtjRStpL0tVVStrWmlpM0tIb0VBOXFEUlFvc3pXV1Fi?=
 =?utf-8?B?SkRLZTBybWVWMVVWR0hiU0VRUTZWQXZSOWozbFMySXJwanJ1d3RFRFYzMWtS?=
 =?utf-8?B?dDJEb1FUaVExNXllRmhWT0h3c1lHOWpNKzJtNlQ0MlJEeEFTeW1sK2VTaWZP?=
 =?utf-8?B?VmtGbngwcTNRdGVMWUo5bzNOOE5NR1RRb2Mva3NISXh4czFKZ20wM0Z2ZHJZ?=
 =?utf-8?B?K0hTcFR0UCtRNmVqKzcrTkVIeUJaVllhMHFTZzZlV0FRMDduZHEzZ0VlK3A2?=
 =?utf-8?B?cUxJNWtRKzN6Y1RoVXRxL1BIenhsOGVSc2RoRXp4aWxLU1FNVzJmN2NZRlJ6?=
 =?utf-8?B?V0h6d3JydjRHUkV4UThTamlaa2cxTFBROFJFMnZkb0ZkWTA1RXFHYTRzTzFj?=
 =?utf-8?B?K0xoV0ZCTDlaY0t4OUhyeHI2d3dpOFNBZGRSQ25jZEZUc2lkbFZOc0xPQ0ZB?=
 =?utf-8?B?aVp5QnRKT0wvV054VFd1NUJtOTFtWUdxOEdmcnc3czZpMkJUTWNZQ3YrM2Ix?=
 =?utf-8?B?Z211R2Q5T3RpcHRJbEFwWE1nQVV3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e6030f-b65b-4e72-1c65-08d9a35a0879
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 08:22:13.2103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P+hZBcPdvISdDcfBIzh2LGQxqBqK9riKJ5Z9LhX6bUQ4DxY2r3rchSlQd+f00fpnpttytrhaGKpJ/yM/MfuveYNFvKzBhKZw8t2vvAA5gos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2801
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UkZDIDQvNF0gd2F0Y2hkb2c6IEFkZCBXYXRjaGRvZyBUaW1lciBkcml2ZXIgZm9yIFJaL0cyTA0K
PiANCj4gT24gTW9uLCBOb3YgOCwgMjAyMSBhdCA3OjM4IFBNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4
QHJvZWNrLXVzLm5ldD4gd3JvdGU6DQo+ID4gT24gMTEvNC8yMSA5OjA4IEFNLCBCaWp1IERhcyB3
cm90ZToNCj4gPiA+IEFkZCBXYXRjaGRvZyBUaW1lciBkcml2ZXIgZm9yIFJaL0cyTCBTb0MuDQo+
ID4gPg0KPiA+ID4gV0RUIElQIGJsb2NrIHN1cHBvcnRzIG5vcm1hbCB3YXRjaGRvZyB0aW1lciBm
dW5jdGlvbiBhbmQgcmVzZXQNCj4gPiA+IHJlcXVlc3QgZnVuY3Rpb24gZHVlIHRvIENQVSBwYXJp
dHkgZXJyb3IuDQo+ID4gPg0KPiA+ID4gVGhpcyBkcml2ZXIgY3VycmVudGx5IHN1cHBvcnRzIG5v
cm1hbCB3YXRjaGRvZyB0aW1lciBmdW5jdGlvbiBhbmQNCj4gPiA+IGxhdGVyIHdpbGwgYWRkIHN1
cHBvcnQgZm9yIHJlc2V0IHJlcXVlc3QgZnVuY3Rpb24gZHVlIHRvIENQVSBwYXJpdHkNCj4gPiA+
IGVycm9yLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiArKysgYi9k
cml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jDQo+IA0KPiA+ID4gK3N0cnVjdCByemcybF93ZHRf
cHJpdiB7DQo+ID4gPiArICAgICB2b2lkIF9faW9tZW0gKmJhc2U7DQo+ID4gPiArICAgICBzdHJ1
Y3Qgd2F0Y2hkb2dfZGV2aWNlIHdkZXY7DQo+ID4gPiArICAgICBzdHJ1Y3QgcmVzZXRfY29udHJv
bCAqcnN0YzsNCj4gPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgb3NjX2Nsa19yYXRlOw0KPiA+ID4g
KyAgICAgdW5zaWduZWQgbG9uZyBwY2xrX3JhdGU7DQo+ID4NCj4gPiBwY2xrX3JhdGUgaXMgb25s
eSB1c2VkIGluIHRoZSBwcm9iZSBmdW5jdGlvbiBhbmQgdGh1cyBub3QgbmVlZGVkIGhlcmUuDQo+
IA0KPiBJbmRlZWQuLi4NCk9LLg0KPiANCj4gPiA+ICtzdGF0aWMgaW50IHJ6ZzJsX3dkdF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gPiArICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ID4gKyAgICAgc3RydWN0IHJ6ZzJsX3dkdF9wcml2
ICpwcml2Ow0KPiA+ID4gKyAgICAgc3RydWN0IGNsayAqd2R0X2NsazsNCj4gPiA+ICsgICAgIGlu
dCByZXQ7DQo+ID4gPiArDQo+ID4gPiArICAgICBwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7DQo+ID4gPiArICAgICBpZiAoIXByaXYpDQo+ID4gPiAr
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgcHJpdi0+
YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gPiA+ICsg
ICAgIGlmIChJU19FUlIocHJpdi0+YmFzZSkpDQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBQ
VFJfRVJSKHByaXYtPmJhc2UpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgLyogR2V0IHdhdGNoZG9n
IG1haW4gY2xvY2sgKi8NCj4gPiA+ICsgICAgIHdkdF9jbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYt
PmRldiwgIm9zY2NsayIpOw0KPiA+ID4gKyAgICAgaWYgKElTX0VSUih3ZHRfY2xrKSkNCj4gPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUih3
ZHRfY2xrKSwgIm5vDQo+ID4gPiArIG9zY2NsayIpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgcHJp
di0+b3NjX2Nsa19yYXRlID0gY2xrX2dldF9yYXRlKHdkdF9jbGspOw0KPiA+ID4gKyAgICAgaWYg
KCFwcml2LT5vc2NfY2xrX3JhdGUpDQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJy
X3Byb2JlKCZwZGV2LT5kZXYsIC1FSU5WQUwsICJvc2NjbGsgcmF0ZQ0KPiA+ID4gKyBpcyAwIik7
DQo+ID4gPiArDQo+ID4gPiArICAgICAvKiBHZXQgUGVyaXBoZXJhbCBjbG9jayAqLw0KPiA+ID4g
KyAgICAgd2R0X2NsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAicGNsayIpOw0KPiA+ID4g
KyAgICAgaWYgKElTX0VSUih3ZHRfY2xrKSkNCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUih3ZHRfY2xrKSwgIm5vDQo+ID4gPiArIHBj
bGsiKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIHByaXYtPnBjbGtfcmF0ZSA9IGNsa19nZXRfcmF0
ZSh3ZHRfY2xrKTsNCj4gPiA+ICsgICAgIGlmICghcHJpdi0+cGNsa19yYXRlKQ0KPiA+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCAtRUlOVkFMLCAicGNs
ayByYXRlDQo+ID4gPiArIGlzIDAiKTsNCj4gDQo+IC4uLiBhbmQgdGhpcyBjYW4ndCByZWFsbHkg
aGFwcGVuLCBjYW4gaXQ/DQoNCkJ1dCBJIG5lZWQgcGNsayBmcmVxdWVuY3kgIGZvciBkZWxheSBj
YWxjdWxhdGlvbi4gVGhhdCBpcyB0aGUgcmVhc29uIEkgYW0gZG9pbmcgYSBnZXQuIFByb2JhYmx5
IGFmdGVyIA0KR2V0dGluZyB0aGUgcmF0ZSwgSSBzaG91bGQgZG8gYSAicHV0Ii4gU28gdGhhdCBS
dW4gdGltZSBQTSB3aWxsIGJlIGluIGZ1bGwgY29udHJvbCBmb3IgdGhlIGNsb2Nrcy4NClNhbWUg
Zm9yIG9zY2lsbGF0b3IgY2xrLiBJcyBpdCBvaz8NCg0KUmVnYXJkcywNCkJpanUNCj4gDQo+IFNv
IHlvdSBkb24ndCBuZWVkIHRvIGdldCBwY2xrIGF0IGFsbC4gIEl0IHdpbGwgYmUgY29udHJvbGxl
ZCB0aHJvdWdoDQo+IFJ1bnRpbWUgUE0gYW55d2F5Lg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMs
DQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzDQo=
