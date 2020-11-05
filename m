Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA9E2A7788
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 07:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgKEGqV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 01:46:21 -0500
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:16878
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725287AbgKEGqT (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 01:46:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOrING0zsMxDiTkyctLvrg5PIBiyY6cKAiWFE51wX+hMGacMHyklE6IvucNHntS2yyPylfgtB+F2E/GOyHNT21rNtkKhR4a1WtdFlQfBDi0djArVVpzSu6ccXd/999B5nt7Cje5+MwBM3TIosxF185DjNBfkHuy/6cEXouWUuBpb45tBOwkteuaR90KBR10mB/VpsRe2s2N0ZjSXDrTRwls5mUUa9kbMyg/rao0IDBj5U+zssIA/pyi/oon8TdKVq7f7/vzVc7Jg48cZsRHInxmVc/sCf5khSX/g7u2sc9H4KJvWlhBwcqaJ9JLjBlbWZM8d8AOxYu3zs94YF5vV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3puFzKNp8/oDweHOcqOyOtf9X1V5Jifr3m3D/bLozw=;
 b=R3HZXfXDARq439o9gY3QEZO5bKKkPRsSDChlcJz9L6l2hlvAlFEYSQlstayMb7LQh1VV/UgnbpOhKDCiLCsN3aNdGA2qBYHbT3lYTz9hSh0x78D9GKV6OM747CQ27ZtS+feADu9Hk4YiYg9Tnd9QrfQrYeGmCnRhavq+kJr6jGFO8y+32KGg8Axj3Nahz5So6UkOUed+w1Gx7oglW8ur+8rps5zLS4rYSPo61LbWW3kaAjxk3VsVZBxlj8fYIgkIbXDXoxoZrItbtAuC8Uk2TSNmcCcM/3dNasu1O3mzqvXKoFD+K+JmSiSl1Ejf+jbjD9iQBZfP5/tnsrRCaqZotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3puFzKNp8/oDweHOcqOyOtf9X1V5Jifr3m3D/bLozw=;
 b=YzzAN4KOmmudjf+3AFe+lri0ZJHEMfWJ3j1oVb16UHkF1nZNvKhH8ycf+nLLc/WF3mhldS0ZjipbMfbmKiWA6BDi0lLN2tnoU3zYD9K9BZTai7dLN4wDl4WX7zS9tSRGo09qiBvHczZkhU5dsGXDknB5d/7qVicyFkh+CVvqIsE=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DBBPR03MB5447.eurprd03.prod.outlook.com (2603:10a6:10:d8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.29; Thu, 5 Nov 2020 06:46:13 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107%7]) with mapi id 15.20.3477.038; Thu, 5 Nov 2020
 06:46:13 +0000
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
Thread-Index: AQHWrQ9DwN0nkcfMkkiJSgq2+hhNRam4KrWAgAD53wA=
Date:   Thu, 5 Nov 2020 06:46:12 +0000
Message-ID: <058913084af32743f2e23228a46944bbfcbd52d2.camel@fi.rohmeurope.com>
References: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <c7a838830b7d5ea1c281e419cf0eff0cc50363e0.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <20201104155153.GQ4488@dell>
In-Reply-To: <20201104155153.GQ4488@dell>
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
x-ms-office365-filtering-correlation-id: 85d1d12a-49b4-44f2-c196-08d881567cf4
x-ms-traffictypediagnostic: DBBPR03MB5447:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR03MB5447F0D575B8C016424A0A7AADEE0@DBBPR03MB5447.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qH6pfWhfpmzUavOF9VuwC8nQUxfnCyDAp991NWP0cxkbrAp6eAnl5X9mQKqANx77ZntQyt7fU/adm3C/I58YCXfcIb7JD9GuJ9zz89m64ImL9rXhu2HKCDOD/65CQXi8sIjI7kizL1ueT/hqmOj4lK5+5zDtpLnrc2VJVwEVK4MQk84d+mrUOlEER0UqVChndxSxmWnMBE9Ipg2e+MwXArVzCw/3pxVbVg1SAFJU6rytJ3hME2Ta63ge7GxHkPJu7JkoC7hhqY8a2+GENP8y0UoamVd9apuBDGJt7g61fIJfDfEqCTRzqEAopXGVagJZGWDLwdObkjMNcSErI4BbFQYZgVDrXuqe3Ky+4ALrio7PlfBonlDmrFAU4qbM8SJFh433UY/Cr2vqJX5PG/d2iw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(136003)(366004)(396003)(376002)(71200400001)(6506007)(66446008)(8676002)(8936002)(66946007)(54906003)(76116006)(66476007)(66556008)(64756008)(316002)(6486002)(86362001)(83380400001)(186003)(91956017)(4326008)(966005)(2906002)(5660300002)(3450700001)(6512007)(478600001)(26005)(6916009)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: J9gLOlWBLJ/4UAIgQ3qDdani2JsVygOsyOLDtJ4I2eZVx5jpDTNMMLOISrvUB2hoNeCbtfthR5ybnwdGODJjTNFX+3xDvIuqybwXIEKiI31KY+QpBqEHznrLwYT0QpwFOeATTfsi1OMoUjl5MpYnFqQEIMpkGR6sekb5dkirwxA7QuK0NSy0kGI1xyg6Cp6jDHxapLZdAOf2jxOdnvNBWchijg2N6brq62HVB68pSUHqMvI8zG5gJOwdi447BEeQ6KAf7fLePNkqd1A2OTWSh9PoxyUPh7lYQkCBFe6rfxbau0/5+qkhmpS1onjKBTZAOjnO6BOgvr3u0gboniPTcdPkt1NRVt7HzqMF56DFzsqtxu556hfXBnJP794jC1v7FsgB3KaohY1OOcphn3S+urm38kdwhFO6jNe58yC8G4cUGPvfcHTM3l0X2tGNJjm62wvgsDLxROG8j/BOGzres06LX45CMf1UP13IR26FQXh8A6i4CLDZyVfplIXKfclpgkR50jbwPJ1FxsmVfAmeCqIHBs36jFaAXRhdylUY4uSGm2lplYqrtErHRp9S/DICpmk+gELYdaJMIRDolxpkhOMUuHrTPz/I8BzLcedMvD1QSwTm2umz0LL0vagqRhVe/ihrFaL9UIHhNqGFAFMC/Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C34B6D0C992194A9A81FECAF855F579@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d1d12a-49b4-44f2-c196-08d881567cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 06:46:13.5161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rhzpmt/UhAPjhLFFf45+dHFypHiKVf/ya6k9ru4HRGh3ddC57B5iHGUzTpBq3yPvZ7U+zIJmBnRrGvUOk8wRYzjhoxBR2Q6DVAj7XO73CInx+EKUQNeoksTuuMwQh79T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB5447
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

TW9ybmluZyBMZWUsDQoNClRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGlzIDopIEkgc2Vl
IG1vc3Qgb2YgdGhlIGNvbW1lbnRzIGJlaW5nDQp2YWxpZC4gVGhlcmUncyB0d28gSSB3b3VsZCBs
aWtlIHRvIGNsYXJpZnkgdGhvdWdoLi4uDQoNCk9uIFdlZCwgMjAyMC0xMS0wNCBhdCAxNTo1MSAr
MDAwMCwgTGVlIEpvbmVzIHdyb3RlOg0KPiBPbiBXZWQsIDI4IE9jdCAyMDIwLCBNYXR0aSBWYWl0
dGluZW4gd3JvdGU6DQo+IA0KPiA+IEFkZCBjb3JlIHN1cHBvcnQgZm9yIFJPSE0gQkQ5NTc2TVVG
IGFuZCBCRDk1NzNNVUYgUE1JQ3Mgd2hpY2ggYXJlDQo+ID4gbWFpbmx5IHVzZWQgdG8gcG93ZXIg
dGhlIFItQ2FyIHNlcmllcyBwcm9jZXNzb3JzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1h
dHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+IC0t
LQ0KPiA+ICsJdW5zaWduZWQgaW50IGNoaXBfdHlwZTsNCj4gPiArDQo+ID4gKwljaGlwX3R5cGUg
PSAodW5zaWduZWQgaW50KSh1aW50cHRyX3QpDQo+ID4gKwkJICAgIG9mX2RldmljZV9nZXRfbWF0
Y2hfZGF0YSgmaTJjLT5kZXYpOw0KPiANCj4gTm90IG92ZXJseSBrZWVuIG9uIHRoaXMgY2FzdGlu
Zy4NCj4gDQo+IFdoeSBub3QganVzdCBsZWF2ZSBpdCBhcyAodWludHB0cl90KT8NCg0KSSBkaWRu
J3QgZG8gc28gYmVjYXVzZSBvbiB4ODZfNjQgdGhlIGFkZHJlc3Mgd2lkdGggaXMgcHJvYmFibHkg
NjQgYml0cw0Kd2hlcmVhcyB0aGUgdW5zaWduZWQgaW50IGlzIGxpa2VseSB0byBiZSAzMiBiaXRz
LiBTbyB0aGUgYXNzaWdubWVudA0Kd2lsbCBjcm9wIGhhbGYgb2YgdGhlIHZhbHVlLiBJdCBkb2Vz
IG5vdCByZWFsbHkgbWF0dGVyIGFzIHZhbHVlcyBhcmUNCnNtYWxsIC0gYnV0IEkgd291bGQgYmUg
c3VycHJpemVkIGlmIG5vIGNvbXBpbGVycy9hbmFseXplcnMgZW1pdHRlZCBhDQp3YXJuaW5nLg0K
DQpJIG11c3QgYWRtaXQgSSBhbSBub3QgMTAwJSBzdXJlIHRob3VnaC4gSSBzdXJlIGNhbiBjaGFu
Z2UgdGhpcyBpZiB5b3UNCmtub3cgaXQgYmV0dGVyPw0KDQo+IFdoYXQgaGFwcGVucyB3aGVuIHlv
dSBkb24ndCBjYXN0IHRvICh1aW50cHRyX3QpIGZpcnN0Pw0KDQpPbiBzb21lIHN5c3RlbXMgYXQg
bGVhc3QgdGhlIGdjYyB3aWxsIHdhcm46DQo+IHdhcm5pbmc6IGNhc3QgZnJvbSBwb2ludGVyIHRv
IGludGVnZXIgb2YgZGlmZmVyZW50IHNpemUgWy1XcG9pbnRlci0NCnRvLWludC1jYXN0XQ0KDQpJ
IGFtIHByZXR0eSBzdXJlIEkgZGlkIGVuZCB1cCB0aGlzIGRvdWJsZSBjYXN0aW5nIHZpYSB0cmlh
bCBhbmQgZXJyb3INCjopDQorDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGJkOTU3eF9vZl9tYXRjaFtdID0gew0KPiA+ICsJew0KPiA+ICsJCS5jb21wYXRpYmxlID0gInJv
aG0sYmQ5NTc2IiwNCj4gPiArCQkuZGF0YSA9ICh2b2lkICopUk9ITV9DSElQX1RZUEVfQkQ5NTc2
LA0KPiA+ICsJfSwNCj4gPiArCXsNCj4gDQo+IFlvdSBjb3VsZCBwdXQgdGhlIDIgbGluZXMgYWJv
dmUgb24gYSBzaW5nbGUgbGluZS4NCg0KQnJhY2VzPyBJIHB1dCBicmFjZXMgb24gc2VwYXJhdGUg
bGluZXMgb24gcHVycG9zZS4gQmVlbiBkb2luZyB0aGlzDQphZnRlciB3ZSBoYWQgdGhpcyBkaXNj
dXNzaW9uOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTgwNzA1MDU1MjI2LkdK
NDk2QGRlbGwvDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTgwNzA2MDcwNTU5LkdX
NDk2QGRlbGwvDQoNCjspDQoNCkkgY2FuIGNoYW5nZSBpdCBpZiB5b3Ugd2lzaGZlZWwgaXQgaXMg
aW1wb3J0YW50IC0gbm90IGEgcG9pbnQgSSBmZWVsDQpsaWtlIGZpZ2h0aW5nIG92ZXIgOykNCg0K
PiANCj4gPiArCQkuY29tcGF0aWJsZSA9ICJyb2htLGJkOTU3MyIsDQo+ID4gKwkJLmRhdGEgPSAo
dm9pZCAqKVJPSE1fQ0hJUF9UWVBFX0JEOTU3MywNCj4gPiArCX0sDQo+ID4gKwl7IH0sDQo+ID4g
K307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGJkOTU3eF9vZl9tYXRjaCk7DQoNCg0K
QmVzdCBSZWdhcmRzDQoJTWF0dGkNCg0KLS0NCk1hdHRpIFZhaXR0aW5lbiwgTGludXggZGV2aWNl
IGRyaXZlcnMNClJPSE0gU2VtaWNvbmR1Y3RvcnMsIEZpbmxhbmQNClNXREMNCktpdmloYXJqdW5s
ZW5ra2kgMUUNCjkwMjIwIE9VTFUNCkZJTkxBTkQNCg0Kfn5+ICJJIGRvbid0IHRoaW5rIHNvLCIg
c2FpZCBSZW5lIERlc2NhcnRlcy4gSnVzdCB0aGVuIGhlIHZhbmlzaGVkIH5+fg0KDQpTaW1vbiBz
YXlzIC0gaW4gTGF0aW4gcGxlYXNlLg0KIm5vbiBjb2dpdG8gbWUiIGRpeGl0IFJlbmUgRGVzY2Fy
dGUsIGRlaW5kZSBldmFuZXNjYXZpdA0KDQooVGhhbmtzIGZvciB0aGUgdHJhbnNsYXRpb24gU2lt
b24pDQoNCg==
