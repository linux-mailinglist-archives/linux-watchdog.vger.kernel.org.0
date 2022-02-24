Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463AE4C2A3D
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Feb 2022 12:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbiBXLEG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Feb 2022 06:04:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbiBXLED (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Feb 2022 06:04:03 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FD928F956;
        Thu, 24 Feb 2022 03:03:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glGbckuremY2al8yOpFgejrG5piiogRAfpH18scYuAEb+hes0Vzv/y0nLYdZ0poVjf/VpFgw6lIRtgE8svrgJrqrO3uZ79n35Z953DGwp+hC9396ptgCDl5dutlKt7sXUsMGdIhR7S3yExrlPpkiY+dXUaiBeZhprlnwEhSnqxVKCOyGtNAtlGqhsyewFybZe5xJHw6fsYEcyl1VfhxdtDafBasKeNSEsp44F44e1butpKr3GqAxR5qU7Tx4KGxNtmhR+g10n+KsQSi0FFYC3KqJu/7/5IRG3l83SVAbWI0OzO/eJoxaaFer/GscIdmr2uCh18cGFjy4AdSMeCBQPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urPKEjQNx1BbZVtrnB0jPB/kW5t5Zi5ZTPdpU2EVcN0=;
 b=Ta5Behp1EO8cwFBFbI0lhHmIFCTBbjSNNNKKxsb755zTxtqu6CfHm0hD57LomoZvk1XXW/HG9mEUnrSkYLUhbhZ7O0JmS5FaCBc+YEx0HFKYA1Q2dNhKwNyj5LtbaBGgw5x0YU04qHABHZv4pNBP77ttjeZN9yXvDQoOgxc5BWrNUkOEV1yaWTHhffgm+VF3YRzLDAhsad0l8smdeLUr6eqJH7K1rrJPK+u/0DaapN0Tb8Wf1WdqMAGgb6I5ljANLXQLFR6MsVPPl5YJwCAFWyCWR909dESHu8ppVmd+Ff6ElKy2KqzR+kkiGaS4AM4mgybFNJAjazDped2DFrFB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urPKEjQNx1BbZVtrnB0jPB/kW5t5Zi5ZTPdpU2EVcN0=;
 b=nhlWIl8CA/q52yzjtLl7sBEcBzFJZHWJ190NlVZI/2IpSGs1rhYY0tyTSKqsVfC5T2uH2ia2Rgk/xiRe5MQgxa31Bm+XO/aY9CfIam6lDM4BeJVd4mI3Su/JiaZqk7+T0zEjSj5kRcS48X6piLV10qfr1spBY8LxJYxFaTKvC5A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6120.jpnprd01.prod.outlook.com (2603:1096:604:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 24 Feb
 2022 11:03:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%6]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 11:03:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 4/6] watchdog: rzg2l_wdt: Add error check for
 reset_control_deassert
Thread-Topic: [PATCH v4 4/6] watchdog: rzg2l_wdt: Add error check for
 reset_control_deassert
Thread-Index: AQHYKM6Xxv431bIl5keQoDzz3bU6ZqyiceMAgAAV/hA=
Date:   Thu, 24 Feb 2022 11:03:30 +0000
Message-ID: <OS0PR01MB5922749D5D93B99C05E7BBB0863D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com>
 <20220223160100.23543-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdV80cvBCP-zOH-opy5hviXZiO6Xf43RCF-ah9kZXgPdAQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV80cvBCP-zOH-opy5hviXZiO6Xf43RCF-ah9kZXgPdAQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12a7856f-319d-44a8-b3c6-08d9f7854aba
