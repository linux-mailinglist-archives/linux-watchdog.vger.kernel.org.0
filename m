Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0B64C6FA1
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Feb 2022 15:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236523AbiB1Ohd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Feb 2022 09:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbiB1Ohb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Feb 2022 09:37:31 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD117ED99;
        Mon, 28 Feb 2022 06:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrVMCoxetr6WnyMW+vCG68a3mnlv54CCvaLbCJBBjIlZEHtDMMBUhxqPMdffh70FACeGOF/Ial6wa18dhPfGsHIDH5w00xD0OYF10g0HvnlTCEW07MHuwWBescOuP78uPcYd0UR2oMvMODVEDc24K4rgUi4tPkYcOU2SyDCoCHqSJZEfz8x8RarrKjdLOgYfhZZfVHfkzpsmghGzs1j0kiXnw/3+x3xMDnDKPArMNde4t2nPPXLrpLrNiMryMPsUTPmGCynq8zTrAmGvZmO1Dgu5ukM20SCIjEngAenJWr70MD56tQCOv/HRIBOT4H7moUK0Be7Z7AuP7pGAmZe3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJycNJ5fUC5JltZo5Xdnuulu7dc7rVOQCkgXqIKj/eU=;
 b=KKAikEvDf7oWv4K7yQ7rpWsYbmqzac2SatrVqCcDL9tDxP+yPepw5hI0mKv8WoEoMd0PbqvLcp9mEHavy65tBhY5aMyzirM4u2rVTniiaaX91iC5MM7v5bZi1m2ye2yxHmaF924Dr0jzrdiG62gX1iBrh5oLPY8VNwtgAvReEmb0gN0+rL3375xmk6gBnzeG5L1dJr3kC+WJsjn4UZsCxJ2Rhzz46IXy4ej+ddsH7x6KWOOXBI6Uc6QLfX36WmRm/ZAa19K0GehctBJbQmaMbBjX6984h3j87cC/lMLDU78LwbRO9G1my+zfHSz2Vkzg9isc8EQYHZ+A0CGrsTujrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJycNJ5fUC5JltZo5Xdnuulu7dc7rVOQCkgXqIKj/eU=;
 b=kywSnrq9tz6NA3Na8+IfnftClR44MEGlRybycwnB7PZRwvJYFyJ09K1+BaHjayNjRiNJSIIzZ+VtvDBVkL0qcTAwBAFzSpgk/6S0MVT0dphLVifdp6JrH5zkrKyLiU1lh9aEt1U5kboen1gAKL1YKHma7jO+EX3xYtKy+k12stM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB4718.jpnprd01.prod.outlook.com (2603:1096:404:12c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Mon, 28 Feb
 2022 14:36:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%6]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 14:36:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 5/7] watchdog: rzg2l_wdt: Add error check for
 reset_control_deassert
Thread-Topic: [PATCH v5 5/7] watchdog: rzg2l_wdt: Add error check for
 reset_control_deassert
Thread-Index: AQHYKnCgn/aQiNTIKUWwJxgk3JutbKyljgmAgAN9tgA=
Date:   Mon, 28 Feb 2022 14:36:47 +0000
Message-ID: <OS0PR01MB5922C2158E28ED56CFFBF16F86019@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <20220225175320.11041-6-biju.das.jz@bp.renesas.com>
 <425f9f1c-2007-a623-c4ba-0b78ce156c81@gmail.com>
