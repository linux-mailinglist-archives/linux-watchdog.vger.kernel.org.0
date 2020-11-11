Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED7F2AF48B
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Nov 2020 16:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgKKPPY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Nov 2020 10:15:24 -0500
Received: from mail-eopbgr80084.outbound.protection.outlook.com ([40.107.8.84]:22181
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725995AbgKKPPW (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 10:15:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuBAWdJIKlocJzu033VXn2+80fROVioHm3QFw+tMWC9svtmqfF3u31ZTJtInxg7XR/NP6JoGWm+kQYczJzmy6x9BBDdaQ2XGls4WWESy28osc4fZwGC75rA5pbAilUXCX24NCTOVdu8bGnY4pF7ZOya6f8oml0EjEk4MDhSKW80W3Vdny6qLb1l7ZZYV7+yvNOwlMent0xPgqUog82zvPbaHKqZAlueePMQfREbqtvZ5T8uNZpR/jymGUt167XjpJVLPIf1mQvVRg3u93F9UV1CSoWFTikSqHvPfb4Gznex63iFHlGA0ApMv+TB6yVrDIuhEJyu8oCCmfT4vxH91rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/zE6N4nMP2693h6yPDhjo4yX74tw6SvTYK17KCNo50=;
 b=n4rl3U3RUZH56AJcqsfBSE4Uvcputy7JNTtS3EV3Mp+hjWbt/GzarPSclk9R62OD0SfSuvjQBdoc2uinJbl5zSLc5RGtTcUWxT/ts3A99cURUMiKzM7W7m6Q3v8OR+Q+qHedMKtx0NuRMu4Y8kWfcOobuThNg5xb5A3J8O9i7u1DB55PteBVerpnqHOxkZFgZiFErh8kiDIqGR6noMG1taf+ht4SbX9377PUF9GZZuFsm76hgEWSFb2R3c/deUXO3jbLxUX3vvMvFiHOYjvRJ8FvOhe0sjF+H+JV4QoNPCXA6WeL024hEyANnAtK5eqq3E+oURhB7ZtfxRGTjKfrcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/zE6N4nMP2693h6yPDhjo4yX74tw6SvTYK17KCNo50=;
 b=fOiCcT0pPZY2FNJ16Lm/jVtgfryneeVgWyoxZozRD/WTJteOC4Nnb2r6UDS7wZ0yeTZH8IILcxgyGcBt3dAy8EsZKbINZYq+s/DQkt8WRgSU6EmFh16C4nQJegBHmVKGdCXV2qqMTI7SiZ8OG7RwuCWZqK+jdQJuyd6h6wFbPAc=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2475.eurprd03.prod.outlook.com (2603:10a6:3:69::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Wed, 11 Nov 2020 15:15:17 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::2c6d:c39b:de6d:b343]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::2c6d:c39b:de6d:b343%5]) with mapi id 15.20.3541.021; Wed, 11 Nov 2020
 15:15:17 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v5 3/4] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
Thread-Topic: [PATCH v5 3/4] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
Thread-Index: AQHWs2g3f/ROJf29sU2Nc5RkpdSV3anC/3+AgAALT4CAAAlGgA==
Date:   Wed, 11 Nov 2020 15:15:17 +0000
Message-ID: <38cca1630a12f8b6c6a9f1e7a8669714957b0d01.camel@fi.rohmeurope.com>
References: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
         <1a454defaf65ecc22deb0fe42a1384a5f9d5a771.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
         <7d912f9a9c1aa2be3d73287401fd2088a63b899c.camel@fi.rohmeurope.com>
         <2f455295-9c48-c9a7-8d70-90339833eb94@roeck-us.net>
