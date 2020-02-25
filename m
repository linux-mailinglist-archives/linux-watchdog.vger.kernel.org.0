Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A2216B6BA
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2020 01:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgBYAbO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Feb 2020 19:31:14 -0500
Received: from mail-eopbgr20050.outbound.protection.outlook.com ([40.107.2.50]:41092
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728011AbgBYAbN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Feb 2020 19:31:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfBGnYYn+oP5XcP7N1qz8e0//vMD8vMQS3v0xM/TU4FhslZ8/9/HCfaFFlUkVlh2b8ToTJlemYNWs7qHu1mudKA/3jt+0IKi+dbpVLtLS8lbd4rk0Dw2tBNp1ph5KauW8FUJVcy8T0GWc2FvbPHrDFKOrSwbVTnEa5N6Y0E0WKjTsy3I8cdPS2x12QgWrr87R38PPH78p3IoWmdVgPCYZzN2GJeVLj6HTNPdPsZQlNaObzsqbo15Gd0Jq/br+OlDteEjdavzxYNTCH9Md+70en+cFYogYej24HprswXOeLEHssyOw2w8UMG1LYyjgPJ+aG9baK3vQlWNtIX5tpH34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdajuWpUehzUxcCZTY5/7NDXixbOhl8xRh7ZKfm3vyQ=;
 b=gvzg8/mtos4EqIBloo2RLZtSvHJZHimkMVf7Bag0jlKJdMbqvAXWNUpLpUc1mmjNAynXiHhlal8pWNyc4KIaaDXFSXXPxJuS9ADB/4RJFmNvcglK7HpAJDFDyjIJANdDfLJAm6NulAbY1o5qliOS09q7OB+nJZN7sWfRd6/AZrkTHVFjo9TUetk/hIJQh87h9yoTVGq/r//KXBMwel/sKAlDn5aW+0RezDBE9wEdQJMqrBbkEOcNn/S/ZwWBUulqfyVmWLkJRlFWqoToTC/sjjU/O00rJo8KYddqyqApbean/S1fQ3SgXkEQiLrkyA9LdpC/yzTQ0gyeSa7tgEA3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdajuWpUehzUxcCZTY5/7NDXixbOhl8xRh7ZKfm3vyQ=;
 b=sUTKn7prIEfsToNqrOwF5REkRlXoZ3Og/+RbvgN9+4Xlt0uvIrCdQTs66ph/VGgIP8I/aAqWpH7IVSiYkTjuIVjIhdwKWJPEwNq8tNuztCOmj76cK0Y3XXlYMKndn0r3jzsKPSVELB3VM8XDM2bt2TNkIn/jgGFZRbdD97Mgc1Q=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3676.eurprd04.prod.outlook.com (52.134.70.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Tue, 25 Feb 2020 00:31:06 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 00:31:06 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] watchdog: imx2_wdt: Drop .remove callback
Thread-Topic: [PATCH] watchdog: imx2_wdt: Drop .remove callback
Thread-Index: AQHV6r4pAecyWfgb902OwJH5EZ8Ix6gqIxCAgAAQU5CAADDNgIAAq9PQ
Date:   Tue, 25 Feb 2020 00:31:06 +0000
Message-ID: <DB3PR0402MB391656211E0A37CBA969D652F5ED0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
 <20200224102211.clzqw4vtzc4nz5df@pengutronix.de>
 <DB3PR0402MB391637EB54A1FD37059FBE47F5EC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <33c3778f-fc7e-8564-f767-91aafae03122@roeck-us.net>
In-Reply-To: <33c3778f-fc7e-8564-f767-91aafae03122@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32d58c28-a8fa-4ebe-43f5-08d7b98a0092
x-ms-traffictypediagnostic: DB3PR0402MB3676:|DB3PR0402MB3676:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3676AC28F99F2E8ECA5A366CF5ED0@DB3PR0402MB3676.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(199004)(189003)(81156014)(7696005)(66556008)(8936002)(8676002)(71200400001)(478600001)(6506007)(81166006)(186003)(26005)(86362001)(9686003)(55016002)(53546011)(5660300002)(44832011)(52536014)(316002)(76116006)(66946007)(4326008)(110136005)(64756008)(54906003)(66446008)(66476007)(2906002)(33656002)(7416002)(142923001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3676;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zr6NeG2zzFzsI9SRAVUDiAzjl2twBkI6igutQ0EUFn4dUhRnlZq65aSuHOhTg2gNnfqEnG2F98ef4AMy50oXiYmorwXmk0Ed6JF9w2CR8qItkNpnW9gPz0FDm1ZQalh9QNgJgfk4XdHe4yEys2cQPbYJ3exPNwmU22lXNUF23mdETQvWuovdV8vJQn5XbJtRXjIo42O7dc7pQHT9PU2VH2hDUxXrFX0gTPGaJgOIvm+HH6FBe4ZJrW9Zh0mCfD6nAdwIB+GfQ+5rEO2nPUjJOYp94w+IRptM30eEU5bXBx0Axyozh4exq8Xei9IbjEOfMy7FictcTVEqSaYrFLplzAmm3GM1mlLhAS8aKesVvuOR1lnMpViFgcNKGqsYyhtGjGtWRbyNrV/ncSqBA5CZXZDSiXEIXgVwLXY0zoyv3DOOgSEokvRxBdCvINeJQKn00L38aqIEXmszF65PMxPBRQOBYFs7eiKLTnunIyoysLUqhTqhjY7Qk6ve+PiJLE24
x-ms-exchange-antispam-messagedata: WKWtioHDG42M5zLPwSrn0YuGItTH4VDSGLiga7JcheXTTkHFCK7MmQUfp8PHYFeoVt8tv2XlUFVBzgHvDBXLfsBUDYBiIR1ao8PZjufVXOVOne7bSyVrlDUXs/86Y4HkqxT59O8lvoOMYB1wV3Iw9g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d58c28-a8fa-4ebe-43f5-08d7b98a0092
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 00:31:06.1496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x61zwUsxAf7IW1rh7YM+VCL9zkf6egeBLqtmHmm/HWo15UucdBCX0OuwWzEYoXxzzF5YOFoNWCIZG5HfioTw9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3676
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB3YXRjaGRvZzogaW14Ml93ZHQ6
IERyb3AgLnJlbW92ZSBjYWxsYmFjaw0KPiANCj4gT24gMi8yNC8yMCAzOjQ0IEFNLCBBbnNvbiBI
dWFuZyB3cm90ZToNCj4gPiBIaSwgVXdlDQo+ID4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
d2F0Y2hkb2c6IGlteDJfd2R0OiBEcm9wIC5yZW1vdmUgY2FsbGJhY2sNCj4gPj4NCj4gPj4gT24g
TW9uLCBGZWIgMjQsIDIwMjAgYXQgMTA6NTE6MjdBTSArMDgwMCwgQW5zb24gSHVhbmcgd3JvdGU6
DQo+ID4+PiAucmVtb3ZlIGNhbGxiYWNrIGltcGxlbWVudGF0aW9uIGRvZXNuJyBjYWxsIGNsa19k
aXNhYmxlX3VucHJlcGFyZSgpDQo+ID4+PiB3aGljaCBpcyBidWdneSwgYWN0dWFsbHksIHdlIGNh
biBqdXN0IHVzZQ0KPiA+Pj4gZGV2bV93YXRjaGRvZ19yZWdpc3Rlcl9kZXZpY2UoKSBhbmQNCj4g
Pj4+IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIHRvIGhhbmRsZSBhbGwgbmVjZXNzYXJ5IG9w
ZXJhdGlvbnMgZm9yDQo+ID4+PiByZW1vdmUgYWN0aW9uLCB0aGVuIC5yZW1vdmUgY2FsbGJhY2sg
Y2FuIGJlIGRyb3BwZWQuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcg
PEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgZHJpdmVycy93YXRjaGRv
Zy9pbXgyX3dkdC5jIHwgMzcNCj4gPj4+ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDI3IGRlbGV0
aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2lteDJf
d2R0LmMNCj4gPj4+IGIvZHJpdmVycy93YXRjaGRvZy9pbXgyX3dkdC5jIGluZGV4IGY4ZDU4YmYu
LjFmZTQ3MmYgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2lteDJfd2R0LmMN
Cj4gPj4+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvaW14Ml93ZHQuYw0KPiA+Pj4gQEAgLTI0NCw2
ICsyNDQsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnDQo+ID4+IGlteDJf
d2R0X3JlZ21hcF9jb25maWcgPSB7DQo+ID4+PiAgIAkubWF4X3JlZ2lzdGVyID0gMHg4LA0KPiA+
Pj4gICB9Ow0KPiA+Pj4NCj4gPj4+ICtzdGF0aWMgdm9pZCBpbXgyX3dkdF9hY3Rpb24odm9pZCAq
ZGF0YSkgew0KPiA+Pj4gKwljbGtfZGlzYWJsZV91bnByZXBhcmUoZGF0YSk7DQo+ID4+DQo+ID4+
IERvZXMgdGhpcyBoYXZlIHRoZSBlZmZlY3Qgb2Ygc3RvcHBpbmcgdGhlIHdhdGNoZG9nPyBNYXli
ZSB3ZSBjYW4gaGF2ZQ0KPiA+PiBhIG1vcmUgZXhwcmVzc2l2ZSBmdW5jdGlvbiBuYW1lIGhlcmUg
KGlteDJfd2R0X3N0b3BfY2xrIG9yIHNpbWlsYXIpPw0KPiA+DQo+ID4gVGhpcyBhY3Rpb24gaXMg
T05MWSBjYWxsZWQgd2hlbiBwcm9iZSBmYWlsZWQgb3IgZGV2aWNlIGlzIHJlbW92ZWQsIGFuZA0K
PiA+IGlmIHdhdGNoZG9nIGlzIHJ1bm5pbmcsIHRoZSBjb3JlIGRyaXZlciB3aWxsIHByZXZlbnQg
aXQgZnJvbSBiZWluZyByZW1vdmVkLg0KPiA+DQo+ID4+DQo+ID4+IElzIHRoZXJlIHNvbWUgd2F0
Y2hkb2cgY29yZSBwb2xpY3kgdGhhdCB0ZWxscyBpZiB0aGUgd2F0Y2hkb2cgc2hvdWxkDQo+ID4+
IGJlIHN0b3BwZWQgb24gdW5sb2FkPw0KPiA+DQo+ID4gd2F0Y2hkb2dfc3RvcF9vbl91bnJlZ2lz
dGVyKCkgc2hvdWxkIGJlIGNhbGxlZCBpbiAucHJvYmUgZnVuY3Rpb24gdG8NCj4gPiBtYWtlIGNv
cmUgcG9saWN5IHN0b3AgdGhlIHdhdGNoZG9nIGJlZm9yZSByZW1vdmluZyBpdCwgYnV0IEkgdGhp
bmsNCj4gPiB0aGlzIGRyaXZlciBkb2VzIE5PVCBjYWxsIGl0LCBtYXliZSBJIHNob3VsZCBhZGQg
dGhlIEFQSSBjYWxsLCBuZWVkIEd1ZW50ZXINCj4gdG8gaGVscCBjb25maXJtLg0KPiA+DQo+IFRo
ZSBkcml2ZXIgZG9lc24ndCBoYXZlIGEgc3RvcCBmdW5jdGlvbiwgd2hpY2ggaW1wbGllcyB0aGF0
IHRoZSB3YXRjaGRvZyBjYW4NCj4gbm90IGJlIHN0b3BwZWQgb25jZSBzdGFydGVkLiBDYWxsaW5n
IHdhdGNoZG9nX3N0b3Bfb25fdW5yZWdpc3RlcigpIHNlZW1zDQo+IHRvIGJlIHBvaW50bGVzcy4N
Cj4gDQo+IFRoYXQgYWxzbyBpbXBsaWVzIHRoYXQgdGhlIHdhdGNoZG9nIGNhbiBub3QgYmUgdW5s
b2FkZWQgYWZ0ZXIgaXQgaGFzIGJlZW4NCj4gc3RhcnRlZCBzaW5jZSBpdCBjYW4ndCBiZSBzdG9w
cGVkLiBNb3JlIG9uIHRoYXQgYmVsb3cuDQo+IA0KPiA+Pg0KPiA+Pj4gK30NCj4gPj4+ICsNCj4g
Pj4+ICAgc3RhdGljIGludCBfX2luaXQgaW14Ml93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikgIHsNCj4gPj4+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7
DQo+ID4+PiBAQCAtMjkyLDYgKzI5NywxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBpbXgyX3dkdF9w
cm9iZShzdHJ1Y3QNCj4gPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+Pj4gICAJaWYgKHJl
dCkNCj4gPj4+ICAgCQlyZXR1cm4gcmV0Ow0KPiA+Pj4NCj4gPj4+ICsJcmV0ID0gZGV2bV9hZGRf
YWN0aW9uX29yX3Jlc2V0KGRldiwgaW14Ml93ZHRfYWN0aW9uLCB3ZGV2LT5jbGspOw0KPiA+Pj4g
KwlpZiAocmV0KQ0KPiA+Pj4gKwkJcmV0dXJuIHJldDsNCj4gPj4+ICsNCj4gPj4+ICAgCXJlZ21h
cF9yZWFkKHdkZXYtPnJlZ21hcCwgSU1YMl9XRFRfV1JTUiwgJnZhbCk7DQo+ID4+PiAgIAl3ZG9n
LT5ib290c3RhdHVzID0gdmFsICYgSU1YMl9XRFRfV1JTUl9UT1VUID8NCj4gPj4gV0RJT0ZfQ0FS
RFJFU0VUIDogMDsNCj4gPj4+DQo+ID4+PiBAQCAtMzE1LDMyICszMjQsNyBAQCBzdGF0aWMgaW50
IF9faW5pdCBpbXgyX3dkdF9wcm9iZShzdHJ1Y3QNCj4gPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiA+Pj4gICAJICovDQo+ID4+PiAgIAlyZWdtYXBfd3JpdGUod2Rldi0+cmVnbWFwLCBJTVgy
X1dEVF9XTUNSLCAwKTsNCj4gPj4+DQo+ID4+PiAtCXJldCA9IHdhdGNoZG9nX3JlZ2lzdGVyX2Rl
dmljZSh3ZG9nKTsNCj4gPj4+IC0JaWYgKHJldCkNCj4gPj4+IC0JCWdvdG8gZGlzYWJsZV9jbGs7
DQo+ID4+PiAtDQo+ID4+PiAtCWRldl9pbmZvKGRldiwgInRpbWVvdXQgJWQgc2VjIChub3dheW91
dD0lZClcbiIsDQo+ID4+PiAtCQkgd2RvZy0+dGltZW91dCwgbm93YXlvdXQpOw0KPiA+Pg0KPiA+
PiBEb2VzIHRoZSBjb3JlIHB1dCB0aGlzIGluZm8gaW4gdGhlIGtlcm5lbCBsb2c/IElmIG5vdCBk
cm9wcGluZyBpdA0KPiA+PiBpc24ndCBvYnZpb3VzbHkgcmlnaHQgZW5vdWdoIHRvIGJlIGRvbmUg
ZW4gcGFzc2FudC4NCj4gPg0KPiA+IFRoaXMgaXMganVzdCBhbiBpbmZvIGZvciB1c2VyIHdoaWNo
IEkgdGhpbmsgTk9UIHVubmVjZXNzYXJ5LCBzbyBJIGRyb3ANCj4gPiBpdCBpbiB0aGlzIHBhdGNo
IGFzIHdlbGwuDQo+ID4NCj4gPj4NCj4gPj4+IC0JcmV0dXJuIDA7DQo+ID4+PiAtDQo+ID4+PiAt
ZGlzYWJsZV9jbGs6DQo+ID4+PiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZSh3ZGV2LT5jbGspOw0K
PiA+Pj4gLQlyZXR1cm4gcmV0Ow0KPiA+Pj4gLX0NCj4gPj4+IC0NCj4gPj4+IC1zdGF0aWMgaW50
IF9fZXhpdCBpbXgyX3dkdF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgLXsN
Cj4gPj4+IC0Jc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RvZyA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOw0KPiA+Pj4gLQlzdHJ1Y3QgaW14Ml93ZHRfZGV2aWNlICp3ZGV2ID0gd2F0Y2hk
b2dfZ2V0X2RydmRhdGEod2RvZyk7DQo+ID4+PiAtDQo+ID4+PiAtCXdhdGNoZG9nX3VucmVnaXN0
ZXJfZGV2aWNlKHdkb2cpOw0KPiA+Pj4gLQ0KPiA+Pj4gLQlpZiAoaW14Ml93ZHRfaXNfcnVubmlu
Zyh3ZGV2KSkgew0KPiA+Pj4gLQkJaW14Ml93ZHRfcGluZyh3ZG9nKTsNCj4gPj4+IC0JCWRldl9j
cml0KCZwZGV2LT5kZXYsICJEZXZpY2UgcmVtb3ZlZDogRXhwZWN0IHJlYm9vdCFcbiIpOw0KPiA+
Pj4gLQl9DQo+ID4+DQo+ID4+IEkgYWxzbyB3b25kZXIgYWJvdXQgdGhpcyBvbmUuIFRoaXMgY2hh
bmdlcyB0aGUgdGltaW5nIGJlaGF2aW91ciBhbmQNCj4gPj4gc28gSU1ITyBzaG91bGRuJ3QgYmUg
ZG9uZSBhcyBhIHNpZGUgZWZmZWN0IG9mIGEgY2xlYW51cCBwYXRjaC4NCj4gPg0KPiA+IEd1ZW50
ZXIgaGFzIGEgY29tbWVudCBvZiAidXNlIGRldm1fd2F0Y2hkb2dfcmVnaXN0ZXJfZGV2aWNlKCks
IGFuZA0KPiB0aGUNCj4gPiB3YXRjaGRvZyBzdWJzeXN0ZW0gc2hvdWxkIHByZXZlbnQgcmVtb3Zh
bCBpZiB0aGUgd2F0Y2hkb2cgaXMgcnVubmluZw0KPiA+ICIsIHNvIEkgdGhvdWdodCBubyBuZWVk
IHRvIGNoZWNrIHRoZSB3YXRjaGRvZydzIHN0YXR1cyBoZXJlLCBidXQgYWZ0ZXINCj4gPiBmdXJ0
aGVyIGNoZWNrIHRoZSBjb3JlIGNvZGUgb2Ygd2F0Y2hkb2dfY2Rldl91bnJlZ2lzdGVyKCkgZnVu
Y3Rpb24sIEkNCj4gPiBPTkxZIHNlZSBpdCB3aWxsIGNoZWNrIHdoZXRoZXIgbmVlZCB0byBzdG9w
IHdhdGNoZG9nIGJlZm9yZQ0KPiA+IHVucmVnaXN0ZXIsDQo+ID4NCj4gDQo+IEkgd291bGQgc3Vn
Z2VzdCBmb3Igc29tZW9uZSB0byB0cnkgYW5kIHRyaWdnZXIgdGhpcyBtZXNzYWdlLCBhbmQgbGV0
IG1lDQo+IGtub3cgaG93IHlvdSBkaWQgaXQuIElmIHRoZSB3YXRjaGRvZyBpcyBydW5uaW5nLCBp
dCBzaG91bGQgbm90IGJlIHBvc3NpYmxlIHRvDQo+IHVubG9hZCB0aGUgZHJpdmVyOyBhdHRlbXB0
cyB0byB1bmxvYWQgaXQgc2hvdWxkIHJlc3VsdCBpbiAtRUJVU1kuIElmIGl0IGlzDQo+IHBvc3Np
YmxlIHRvIHVubG9hZCB0aGUgZHJpdmVyLCB0aGVyZSBpcyBhIGJ1ZyBpbiB3YXRjaGRvZyBjb3Jl
IHdoaWNoIHdpbGwgbmVlZA0KPiB0byBnZXQgZml4ZWQuDQo+IA0KPiA+IC4uLg0KPiA+DQo+ID4g
MTA4MyAgICAgICAgIGlmICh3YXRjaGRvZ19hY3RpdmUod2RkKSAmJg0KPiA+IDEwODQgICAgICAg
ICAgICAgdGVzdF9iaXQoV0RPR19TVE9QX09OX1VOUkVHSVNURVIsICZ3ZGQtPnN0YXR1cykpIHsN
Cj4gPiAxMDg1ICAgICAgICAgICAgICAgICB3YXRjaGRvZ19zdG9wKHdkZCk7DQo+ID4gMTA4NiAg
ICAgICAgIH0NCj4gPg0KPiA+IEhpLCBHdWVudGVyDQo+ID4gCURvIHlvdSB0aGluayB3YXRjaGRv
Z19zdG9wX29uX3VucmVnaXN0ZXIoKSBzaG91bGQgYmUgY2FsbGVkDQo+IGluIC5wcm9iZQ0KPiA+
IGZ1bmN0aW9uIHRvIG1ha2Ugd2F0Y2hkb2cgc3RvcCBiZWZvcmUgdW5yZWdpc3Rlcj8NCj4gPg0K
PiBIb3cgd291bGQgeW91IGV4cGVjdCB0aGUgd2F0Y2hkb2cgY29yZSB0byBzdG9wIHRoZSB3YXRj
aGRvZyB3aXRoIG5vIHN0b3ANCj4gZnVuY3Rpb24gaW4gdGhlIGRyaXZlciA/DQoNCk5vdyBJIHVu
ZGVyc3RhbmQgeW91ciBwb2ludCwgdGhhbmtzIGZvciB5b3UgZGV0YWlsIGV4cGxhbmF0aW9uLg0K
DQpUaGFua3MsDQpBbnNvbg0KDQo=
