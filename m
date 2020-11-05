Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE902A79EB
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 09:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbgKEI6y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 03:58:54 -0500
Received: from mail-eopbgr00079.outbound.protection.outlook.com ([40.107.0.79]:64654
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725827AbgKEI6y (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 03:58:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAeUXW8n2GT9RmMu78AI0z1j0Ko6EgnnqEZIzX0LheaUzI97h0JqzHXA5n9r9b48/7eHQN5M+Tw3Nf/nHM5X9K60TUp9U4yziqj7ecZ8Drj0dMa3eQDanOR3wDaYWfrzwQRDG+cAIr6mxG9Atm1jHBUW39qVsjJp8V7r4DD8aDsS7KPQrXW5a7L6vKABpGDuhbRRD1kmLYDzYD5aFfCgFkUWcJqY10mP+4nqZZOb+aFEohS1vFisC9jfw4Zq7G3Q79rWYZGNSloUaJ/4y1K0XFqvK6c/OjQv20wEzOwgzAktn0+9KAs1QOYnG3tzFHjDoCYx1PZGiacI1GlCRj26hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUoJT2GHNol8JM1FooMvlJbFbTBjhIWA0ULOXJFEKRc=;
 b=PiWXVzVxbU9Q+OvXBdejVrtrHQZV0S23cwTXIItiLtMXH9/NeSkwdvgMGlHfvt0u630v0z6mFlFCw2KijDkLSqEySjAqGWJ73bKbQSlmqBkXsakB7tSVGEBGOL30NInYlypCQrvZT65LuxkHfrkmWVNaWaJRWf6juBpnZJElSsvxLB7LTtnReVoiOIcKRVy6nFqfH3jxswH3NQrFv1FYK/hPnWe8hIhj++rPxb9E3fgZ51aqP6cMKRDVEpC94eetqAP9+Oe4WJP9KANDTTw44vwNkLRgzzB1iYQfmLaT4tHEFRAAQjP1evZIeZpyeeViVZjXXJ13vb91/2D8AJK19w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUoJT2GHNol8JM1FooMvlJbFbTBjhIWA0ULOXJFEKRc=;
 b=vXJxTUwZufpz6zoJyWVEMpU+JUtZDfI2KcbWUpu/84b8VLBDzrLuM5lbBgV3JoxCCU90iJDGe4hK8wM7GuKHn9IbEPRsJ/QxYFx8F40ohzpC0N65cPj2E6N7qko2IHU7/aiyfhEHkuNLPJMBuLcP5UAgcg8L0wkgz6t23IQ8Ab0=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DBBPR03MB5320.eurprd03.prod.outlook.com (2603:10a6:10:d9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21; Thu, 5 Nov 2020 08:58:47 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107%7]) with mapi id 15.20.3477.038; Thu, 5 Nov 2020
 08:58:47 +0000
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
Subject: Re: [PATCH v4 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH v4 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWrQ9DwN0nkcfMkkiJSgq2+hhNRam4KrWAgAEVDACAAAncgA==
Date:   Thu, 5 Nov 2020 08:58:45 +0000
Message-ID: <9cadea52ab4a19d004222c88d68d25cf425bb9a7.camel@fi.rohmeurope.com>
References: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <c7a838830b7d5ea1c281e419cf0eff0cc50363e0.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <20201104155153.GQ4488@dell> <20201105082328.GV4488@dell>
In-Reply-To: <20201105082328.GV4488@dell>
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
x-ms-office365-filtering-correlation-id: 94c58179-ba5d-44bf-9a40-08d8816901a0
x-ms-traffictypediagnostic: DBBPR03MB5320:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR03MB5320DFE6015B9D0B4DB14980ADEE0@DBBPR03MB5320.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0IAukSAU32L+Nhe3nrx52XQlmCM8MP5lyov+y7QXmZJZBwsitWqoFSbkyLtEZEI8CbR7sWyntjLJkI/vdF3ZfQDVR/ml0vrK2DmqcgQ2+GrlCkqfXwsuyn3IFy+8EwjxAPwBWrY/qMeQX4YY+5+Qyc0ydcLiwmc95qZmzdDX79a45+648FsbSCir9BPjCZWbhggp9Uio5CP+PvlwzSSutyq3hr8OfqQQGqWBmkFjW66JJK2K9QUjY1bvdBVdlS+QFypcUbGD6my/IS202oHpJX90I1avmBKnCqbzVIn0GgmRPZF61G7sEtDnEK7FAE4rzUnQYsJraGMfSkoA1QHwLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39840400004)(346002)(86362001)(186003)(6916009)(5660300002)(6512007)(3450700001)(316002)(8936002)(478600001)(2616005)(54906003)(71200400001)(66946007)(66556008)(76116006)(64756008)(91956017)(8676002)(66476007)(66446008)(2906002)(26005)(83380400001)(6486002)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZVaDTyLZIvnISepVCRbikXvpt6B8PRJZsDVTLT5pfgI0mgRdTGvqNXUF+aznxdE/DQe/DOkfAvGy7x/mR+LyjxPRaJ3JvxWe/vAsch9jK7iiGiNL0cTMI3y9Oiajg3mdQvMVaWk8b0ID4eKBP3mk/Y70aatcAJ8r4cCdf3S1tZqgduLpghUYQb3qsvUtjew2jzIRTzQhPKqriYWQ/gsFom/tW9BUiFPdmeM20E17O/XuKEQpi8Dao+nRj1ISIQjuu9fe9iUBoBWmal+T5KLvS4qs4jN1m5ZTZfssUEgssnZZYhgaq00KXT5Od3Qccw4/a/67GTG+7hgA+zC2Lv8NepsyX8m2HOwfxA/vC8x6Ve23GK0XUQk3ng5Qz+OOh5fnpHYp0ohGIRYbnyn/TbVWVZ+e0nqW5FQiDCf131Zh7AOdADZ+B1Ym059IpQwl1WiIZhtI4I1+Ks90O0ZxDfCKJbUWRWGw6/DhWjOjOHJWSlH3ww0p1il8ouPYCvtle7WTo2iWUhndbZQN3LDFqRosxp7NjvszJmA9we5aqyLZ0bpCxxRNFO2vzVHjTwELGYkC3C9inE9jJuPFEwWsue6rItfCGudwZZrxQNFIVmqWapUgyql7V8JpKtdCn1pb1QqX2Zq2PEOwehaN8f0Pk3lbWA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2F8D720A6A73040976D727F7C76FEDC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c58179-ba5d-44bf-9a40-08d8816901a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 08:58:46.7829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKlV6wX1hJ90w9ChTodwJbWWuCx7lsIRk9ft1yazCvB+rvHCNozmW/069HmGxXEBk7k8y/IQFupTs1nQgccgEYEfprfuFQlHgd0x/zre0JwYtjFoxrsrVBDM7EjTR1PV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5320
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiBUaHUsIDIwMjAtMTEtMDUgYXQgMDg6MjMgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gV2VkLCAwNCBOb3YgMjAyMCwgTGVlIEpvbmVzIHdyb3RlOg0KPiANCj4gPiBPbiBXZWQsIDI4
IE9jdCAyMDIwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+ID4gDQo+ID4gPiBBZGQgY29yZSBz
dXBwb3J0IGZvciBST0hNIEJEOTU3Nk1VRiBhbmQgQkQ5NTczTVVGIFBNSUNzIHdoaWNoIGFyZQ0K
PiA+ID4gbWFpbmx5IHVzZWQgdG8gcG93ZXIgdGhlIFItQ2FyIHNlcmllcyBwcm9jZXNzb3JzLg0K
PiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0
aW5lbkBmaS5yb2htZXVyb3BlLmNvbQ0KPiA+ID4gPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVy
cy9tZmQvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMTEgKysrDQo+ID4gPiAgZHJpdmVycy9tZmQv
TWFrZWZpbGUgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ID4gIGRyaXZlcnMvbWZkL3JvaG0tYmQ5
NTc2LmMgICAgICAgIHwgMTMwDQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQvcm9obS1iZDk1N3guaCAgfCAgNTkgKysrKysrKysr
KysrKysNCj4gPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9yb2htLWdlbmVyaWMuaCB8ICAgMiArDQo+
ID4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAyMDMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL21mZC9yb2htLWJkOTU3Ni5jDQo+ID4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL3JvaG0tYmQ5NTd4LmgNCj4gDQo+IFsuLi5dDQo+IA0K
PiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX3JhbmdlIHZvbGF0aWxlX3Jhbmdlc1td
ID0gew0KPiA+ID4gKwl7DQo+ID4gPiArCQkucmFuZ2VfbWluID0gQkQ5NTdYX1JFR19TTVJCX0FT
U0VSVCwNCj4gPiA+ICsJCS5yYW5nZV9tYXggPSBCRDk1N1hfUkVHX1NNUkJfQVNTRVJULA0KPiA+
ID4gKwl9LA0KPiA+ID4gKwl7DQo+ID4gDQo+ID4gVGhlIHdheSB5b3Ugc3BhY2UgeW91ciBicmFj
ZXMgaXMgbm90IGNvbnNpc3RlbnQuDQo+ID4gDQo+ID4gPiArCQkucmFuZ2VfbWluID0gQkQ5NTdY
X1JFR19QTUlDX0lOVEVSTkFMX1NUQVQsDQo+ID4gPiArCQkucmFuZ2VfbWF4ID0gQkQ5NTdYX1JF
R19QTUlDX0lOVEVSTkFMX1NUQVQsDQo+ID4gPiArCX0sDQo+ID4gPiArCXsNCj4gPiA+ICsJCS5y
YW5nZV9taW4gPSBCRDk1N1hfUkVHX0lOVF9USEVSTV9TVEFULA0KPiA+ID4gKwkJLnJhbmdlX21h
eCA9IEJEOTU3WF9SRUdfSU5UX1RIRVJNX1NUQVQsDQo+ID4gPiArCX0sDQo+ID4gPiArCXsNCj4g
PiA+ICsJCS5yYW5nZV9taW4gPSBCRDk1N1hfUkVHX0lOVF9PVlBfU1RBVCwNCj4gPiA+ICsJCS5y
YW5nZV9tYXggPSBCRDk1N1hfUkVHX0lOVF9TWVNfU1RBVCwNCj4gPiA+ICsJfSwgew0KPiA+ID4g
KwkJLnJhbmdlX21pbiA9IEJEOTU3WF9SRUdfSU5UX01BSU5fU1RBVCwNCj4gPiA+ICsJCS5yYW5n
ZV9tYXggPSBCRDk1N1hfUkVHX0lOVF9NQUlOX1NUQVQsDQo+ID4gPiArCX0sDQo+ID4gPiArfTsN
Cj4gDQo+IERvbid0IGZvcmdldCBhYm91dCB0aGlzLg0KPiANCj4gSSB3b3VsZCBwcmVmZXIgdG8g
aGF2ZSB0aGUgYnJhY2VzIG9uIHRoZSBzYW1lIGxpbmUgKGV2ZW4gaWYgaXQgbWVhbnMNCj4geW91
IGhhdmUgdG8gY2hhbmdlIGFuIGV4dHJhIGxpbmUgd2hlbiBlZGl0aW5nKSwgYnV0IEknbSBub3Qg
MTAwJSBkZWFkDQo+IHNldCBvbiBpdC4gIENvbnNpc3RlbmN5IGhvd2V2ZXIsIEkgYW0uDQo+IA0K
DQpJIHdvbid0IGZvcmdldC4gSSBpbnRlbmRlZCB0byB3cml0ZSB0aGF0IEkgd2FzIE9rIHdpdGgg
YWxsIHRoZSBvdGhlcg0KY29tbWVudHMuIE1heWJlIEkgZm9yZ290IHRob3VnaC4gQW55d2F5cywg
SSdsbCBmaXggdGhlIGluY29uc2lzdGVuY3kgLQ0KdGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQh
DQoNCi0tTWF0dGkNCg0K
