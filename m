Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D7A2CBE5E
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Dec 2020 14:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgLBNdH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Dec 2020 08:33:07 -0500
Received: from mail-eopbgr150048.outbound.protection.outlook.com ([40.107.15.48]:19156
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725920AbgLBNdG (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Dec 2020 08:33:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbkIvHuWfGWsZfD90LovojZMjb0DDz+Cs3rwmelr/jrEZRpwB43+85uhed1Kg5L9NkbXnStby1Gle3p3rf4bauSAXuAcNcihLle8WT0e8tIpeapUmy/VERW0Tz8OzHyvZPuuykdNLUKgI4MLw/TEPgh/dMjPE3nA1pegi1wGYFZcRqk1laXfrUXQNT1blvQuLq+1Dr8ZuHFd1Kq5jcXbc2C4i83nPhnI0mg4pYI1nb/T1d6QpGo/kTNa2iR5vmcHgtZjLe14Uq/B2924fyvLfTWyRxYbw1hAcJ5E7CG5xp+y41hc34LAP6sgI17VvBOCsNSvgYsDBFKE35bWSfU+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1uJr9URLXXLlnKhosLICfNuM+6nZCYoWjvKOWJER/g=;
 b=d++ZTycJpMGLv3LM07V9ceGSrc5vEzEgEOnrCCS5hsQkNIb1riMdA9dzKXOjuD007u40wACjT9z4GvWeRRTfhllbwVLH5WGhIvBXAnLN+8eT6uzkmw+xp8SGTcgm9JXJY7O4pkeszrQc+qDkD7dhPyyw5LhnPuhC1X7p1XtLJ+F6SB/GDK0R5L0EoMB3aIJiDWiGddOtqU+XQZlw7LFg7uEfqzghJaIhoNDeGY2pafxL5agem0pgMDykQeyI+bynpSdw9J3q8zUdq3WL6Jkkwyx+xThjyzVFS48fu7bC9uV2VlA1FrGt5dyJDT4evPnkmqkmlpIe5bwWe6k+Pj8IBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1uJr9URLXXLlnKhosLICfNuM+6nZCYoWjvKOWJER/g=;
 b=J+BICf/1sYJ0ubJX0la37s3NC03fgLPB8tOAMKA1tH7xgBE91pGBcrTHIOzNQegHGY1O165mhoG6B37WqbY6ChOY8EoHGWaFCNpxn8t4foAMAVBtBRjy9pVF6h2r1dpyYacmyKOdbgJj8YhL30SQJRGEoYuobrSvzXBw/VtiJkM=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3163.eurprd03.prod.outlook.com (2603:10a6:7:5e::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.22; Wed, 2 Dec 2020 13:32:15 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 13:32:15 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWwWDHZJglj3cu602g/c6U2v2JcanbrP0AgAAT74CACBGsgIAACbeA
Date:   Wed, 2 Dec 2020 13:32:14 +0000
Message-ID: <3bab8bd8c69a878f849a07dd9ea35bfac2006da2.camel@fi.rohmeurope.com>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
         <20201127083242.GK2455276@dell>
         <6bd4abcb340bdf764fd23b685684d3f984319ed7.camel@fi.rohmeurope.com>
         <20201202125723.GK4801@dell>
In-Reply-To: <20201202125723.GK4801@dell>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec3e75b6-f31e-40f2-942d-08d896c6aeb4
x-ms-traffictypediagnostic: HE1PR03MB3163:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB3163D1D9C2EADADB3E6127CAADF30@HE1PR03MB3163.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dJG5CYIf0xCSsLNyiXINX6Wi4XL+IzqACoVbw6oiKIPz1JpZ5B7bbN9JJLWbtjoQ8LLJxS5zSfxSsUobx9a4YGJNs0cbYb1H6DhJWevijTYPH6SG3Znm3t//IUHgm87taqGeerRNDnmwmrnW/o5YNFopiEs9noz7mb2zJ9kFC7xVCl5IPNCKcEkT+hsPZFkIVX3Bxt5aZg7oqEnCTDbVohN8ti4et3HnVyBTH0VT6mCugpSlGouJJh/TNhlmw5hmP+5wzEUeBUZo0Ke+mtnIyUOEt8HHyHl35frAOhXD0J1QiWODtfxWVxA0UzyQxBh/QW02Tux9JNf+N8bHEVhnoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(366004)(2906002)(3450700001)(186003)(83380400001)(86362001)(66946007)(2616005)(66446008)(26005)(6506007)(4326008)(66476007)(5660300002)(4001150100001)(66556008)(76116006)(64756008)(6486002)(6512007)(478600001)(71200400001)(8676002)(316002)(6916009)(8936002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?anBLRnBQMHdQbDBMKzNzMS9HT1NNc0VHeHd3Sm1CWjYrZDBCOVY4UEx4ZFM0?=
 =?utf-8?B?L2lzbWRPQ3VGYjk2QkxVdzJWQnhJdWF3N2ZmRGxTSTB1K1BBZlhJWEJEOU9n?=
 =?utf-8?B?cTM0cEpOcTdFMVY2Mjl6bnRUT1ZmTklzamlNT21iVTAzd05tcTRwTGt1Y1JL?=
 =?utf-8?B?RHpoWnhXclVpeUpIajh3bk9oTWpKd1dHWmplSXhTWEE0ems4UVg5VERzTHI3?=
 =?utf-8?B?Z1RsZ2VwZzk4WFh3ckNybnBaek5qNkNZYndUenZRaUlXUFpjL3A2eEYwdy9u?=
 =?utf-8?B?WXBYSXNIYzVZTHVrajdQVFJTczJxRThXNmFxanFVVkVDTW1pSHNHaWI1Vkx2?=
 =?utf-8?B?VkhIT1Z4cDAzS2ZReFhVMUlPYzJFQ1lIc0IvTUNubE5tU0FPeHYzZFI2SmhW?=
 =?utf-8?B?Wmk3MittZE5jUFc2djcxbkxBVzI0U0t5WDZObWJyM3ZwSC8zbW5TdnQ0TDBY?=
 =?utf-8?B?R01yRUlZZWgxYWd2MXN5UkducW1TK1lTc3A4N0FndFNzY2kzcE9xVDN2dlRx?=
 =?utf-8?B?WEdBc2ZIMy9XUVZGckhLMXNFZm9JL2tqUy9Rc2JlME5HT0RkbmtqcENuWHRI?=
 =?utf-8?B?N0xGZTYwSitUWDZ4QmxsVGpOZVBlNlRKVStycm1rZnlTZ3B1WFZNd28wemc3?=
 =?utf-8?B?dG1yNE14S0pXWkdCMzZNZlN0REg3cE9qVGVmbWl2WGFiYTJKcGJiTDU0SlJK?=
 =?utf-8?B?N2lhQUgxNDRxUEovNk8yNUpFL3NRYzdSa0lLS1N2QmdPNjZxbWZ1R0M0dTFC?=
 =?utf-8?B?c1lVQTFBalhMVnFSUmF0UWRWVlJTZ01qUDV2LzVGdnhtZCs5c3o5VzQrOHpV?=
 =?utf-8?B?THoyL0pFWmRPUzFoNWNVa3NZeFYvcE9HZHlvZWlzbElXQWo3NGpMd08yaTJF?=
 =?utf-8?B?L1NiR2RUaDZaRDhKbVBjdWQwZ1JJeVhWSmFONmhiZFI0TzNPK2dadHBPOGk5?=
 =?utf-8?B?Q1FSNU5BT3lVRkJWWkgxckdVWElTd1VwdENQUy9JSVo4TnFSZ0c0T3RkQjli?=
 =?utf-8?B?RGZPS2djMDFhdm5PdUdTZnJtY3doU0luNHNCaWw4RWR1OHVjSzNDSWI4UnEy?=
 =?utf-8?B?YytKMnhncTdBbDErMTVYcWdqZVBGN1NJUkNPZVdxSWp4dFZoYzFyV084dVNY?=
 =?utf-8?B?c0h1MW9ici85dlBtVGxHWE9SYmk0YXdKdHFpSUN6TDdhcVBoSldVRlhwTUNv?=
 =?utf-8?B?RUNTb3RxaHhvY1pOYm02MHhlUEtzU2Z4WEpqaVVJRmhzMmlnRldvaVM0M1Yr?=
 =?utf-8?B?ek91dWhEL1gzYkhVcmdMME9kaFNsbEVLYmtBWXlKQlA0YUhTSGRWVTU5Yktp?=
 =?utf-8?Q?uXcaanBqPHX7Yez2cCQPrFPzpglW2YH0EW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F364C9C88D682F4099F737520E2F4A54@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3e75b6-f31e-40f2-942d-08d896c6aeb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 13:32:15.0476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ebsDyx9YfXYX9AALld3ASvHf4hnpjI+OySaaD35aGFbBokPcgnl/PwPhVbY81Yl0IAnoVEz7EPJC6YG6w7Vu5PY1vSNHcWalS749fquqqTeNF5qZMujXeCguxLLLxYw1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3163
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBXZWQsIDIwMjAtMTItMDIgYXQgMTI6NTcgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gRnJpLCAyNyBOb3YgMjAyMCwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToN
Cj4gDQo+ID4gSGVsbG8gTGVlLA0KPiA+IA0KPiA+IE9uIEZyaSwgMjAyMC0xMS0yNyBhdCAwODoz
MiArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOg0KPiA+ID4gT24gTW9uLCAyMyBOb3YgMjAyMCwgTWF0
dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiA+IEFkZCBjb3JlIHN1cHBvcnQgZm9y
IFJPSE0gQkQ5NTc2TVVGIGFuZCBCRDk1NzNNVUYgUE1JQ3Mgd2hpY2gNCj4gPiA+ID4gYXJlDQo+
ID4gPiA+IG1haW5seSB1c2VkIHRvIHBvd2VyIHRoZSBSLUNhciBzZXJpZXMgcHJvY2Vzc29ycy4N
Cj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8DQo+ID4g
PiA+IG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4g
PiA+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgICAgICB8ICAxMSArKysrDQo+ID4gPiA+
ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArDQo+ID4gPiA+ICBkcml2
ZXJzL21mZC9yb2htLWJkOTU3Ni5jICAgICAgICB8IDEwOA0KPiA+ID4gPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9yb2htLWJkOTU3
eC5oICB8ICA1OSArKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQv
cm9obS1nZW5lcmljLmggfCAgIDIgKw0KPiA+ID4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAxODEgaW5z
ZXJ0aW9ucygrKQ0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL3JvaG0t
YmQ5NTc2LmMNCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9y
b2htLWJkOTU3eC5oDQo+ID4gPiANCj4gPiA+IExvb2tzIGxpa2UgYSBwb3NzaWJsZSBjYW5kaWRh
dGUgZm9yICJzaW1wbGUtbWZkLWkyYyIuDQo+ID4gPiANCj4gPiA+IENvdWxkIHlvdSBsb29rIGlu
dG8gdGhhdCBwbGVhc2U/DQo+ID4gPiANCj4gPiBJIG11c3QgYWRtaXQgSSBkaWRuJ3Qga25vdyBh
Ym91dCAic2ltcGxlLW1mZC1pMmMiLiBHb29kIHRoaW5nIHRvDQo+ID4ga25vdw0KPiA+IHdoZW4g
d29ya2luZyB3aXRoIHNpbXBsZSBkZXZpY2VzIDopIElzIHRoaXMgYSBuZXcgdGhpbmc/DQo+IA0K
PiBZZXMsIGl0J3MgbmV3Lg0KPiANCj4gPiBJIGFtIHVuc3VyZSBJIHVuZGVyc3RhbmQgdGhlIGlk
ZWEgZnVsbHkuIFNob3VsZCB1c2VycyBwdXQgYWxsIHRoZQ0KPiA+IGRpZmZlcmVudCByZWdhbXAg
Y29uZmlncyBpbiB0aGlzIGZpbGUgYW5kIGp1c3QgYWRkIHRoZSBkZXZpY2UgSURzDQo+ID4gd2l0
aA0KPiA+IHBvaW50ZXIgdG8gY29ycmVjdCBjb25maWc/IChCRDk1NzYgYW5kIEJEOTU3MyBuZWVk
IHZvbGF0aWxlDQo+ID4gcmFuZ2VzKS4NCj4gPiBBbHNvLCBkb2VzIHRoaXMgbWVhbiBlYWNoIHN1
Yi1kZXZpY2Ugc2hvdWxkIGhhdmUgb3duIG5vZGUgYW5kIG93bg0KPiA+IGNvbXBhdGlibGUgaW4g
RFQgdG8gZ2V0IGNvcnJlY3RseSBsb2FkIGFuZCBwcm9iZWQ/IEkgZ3Vlc3MgdGhpcw0KPiA+IHdv
dWxkDQo+ID4gbmVlZCBhIGJ1eS1pbiBmcm9tIFJvYiB0b28gdGhlbi4NCj4gDQo+IFlvdSBzaG91
bGQgZGVzY3JpYmUgdGhlIEgvVyBpbiBEVC4NCg0KWWVzLiBBbmQgaXQgaXMgZGVzY3JpYmVkLiBC
dXQgSSd2ZSBvY2Nhc2lvbmFsbHkgcmVjZWl2ZWQgcmVxdWVzdCBmcm9tDQpEVCBndXlzIHRvIGFk
ZCBzb21lIHByb3BlcnRpZXMgZGlyZWN0bHkgdG8gTUZEIG5vZGUgYW5kIG5vdCB0byBhZGQgb3du
DQpzdWItbm9kZS4gVGhpcyBpcyB3aGF0IGlzIGRvbmUgZm9yIGV4YW1wbGUgd2l0aCB0aGUgQkQ3
MTgzNy80NyBjbG9ja3MgLQ0KdGhlcmUgaXMgbm8gb3duIG5vZGUgZm9yIGNsayAtIHRoZSBjbGsg
cHJvcGVydGllcyBhcmUgcGxhY2VkIGRpcmVjdGx5DQppbiBNRkQgbm9kZSAoYXMgd2FzIHJlcXVl
c3RlZCBieSBTdGVwaGVuIGFuZCBSb2IgYmFjayB0aGVuIC0gSQ0Kb3JpZ2luYWxseSBoYWQgb3du
IG5vZGUgZm9yIGNsaykuIEkgcmVhbGx5IGhhdmUgbm8gY2xlYXIgdmlldyBvbiB3aGVuDQp0aGlu
Z3Mgd2FycmFudCBmb3Igb3duIHN1Ym5vZGUgYW5kIHdoZW4gdGhleSBkb24ndCAtIGJ1dCBhcyBm
YXIgYXMgSQ0KY2FuIHNlZSB1c2luZyBzaW1wbGUtbWZkLWkyYyBmb3JjZXMgb25lIHRvIGFsd2F5
cyBoYXZlIGEgc3ViLW5vZGUgLw0KZGV2aWNlLiBFdmVuIGp1c3QgYSBlbXB0eSBub2RlIHdpdGgg
bm90aGluZyBidXQgdGhlIGNvbXBhdGlibGUgZXZlbiBpZg0KZGV2aWNlIGRvZXMgbm90IG5lZWQg
c3R1ZmYgZnJvbSBEVD8gQW55d2F5cywgSSB0aGluayB0aGlzIGlzIG5pY2UNCmFkZGl0aW9uIGZv
ciBzaW1wbGUgZHJpdmVycy4NCg0KPiA+IEJ5IHRoZSB3YXkgLSBmb3IgdW5lZHVjYXRlZCBleWVz
IGxpa2UgbWluZSB0aGlzIGRvZXMgbm90IGxvb2sgbGlrZQ0KPiA+IGl0DQo+ID4gaGFzIG11Y2gg
dG8gZG8gd2l0aCBNRkQgYXMgYSBkZXZpY2UgLSBoZXJlIE1GRCByZW1pbmRzIG1lIG9mIGENCj4g
PiBzaW1wbGUtDQo+ID4gYnVzIG9uIHRvcCBvZiBJMkMuDQo+IA0KPiBUaGlzIGlzIGZvciBNRkQg
ZGV2aWNlcyB3aGVyZSB0aGUgcGFyZW50IGRvZXMgbGl0dGxlIG1vcmUgdGhhbiBjcmVhdGUNCj4g
YSBzaGFyZWQgYWRkcmVzcyBzcGFjZSBmb3IgY2hpbGQgZGV2aWNlcyB0byBvcGVyYXRlIG9uIC0g
bGlrZSB5b3Vycy4NCj4gDQo+ID4gQW55d2F5cywgdGhlIEJEOTU3NiBhbmQgQkQ5NTczIGJvdGgg
aGF2ZSBhIGZldyBpbnRlcnJ1cHRzIGZvcg0KPiA+IE9WRC9VVkQNCj4gPiBjb25kaXRpb25zIGFu
ZCBJIGFtIGV4cGVjdGluZyB0aGF0IEkgd2lsbCBiZSBhc2tlZCB0byBwcm92aWRlIHRoZQ0KPiA+
IHJlZ3VsYXRvciBub3RpZmllcnMgZm9yIHRob3NlLiBSZWFzb24gd2h5IEkgb21pdHRlZCB0aGUg
SVJRcyBmb3INCj4gPiBub3cgaXMNCj4gPiB0aGF0IHRoZSBIVyBpcyBkZXNpZ25lZCB0byBrZWVw
IHRoZSBJUlEgYXNzZXJ0ZWQgZm9yIHdob2xlIGVycm9yDQo+ID4gZHVyYXRpb24gc28gc29tZSBk
ZWxheWVkIGFjayBtZWNoYW5pc20gd291bGQgYmUgbmVlZGVkLiBJIHdvdWxkDQo+ID4gbGlrZSB0
bw0KPiA+IGtlZXAgdGhlIGRvb3Igb3BlbiBmb3IgYWRkaW5nIElSUXMgdG8gTUZEIGNvcmUuDQo+
IA0KPiBZb3UgbWVhbiB0byBhZGQgYW4gSVJRIERvbWFpbj8NCg0KWWVzLiBJIHBsYW5uZWQgdG8g
dXNlIHJlZ21hcC1pcnEgYW5kIGNyZWF0ZSBpcnEgY2hpcCBpbiBNRkQgd2hlbiB0aGUNCm92ZXIg
LyB1bmRlciB2b2x0YWdlIC8gdGVtcGVyYXR1cmUgLSBub3RpZmljYXRpb25zIG9yIHdhdGNoZG9n
IElSUXMgYXJlDQpuZWVkZWQuIA0KDQpCZXN0IFJlZ2FyZHMsDQoJTWF0dGkgVmFpdHRpbmVuDQo=
