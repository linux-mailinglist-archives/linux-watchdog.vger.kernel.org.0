Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2955F46C1C0
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Dec 2021 18:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbhLGRdt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Dec 2021 12:33:49 -0500
Received: from mail-tycjpn01on2137.outbound.protection.outlook.com ([40.107.114.137]:26594
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229919AbhLGRds (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Dec 2021 12:33:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCRRoy0FKXZp9km1heDjn2SNCTqJKbAkgdjO7LYfALH8a8qF/sU5eXPplAbl+c+I2xxFwwmNnb+dnk1Uqg0UhiF0qa5xW9UYOmjCGQME3u0rWh2wNRV3pV+H1yoMvBwk0T1zhla7hFpzFjZlwjcDAKhlGdRMuKMmG/QkCv+useArg/3zrI549MCCNL5tU24zr8Y81aVMevTCEiaPnkvIooG+i3Drye72uf8WkgNq+hxsWDxIxSgRPIYMtAjXOI8IEtB+xQDOW8ogdBmVYhseiZArDkoqNboPnTtBeLLz8DtS0tWqeC1n00kBIbO7fo/VQ1kk8tlheH6Rd/a13W68Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyvCQPBnqJ2GnVFoGnO1WC7p9i7wy1nF1Al5413Rzfk=;
 b=UXgMriF2oC0HSmN2Bqly1WNtmAWzvSYELP710broj/ftLjERUmtioXMytGmO835lyKXSqD61N5jj1hdUzlhqNrJg8y8r0S0KLzo/be27QeRArAQJt+D2bwRTPzMDWX9v7tFMJgUJWUVu/zXmz9hgcmvceIGR6pn6Mn8X+ybaQQzpRavh/vFOl+TxCA8Crs934VmGN5ahxVTlzfp0lYguV6yNClBL9h11mBi49P+Oie3LcVo9Hmem8yPZU/I26e+OcVs2M4comt4okIORpUk3co877OSXTUnZILC6TaY1CsfALY1A9nzN3VKLEmx1G/mwOJL7e1XGxPblzD41ShTjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyvCQPBnqJ2GnVFoGnO1WC7p9i7wy1nF1Al5413Rzfk=;
 b=pN+uWuJqumIgIx/5ZUWxvkEAbfUyPOXWvaNPXBDhb1eB1JIsafqzsbhnSc7swz8qu1wTFPMe4CoCp/k2HmPeI1HAcIMQXe8Fulw4xCbhWDytrfbCesLRJf+/EYRqVFnMaemc10/dJkmMmsX/5HKb3TvUTzfzO+HYf2mYKqUtpp8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6488.jpnprd01.prod.outlook.com (2603:1096:604:e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Tue, 7 Dec
 2021 17:30:15 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 17:30:15 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 0/2] Add WDT driver for RZ/G2L
Thread-Topic: [PATCH v5 0/2] Add WDT driver for RZ/G2L
Thread-Index: AQHX5iQHYyCQzOYY50q0akJw+QU7QawnPDYwgAAVVgCAAAIAwA==
Date:   Tue, 7 Dec 2021 17:30:15 +0000
Message-ID: <OS0PR01MB5922C0FE8BDB87304CE09F32866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211130195357.18626-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922D81A09F4B51C771FE6D5866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cea6840b-31a8-d02c-19fc-9964f4d0be5b@roeck-us.net>
In-Reply-To: <cea6840b-31a8-d02c-19fc-9964f4d0be5b@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b125fe1-ead4-42cc-458d-08d9b9a73b22
x-ms-traffictypediagnostic: OS3PR01MB6488:EE_
x-microsoft-antispam-prvs: <OS3PR01MB6488D1E21E576547054FDD5B866E9@OS3PR01MB6488.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mG1YLZM7T7S1zDz+Ynqf18o/WPwY5sOpz52CXVSXGz3FN+xEa7eZQBPZdItExhX6II+zN6WOCln72EVYuaeFz18chzzs/RHocFkj7QGElWdEXtznI6Ug5rZai3/QUujt6cGkkfda6MioU4pSQYXhOIJGT0khxTgpA75TD42HyxtLr+1qOCfsGZNdgVdkJJ5eXD2ed8jlVXwPBEsK2k783Vdfh7AOEGSTq+r5jvWAlwFDQpk7W2JKlNG3VBa3cmjprhApuBqiC8J6M1pPmw3Ec8ySKIgrRCEoC1fKcj2eFfmr7KhX1SQJz637N7mxJcvK0V0aF1CFuqiVkn5nBZACTFy+kkH9cVLSpQUV19DQLEN15q3sHN66tFtm4l4PZR7am1zBakxpykSmsExeJDmejs2+M+BzJ9qp8nfx6Fj6r8dL7UqrTOBjXT4j5Q0GBwZrrHL25X9yrYrXGWrNzZ8WfTfmw8DMqLyUlVeZSBAHoziba/4Q4bCxMk5lTDa+P8u5atGwKX1UveC10i12t3TmovLBv92wSaejoKxR/6SxoS+kTKvfVrboicq7GfxvoeQOME2DJ3V8rB2y0su7gOUK66E1hfTpYgfrSXbJP6oeUCE4ZX7Ox6WQrFeNnPLamWyNY3EZZvdCSQTnS7XvHtft9nXBYCf+y0FNC2hHgTYz/G+puks6oyYKER5wiEN6KcMIW18kV5I9aNaaufCJtZu2Rw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016003)(38070700005)(4326008)(86362001)(83380400001)(38100700002)(122000001)(9686003)(8676002)(33656002)(2906002)(53546011)(66446008)(316002)(54906003)(110136005)(7696005)(8936002)(66946007)(71200400001)(52536014)(66476007)(66556008)(64756008)(5660300002)(186003)(26005)(76116006)(508600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnRzeUZIWWZqT21MRXhtcUZJc0tuZDJqRmIveDN0dzVYMHNXTW9PcUg2SGFu?=
 =?utf-8?B?eGd4cEtnZDNGQVRPSzg2RXdPWDZpTVhwRlc5ak5ZbnU5Z2xpaDlqUW43NHRz?=
 =?utf-8?B?elpNd2ExYlg5ZSt4OGl5enNhVHVha2JpcEI0cWJCdkoweEFRR0pLMnlkSUZm?=
 =?utf-8?B?NU1jMTRxdzdkbzI2dnptbWlVNk5GYUwvcXVyVzB5VFVGYWt5ekdXdVY0SXlh?=
 =?utf-8?B?cDFTQUQ0M1dicU1uOVZPSEhXK2tEOVlkQTZabmV3TE8vd1U3YmFCNkRxaWlr?=
 =?utf-8?B?L25WTFNOeGdkaEFSWXVKUCt0V0lBSDNqdFBNaklJaVg2MUNhbzUyYjcrMTBv?=
 =?utf-8?B?VjArcFRrbFJDNnMzb091WExxdjRsSzgxNUxvdDBUR0wraXJyRzBKemVNRHd3?=
 =?utf-8?B?dnFjNisxNFdmbWcrSUxueVFBKzY2dXFkbFhKenVtUVV5VTJ4SEgvWnZ6YWNi?=
 =?utf-8?B?Uy9HSmNUdmpnUkUrbzFEdmxGODFKZVlPRHBuR2tDNHVwWGQrTnRuQzQ4N1hh?=
 =?utf-8?B?aGJVTms1V2lheEJzd3BhZ0g3eE9rdmY3NmNBK1VhZFU2cDBtem5SQU1YVTh2?=
 =?utf-8?B?cnNEeC9IdUFZc3RQYWlNU25JNnVDbGd4d0QzSVBzeG5MZHJkeFdFejNyc0ov?=
 =?utf-8?B?R1JiYnl3RXNJMXNucU5nL2thUjJhWVBCUjY1Vk9xaTZRZGhDUWJiQ3RmQ1Qv?=
 =?utf-8?B?ZlhBVUNxa09sNHg1cVVDajVhSEhCS0tiQUYzdW05dHVYZ3NLb083ZU9NbmtO?=
 =?utf-8?B?cWkwYkJBZ1MzOUYzc0hLZ1RsQVFGTHA3NlpIOE5ialJoZXRjL2dRN2Z1elpT?=
 =?utf-8?B?ZW1wVlRKUGVPdGt2Q3F3VldETnkrNm9GajJMQVpMay9lOVdPRlZBb0VEMGFu?=
 =?utf-8?B?ZjRVb1VLMUxtVGhiVURaL2F1Nm5PNHNDYmhwaVlEcDN1WlRIZnNUV1NqaU1M?=
 =?utf-8?B?SWFuRTlUOGpTcEg5K1UxbXE3MTZ2d3FsTmVyNC9IaVBlRnlBcTNRTFVwSlEr?=
 =?utf-8?B?ZWdjbFVGU3RFcVFtdUpBMTFSaXdLU1oxNXZpNVRIRjhDSzdqZVlMcU5ERzJo?=
 =?utf-8?B?Wm9MVDI3R0RCUmw2WEk5STZvVXplWnhtQm1VNEIxTVBrK2pOUWpLNW5ORWNt?=
 =?utf-8?B?NEEvKytub0FWRmYwQTNXNDdoTlREWEEycDM3WkpseWkzN2NOS1luVWJqZVRQ?=
 =?utf-8?B?dVVHa0dGeDBzQUNJQTRjMUc5dmh0RUs0RHRXZlQ2UnJJWGhob3dBUWt1RlFa?=
 =?utf-8?B?eDFvN1V2dTBqTm16ZUxqenFOcDdZUHBGRnlLdk1UQ3JMbk1tZ3pHRWhwYkNl?=
 =?utf-8?B?ZTJoUXpOQ2lRczR1Qkg3L3ZxOERwRVoySHdhUmQyTC9uL1JrUUd3T3FFeEJW?=
 =?utf-8?B?NjJJWkl2bW50dUsvaUlHeEFIZkM1V3dUQkdDUy9tMGJ6cVZBaGNXMGtkYm81?=
 =?utf-8?B?UGFPbVRyZkM5V1Z6SERZNGd5bnFVcEl5Q00wK0tIbHlrZHZvbEtqMW8wM2Rx?=
 =?utf-8?B?YUt0YXdrQzJQMW9ySlJPdnZYckF0UkJhMTZrOUlhdm0xOGxieE1CaTRDV3lT?=
 =?utf-8?B?RisrR0FHNXl5c3hRb0ZydUJmci9MNlZGcmtBeGk5YVFzb1A5azk0WmN3Y3JD?=
 =?utf-8?B?a2VqS3hFK0hSQUI2ZmV1OXIrRVN2WXJ1bU44T2VOK2dEZG02bjl6MmNJS21B?=
 =?utf-8?B?ZTNYdkxLK3gwWmJNRUgyYjBITW1KQzJrb0lLYWQ3R2VtSFJUN2tBTzhLVGMy?=
 =?utf-8?B?TkpibFBLbGJXVktVYnpiaE1hWE0rakhHWjNoTnNaVXpBYjRwbUp4a1k0MGNV?=
 =?utf-8?B?b2twUVhqQWFUZFpyeXFieWI3VW56L3BOM0JPVXUvMVpWYXhoM1BiUHpYYzMv?=
 =?utf-8?B?eExvM3pBMkhKZll1cU1USFhORThaWXBTWDJZMkZ1TzV2T2VZaDgvM09ldkdE?=
 =?utf-8?B?MEFhN0hvL3lKNTRBbkRRbmRwYkI2czJMTStxTEVFc1lIMitNTGY0NUtWcThn?=
 =?utf-8?B?MU1uNlViVDFIZlFCTGZCR3pKN3BVbG1tTjd3T1V3MEN4alp0SmJ2MmNHYy9k?=
 =?utf-8?B?VGRLelY5OTRoamVJU2xRNHdUSExkTjhEQTEvOG9MTEtGT2JIWWNsNHQxaE1B?=
 =?utf-8?B?QTQ5VEY5My9LVU8xVStzV0xkZWR4bmpKeDZZMVJCR21aeWFqdHlOaVQ1eFpM?=
 =?utf-8?B?YUpqY1BQbThoM2xtVFovYnZMT05oWXp0eWFneWNyVnJwUUdMQlhINzNiZkth?=
 =?utf-8?B?N25pVU5iQ0cwa3dveDRGVkJvY0d3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b125fe1-ead4-42cc-458d-08d9b9a73b22
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 17:30:15.0592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +icxjJj730dChM0vbuIDedkGaci00znVVLXy/GNfYCPjv/ik5xEn0mi+my5Lc28MdXnWCgRFWBaVX7kcxoHiNbgce8M9523tVDBnP943GC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6488
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAvMl0gQWRkIFdEVCBkcml2ZXIgZm9yIFJaL0cyTA0K
PiANCj4gT24gMTIvNy8yMSA4OjA3IEFNLCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBBbGwsDQo+
ID4NCj4gPiBHZW50bGUgcGluZy4NCj4gPg0KPiA+IEFyZSB3ZSBoYXBweSB3aXRoIHRoaXMgcGF0
Y2ggc2VyaWVzPyBQbGVhc2UgbGV0IG1lIGtub3cuDQo+ID4NCj4gDQo+IEkgdGhpbmsgc28uIFlv
dSByZXRhaW5lZCBteSBSZXZpZXdlZC1ieTogdGFnLCBzbyBJIGRpZCBub3Qgc2VlIGEgbmVlZCB0
bw0KPiByZXBseSAoYWdhaW4pLg0KDQpUaGFuayB5b3UuDQoNCkNoZWVycywNCkJpanUNCg0KPiA+
DQo+ID4NCj4gPj4gU3ViamVjdDogW1BBVENIIHY1IDAvMl0gQWRkIFdEVCBkcml2ZXIgZm9yIFJa
L0cyTA0KPiA+Pg0KPiA+PiBUaGlzIHBhdGNoIHNlcmllcyBhaW1zIHRvIGFkZCBXRFQgZHJpdmVy
IHN1cHBvcnQgZm9yIFJaL0cyTCBTb0Mncy4NCj4gPj4NCj4gPj4gV0RUIGhhcyAzIGNoYW5uZWxz
DQo+ID4+IDEpIENIMCB0byBjaGVjayB0aGUgb3BlcmF0aW9uIG9mIENvcnRleC1BNTUtQ1BVIENv
cmUwDQo+ID4+IDIpIENIMSB0byBjaGVjayB0aGUgb3BlcmF0aW9uIG9mIENvcnRleC1BNTUtQ1BV
IENvcmUxDQo+ID4+IDMpIENIMiB0byBjaGVjayB0aGUgb3BlcmF0aW9uIG9mIENvcnRleC1NMzMg
Q1BVDQo+ID4+DQo+ID4+IFdEVCBJUCBzdXBwb3J0cw0KPiA+PiAxKSBOb3JtYWwgV2F0Y2hkb2cg
VGltZXIgRnVuY3Rpb24NCj4gPj4gMikgUmVzZXQgUmVxdWVzdCBGdW5jdGlvbiBkdWUgdG8gQ1BV
IFBhcml0eSBFcnJvcg0KPiA+Pg0KPiA+PiBPbmNlIHRoZSBzb2Z0d2FyZSBhY3RpdmF0ZXMgdGhl
IHdhdGNoZG9nIHRpbWVyLCB0aGUgd2F0Y2hkb2cgdGltZXINCj4gPj4gZG9lcyBub3Qgc3RvcCB1
bnRpbCBpdCBpcyByZXNldC4NCj4gPj4NCj4gPj4gQ3VycmVudCBkcml2ZXIgc3VwcG9ydHMgTm9y
bWFsIFdhdGNoZG9nIFRpbWVyIGJhc2ljIGZ1bmN0aW9uYWxpdHkuDQo+ID4+DQo+ID4+IFRlc3Rl
ZCBXRFQgZHJpdmVyIHdpdGggc2VsZnRlc3RzIHRvb2wgYW5kIHJlYm9vdCBjb21tYW5kDQo+ID4+
DQo+ID4+IEFsbCAzIGNoYW5uZWxzIHRlc3RlZCB3aXRoIGJlbG93IGNvbW1hbmQuDQo+ID4+DQo+
ID4+IGNhdCAvZGV2L3dhdGNoZG9nICAmIGZvciBpIGluIHsxLi42MH07IGRvIHNsZWVwIDE7IGVj
aG8gJGk7IGRldm1lbTINCj4gPj4gMHgxMjgwMDgwODsgZG9uZSBjYXQgL2Rldi93YXRjaGRvZzEg
ICYgZm9yIGkgaW4gezEuLjYwfTsgZG8gc2xlZXAgMTsNCj4gPj4gZWNobyAkaTsgZGV2bWVtMiAw
eDEyODAwYzA4OyBkb25lIGNhdCAvZGV2L3dhdGNoZG9nMiAmIGZvciBpIGluDQo+ID4+IHsxLi42
MH07IGRvIHNsZWVwIDE7IGVjaG8gJGk7IGRldm1lbTIgMHgxMjgwMDQwODsgZG9uZQ0KPiA+Pg0K
PiA+PiB2NC0+djU6DQo+ID4+ICAgKiBTdGFydGVkIHVzaW5nIHRoZSBtYWNyb3MgTUlDUk8gYW5k
IFVTRUNfUEVSX1NFQw0KPiA+PiAgICogUmVuYW1lZCByemcybF93ZHRfZ2V0X2N5Y2xlX21zZWMo
KSB0byByemcybF93ZHRfZ2V0X2N5Y2xlX3VzZWMoKQ0KPiA+PiAgICogRml4ZWQgdGhlIHZhbHVl
IG9mIHByaXYtPndkZXYubWF4X3RpbWVvdXQgaW4gc2Vjb25kcy4NCj4gPj4gVjMtPlY0Og0KPiA+
PiAgICogRml4ZWQgdGhlIGJ1aWxkIGlzc3VlIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90
DQo+ID4+IFYyLT5WMzoNCj4gPj4gICAqIEFkZGVkIFJiIHRhZyBmcm9tIEd1ZW50ZXIgUm9lY2sN
Cj4gPj4gICAqIFJlbW92ZWQgUmVtb3ZlZCBwYXRjaCMxLCBhcyB0aGUgY2xvY2sgY2hhbmdlcyBy
ZWxhdGVkIHRvIFdEVA0KPiA+PiByZXNldCBzZWxlY3Rpb24NCj4gPj4gICAgIHdpbGwgYmUgaGFu
ZGxlZCBpbiBURi1BLg0KPiA+PiBWMS0+VjI6DQo+ID4+ICAgKiBzdGFydGVkIHVzaW5nIGNsa19n
ZXQvcHV0IGluc3RlYWQgb2YgZGV2bV9jbGtfZ2V0L3B1dA0KPiA+PiAgICogTW92ZWQgZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0IGFmdGVyIHNldF9kcnZkYXRhKCkgYW5kDQo+ID4+ICAgKiByZW1v
dmVkIHJlZHVuZGFudCBhY3Rpb24gb24gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgZmFpbHVy
ZS4NCj4gPj4gUkZDLT5WMQ0KPiA+PiAgICogUmVtb3ZlZCBwYXRjaCMzLCB0aGUgY2xrIHBhdGNo
IGlzIHF1ZXVlZCBmb3IgNS4xNw0KPiA+PiAgICogQWRkZWQgY2xvY2stbmFtZXMgYW5kIGludGVy
cnVwdC1uYW1lcyBhcyByZXF1aXJlZCBwcm9wZXJ0aWVzIGZvcg0KPiBSWi9HMkwNCj4gPj4gICAq
IFJlLW9yZGVyIGNsb2NrbmFtZXMgd2l0aCBpbnRlcm5hbCBtb2R1bGUgY2xvY2sgZmlyc3QNCj4g
Pj4gICAqIFJlbW92ZWQgcGNsa19yYXRlIGZyb20gcHJpdi4NCj4gPj4gICAqIHJ6ZzJsX3dkdF93
cml0ZSgpIHJldHVybnMgdm9pZCBhbmQgUmVtb3ZlZCB0aWVtb3V0IHJlbGF0ZWQgdG8NCj4gPj4g
cmVnaXN0ZXIgdXBkYXRlDQo+ID4+ICAgKiByemcybF93ZHRfaW5pdF90aW1lb3V0KCkgcmV0dXJu
cyB2b2lkIGFuZCByZW1vdmVkIGRlbGF5cy4NCj4gPj4gICAqIHJlbW92ZWQgc2V0X2JpdChXRE9H
X0hXX1JVTk5JTkcsLi4pIGFzIHdlIGNhbiBzdG9wIHdhdGNoZG9nDQo+ID4+ICAgKiByZW5hbWVk
IHJlc2V0X2Fzc2VydF9jbG9ja19kaXNhYmxlLT5yZXNldF9hc3NlcnRfcG1fZGlzYWJsZV9wdXQN
Cj4gPj4gICAqIHN0YXJ0ZWQgdXNpbmcgZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUo
KQ0KPiA+PiAgICogcmVtb3ZlZCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KSBhcyB0
aGVyZSBpcyBubyB1c2VyDQo+ID4+ICAgKiByZW1vdmVkIHdhdGNoZG9nX3NldF9yZXN0YXJ0X3By
aW9yaXR5KCZwcml2LT53ZGV2LCAwKSBhcyAwIGlzIHRoZQ0KPiA+PiBkZWZhdWx0Lg0KPiA+PiAg
ICogcmVtb3ZlZCByZW1vdmUgY2FsbGJhY2sgYXMgaXQgaXMgZW1wdHkuDQo+ID4+DQo+ID4+IEJp
anUgRGFzICgyKToNCj4gPj4gICAgZHQtYmluZGluZ3M6IHdhdGNoZG9nOiByZW5lc2FzLHdkdDog
QWRkIHN1cHBvcnQgZm9yIFJaL0cyTA0KPiA+PiAgICB3YXRjaGRvZzogQWRkIFdhdGNoZG9nIFRp
bWVyIGRyaXZlciBmb3IgUlovRzJMDQo+ID4+DQo+ID4+ICAgLi4uL2JpbmRpbmdzL3dhdGNoZG9n
L3JlbmVzYXMsd2R0LnlhbWwgICAgICAgIHwgIDc1ICsrKy0tDQo+ID4+ICAgZHJpdmVycy93YXRj
aGRvZy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsNCj4gPj4gICBkcml2ZXJz
L3dhdGNoZG9nL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+PiAgIGRy
aXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMgICAgICAgICAgICAgICAgICB8IDI2Mw0KPiArKysr
KysrKysrKysrKysrKysNCj4gPj4gICA0IGZpbGVzIGNoYW5nZWQsIDMyOSBpbnNlcnRpb25zKCsp
LCAxOCBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4+IDEwMDY0NCBkcml2ZXJzL3dhdGNo
ZG9nL3J6ZzJsX3dkdC5jDQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuMTcuMQ0KPiA+DQoNCg==