In-Reply-To: <425f9f1c-2007-a623-c4ba-0b78ce156c81@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a865e463-222e-49e7-eaaa-08d9fac7c04e
x-ms-traffictypediagnostic: TYAPR01MB4718:EE_
x-microsoft-antispam-prvs: <TYAPR01MB4718060E1646B0475402A1BC86019@TYAPR01MB4718.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: njnLPHMeoIyBKMsupRTPp3t9CC3ZcFtyOjmNj5IPdBE+mmDl9OhDXbaME+yCbDWODUCDWjnD1YrYtJDEiE2IVsn2p08yCTYGtGRO1nQ7BYWf9XI3CPuzOhzlCuVCe7c4LnhHQpDZ0ttvPS2CjG7TvOVOUIuhRwDTbZ/SSb4cwKfWJHFZ80XBye2eM4+ZEnpw4pBy+8bOK8Nxcw9oEsE5X0riF+jqTsxH9qnCWaTo6hm6UAt+VxfOKk8Yn+cTli7jsz1Aq/6JD9kk9k40Dr+HoszYPjOcZSyTrP8uklaEyc7bXiuq4+l6B8jN8ew3R7ZY9Jpn3EYgL2pYVeJv0naJ8Otp/6PJbBhVlo6MxcDf2zRFQfgAZqHQGgMahBbEn6gAxY33DHGfz4FXBii5HRv2KBf41jRL0p08BWoEy1UrNty4UKL/xEo/ZjVG7CsstftbN3Lvfsahstvo+aKDY6YsMZ2ZeWVyxzo9xA4FLJfZkGp4GG6f8IT0Ri5mYZ47RFUEZNTj25fUR2vatt++KJY1SGvMeCQAzqOtquCRly91y8rUx0UJMftP15M8Sj9a4NVpZCIex5Ccdd64un9xb2C0/bE4IRCmaO6QhN/CG9GDvRp8QJmo+Eqn7WVenYZJR4SWI/bpNmU7ANeme+2fGEsyQvfbEYKQDJcDoqGP6WbRoXhK8VkyjTcBLkgXush167zaBV02o4DONhPW8MrRPkWmkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(86362001)(508600001)(53546011)(52536014)(83380400001)(7696005)(71200400001)(8936002)(76116006)(66946007)(6506007)(66556008)(66446008)(33656002)(66476007)(8676002)(4326008)(64756008)(55016003)(110136005)(54906003)(38100700002)(122000001)(9686003)(2906002)(26005)(316002)(186003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTF5U1pCMWh3YU1RUVZaUkhmR3czVFlTOWRuNHcva0FxNzBoZzBBazVyYnMv?=
 =?utf-8?B?MFNrRWg1aEJMZk9OUmFHRTJ3WDlkYW1XMng1dWNiQ0FOTG5TZWFwbkQzcUlu?=
 =?utf-8?B?MlRKNUJOWUZuV1pNWDV4L1R3djJlV05sR0IzdG40SG1UZ2sraFUzL0tRUWpF?=
 =?utf-8?B?V1B2MzNNa3BsVEFXQ2wyNDhkOW1Hb01QRVp1Mk1hOE9pMDJoN3R2WVRQVHE4?=
 =?utf-8?B?NmZlMjBtZWcxRWRzYWxoVmxpdzVxZ1lBeTUrcG5DVTBIMGxwWVpVanpDNjNx?=
 =?utf-8?B?b0RmMGFWcmk3cmhVQk1RS2s0WVJmcmU2VGJKQUVmdjVPOUtTb0ZIOHY4MUxK?=
 =?utf-8?B?OXlWWVVsRUJibVhuS2hhc0xsdUVQZzdQT3ppVHAwaURwajhrMEhpZVZVem13?=
 =?utf-8?B?S2pTOTh5VHVPaUFUK3A0a2VLSitoQlFEanN6VzIvbU5PVHZYZWlBSUdsNHlJ?=
 =?utf-8?B?RGxPc0xBOHN6aGpjL0pSZ3R5MTZscmRJcmpNb2dxd25TQzBhV2NLUU5pdjB3?=
 =?utf-8?B?SWRYakMycDl2bWhHQzdMUlU4SGk3VUd4Sk9yamgxZXVNU3BZZmpwdUJ4aHpT?=
 =?utf-8?B?UzFKYVBSSWNTNFVCcFJyWFdiWDZoNnNsTm5ZYjBWUHBicWpreVhycWk2akM1?=
 =?utf-8?B?M0xVS1ZBbmdQWjBHb2hkTUJkZ25XdU5JSXp1TDFYZFBlOHptU0JIUDdxWUhq?=
 =?utf-8?B?WXpZVDVLWTdqRVhmTVJRS01hNWN4ejVCb09WcDBOdFFmZUIxV1dZaCtYcC9L?=
 =?utf-8?B?VzBQeTVTSDBrYmJoWk04b1dTc2N2MXR1bXhGVzZrZ0xza1pFbkJkSWxOdXI2?=
 =?utf-8?B?Sy9GRnJLOGd1UFdxK2tpR1cxcTgrTXdDSGNrNVB6aGJHcyszS2wzeXBGYkt0?=
 =?utf-8?B?S2FWam5zV1ZmZjFmNGxJNHFwcEZ0eUFJVVdQTk04bDJPVXVnSkczYkx4NXho?=
 =?utf-8?B?T25lZ20vVjZHUmJvRzREOCtqcTNOa3gxY0pheVRMWTgrN0NXMXRYM0U4cnhX?=
 =?utf-8?B?TElpajRnMzBaTHY2L0E1TWsxVm1icXZOMVE2cmlqSk9tQmdzOWxqZVp0YmFO?=
 =?utf-8?B?d2Zxa2x6Vjk1YU83MXIwY3htNHpRTGVTN2JaOUo4cU4wNVRPYk1hN1BxVW1t?=
 =?utf-8?B?S2FFNHlVRGdObVZZTmtITTBUR1FFb1IzSElOOUFDT1k2SjB5cXR5dlVWYUhy?=
 =?utf-8?B?bkRkZkhNRnZNa213WjdYMTRiQWlVVjMvMWYxQ0RYbWZPeFZOUEllanoxMmpo?=
 =?utf-8?B?R0FsOVlwbHdhQ0IwL2ZTUDR0bUt5di92YzEzUHVwTGRSMzg3ZHhrM0x2MWF1?=
 =?utf-8?B?SHlKUmQ4eU9BVmJPNzJSaVJOMDJLY3hNOXFWT3diS29kSjFER25idU9Wb3Zr?=
 =?utf-8?B?MUFZUXI3U05UejMyNHF5aHdUZ2RDNzhQUk9xcFlxeTdyaGQ5WEsvTTRqSnV4?=
 =?utf-8?B?UUNReS9idjRRMW1NeG5mRmk1MG9LUWlTWU5vYXBhZFpUL0ZFSnFmRDZybWpY?=
 =?utf-8?B?QXc3Umc4OHN2eFNnRHNaTTNEd3FqQk9sNU4rOENsMEM4WDhLbEQ4VlFJZlFv?=
 =?utf-8?B?M1kzYVJJdmxZUTZDSU5BVzNIMExZRHpGOEp1bXNqd3k0b3h3anlZQ3paQkxH?=
 =?utf-8?B?M0lueFdVYUNEZi8vdnRHUTVIWUpwcWFMakhyRm8zU3BPRTRwOXkvMWduWkJI?=
 =?utf-8?B?c09CMU43RU9DOFNIZ3p3a3BWc1FOakVHenJZWFRmRDNkQ2V2WG5RRmxNTWgy?=
 =?utf-8?B?L0JHMzdVSkFjS1E1NUU5ZmlyVFNpWDdBMUtVV1VXZFgwSXVjeDlhK0hzeTNV?=
 =?utf-8?B?OGNPSkFKSllRNGpCK2dvcDJkRXJSQUU3SWIzYnplamQ2NTJDMTVXS3Z2ZVg5?=
 =?utf-8?B?RzQ5cUxqRWZSS2d6Q2lHWEc4SEkxU1MyanVLUUFLTVlmVGd1Z3NjQlV6VXZV?=
 =?utf-8?B?azJaRmlWOTBKZjI2RFMza1BBZEVGeG5sRzI1QTFrODY0K1A2S1V3ZHYzcGpF?=
 =?utf-8?B?b05Sc0pRaUp1RnpnNjl4Qm5uSnM5S0p2VlNlQlJRdFZBRW5KbHBlT0pTQkV1?=
 =?utf-8?B?SXdBNkZiRFRvR0NzZjJJa3hXMEs2cHpnZWlzM2xNNThkQVJHblpnbUFHeGta?=
 =?utf-8?B?UWhGNm9IN1QrWUhXenpCaU1HaGdoa0s0TzVWb2d2T3U3Umg3eGtIM0VOdTRp?=
 =?utf-8?B?MzlWT1Rwc2JJd0xzcVkrV3dZVWJiRFRRTXJmTHBySUVaL0dXUTJjdzMyYURP?=
 =?utf-8?B?WE1TOTlHQjRTKzBKUjltVk9iY3hnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a865e463-222e-49e7-eaaa-08d9fac7c04e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 14:36:47.9594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECudEROm+ZOMVKrhVyRCTDijGkiDspnaBCxdphETuIfW2vcldS39BoUKkmFMaBpHQzUV8X4wRJNYf1eZkRweQF9ULI8ZMKMdO2MsSQjjIEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4718
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGVsbG8gU2VyZ2VpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY1IDUvN10gd2F0Y2hkb2c6IHJ6ZzJsX3dkdDogQWRkIGVycm9yIGNoZWNrIGZv
cg0KPiByZXNldF9jb250cm9sX2RlYXNzZXJ0DQo+IA0KPiBIZWxsbyENCj4gDQo+IE9uIDIvMjUv
MjIgODo1MyBQTSwgQmlqdSBEYXMgd3JvdGU6DQo+IA0KPiA+IElmIHJlc2V0X2NvbnRyb2xfZGVh
c3NlcnQoKSBmYWlscywgdGhlbiB3ZSB3b24ndCBiZSBhYmxlIHRvIGFjY2VzcyB0aGUNCj4gPiBk
ZXZpY2UgcmVnaXN0ZXJzLiBUaGVyZWZvcmUgY2hlY2sgdGhlIHJldHVybiBjb2RlIG9mDQo+ID4g
cmVzZXRfY29udHJvbF9kZWFzc2VydCgpIGFuZCBiYWlsb3V0IGluIGNhc2Ugb2YgZXJyb3IuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+IFsuLi5dDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJs
X3dkdC5jDQo+ID4gYi9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jIGluZGV4IDg4Mjc0NzA0
YjI2MC4uNzNiNjY3ZWQzZTk5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvcnpn
Mmxfd2R0LmMNCj4gPiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dkdC5jDQo+ID4gQEAg
LTIwMyw3ICsyMDMsMTAgQEAgc3RhdGljIGludCByemcybF93ZHRfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiAqcGRldikNCj4gPiAgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+
ZGV2LCBQVFJfRVJSKHByaXYtPnJzdGMpLA0KPiA+ICAJCQkJICAgICAiZmFpbGVkIHRvIGdldCBj
cGcgcmVzZXQiKTsNCj4gPg0KPiA+IC0JcmVzZXRfY29udHJvbF9kZWFzc2VydChwcml2LT5yc3Rj
KTsNCj4gPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocHJpdi0+cnN0Yyk7DQo+ID4g
KwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVk
IHRvIGRlYXNzZXJ0Iik7DQo+IA0KPiAgICBEZWFzc2VydCB3aGF0PyA6LSkNCg0KZmFpbGVkIHRv
IGRlYXNzZXJ0IFdEVF9QUkVTRVROIHJlc2V0IHNpZ25hbC4NCg0KQ2hlZXJzLA0KQmlqdQ0K
