Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8134316A55C
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2020 12:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgBXLo2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Feb 2020 06:44:28 -0500
Received: from mail-eopbgr00078.outbound.protection.outlook.com ([40.107.0.78]:26947
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726509AbgBXLo2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Feb 2020 06:44:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdqvaJl7vOKV7oAPU6X+dOb0IeZK03Dab4yVrd/isHt/+j/rZ0Ww0H3UdzDQT0QFB7kpMdbGgcmLbr6TB0+q+ZjtkwEvU043J/w8R3EVzb3O51LWba2y0HEHvMt8nNiw8DQXTniWP2Fb8IwCORfrH8R+jbDrkjvkxYYhuMYpgEwH88FbHsIeLCWJWB0uoXhnf+xEN0t9iFiCOGKUTdOFr62VALPEnDbNqnkqi7zRzKXeKwYJLmLglSmjy1XOSf6kmvj5sfhP6lSjGvBO0RfMb67y6RO8/PaLl5+OGaX2QXQVAs2Q1Pt80hX7q+ppO8HxlXriiWbiPBSTvCv/Q90eUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdYtt9nnoIB/5q1WHfjK0FVNHr/LKcNeEH7NMeuHnHE=;
 b=aL/9J9DLIhXz12h18rvYJBAiRMEKkqlLZIHif6CMYn3LQpv3l0eWdJXukUD4chs4k+DvYNCnT1p6j5ygf501FFaL1ZPjRJP93s+GTBe0Rg/aMFmpzyX8J74E/GtxC6oojRJxqazEqdC6tynbxkqJ3xNn8NRX5dCR2dHBM7XbQqMDhhv/nsW1jBsjMGW50aQt7k2pkm25eOHANxTPdjamC0lgQ9mG/4p9Lyw2nM4zlVvfedUPWmqEAJQT2147oT1wFSWhBTFxQdHo13Djpcsxf9dZPbQ6ULJ2f2ktp9XmFnYZgcU9YtURqyRSSZUQn7qQO+eW1VMwPY0gHprXxnaboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdYtt9nnoIB/5q1WHfjK0FVNHr/LKcNeEH7NMeuHnHE=;
 b=qRSxe55oQrQsvGPLGDOgqLwNJgQOxZMH22PZLJpSXjnRU0HFAG36HlQh/6pwVVf+nvd8o04Z5YRWv+dhA4QF45olsOLeQkvYis3mTt9j3H/hQm/2DbRhkvtzmXUqZ55MG0aH4QapsO6xMNrzvhfDfZZj0so3ib1a0JYYOHL39DU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3658.eurprd04.prod.outlook.com (52.134.65.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.31; Mon, 24 Feb 2020 11:44:23 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 11:44:23 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
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
Thread-Index: AQHV6r4pAecyWfgb902OwJH5EZ8Ix6gqIxCAgAAQU5A=
Date:   Mon, 24 Feb 2020 11:44:22 +0000
Message-ID: <DB3PR0402MB391637EB54A1FD37059FBE47F5EC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
 <20200224102211.clzqw4vtzc4nz5df@pengutronix.de>
In-Reply-To: <20200224102211.clzqw4vtzc4nz5df@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 81c0c538-46f1-43ac-8177-08d7b91ee489
x-ms-traffictypediagnostic: DB3PR0402MB3658:|DB3PR0402MB3658:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB365819E08248EE6577205138F5EC0@DB3PR0402MB3658.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(5660300002)(66476007)(81166006)(8676002)(64756008)(66446008)(81156014)(2906002)(8936002)(66946007)(76116006)(66556008)(33656002)(71200400001)(86362001)(7416002)(478600001)(55016002)(6506007)(9686003)(44832011)(26005)(186003)(7696005)(6916009)(316002)(54906003)(52536014)(4326008)(142923001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3658;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+S6AQ6HACqVDGItV/695xHu+qD+NVKA6mcZYg5NjWYR9mbbWZ3Iz06yOa9z1PyXUx8tQv1zMQ0frt/RwA7WnAgfJ3Gl3e/kFiifkoRuQ2Du/zrqx8QzxWYWgVHLTN6qcdmqi1OvwdUZIyUGjlKAPU/TOYs3BP1eqJzVsw+lEs9lL2v2Mi1l+QSicOTm6emF9eoQ2/frktwqasoQavtN4bdv1ZJ6Ap+2MCqsHmElmJGjXxDXW3IHBjMjiqelRfH3NEekOd7BtQnYCCN1VxCATCByFLfCb0nHEi6CW6ilPm3QCRK5eb7eFw9EA417zak076956ubzShI4J6jw6m6+JMMeqswzIDKaQoFo4qcuOLfYHxdlRv4+sAnV0+1StTtZmFONZs9CP+/9hAFj506FCcvvWJD638LWflDhtPagt/WBjqpHF1vsxNwRTj1+397Xq00s9BNw9nLECEgRdviL2bJlxlCARRcGocoYNfNiPeleug297H0cU72dvyiirohO
x-ms-exchange-antispam-messagedata: du15b1p3kV5XsNf2TGR6FGomFJqhdsaC7o41a12jWwnV19a5A3OukrN4UaUWKdCV1zlUMkluU/1o9Opcz8F9U1/rRdbg7KePuIjab8kMMIF7CQ5j5wBRm4o91LIHyN+uB9/qcXtsNMrw/2psTAeZ8A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c0c538-46f1-43ac-8177-08d7b91ee489
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 11:44:22.9929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wr0uJqGwjdL6O7wsJkQHjN9FFAgIj8U2otibbOcF7SQxF5Axbz/eFQz7qEQ9TqD2yVKrqP13CxoT/o2ohJZlyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3658
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIFV3ZQ0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHdhdGNoZG9nOiBpbXgyX3dkdDogRHJv
cCAucmVtb3ZlIGNhbGxiYWNrDQo+IA0KPiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAxMDo1MToy
N0FNICswODAwLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gPiAucmVtb3ZlIGNhbGxiYWNrIGltcGxl
bWVudGF0aW9uIGRvZXNuJyBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpDQo+ID4gd2hpY2gg
aXMgYnVnZ3ksIGFjdHVhbGx5LCB3ZSBjYW4ganVzdCB1c2UNCj4gPiBkZXZtX3dhdGNoZG9nX3Jl
Z2lzdGVyX2RldmljZSgpIGFuZA0KPiA+IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIHRvIGhh
bmRsZSBhbGwgbmVjZXNzYXJ5IG9wZXJhdGlvbnMgZm9yDQo+ID4gcmVtb3ZlIGFjdGlvbiwgdGhl
biAucmVtb3ZlIGNhbGxiYWNrIGNhbiBiZSBkcm9wcGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvd2F0Y2hkb2cvaW14Ml93ZHQuYyB8IDM3DQo+ID4gKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMjcg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9pbXgy
X3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9pbXgyX3dkdC5jDQo+ID4gaW5kZXggZjhkNThiZi4u
MWZlNDcyZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2lteDJfd2R0LmMNCj4g
PiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL2lteDJfd2R0LmMNCj4gPiBAQCAtMjQ0LDYgKzI0NCwx
MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcNCj4gaW14Ml93ZHRfcmVnbWFw
X2NvbmZpZyA9IHsNCj4gPiAgCS5tYXhfcmVnaXN0ZXIgPSAweDgsDQo+ID4gIH07DQo+ID4NCj4g
PiArc3RhdGljIHZvaWQgaW14Ml93ZHRfYWN0aW9uKHZvaWQgKmRhdGEpIHsNCj4gPiArCWNsa19k
aXNhYmxlX3VucHJlcGFyZShkYXRhKTsNCj4gDQo+IERvZXMgdGhpcyBoYXZlIHRoZSBlZmZlY3Qg
b2Ygc3RvcHBpbmcgdGhlIHdhdGNoZG9nPyBNYXliZSB3ZSBjYW4gaGF2ZSBhDQo+IG1vcmUgZXhw
cmVzc2l2ZSBmdW5jdGlvbiBuYW1lIGhlcmUgKGlteDJfd2R0X3N0b3BfY2xrIG9yIHNpbWlsYXIp
Pw0KDQpUaGlzIGFjdGlvbiBpcyBPTkxZIGNhbGxlZCB3aGVuIHByb2JlIGZhaWxlZCBvciBkZXZp
Y2UgaXMgcmVtb3ZlZCwgYW5kIGlmIHdhdGNoZG9nDQppcyBydW5uaW5nLCB0aGUgY29yZSBkcml2
ZXIgd2lsbCBwcmV2ZW50IGl0IGZyb20gYmVpbmcgcmVtb3ZlZC4NCg0KPiANCj4gSXMgdGhlcmUg
c29tZSB3YXRjaGRvZyBjb3JlIHBvbGljeSB0aGF0IHRlbGxzIGlmIHRoZSB3YXRjaGRvZyBzaG91
bGQgYmUNCj4gc3RvcHBlZCBvbiB1bmxvYWQ/DQoNCndhdGNoZG9nX3N0b3Bfb25fdW5yZWdpc3Rl
cigpIHNob3VsZCBiZSBjYWxsZWQgaW4gLnByb2JlIGZ1bmN0aW9uIHRvIG1ha2UgY29yZQ0KcG9s
aWN5IHN0b3AgdGhlIHdhdGNoZG9nIGJlZm9yZSByZW1vdmluZyBpdCwgYnV0IEkgdGhpbmsgdGhp
cyBkcml2ZXIgZG9lcyBOT1QgY2FsbA0KaXQsIG1heWJlIEkgc2hvdWxkIGFkZCB0aGUgQVBJIGNh
bGwsIG5lZWQgR3VlbnRlciB0byBoZWxwIGNvbmZpcm0uDQoNCj4gDQo+ID4gK30NCj4gPiArDQo+
ID4gIHN0YXRpYyBpbnQgX19pbml0IGlteDJfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpICB7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+
IEBAIC0yOTIsNiArMjk3LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGlteDJfd2R0X3Byb2JlKHN0
cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCXJl
dHVybiByZXQ7DQo+ID4NCj4gPiArCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYs
IGlteDJfd2R0X2FjdGlvbiwgd2Rldi0+Y2xrKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0
dXJuIHJldDsNCj4gPiArDQo+ID4gIAlyZWdtYXBfcmVhZCh3ZGV2LT5yZWdtYXAsIElNWDJfV0RU
X1dSU1IsICZ2YWwpOw0KPiA+ICAJd2RvZy0+Ym9vdHN0YXR1cyA9IHZhbCAmIElNWDJfV0RUX1dS
U1JfVE9VVCA/DQo+IFdESU9GX0NBUkRSRVNFVCA6IDA7DQo+ID4NCj4gPiBAQCAtMzE1LDMyICsz
MjQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpbXgyX3dkdF9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAJICovDQo+ID4gIAlyZWdtYXBfd3JpdGUod2Rldi0+cmVn
bWFwLCBJTVgyX1dEVF9XTUNSLCAwKTsNCj4gPg0KPiA+IC0JcmV0ID0gd2F0Y2hkb2dfcmVnaXN0
ZXJfZGV2aWNlKHdkb2cpOw0KPiA+IC0JaWYgKHJldCkNCj4gPiAtCQlnb3RvIGRpc2FibGVfY2xr
Ow0KPiA+IC0NCj4gPiAtCWRldl9pbmZvKGRldiwgInRpbWVvdXQgJWQgc2VjIChub3dheW91dD0l
ZClcbiIsDQo+ID4gLQkJIHdkb2ctPnRpbWVvdXQsIG5vd2F5b3V0KTsNCj4gDQo+IERvZXMgdGhl
IGNvcmUgcHV0IHRoaXMgaW5mbyBpbiB0aGUga2VybmVsIGxvZz8gSWYgbm90IGRyb3BwaW5nIGl0
IGlzbid0IG9idmlvdXNseQ0KPiByaWdodCBlbm91Z2ggdG8gYmUgZG9uZSBlbiBwYXNzYW50Lg0K
DQpUaGlzIGlzIGp1c3QgYW4gaW5mbyBmb3IgdXNlciB3aGljaCBJIHRoaW5rIE5PVCB1bm5lY2Vz
c2FyeSwgc28gSSBkcm9wIGl0IGluIHRoaXMgcGF0Y2gNCmFzIHdlbGwuDQoNCj4gDQo+ID4gLQly
ZXR1cm4gMDsNCj4gPiAtDQo+ID4gLWRpc2FibGVfY2xrOg0KPiA+IC0JY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKHdkZXYtPmNsayk7DQo+ID4gLQlyZXR1cm4gcmV0Ow0KPiA+IC19DQo+ID4gLQ0KPiA+
IC1zdGF0aWMgaW50IF9fZXhpdCBpbXgyX3dkdF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikgLXsNCj4gPiAtCXN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkb2cgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiAtCXN0cnVjdCBpbXgyX3dkdF9kZXZpY2UgKndkZXYg
PSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZG9nKTsNCj4gPiAtDQo+ID4gLQl3YXRjaGRvZ191bnJl
Z2lzdGVyX2RldmljZSh3ZG9nKTsNCj4gPiAtDQo+ID4gLQlpZiAoaW14Ml93ZHRfaXNfcnVubmlu
Zyh3ZGV2KSkgew0KPiA+IC0JCWlteDJfd2R0X3Bpbmcod2RvZyk7DQo+ID4gLQkJZGV2X2NyaXQo
JnBkZXYtPmRldiwgIkRldmljZSByZW1vdmVkOiBFeHBlY3QgcmVib290IVxuIik7DQo+ID4gLQl9
DQo+IA0KPiBJIGFsc28gd29uZGVyIGFib3V0IHRoaXMgb25lLiBUaGlzIGNoYW5nZXMgdGhlIHRp
bWluZyBiZWhhdmlvdXIgYW5kIHNvDQo+IElNSE8gc2hvdWxkbid0IGJlIGRvbmUgYXMgYSBzaWRl
IGVmZmVjdCBvZiBhIGNsZWFudXAgcGF0Y2guDQoNCkd1ZW50ZXIgaGFzIGEgY29tbWVudCBvZiAi
dXNlIGRldm1fd2F0Y2hkb2dfcmVnaXN0ZXJfZGV2aWNlKCksIGFuZCB0aGUgd2F0Y2hkb2cgc3Vi
c3lzdGVtDQpzaG91bGQgcHJldmVudCByZW1vdmFsIGlmIHRoZSB3YXRjaGRvZyBpcyBydW5uaW5n
ICIsIHNvIEkgdGhvdWdodCBubyBuZWVkIHRvIGNoZWNrIHRoZSB3YXRjaGRvZydzDQpzdGF0dXMg
aGVyZSwgYnV0IGFmdGVyIGZ1cnRoZXIgY2hlY2sgdGhlIGNvcmUgY29kZSBvZiB3YXRjaGRvZ19j
ZGV2X3VucmVnaXN0ZXIoKSBmdW5jdGlvbiwgSSBPTkxZDQpzZWUgaXQgd2lsbCBjaGVjayB3aGV0
aGVyIG5lZWQgdG8gc3RvcCB3YXRjaGRvZyBiZWZvcmUgdW5yZWdpc3RlciwNCg0KLi4uDQoNCjEw
ODMgICAgICAgICBpZiAod2F0Y2hkb2dfYWN0aXZlKHdkZCkgJiYNCjEwODQgICAgICAgICAgICAg
dGVzdF9iaXQoV0RPR19TVE9QX09OX1VOUkVHSVNURVIsICZ3ZGQtPnN0YXR1cykpIHsNCjEwODUg
ICAgICAgICAgICAgICAgIHdhdGNoZG9nX3N0b3Aod2RkKTsNCjEwODYgICAgICAgICB9DQoNCkhp
LCBHdWVudGVyDQoJRG8geW91IHRoaW5rIHdhdGNoZG9nX3N0b3Bfb25fdW5yZWdpc3RlcigpIHNo
b3VsZCBiZSBjYWxsZWQgaW4gLnByb2JlIGZ1bmN0aW9uIHRvDQptYWtlIHdhdGNoZG9nIHN0b3Ag
YmVmb3JlIHVucmVnaXN0ZXI/DQoNClRoYW5rcywNCkFuc29uLg0K
