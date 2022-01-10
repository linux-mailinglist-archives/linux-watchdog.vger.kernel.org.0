Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FFA489734
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jan 2022 12:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244577AbiAJLTa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jan 2022 06:19:30 -0500
Received: from mail-tycjpn01on2090.outbound.protection.outlook.com ([40.107.114.90]:46214
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244565AbiAJLT0 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jan 2022 06:19:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvy2sez1uh4x170x64SlbtSi6Y25Tm4uY2OP9KRNptf/vlIVK5xXyhv03IXCAMr+BOHUlowXWLyMLcSS6Kw4OU1ISujswqBM0vNeX0KcyMEF8Hvk3nEWZ7Hv21amb9SHLBCtIKBg79q3oqinjlXAGe+RpiGTeO2PD3n09OgSoieGC71BJBt/PVsiTWHfneAHV57JV7AxOLA8plH/jjENT9gvC8tCQ5S7RJLTUIFeOB5UdA6u6hnR5E9apao/F9L0/3qDWqBX5+TUz9Xg0J8lh1a+I92KzN9tuhYb42/FaolcIh9qHI3AfpsPLg4od+cayMgdU8YYNNlT1Q/cOz1csA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NTKX7UMv2yQWka8OD7CwIxfzRSiaRZWiKV+GHxLvlg=;
 b=KRagPh1AiKfHgqkS5YDUmo+sN5An6QU/62s9e9n5++TrWEL0JRb3GeYWUMoi4FnL1S/2DaoatWM9p8x9T5G8KT2tHl8/YZk4bPClfBV8ULv7k5gwCjUNeZCVnlcDrwJv0ONUmpYjs2mS2TGaw3PhnqmRP8GW6Cbxma5fvdDYhMLBV2WNwIDM2/8xWLSBCmsplJePjR2rfdtt5SBCCbrquBANM7UkXOPnXuZviIOtq8/sQ8AhuBag5YoLv9UJKZr01xxjXqOrA3kUAfEL2prB1qDjS5WXhS/DAyczBppoLNLS3pTU6RnIJ7V+OtNn+zQASavNYBYX0Ob/5dZTYp7O7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NTKX7UMv2yQWka8OD7CwIxfzRSiaRZWiKV+GHxLvlg=;
 b=jEPnHs8n+aBlHVCumtr9D0H7p0bLRRv/g6GZnqqjw8dxhUYkoPqf20lTEwZibeZinE6RhRkfyUlp8iacfDPBUnnXX9enfy8nwD3d3KwEVg+E1mMf3h/YZ8Mbl+4IDZ9QW7NEscs+McdL9sKS3LLTUSpNW3dQN2GY60Qc4dJ7/kI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5701.jpnprd01.prod.outlook.com (2603:1096:604:c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 11:19:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 11:19:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/4] watchdog: rzg2l_wdt: Use force reset for WDT reset
Thread-Topic: [PATCH v3 2/4] watchdog: rzg2l_wdt: Use force reset for WDT
 reset
Thread-Index: AQHYAZasG7VKN6y6+EmPKW5g0PPE1qxcDByAgAADT+CAAA8ZAIAAAHiw
Date:   Mon, 10 Jan 2022 11:19:23 +0000
Message-ID: <OS0PR01MB59223922DA668749AE888F0A86509@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220104181249.3174-1-biju.das.jz@bp.renesas.com>
 <20220104181249.3174-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWYQXsiik3z63UX4fXNfOFqGFt4VnkwOzr9mHkPMZiyWA@mail.gmail.com>
 <OS0PR01MB5922F9FAC00C07568D399F6C86509@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdViRF+zNyOTRTu0qAgDG1gSG-VsXXT+SLyJZ7bBHb1Yvg@mail.gmail.com>
In-Reply-To: <CAMuHMdViRF+zNyOTRTu0qAgDG1gSG-VsXXT+SLyJZ7bBHb1Yvg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c85965a8-6885-4ebc-2de8-08d9d42b0e10
x-ms-traffictypediagnostic: OS3PR01MB5701:EE_
x-microsoft-antispam-prvs: <OS3PR01MB5701FEB9E1BC4644A790ECB186509@OS3PR01MB5701.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1XBYb0JDp96lrSDp7COMI7mGonp7AEv+DN21RAkx29RBzCtxds7Wol8J24qU8fqv1JuIppea2iuQIcb18Xh11KgdrHaWdBhpMqZZAZKE6P3l8tSAhL0E7n5iblhL21b/DvKI646XdQVemNWkak6udK4B4WVr5jobE62dNY4EgS7g5Y2bT43lf7pi6FSZgx80RkrEjECi16m6YT6nUOr3m5W3wTUdzUCBGjLovrrjGzqshOaoqGeBNAEqDAgM41Qk5fHVJ+suC2bkjSM+JH3WkVNzj2CkBdoxrPkP7JGMS1tdoQYoFDo2GJeDJfFQ7G7BJEJjO5qJQwSzAC7gWxZ9Y9MvwE4vNad+kQAY2iju3C0cBvI8kG8piyt7DKd/Kt7Lc1EkJZHdSPaqMdwlbNt1lkxCGidaBSzCRCCbUdDnXdDFS3i09ce2EAhg81pNe8bffehdqeRx7ZxzoP7yXDbMEAbXRIWRwfP4MvxIlbU0M4BPGoHNitF0i1Zim0i5oykYEc4poh51jtjf1KSMzlTGaisTuuapiVx6TfboVPnXH9C0dezB4dpCa3Z6QdGUdgacLbt37RNVG9bwB11Xtc/xEFNXbL3voNBuICdyr4YzVT9Dg8ZWW6Nl9RZh2apvknXVbLSZHZnVjP/V7AMilW2eAFmruzszJplqBG3kmkZVem7I2RDXMtjNRsdE5DBeLc/qhFwxzZYcd84oR3pcU5uVyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(66476007)(86362001)(26005)(55016003)(4326008)(66946007)(66556008)(66446008)(8676002)(64756008)(122000001)(38100700002)(76116006)(6506007)(53546011)(6916009)(71200400001)(83380400001)(8936002)(508600001)(186003)(5660300002)(2906002)(9686003)(54906003)(52536014)(33656002)(316002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFdMaGIvY2NhTDJQMU1GckNUVmZkYjhwL3BkRjlMbko4dkRnRzFtR0VOdmFD?=
 =?utf-8?B?aU9aRFI1anJsSUprcmJ2WURlb1g2Z2pTekVoTkZtUFFTNGUyY2haZlRPRjRK?=
 =?utf-8?B?N3Jvb2dtU0t0eDFXU0ViWVFsSFZKVXE3TDBjUlJOd2lnRU1Yazc0UFNkV25S?=
 =?utf-8?B?N2I3WUlwMDV5Z0IxUEh2VmZrQTRXWnN6VXJ0VHE4cWlBbFVQbGhTdTNRT29B?=
 =?utf-8?B?MnRqL0MzZFNNbUh2dXpwSnQwT2xaTHhiRmY0QlExTy9pSUZsWU1OQnZkaXFu?=
 =?utf-8?B?a1NNTEc5M1NpNUFjU3ArOFIvd2NHU1RSQ3lDakR2M09Ibi9PL3AvUkozNjA1?=
 =?utf-8?B?dTlhMXQyckl6d0dPWmh2TDZsb3dkYXpSMG9vZWtzL0M3Zy9yeWd5ZWp5WGFj?=
 =?utf-8?B?TFJhMDAwcmZiSHNGWjVMbUFHSWZrRjlKQWJLUVJQS1FBTU1kWmhuZ3VDK1cv?=
 =?utf-8?B?YmEwZmhsYzZ0MUx0Zk5JU0tTREQ5c01lNDhDeU14ZUNZK1g3dUliUWt5RU9S?=
 =?utf-8?B?Y3ZydEhGRHpRbmhFYXVaQVdqWEVwNEgxN2RUeTYybVFuVG9tVnBzNGY2TGZK?=
 =?utf-8?B?dVJaK281ekxCZWQ2Mml5VWVPWXQ5SVVlQVNxQ1J2dTN3Z2RuNmNvenNVT1d6?=
 =?utf-8?B?OHFWeHcvZDF3aGsyZG90WUxacnFicklmcXN1M3JwTHFUNElPTzNyemxMUHpa?=
 =?utf-8?B?Mzh4SHJHd2tkd3ZJaEV0RTJNb0w4Umh1WmowYnQyWU9rZTF3RWoxWENkZ2Zi?=
 =?utf-8?B?RGtsVGg1Qlo0M0ZvUVNoRGJoT3RpekN4Mm9rVU54Nmp4bkNqN3g5a09xZDd3?=
 =?utf-8?B?WE13R3MyRTgvdEtVV25qUW53bndhdXJXMGV5Q1NTWTRHZnIweXlKak5nZ0hR?=
 =?utf-8?B?UE9QOTFWSS93VkdVNGthU2svbG8zaG10RnRkM05rRlZpSVNJalBvV3lKU2Zt?=
 =?utf-8?B?elFMTmY1MG03VTh3NXgvTVFWRmZkUGd0TG1qWmp4NTVrVnE1MDZRZVJvR1lW?=
 =?utf-8?B?Nm9hUW9iL3JKbm5obk81ZHRWZ2cyWmtyV3g3QjFuYlRuT2h4cHpSSnNvNmhJ?=
 =?utf-8?B?TXp6WDllVWEvM0ZXczhJTlp6U2lRb1R0UzJNSlc4NEVFREE4ejVvbGgzeEZH?=
 =?utf-8?B?MjRZTENhek1YMkl0Q01CT0hNM0V5MnB6SXYzSEd4ayswUHpvZUVLYlJ6ek95?=
 =?utf-8?B?YUpIUFhucElJdFlmWFIwSDg0ZGgvaGVJOEpkMzlHYWpxcmp3SjNzYnovd0NF?=
 =?utf-8?B?Q0ZMZW9TOVZ6dDJXNUlvQWNNVlJpZzFraUIwQzBCeWRnY3FHUmZRcHc1YlJs?=
 =?utf-8?B?bnAzYU9XTlRMMmR0enU4bVRSRi9IR3U1bkdaQ004d0lqbFdSNFV6VnZTT1N1?=
 =?utf-8?B?RjBkMmR1MzBaWjNtRG5tVTBjNWQ5cXZ4eUphN1YxelFPd3RlRk5xNmYyRmVY?=
 =?utf-8?B?dWRnOW1BTHZIRVNWVGZpSzJieEl2VVNJYjBpajE3c1FpZzU3bGVLOXVJVWdZ?=
 =?utf-8?B?NG1ra3dkcEdRckFkckY2dnY3b1ZNUnduSG9OR3J3UHVjN0lkU0w5SnVES1gz?=
 =?utf-8?B?SDNGSUZzNmZSOE85cmdGazc0NWFLYncvNHQ3ZlA5Wmp4NFZuczVMbjYyL2c0?=
 =?utf-8?B?bHkwZDR6eVVhQnpXaTk2RnpEb0hiYnFCM3lJR1h3VCs5YVN1dGp3bzZRNjBV?=
 =?utf-8?B?a1NyeDhDRGVHWVcra1laeXBIeDJmdDF4NkMza0l5YTNqSWxqWEdDd1Vua0Ni?=
 =?utf-8?B?czJGZjBuM2p5cEptZys2a293U3NuTTN0d2xmMHNQZTkybERTMENJck1IYXlm?=
 =?utf-8?B?bHpCdEVLa2NGalhkT0dzeG53cmlMd1hRQkhQMTNDaUlZOXU3djY5R3pyVGFk?=
 =?utf-8?B?Y2o4ZTJFeGltMVVNOEQ0Vnhtd01BcXNPenVmOFR1b2V4c3RwS0tiNGIyd250?=
 =?utf-8?B?RFhWNUYzc1BCU0tacjJwTVUrMnZHSFMyV1J6aVZ3Ly95WGJQTmN5V2tzWmtk?=
 =?utf-8?B?V2xINFhIbGNuU3FKZWIzSHV2TnZkZ0FVaGVVK2tpS1REbksxbFNlU3crWnR5?=
 =?utf-8?B?TkxpNENRbmZvQTFZUlBxTmdJbzZlQzNZVWFEMXVXMEx3WDFtMnQrWUo1ZzI5?=
 =?utf-8?B?a0FRZEFzQWhmQS9zU0YwTzNtT1h6b2ZhaFJQMHlydGhlaHpVTGhIbFFkN29s?=
 =?utf-8?B?c1F2T3FoRFpxcFZITGNRK0lzUW9uMkdSUmFQcXlkL3dtWDM2S1J5WXZWMmp3?=
 =?utf-8?B?b0J2ZXdmalVIamlwZ0xvY0NGcld3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85965a8-6885-4ebc-2de8-08d9d42b0e10
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 11:19:23.3635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lss0ewq1fPyYLliJwm/loAkZ4m8zoCDkmECt9Tyn6vSSnKr8B0sXi970Cgnt8BeIbjonI8AwqlpWisUEPzQWiZNQD33NXetGsjNscLrRYDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5701
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzRdIHdhdGNoZG9nOiByemcy
bF93ZHQ6IFVzZSBmb3JjZSByZXNldCBmb3IgV0RUDQo+IHJlc2V0DQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gTW9uLCBKYW4gMTAsIDIwMjIgYXQgMTE6NTEgQU0gQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgMi80XSB3YXRjaGRvZzogcnpnMmxfd2R0OiBVc2UgZm9yY2UgcmVzZXQgZm9yDQo+ID4gPiBX
RFQgcmVzZXQgT24gVHVlLCBKYW4gNCwgMjAyMiBhdCA3OjEyIFBNIEJpanUgRGFzDQo+ID4gPiA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gVGhpcyBw
YXRjaCB1c2VzIHRoZSBmb3JjZSByZXNldChXRFRSU1RCKSBmb3IgdHJpZ2dlcmluZyBXRFQgcmVz
ZXQNCj4gPiA+ID4gZm9yIHJlc3RhcnQgY2FsbGJhY2suIFRoaXMgbWV0aG9kIGlzIGZhc3RlciBj
b21wYXJlZCB0byB0aGUNCj4gPiA+ID4gb3ZlcmZsb3cgbWV0aG9kIGZvciB0cmlnZ2VyaW5nIHdh
dGNoZG9nIHJlc2V0Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3dh
dGNoZG9nL3J6ZzJsX3dkdC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxf
d2R0LmMNCj4gDQo+ID4gPiA+ICAjZGVmaW5lIFdEVF9ERUZBVUxUX1RJTUVPVVQgICAgICAgICAg
ICA2MFUNCj4gPiA+ID4NCj4gPiA+ID4gQEAgLTExNiwxNSArMTE5LDExIEBAIHN0YXRpYyBpbnQg
cnpnMmxfd2R0X3Jlc3RhcnQoc3RydWN0DQo+ID4gPiA+IHdhdGNoZG9nX2RldmljZSAqd2Rldiwg
IHsNCj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgcnpnMmxfd2R0X3ByaXYgKnByaXYgPSB3YXRjaGRv
Z19nZXRfZHJ2ZGF0YSh3ZGV2KTsNCj4gPiA+ID4NCj4gPiA+ID4gLSAgICAgICAvKiBSZXNldCB0
aGUgbW9kdWxlIGJlZm9yZSB3ZSBtb2RpZnkgYW55IHJlZ2lzdGVyICovDQo+ID4gPiA+IC0gICAg
ICAgcmVzZXRfY29udHJvbF9yZXNldChwcml2LT5yc3RjKTsNCj4gPiA+ID4gLSAgICAgICBwbV9y
dW50aW1lX2dldF9zeW5jKHdkZXYtPnBhcmVudCk7DQo+ID4gPg0KPiA+ID4gV2h5IGFyZSB0aGVz
ZSBubyBsb25nZXIgbmVlZGVkPyBCZWNhdXNlIC5wcm9iZSgpIHRha2VzIGNhcmUgb2YgdGhhdD8N
Cj4gPg0KPiA+IFRoaXMgY29kZSBpcyBhZGRlZCB0byBtb2RpZnkgV0RUU0VUIHJlZ2lzdGVyLg0K
PiA+IE9uY2Ugd2F0Y2hkb2cgaXMgc3RhcnRlZCwgT24gdGhlIGZseSwgd2Ugd29uJ3QgYmUgYWJs
ZSB0byB1cGRhdGUNCj4gPiBXRFRTRVQgcmVnaXN0ZXIuIEJ5IHJlc2V0dGluZyhhc3NlcnQvZGVh
c3NlcnQpIHRoZSBtb2R1bGUgd2UgY2FuDQo+ID4gdXBkYXRlIHRoZSBXRFRTRVQgcmVnaXN0ZXIu
IEl0IHRha2VzIDM0IG1pbGxpc2VjIHRvIHRyaWdnZXIgcmVzZXQuDQo+ID4NCj4gPiBCdXQgd2l0
aCBQRUVOX0ZPUkNFLCBvbiB0aGUgZmx5IHdlIGNhbiB1cGRhdGUgcmVnaXN0ZXIgYW5kIGl0DQo+
IGltbWVkaWF0ZWx5IHRyaWdnZXJzIHJlc2V0Lg0KPiA+DQo+ID4gVGhlbiB3aHkgZG8gLnN0YXJ0
KCkgYW5kIC5zdG9wKCkgaGF2ZQ0KPiA+ID4gcmVzZXQgYW5kIFJ1bnRpbWUgUE0gaGFuZGxpbmcs
IHRvbz8NCj4gPg0KPiA+IC5zdGFydC0+IHR1cm5zIG9uIHRoZSBDbG9ja3MgdXNpbmcgUnVudGlt
ZSBQTS4NCj4gPg0KPiA+IFdlIGNhbm5vdCBVcGRhdGUgV0RUU0VUL1dEVEVOIHJlZ2lzdGVycywg
b25jZSB3YXRjaGRvZyBpcyBzdGFydGVkLg0KPiA+IEFkZGluZyByZXNldCBhbmQgUnVudGltZSBQ
TSBoYW5kbGluZyBpbiAuc3RvcCwgYWxsb3dzIHRvIHN0b3AgdGhlDQo+IHdhdGNoZG9nLg0KPiA+
DQo+ID4gLnN0b3AtPiB0dXJucyBvZmYgdGhlIGNsb2NrIHVzaW5nIFJ1bnRpbWUgUE0gYW5kIGRv
ZXMgdGhlDQo+IHJlc2V0KGFzc2VydC9kZWFzc2VydCkgb2YgdGhlIG1vZHVsZQ0KPiA+ICAgICAg
ICAgaW4gb3JkZXIgdG8gbW9kaWZ5IFdEVFNFVC9XRFRFTiByZWdpc3RlcnMgYWZ0ZXIgc3RvcCBv
cGVyYXRpb24uDQo+ID4NCj4gPiBNYXkgYmUgSSBzaG91bGQga2VlcCBwbV9ydW50aW1lX2dldF9z
eW5jKHdkZXYtPnBhcmVudCkgaW4gcmVzdGFydA0KPiA+IGNhbGxiYWNrLCBUbyB0dXJuIG9uIHRo
ZSBjbG9ja3MsIElmIHNvbWVvbmUgY2FsbHMgc3RvcCBmb2xsb3dlZCBieQ0KPiA+IHJlc3RhcnQN
Cj4gDQo+IEknbSBzdGlsbCBjb25mdXNlZDogLnByb2JlKCkgdHVybnMgdGhlIGNsb2NrIG9uIHRo
cm91Z2ggUnVudGltZSBQTSwgc28NCj4gaXQncyBhbHdheXMgcnVubmluZy4gIENhbGxpbmcgLnN0
YXJ0KCkgbWVyZWx5IGluY3JlYXNlcyB0aGUgdXNhZ2UgY291bnQsDQo+IGFuZCBhIHN1YnNlcXVl
bnQgLnN0b3AoKSB3aWxsIGRlY3JlYXNlIGl0IGFnYWluLiAgQnV0IHRoZSBjbG9jayBrZWVwcyBv
bg0KPiBydW5uaW5nPyBXaGF0IGFtIEkgbWlzc2luZz8NCg0KU29ycnkgZm9yIHRoZSBjb25mdXNp
b24uIE9uIHRoZSBuZXh0IHBhdGNoICMzLCBJIGFtIHJlbW92aW5nIGNsb2NrIG9uIHRocm91Z2gg
UnVudGltZSBQTSBmcm9tIHByb2JlLA0KSW4gb3JkZXIgdG8gZ2V0IGJhbGFuY2VkIFBNIHVzYWdl
IGNvdW50IHdpdGggc3RhcnQvc3RvcCBvcGVyYXRpb24uDQoNClNvIGFmdGVyIHBhdGNoIzMsIC5z
dGFydCgpIHR1cm5zIG9uIHRoZSBjbG9jayBhbmQgLnN0b3AoKSB0dXJucyBvZmYgdGhlIGNsb2Nr
Lg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo=