x-ms-traffictypediagnostic: OS3PR01MB6120:EE_
x-microsoft-antispam-prvs: <OS3PR01MB6120058C1B65BCC94D5E9D07863D9@OS3PR01MB6120.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2P5mehgwoa2USmPHzV8+0u8YrKsX3E66OTwFzaMFhNPrlf/FajfDQe1wSWrqCpdUyoOQ8OCX2DyFa6ENi3JMmsESKS+AKpsyZmXXiuJIbCxWREDJjcYBtqwN3DtxYrvpeKAU17qp/9nw0yZKQIWv0Eg2h4UJ0S0u30WaPmL+K26X3JK3Axv2iOuaLnmbLFuAEENHlozVf/ElJXeKpO8NdomBdA82B851AEaYJcbG9b1OkAudMZKm8zjvrAeHM9A8YK1rttmZLrkd3puJWo+y3D/16tOl7BoTl3HBjlHR+mK+DvaxSGZOMqnnE9T0HYTyPuFcNci+9EFoBmK+tac5OG2UPf/2Q8otuLTs7gmiDiCFnwIeMMnPHcccNAzJ8uf+1DWw0FQ1cIah17XJ7OQvgqKdTOVidu0TcG5nsz94g3fyvzhCn2cWYrbmxQc4VHulVtlePIHjhzv7PdFz6h3MIbFnumF/E2L+8BayDIHPeJugQAbvRzLkR6l+TiYF5w3fRJOVhMSS+rI2oL2BC9+IEBYA0ISNkIN1+jRP4GbG5YvFfYa3Ul1XLYKlK0DRlCUbzuymTPdo5pSzJKNmzp7Bw+OpT3S07MnYZYY1B0pPiddAHuy1VNIxCZQTYElzXmt8YFDj/Q1UN24IU1G6+iYUsBe6ye85fB5PAfIBnJwa7s0jCXAo83i6fU96UdROSHefVvhfhSwoGq+IRAelPCBQulwrIwgJ91ImIc55Is14/oUVnwmbhTXTB9aW/rSi8L6O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66556008)(316002)(76116006)(66946007)(508600001)(55016003)(8676002)(64756008)(4326008)(33656002)(53546011)(5660300002)(6506007)(66446008)(9686003)(7696005)(6916009)(71200400001)(38100700002)(26005)(122000001)(52536014)(8936002)(86362001)(38070700005)(2906002)(54906003)(83380400001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3lxZEJMNm5HTmhaMnFLUkJPZExtMktPdVBQQThOZFQ3d1J1NVA5RlpENmdl?=
 =?utf-8?B?OG1DZE43UmZMWmpSNWZRdmt2Nlo1dGZBOURLaWY5ek5SYTN1WW1Vb0EwMFZn?=
 =?utf-8?B?UTBFVkhDUUlhYTU1b2hWQTRtUmR0YUVCLzVuVnVIYWxrVmQ4WTd2SUtRS1A3?=
 =?utf-8?B?UzdWMGZOckFZZC93U1dJL3hxSk13L1VDUmFjRlZKa2tRMjEramgrZm9PTnlq?=
 =?utf-8?B?QkJ4dXBhcTArQmhFWTdQaHkvbGUrSTR0RVRFMWtVQUphN1REZ2cwd2pRalRH?=
 =?utf-8?B?a1cvL2VHS3RIMXREd2dWemtkc3JvNU05b3NDdzNSc2Z2WEpieUdNYVhCN2pi?=
 =?utf-8?B?QUNXYjVuR1pKSG9BNThMRmZEOHprY3ZLbURUT1grN013R0NNNmlkaU9ESDFx?=
 =?utf-8?B?R094c0YwRXJQRG9ZNDhRejRsMDJWSm1UYjdmbXFQSDJnZUVvcVkxZjNxQlpT?=
 =?utf-8?B?TmpnVnNMOFA3S2VQWlZRWm42Z2ovQTR1NVV3S1l3WWJqM0REQm5mekh1NWxk?=
 =?utf-8?B?dG5TTnFaS1NhY2hGdWVUdmFRRVpuOHZsdmMzZmxiME5OK0F5bU8wRk82MEla?=
 =?utf-8?B?a0ZHV2lYK083bW00UUZmbkxrSHhyL2lGdnRvWFMyRktDS3FQbXRIWTJmV3NW?=
 =?utf-8?B?bGRINUtpTXQ3Wng0Y0x0cDJ2ZytwZkV1L0h5VXpBNDFMbFhHNFYvby9KbXZK?=
 =?utf-8?B?dkorcW4xVWllTVl1enNNZHFFTTFhc3NGSDJFZE1WelljTE5CbjhKcFpMY1lC?=
 =?utf-8?B?dklLRVV0MTBKbFgwNUVUR1FwbWlJVW5vUlA0WFVCOERFK0N4dlAyNm42ZWVP?=
 =?utf-8?B?NURRc0lvT1QzT3FQdzZQTXB4VVhGZjZuM1ArVEFnL0RLdmptN2lRbmtHR3Zk?=
 =?utf-8?B?R2RPMHdwdmJaUFQ3aU1UK3o4Z2Q4dkNZTk9DWnFSa3NvUEs0WG0ydVlYT1du?=
 =?utf-8?B?VHgxTWt1Zy9WSHcvWDRTcWRQVEhCU2VadFBNZWRJd0ZUR2pNODIySVRHOVh3?=
 =?utf-8?B?ZzZaWTZCUnhpUDA2aXN3WG0zeFRxQmJzaEt0VWdzZmxjeGNuL3V6OG40anpp?=
 =?utf-8?B?bXNTTmdlaDlEWm4wZy9XYjBhSXVnRmZNNE5xRXdhdkJ1S2M5SE81UWJ3NHo0?=
 =?utf-8?B?TEpERHY3L2s3blYwQ050aU5memJCK3dMZEVmWi84a0RsU1hoQnNKMitRZWJa?=
 =?utf-8?B?YTVvQjF2UDZJSzZLdDRacUU3ZlVlMXYzclFTQmk0aWRpUUpXTUhWNVQ2c295?=
 =?utf-8?B?RmcxWVBMb210dklVVGtrWkcyRFVtQS8xVndnWEFLV1IrSjJLSjc2OTlxeHdw?=
 =?utf-8?B?TTFkTndUQVVid1FzYmZieHY5dXFRaTdaRVMvbnRpN0xHWFNlaG10YWN0Z0pz?=
 =?utf-8?B?aTluSmtvdlUyMjNsL3hNOW5vZEp3TDJXVXRQN3BjRnBxa2xUV1RYWDdXQURx?=
 =?utf-8?B?dE1IRUNRRENtODlQYkpZT2FBRFNpV2JQL2NzS3gxTEtnVXd1cVorK0VVWjlo?=
 =?utf-8?B?VElDNi9nRzV6cXZPZUhmK2xUczQrN0pLK0U3NmJ4Vk1TNnhBMXROYi9HOEhh?=
 =?utf-8?B?ZStmZkx3VTRQUXBLNzVoUnNvRFVSaDlyY3BYaVVPSFRTNndkc1VjWVUvNGN2?=
 =?utf-8?B?aFpUSkpGZjFCeHM0bFRJTTdYNW5sY3I1UlE0TUdJZDlsS09wU3J1azd3Ykk1?=
 =?utf-8?B?YVYzUWhKc1RORkl4QmI5QW5uVWFacnVOYXM1OGxBYjJDY2NGZnlmU3lwZExj?=
 =?utf-8?B?VHpTWUwrTGcxei9VV2MyVDAwc1hkdnVuakNyQzZxV1ArK3RHLzhlUjZ0c0pZ?=
 =?utf-8?B?eE0yTGV5UEp0WlNuNDZ2ZTdNSUIxMW5tVmJ0M0lJM29yWlMyMmIzWVkyNmxQ?=
 =?utf-8?B?MUdUbExYcEN3UXhpMi9UUE12R3pBQmgwMHQwRmIydkJHT3hYOHlXMWJoMFhp?=
 =?utf-8?B?c25rTmFVeGhSWHZtN3VPYVhWWlN6UnhyemQvazBxcWlxWGRUQ2R5NHdabW5G?=
 =?utf-8?B?eUZEUjhKRUZFellIUDN4RVFoUElSOXZmcXBPakFuTWZFZktNM3FDdGRRK1g0?=
 =?utf-8?B?NmdtUHFrUXpNRTNCRmd3UXB3Mk13c1BwekxMUzk3Q1ROdXVzVlRDV3hlV00y?=
 =?utf-8?B?QnM5MmZBOGZ5V3pBbDVUMTczZTByd3g2U0lLMUw0VVJQUkxoYU9aM2xSajlX?=
 =?utf-8?B?bVg3ZGxDSHNiTGI4dDB6OTV0Y0orZXhtTFVObTFvS2pHS0hGZUE5L2g3bGp3?=
 =?utf-8?B?WWhGUFNYWWcxeS9WVURXbFoxdVNBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a7856f-319d-44a8-b3c6-08d9f7854aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 11:03:30.5314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cmkc19ux6yjxqi0LeBH9Ucg8QCHKJ9AssQl0NokJ5k5vEYfx78VC6KcNBYYtlN3yJ5XRiQFNVHGAuzdisCe3cXUm8qan4WGdj/jPX0f/HTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6120
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgNC82XSB3YXRjaGRvZzogcnpnMmxfd2R0OiBBZGQgZXJyb3IgY2hlY2sgZm9yDQo+
IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIEZl
YiAyMywgMjAyMiBhdCA1OjAxIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gd3JvdGU6DQo+ID4gSWYgcmVzZXRfY29udHJvbF9kZWFzc2VydCgpIGZhaWxzLCB0aGVu
IHdlIHdvbid0IGJlIGFibGUgdG8gYWNjZXNzIHRoZQ0KPiA+IGRldmljZSByZWdpc3RlcnMuIFRo
ZXJlZm9yZSBjaGVjayB0aGUgcmV0dXJuIGNvZGUgb2YNCj4gPiByZXNldF9jb250cm9sX2RlYXNz
ZXJ0KCkgYW5kIGJhaWxvdXQgaW4gY2FzZSBvZiBlcnJvci4NCj4gPg0KPiA+IFdoaWxlIGF0IGl0
IGNoYW5nZSByZXNldF9jb250cm9sX2Fzc2VydC0+cmVzZXRfY29udHJvbF9yZXNldCBpbg0KPiA+
IHJ6ZzJsX3dkdF9zdG9wKCkgYW5kIHJlbW92ZSB1bm5lY2Vzc2FyeSByZXNldF9jb250cm9sX2Rl
YXNzZXJ0KCkgZnJvbQ0KPiA+IHJ6ZzJsX3dkdF9zdGFydCgpLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtz
IGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dk
dC5jDQo+ID4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+IEBAIC04OCw3
ICs4OCw2IEBAIHN0YXRpYyBpbnQgcnpnMmxfd2R0X3N0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZp
Y2UNCj4gPiAqd2RldikgIHsNCj4gPiAgICAgICAgIHN0cnVjdCByemcybF93ZHRfcHJpdiAqcHJp
diA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdkZXYpOw0KPiA+DQo+ID4gLSAgICAgICByZXNldF9j
b250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdGMpOw0KPiANCj4gU28gYmVmb3JlLCB3ZSBoYWQgYSBy
ZXNldCBjb250cm9sIGltYmFsYW5jZT8NCj4gICAtIEFmdGVyIHByb2JlLCByZXNldCB3YXMgZGVh
c3NlcnRlZC4NCj4gICAtIEFmdGVyIHN0YXJ0LCByZXNldCB3YXMgZGVhc3NlcnRlZCB0d2ljZS4g
T29wcy4NCj4gWW91IHByb2JhYmx5IHdhbnQgdG8gbWVudGlvbiB0aGlzIGluIHRoZSBjb21taXQg
ZGVzY3JpcHRpb24sIHRvby4NCg0KT0ssIHdpbGwgYWRkIHRoaXMgaW4gdGhlIGNvbW1pdCBkZXNj
cmlwdGlvbi4NCg0KPiANCj4gPiAgICAgICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMod2Rldi0+cGFy
ZW50KTsNCj4gPg0KPiA+ICAgICAgICAgLyogSW5pdGlhbGl6ZSB0aW1lIG91dCAqLw0KPiA+IEBA
IC0xMDgsNyArMTA3LDcgQEAgc3RhdGljIGludCByemcybF93ZHRfc3RvcChzdHJ1Y3Qgd2F0Y2hk
b2dfZGV2aWNlDQo+ICp3ZGV2KQ0KPiA+ICAgICAgICAgc3RydWN0IHJ6ZzJsX3dkdF9wcml2ICpw
cml2ID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2Rldik7DQo+ID4NCj4gPiAgICAgICAgIHBtX3J1
bnRpbWVfcHV0KHdkZXYtPnBhcmVudCk7DQo+ID4gLSAgICAgICByZXNldF9jb250cm9sX2Fzc2Vy
dChwcml2LT5yc3RjKTsNCj4gPiArICAgICAgIHJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+cnN0
Yyk7DQo+IA0KPiBBcyB0aGUgcmVzZXQgaXMgbm93IGRlYXNzZXJ0ZWQgYWZ0ZXIgcHJvYmUoKSwg
c3RvcCgpLCBhbmQgc3RhcnQoKSwgSSB0aGluaw0KPiB0aGUgcmVzZXRfY29udHJvbF9yZXNldCgp
IGluIC5yZXN0YXJ0KCkgY2FuIG5vdyBiZSByZW1vdmVkPw0KDQpGb3IgT3ZlcmZsb3cgbWV0aG9k
IHN0aWxsIHdlIG5lZWQgdG8gcmVzZXQgdGhlIG1vZHVsZSwgc28gdGhhdCB3ZSBjYW4gdXBkYXRl
IA0KV0RUU0VUIHJlZ2lzdGVyIHRvIGNoYW5nZSB0aGUgdGltZW91dCB2YWx1ZSBmcm9tIDYwc2Vj
IHRvIDQzLjY5IG1zZWMsIA0Kc28gdGhhdCByZWJvb3QgY2FuIG9jY3VyIGFmdGVyIDQzLjY5IG1z
ZWMgd2hpY2ggY29ycmVzcG9uZHMgdG8gY291bnRlciB2YWx1ZSBvZiAxLg0KDQpZZXMsIGl0IGlz
IHJlbW92ZWQgaW4gIHBhdGNoIzUsIHdoaWNoIHVzZSBGb3JjZSByZXNldCBieSBwYXJpdHkgZXJy
b3INCmluc3RlYWQgb2YgV0RUIG92ZXJmbG93IG1ldGhvZC4NCg0KUmVnYXJkcywNCkJpanUNCg0K
DQo+IA0KPiA+DQo+ID4gICAgICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+IEBAIC0yMDQsNyAr
MjAzLDEwIEBAIHN0YXRpYyBpbnQgcnpnMmxfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UNCj4gKnBkZXYpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZw
ZGV2LT5kZXYsIFBUUl9FUlIocHJpdi0+cnN0YyksDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gZ2V0IGNwZyByZXNldCIpOw0KPiA+DQo+ID4gLSAg
ICAgICByZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdGMpOw0KPiA+ICsgICAgICAgcmV0
ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChwcml2LT5yc3RjKTsNCj4gPiArICAgICAgIGlmIChy
ZXQpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAi
ZmFpbGVkIHRvIGRlYXNzZXJ0Iik7DQo+ID4gKw0KPiA+ICAgICAgICAgcG1fcnVudGltZV9lbmFi
bGUoJnBkZXYtPmRldik7DQo+ID4NCj4gPiAgICAgICAgIHByaXYtPndkZXYuaW5mbyA9ICZyemcy
bF93ZHRfaWRlbnQ7DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9y
Zw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQu
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