In-Reply-To: <2f455295-9c48-c9a7-8d70-90339833eb94@roeck-us.net>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 439decf3-a054-45ea-0f5b-08d8865498ed
x-ms-traffictypediagnostic: HE1PR0301MB2475:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2475A75E26462CB2E167F5D6ADE80@HE1PR0301MB2475.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sq5LQk4Ax25bI5zzhwxnUi08B+VZxlkWd34Dwl8sKytRk47gMfz3uvkHXW3a4Vy69BxicxwX6dr4FvEeLZn6Rn4+95OpCeEc+fm5RnxBy7UnunqjUNwQWATxt7slV2nlMBe2xlaUeBxX/ArEciC+sox8lNEg+yp1+7CrT8FhiipMmfNZKbwVD4TfvBRLOU6zLOiyxpHbMb3xia49UdsQGguR5jDGZAuEUWmYN5unTc6JqMkb3+XYGwjqDA6lZpwpKcZfMT3WY1DDBjMsFTAoefdqbYEN/z3HOkCp/jfpOyiyZQ5c4ZW1cNvXtcj2IYUTeUl0yLN4Nzljt/VPbR5hRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39840400004)(366004)(53546011)(66476007)(83380400001)(66556008)(66946007)(478600001)(4001150100001)(6486002)(71200400001)(64756008)(6512007)(66446008)(76116006)(86362001)(186003)(54906003)(110136005)(4326008)(2616005)(2906002)(6506007)(3450700001)(316002)(8676002)(26005)(8936002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 6Avzpa9UuPenpBodMFn6CorhoePP71hU2x2p9lkPxPgC0kT8dsSrgwft2nMhRTBeguk+n2sHHXvOF253MUcLt6uSkOXzHNlh8vyllACveI3MwdhrvDcCpfDO8GCkyHYfZyARK3RnbTqZyYPUL2n04n9maaPiFF4PP5FJdG2p0s63Mt80wMWTVNxgTHWqLE5bLscr0L2alww3+itUD9yXCDMaR/iexp5f2OF857v4tUvThbGX0fLl4yG8logrzqVPZNxeriW8aCDXjxMW8Gb2rXHp8Kq9j4/G6z1nvO0nYWh+MdMO/6aSzdDfCm3OtK1ltcPPFq28YuYrAqXrzQqrDHpg4HcQ3dN29J3CcQclE5Jdf3mN/58bytVCB5hceSD/U/71fr/Eb+FbHIjFd8Jr12uOQ5nIlhBLaE0P+6sRuWKPmV2UJobymiE67o1rAlicIGGvI2zYmIRWofNXGuyWEQYBnWwx4mQEu9sHoxt5qLLP3xS82PsTEUvd2wHBhwE21UylQiu4sGWwNIN6QXKGoSkvVAaqLPQxXXW43mgu8smepFUapudh6ixFpiJa/OOaU/MYJNbZhInkeiLCtdU1MHAVSHk2g59HiE+yjpX/M8SfplPk5mlbtje81EP9BF2b+ahc8ZdP5Oh0I7X/xs/of4A9ev7fl1OrDxg4INpoqOGU1Zfr06p2lSghtcgp/QiYeto6VQUnzXCsVla+6ql8MsNdPnQqb+5VQFfG6wIq0eOR8eZDAW2XDWS1atwUqnIJaCZIBFBskWKaOMrUbiYOe3ls3hn1S2KGeC7ycWFxDVKGVXhBH9ACPtT6IiQyqK/uDeiItJwoD3w729DmhihSLop+EMjGGLT43SmrxrNpbw0KiYwexx7bjy+BrZjESxeeoOHnvNaQ32sk7xIQFDblnQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <144C721DDBBF2F4695D42DA988A688F2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439decf3-a054-45ea-0f5b-08d8865498ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 15:15:17.2303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 50qYPFOIBmoRYeUDzhTCURLfGP/uewq5cvgcOvwwSSQCzLaUkmSBthAoKZX1cTkXoNgMhsY5lol0fy3l8WzQCoM2LCYEEtOiICqCqOuUTyVs6Db/3I6iJ6NsooyhU+xP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2475
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMTEtMTEgYXQgMDY6NDEgLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6
DQo+IE9uIDExLzExLzIwIDY6MDEgQU0sIFZhaXR0aW5lbiwgTWF0dGkgd3JvdGU6DQo+ID4gT24g
VGh1LCAyMDIwLTExLTA1IGF0IDEzOjM4ICswMjAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+
ID4gPiBBZGQgV2F0Y2hkb2cgc3VwcG9ydCBmb3IgUk9ITSBCRDk1NzZNVUYgYW5kIEJEOTU3M01V
RiBQTUlDcyB3aGljaA0KPiA+ID4gYXJlDQo+ID4gPiBtYWlubHkgdXNlZCB0byBwb3dlciB0aGUg
Ui1DYXIgc2VyaWVzIHByb2Nlc3NvcnMuIFRoZSB3YXRjaGRvZyBpcw0KPiA+ID4gcGluZ2VkIHVz
aW5nIGEgR1BJTyBhbmQgZW5hYmxlZCB1c2luZyBhbm90aGVyIEdQSU8uIEFkZGl0aW9uYWxseQ0K
PiA+ID4gd2F0Y2hkb2cgdGltZS1vdXQgY2FuIGJlIGNvbmZpZ3VyZWQgdG8gSFcgcHJpb3Igc3Rh
cnRpbmcgdGhlDQo+ID4gPiB3YXRjaGRvZy4NCj4gPiA+IFdhdGNoZG9nIHRpbWVvdXQgY2FuIGJl
IGNvbmZpZ3VyZWQgdG8gZGV0ZWN0IG9ubHkgZGVsYXllZCBwaW5nIG9yDQo+ID4gPiBpbg0KPiA+
ID4gYSB3aW5kb3cgbW9kZSB3aGVyZSBhbHNvIHRvbyBmYXN0IHBpbmdzIGFyZSBkZXRlY3RlZC4N
Cj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0
dGluZW5AZmkucm9obWV1cm9wZS5jb20NCj4gPiA+ID4NCj4gPiA+IFJldmlld2VkLWJ5OiBHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQo+ID4gPiAtLS0NCj4gPiA+IA0KPiA+IA0K
PiA+IC8vc25pcA0KPiA+IA0KPiA+ID4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3ZhcmlhYmxl
X3UzMl9hcnJheShucCwgInJvaG0saHctdGltZW91dC0NCj4gPiA+IG1zIiwNCj4gPiA+ICsJCQkJ
CQkgICZod19tYXJnaW5bMF0sIDEsIDIpOw0KPiA+ID4gKwlpZiAocmV0IDwgMCAmJiByZXQgIT0g
LUVJTlZBTCkNCj4gPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gPiArDQo+ID4gPiArCWlmIChyZXQg
PT0gMSkNCj4gPiA+ICsJCWh3X21hcmdpbl9tYXggPSBod19tYXJnaW5bMF07DQo+ID4gPiArDQo+
ID4gPiArCWlmIChyZXQgPT0gMikgew0KPiA+ID4gKwkJaHdfbWFyZ2luX21heCA9IGh3X21hcmdp
blsxXTsNCj4gPiA+ICsJCWh3X21hcmdpbl9taW4gPSBod19tYXJnaW5bMF07DQo+ID4gPiArCX0N
Cj4gPiA+ICsNCj4gPiA+ICsJcmV0ID0gYmQ5NTd4X3NldF93ZHRfbW9kZShwcml2LCBod19tYXJn
aW5fbWF4LCBod19tYXJnaW5fbWluKTsNCj4gPiA+ICsJaWYgKHJldCkNCj4gPiA+ICsJCXJldHVy
biByZXQ7DQo+ID4gPiArDQo+ID4gPiArCXByaXYtPmFsd2F5c19ydW5uaW5nID0gb2ZfcHJvcGVy
dHlfcmVhZF9ib29sKG5wLCAiYWx3YXlzLQ0KPiA+ID4gcnVubmluZyIpOw0KPiA+ID4gKw0KPiA+
ID4gKwl3YXRjaGRvZ19zZXRfZHJ2ZGF0YSgmcHJpdi0+d2RkLCBwcml2KTsNCj4gPiA+ICsNCj4g
PiA+ICsJcHJpdi0+d2RkLmluZm8JCQk9ICZiZDk1N3hfd2R0X2lkZW50Ow0KPiA+ID4gKwlwcml2
LT53ZGQub3BzCQkJPSAmYmQ5NTd4X3dkdF9vcHM7DQo+ID4gPiArCXByaXYtPndkZC5taW5faHdf
aGVhcnRiZWF0X21zCT0gaHdfbWFyZ2luX21pbjsNCj4gPiA+ICsJcHJpdi0+d2RkLm1heF9od19o
ZWFydGJlYXRfbXMJPSBod19tYXJnaW5fbWF4Ow0KPiA+ID4gKwlwcml2LT53ZGQucGFyZW50CQk9
IGRldjsNCj4gPiA+ICsJcHJpdi0+d2RkLnRpbWVvdXQJCT0gKGh3X21hcmdpbl9tYXggLyAyKSAq
IDEwMDA7DQo+ID4gDQo+ID4gSG1tLiBKdXN0IG5vdGljZWQgdGhpcyB2YWx1ZSBkb2VzIG5vdCBt
YWtlIHNlbnNlLCByaWdodD8NCj4gPiBNYXhpbXVtIGh3X21hcmdpbiBpcyA0NDE2IG1zLiBJZiBJ
IHJlYWQgdGhpcyBjb3JyZWN0bHkgdGltZW91dA0KPiA+IHNob3VsZA0KPiA+IGJlIGluIHNlY29u
ZHMgLSAgc28gcmVzdWx0IGlzIGFyb3VuZCAyIDAwMCAwMDAgc2Vjb25kcyBoZXJlLiBJDQo+ID4g
dGhpbmsgaXQNCj4gPiBpcyB1c2VsZXNzIHZhbHVlLi4uDQo+ID4gDQo+ID4gUGVyaGFwcw0KPiA+
IAlwcml2LT53ZGQudGltZW91dAkJPSAoaHdfbWFyZ2luX21heCAvIDIpIC8gMTAwMDsNCj4gPiAJ
aWYgKCFwcml2LT53ZGQudGltZW91dCkNCj4gPiAJCXByaXYtPndkZC50aW1lb3V0ID0gMTsNCj4g
PiB3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlLg0KPiA+IA0KPiANCj4gWWVzLiBHb29kIGNhdGNo
LiBBY3R1YWxseSwgc2luY2UgbWF4X2h3X2hlYXJ0YmVhdF9tcyBpcyBzcGVjaWZpZWQsDQo+IGl0
IGNhbiBhbmQgc2hvdWxkIGJlIGEgcmVhc29uYWJsZSBjb25zdGFudCAobGlrZSB0aGUgdXN1YWwg
MzANCj4gc2Vjb25kcykuDQo+IEl0IGRvZXMgbm90IGFuZCBzaG91bGQgbm90IGJlIGJvdW5kIGJ5
IG1heF9od19oZWFydGJlYXRfbXMuDQoNClRoYW5rcyBmb3IgY29uZmlybWluZyB0aGlzIEd1ZW50
ZXIuIEknZCBiZXR0ZXIgYWRtaXQgSSBkaWRuJ3QNCnVuZGVyc3RhbmQgaG93IHRoZSBtYXhfaHdf
aGVhcnRiZWF0X21zIHdvcmtzLg0KDQpJZiBJIG5vdyByZWFkIHRoZSBjb2RlIGNvcnJlY3RseSwg
dGhlICJ3YXRjaGRvZyB3b3JrZXIiIHRha2VzIGNhcmUgb2YNCmZlZWRpbmcgZm9yIHNob3J0ZXIg
cGVyaW9kcyB0aGFuIHRoZSAidGltZW91dCIgLSBhbmQgb25seSBzdG9wcw0KZmVlZGluZyBtYXhf
aHdfaGVhcnRiZWF0X21zIGJlZm9yZSB0aW1lb3V0IGV4cGlyZXMgaWYgdXNlcmxhbmQgaGFzIG5v
dA0KYmVlbiBmZWVkaW4gd2RnLiBUaGlzIGlzIHJlYWxseSBjb29sIGFwcHJvYWNoIGZvciBzaG9y
dChpc2gpDQptYXhfaHdfaGVhcnRiZWF0X21zIGNvbmZpZ3VyYXRpb25zIGFzIHVzZXItc3BhY2Ug
ZG9lcyBub3QgbmVlZCB0byBtZWV0DQoiUlQgcmVxdWlyZW1lbnRzIi4gV0RHIGZyYW1ld29yayBp
cyBtdWNoIG1vcmUgYWR2YW5jZWQgdGhhdCBJIGtuZXcgOikNCkl0J3MgbmljZSB0byBsZWFybiEN
Cg0KDQotLU1hdHRpDQoNCg==
