Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4664B2EED5B
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Jan 2021 07:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbhAHGLk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Jan 2021 01:11:40 -0500
Received: from mail-eopbgr150080.outbound.protection.outlook.com ([40.107.15.80]:7883
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725308AbhAHGLk (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Jan 2021 01:11:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyCRfqOhpI0i89R5FYxyRtnR9i1RsaiqAK84HXIYyPSGd26PYwsCowiUMLXfXEcUEGV5jJ8pnQ+Cp7Vma0YjsKYA2WCb1i7Vg9gzOjn9AtutSLlOkH/OPfakl5uaFmz9R0wTfkfB6AjEyIfgV9M49i8AnsxTrluXYEsRJyY0n1Yx2I77XSEa2KDCzoCKYGlssTu0Ck2tI4l2D59NzkWVjaGuIbOgx5Hr2KsT/B/1bqCMDlzLN8Q1IG/8Gq0O72+y+YxJiSA/c62y/ly33of2OAx/AWtwVs+0ahLHOUiaFPA5L6+bLqRtj/JdJrwe5iWpWyytygfyBPYFt8lkSJEOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ED5zveyX1MeT/xGsnj48IvfdGXe05GMvmyph6kVw4c=;
 b=D+WmHiumrBFkxDeuF8j8VJIymarT/Gs6et+nVg2nL4/89wbDha8DJAznkhi6HMlW4Ds+tdkHPvDHHX/Ls2m7G3q7r0bKh5QlLVsSPz7maMMaU6uv3wZHJgqvZgvpP9qwH7PopJDGSLwSTwiwKOahUNpnoQ4OYhtzDgywb2JheD2DoNYHIBRIN4QGD9haNcMR+S5FqNDo36SW8vTEGjL5jiFq4kGBwBmLpjrzbBseds40wr6n0CY+zzmGuqtsljmtheibOuR1d2Ojk5sKlI+B98Zqv712PifNylsoUZ8B4PWZqjguxhb3g6Te7n70RcsMqHVCUM4NIjwUpI/CfV4zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ED5zveyX1MeT/xGsnj48IvfdGXe05GMvmyph6kVw4c=;
 b=e0OZ/bRFxQfxlOXvjS6kFKnCim3/FVVkXrm2KHxRxPxMOyW+T+EcL1f8SHzwYFVlCKdvSzUZ+/rVIbOr2SwTSRKpYf9nfHXlmJ/jodRleojjUQfw1FPktfotUakdJNsYg7Dvqbun4Q62AAkBib1qTmPvDM8q2d4uy/f0jHkf2zg=
Received: from VI1PR03MB3165.eurprd03.prod.outlook.com (2603:10a6:802:31::10)
 by VI1PR03MB6173.eurprd03.prod.outlook.com (2603:10a6:800:142::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:10:49 +0000
Received: from VI1PR03MB3165.eurprd03.prod.outlook.com
 ([fe80::2562:5ad9:81ee:4783]) by VI1PR03MB3165.eurprd03.prod.outlook.com
 ([fe80::2562:5ad9:81ee:4783%5]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 06:10:49 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH 1/2] watchdog: bd70528: don't crash if WDG is confiured
 with BD71828
Thread-Topic: [PATCH 1/2] watchdog: bd70528: don't crash if WDG is confiured
 with BD71828
Thread-Index: AQHW5L+IrHihOUehfkywMzhn459XW6ocRXKAgAAzOACAAMfTAA==
Date:   Fri, 8 Jan 2021 06:10:48 +0000
Message-ID: <9d3c8f47716dd0b2ff27ffa0192b4d4d214f7339.camel@fi.rohmeurope.com>
References: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
         <20210107151211.GA13040@roeck-us.net>
         <35ba5bcd48d4e027c0e5c839a856751519ee4dd1.camel@fi.rohmeurope.com>
In-Reply-To: <35ba5bcd48d4e027c0e5c839a856751519ee4dd1.camel@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbf75342-6824-4bcd-1338-08d8b39c255a
x-ms-traffictypediagnostic: VI1PR03MB6173:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR03MB6173336AFCF66216A340B82DADAE0@VI1PR03MB6173.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OQic/aLSa6HPAFS+rw43IpdbFwyjYqgPDdkFuHip1nZUnf0ZyV31GLyekqBvm3ms4Px+7X82Lsy+o04Ygk0v33zZpw+HY+vVMqnDgHPolG3NcaWAHKAIF9Z5wTbT1treD4LjVILsp+CqxtburTgZUdbDe4B7A8vroiGlIEWRYDmxMYJfgSGvU0/JnXU5U5pLa8hCVJ71lDmPJk1rW0wsh4HCzSsPxtIioaR+T0rIUVwiUNXPiQVzxRAgVIw6i8Q5JoEaZnRM+0+apmIbTTDNfRiXHFKdOKq3FQxtrUeCWc7HuvYxQ33z2l44GSDerpJ5SG8/DB0Ee6Ssp4BOlLNcaESSkjGHD2Ntxh2FdCms8dvLUAPk8uJ1E1M2BKK5EnkhWv0MxhommiIToxAn9/t9Fw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3165.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39840400004)(186003)(26005)(316002)(478600001)(54906003)(8936002)(6512007)(4326008)(2616005)(6506007)(6486002)(3450700001)(71200400001)(91956017)(83380400001)(66476007)(66556008)(66946007)(64756008)(66446008)(2906002)(76116006)(86362001)(6916009)(5660300002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VnJFcDJ1S3J4MzRvYUk0TTVxdDZVOVN2YitZRTJCYXptdmdTS1I2MlRRRkdV?=
 =?utf-8?B?K2xFdlRpbGdyWFNxZFpuTW9KY2FWcFlidExlZ2V0T3ltTzFpT095QXNzUEdu?=
 =?utf-8?B?NVhYQXM5VTR6ck4zSjVyN3BLeWluUHphRXVYcTlDU25xdUVHYkdLK3VwQjI1?=
 =?utf-8?B?WEJDRy9jZzJNTldwSlRnNm9mZCtlejlKNjliMFBhVlMxc3Y2cHYwaG1oKzYv?=
 =?utf-8?B?YStqejh5ZmFObVpoOFVWQ2htbDBERGtEWHRudVZpRVUyaHU1VWNybmYvaWl6?=
 =?utf-8?B?UEFnRWRrbGhZUHNtNEw2dTI4STdqdjg4NnJ6eVJBNGk0ZFZBb253ZUpzWU92?=
 =?utf-8?B?ei8wd0RrSmJQdVRUd1ZZNmFXcXBXS1MxTXZUNUpRdUE3Y29oUEY4cXlLb3Ux?=
 =?utf-8?B?eDZES0c2VXEyak82UlMyT0JERDJjMStvamlzR0x3RWtIVWlzczlZWTFkTDV5?=
 =?utf-8?B?b3lQMUYyYUhFVC9IdlZ4QU12cjFzdzRQaDVmQk9kM2kwcis2RXovUUVld1h0?=
 =?utf-8?B?b1dDSnZVTHkyWEU2Rms1bjhMcU8wRnQvYkdCZTVJbTdxM1JCdVFSN1FSbHU2?=
 =?utf-8?B?TVh5YnZtYWlVMHlTUHhEcU5kRHc5VE1CTXRPM056VE1aYzlBb2pLVWU2SFUw?=
 =?utf-8?B?ZEg3L1MzNzJHeVZLc3dhaXNSNGRubVRhWGdXZGZtZTlDVUc0TmhjdGEvOEJp?=
 =?utf-8?B?bU9SNEZ6eGxHTkREK2ZFY0dyenNoL3FyMmJtZG5MOS9adExuYjA1N3A0Y2d6?=
 =?utf-8?B?bElnemRVVUl4ZTI0eHA0NFNYWFliZ2wwNUk5R001NlZWUTArQkxiL3pXV01M?=
 =?utf-8?B?bjZvQ2lXcUl1MTB5YVkyek9MTllFK3NRd1VSejBQM0prY2tYOTh5b1VzZHgw?=
 =?utf-8?B?eVhudHhGWGd6WmR2a0JnWExITml0WlRjK3U5STAzbFFnY3ppTms1WDM1ZVlV?=
 =?utf-8?B?WlhoMWF2c2xKU3MyTzhxa1hYckU5UHB2OFR2ZWxOMnpYM1Vqblhnc3F3YjZn?=
 =?utf-8?B?Tm5oRDdBZVNLeEdOaWIvL1FNdmlIWUdaM2lpZHpyc0dPQTZ5aVFSSjdtR2g0?=
 =?utf-8?B?VHMxNzFWaXpQUERxZEYydUVGNFdGRS9kblRPZXBVMWpOaWpxSzNZajJVMnFj?=
 =?utf-8?B?UEVQOFE3dElUMExHekpjOE1TK0VCSUpBMGQ3RmVUaTZlSktza1hxT3B1SzV4?=
 =?utf-8?B?RW5BUEMxbkRiTjBJNnhEODdKUm9YWnQ3RGxaR1RlVENpaFJJd2JVelRIalNF?=
 =?utf-8?B?UTFFUlF6T2EvbFMrU3lUVjZOY1Nubk8wRDErdmtTaVlvcFJGbVZZakNPK3VM?=
 =?utf-8?Q?1Yo9zCxewgcwQ2/Ld+Pms+PlXGA1z0K9Za?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E98C9EC2567084FB207BC81AADD5AA9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3165.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf75342-6824-4bcd-1338-08d8b39c255a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 06:10:49.3666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6ISmt2P/eFUvvZEl7X6WsVUzPH5iuJZy/qw1MYh+grepcJ6Vzmd1emgq5+e1ZjpU3sF77gM3+bLEYe8ON+zCyp0SvGg0o2KCqAjbYpiRYhsUXZ6b42op8F/Ed3pknr6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6173
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiBUaHUsIDIwMjEtMDEtMDcgYXQgMjA6MTUgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gVGhhbmtzIGEgbG90IGZvciB0YWtpbmcgYSBjYXJlZnVsIGxvb2sgYXQgdGhpcyBHdWVu
dGVyIQ0KPiANCj4gT24gVGh1LCAyMDIxLTAxLTA3IGF0IDA3OjEyIC0wODAwLCBHdWVudGVyIFJv
ZWNrIHdyb3RlOg0KPiA+IE9uIFRodSwgSmFuIDA3LCAyMDIxIGF0IDA4OjM3OjAzQU0gKzAyMDAs
IE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiA+IElmIGNvbmZpZyBmb3IgQkQ3MDUyOCB3YXRj
aGRvZyBpcyBlbmFibGVkIHdoZW4gQkQ3MTgyOCBvciBCRDcxODE1DQo+ID4gPiBhcmUgdXNlZCB0
aGUgUlRDIG1vZHVsZSB3aWxsIGlzc3VlIGNhbGwgdG8gQkQ3MDUyOCB3YXRjaGRvZyB3aXRoDQo+
ID4gPiBOVUxMIGRhdGEuIElnbm9yZSB0aGlzIGNhbGwgYW5kIGRvbid0IGNyYXNoLg0KPiA+ID4g
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBm
aS5yb2htZXVyb3BlLmNvbQ0KPiA+ID4gPg0KPiA+IA0KPiA+IEkgcmVhbGx5IHRoaW5rIHRoaXMg
c2hvdWxkIGJlIGhhbmRsZWQgaW4gdGhlIGNhbGxpbmcgY29kZS4NCj4gPiBBbHNvLCBJIGFtIGN1
cmlvdXMgaG93IHRoaXMgaXMgc3VwcG9zZWQgdG8gd29yay4NCj4gPiANCj4gPiBUaGUgY29kZSBp
cyBjYWxsZWQgd2l0aA0KPiA+IA0KPiA+IAlyZXQgPSBiZDcwNTI4X3dkdF9zZXQoci0+cGFyZW50
LCBuZXdfc3RhdGUgJg0KPiA+IEJENzA1MjhfV0RUX1NUQVRFX0JJVCwNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvbGRfc3RhdGUpOw0KPiANCj4gTXkgYnJhaW5mYXJ0Lg0KPiBU
aGUgYmQ3MDUyOF93ZHRfc2V0IGlzIG5vdCBjYWxsZWQgYXMgaXQgaXMgcHJvdGVjdGVkIGluIFJU
QyBieQ0KPiBoYXNfcnRjX3RpbWVycyBmbGFnLg0KPiANCj4gSSBpbnNlcnRlZCB0aGlzIGNoZWNr
IGluIHdyb25nIGZ1bmN0aW9uLiBUaGUgYmQ3MDUyOF93ZHRfbG9jaygpDQo+IGlzIHdoZXJlIHdl
IG1heSBoaXQgdGhlIHByb2JsZW0gYXMgaXQgaXMgbm90IHByb3RlY3RlZC4NCg0KQWN0dWFsbHks
IGFmdGVyIGEgZnJlc2ggbG9vayAtIGl0IHNlZW1zIHRoZSBiZDcwNTI4X3dkdF9sb2NrKCkgaXMg
YWxzbw0KanVzdCBmaW5lLiBUaGUgUlRDIGlzIG5vdCBncmFiYmluZyB0aGUgbG9jayBvbiBvdGhl
ciBQTUlDcyBidXQgdGhlDQpCRDcwNTI4LiBJJ20gbm90IHJlYWxseSBzdXJlIHdoYXQgSSBoYXZl
IGJlZW4gdGhpbmtpbmcgb2YuIEBfQCBJDQpzaG91bGQndmUgYmVlbiBtb3JlIGNhcmVmdWwuIFRo
YW5rcyBmb3Igc3BvdHRpbmcgdGhpcyBpbiB0aGUgcmV2aWV3IQ0KDQpCZXN0IFJlZ2FyZHMNCglN
YXR0aQ0K
