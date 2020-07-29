Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D832318D8
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 07:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgG2FCk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 01:02:40 -0400
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]:60629
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725986AbgG2FCj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 01:02:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc2ymKO8JSkpqQo5vmGi42+yblR9+GwNoaB/Q/9CUTi6JVGBAOiqrDEtHp9SZXGCoWnO7cOoyI7PhI1FDFp7MjYn/4nkJCSGDjlVsPNJxt34mEY85qhoxYt8+FINKmhjUixCY2NxU/29ALAsYWv1AZzegrK/7TVqsHvVtb+kVtg9tGgyvPKJN/dtYM5eSm6Qz8C0hM1VWSXpByuyeHTABXAnEeYGEbv3NHVmeQYXby5qLbm/JjH6wBDFW02QquEg7w3r/dMIkc68iOqDljRNS9uLur6jjOfe0DbqKYlWfziSxPNKHd7WY2Ju4EP+Gl0GFXKAyMGIh4mLJqxSHyRGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gl9y+kEKXff4dMnb99WMPT0KU2472V8KgkbfOQ6ooY=;
 b=SJfKWDFxszdU0pFunZymAS+b4lPP6xL6gOHQQktCqe1vOQEU6gmHhFaSJuK22pcQEBalcGPYeXINvThIoX+0puPLkehodeh0lhYxHeqbIlp80jqu7O8+r0Sgyn/NFvAIR0xGefoeigY9A5jhrLhZ1oMVEZo4WHTrtAGo1inKCvsicGv5ZjOXyNPhFL+jw6dhWMUXLXhMpNsCuAMghPxvu8LjuJXn3TWUhWEFQp9PhlkA3inBdVC/jEpUKNNdfZCGgheAI1yIVC7mRfOj6WCzauECvkHwKB7vrvMfemcB0dOo0sSgS/wIdTJMAethG/Z+x2ji5KC0wL4fQYKe7BG5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gl9y+kEKXff4dMnb99WMPT0KU2472V8KgkbfOQ6ooY=;
 b=gf8tXoh7IvtsBavyUgLtPfCowwe8j0RvyNho0w03mtCZGhTTkaTCKtA6HvUwPkzSR/IF0Jd+66xPyX3mHA5eAmkZ13gzjMTDC6wbxKCHzUJV0uTbkVfEC+IAp2q3Ond+g5dmlrO7d0Pvh6dAR1CqzzRGU+k77hkIieHqeLwbzN4=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB6PR0401MB2375.eurprd04.prod.outlook.com (2603:10a6:4:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 29 Jul
 2020 05:02:33 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 05:02:33 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Thread-Topic: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
Thread-Index: AQHWZU9toVNXTyNlR0yNnyvd1DR7Makd8woAgAAEoFCAAAamIA==
Date:   Wed, 29 Jul 2020 05:02:33 +0000
Message-ID: <DB3PR0402MB3916B38E7DA20A35403F5B1EF5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
 <00587a78-8069-4fbd-7e02-b774d541f75a@roeck-us.net>
 <DB3PR0402MB3916C412DE1E83A2D40B2341F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916C412DE1E83A2D40B2341F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: db0fb9d7-46a9-481b-3d25-08d8337c9a88
x-ms-traffictypediagnostic: DB6PR0401MB2375:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB23754CD2AC94B87834253E58F5700@DB6PR0401MB2375.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eMWofhjn4LkzyrRMxvqg4wYukMAqVxP0sO9ysOXjpzFt4tvUg0yoqF83dCfv06Net1rUmGQS/KMMyyWJD5SB1QgCapIS6ni7ZS+XdBiKvkZdRs7uTuNxNcomN+nzfWsOfEUV8/qSovAOGDE1t/swPJxIxcTwdEER4OHUtdQaiSwLm4HUlKaJst7tJtA2aTmlHGkW8K6aLpURf09AfG8BmXAT4QinI9Vr2RrA01dGwyY4M+lJjdkSPCkMb/1Du682xIJCSOHtbzzTGjRMpXHa5QJflHcPEr8e913fWLta0vV5DLV42S9dKg+O6woDDB4GXRv1N0JKLSJhySiYmR9QsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(478600001)(26005)(186003)(44832011)(86362001)(83380400001)(33656002)(9686003)(66556008)(76116006)(53546011)(66446008)(52536014)(66476007)(8936002)(5660300002)(7696005)(55016002)(6506007)(64756008)(8676002)(316002)(2940100002)(110136005)(71200400001)(2906002)(4326008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uY2PwIJJbdQaaeVf6JvOuWmcNoPcbmH6pR8YHFycCHbTkMfu9ZKMgzQFTmyCeXQHgr0ibqq6OzKu3FBOp596kLFqiyt5t9Q3rEpw+/zoh2a0ZFrxBAXdP6o9PO/PcTYPaBusvXo54YhTQpg8tKaMIiqYhoRZ19IcwVPf0aHltCCJ1uX+t38ubXhTEgPa2aMpKcMLApKO4F7AcbCcG0Oz+Zu//QtwM2qNAkzgowc7P9OhdJ6q37NcT1RSmR8Ktkatj7K0YzZZo8NnDlUjMx7Z8BUeOfpXyiv+xXIYqTFACIPEsKO1+LKnYj6DRLY5/V/Hp2Kq/LI6YrWCnhrrS9rftfoEIdwE1WzTsK95Zj6n/j9h8poweFrPCNaniuvhz6ZSPn0FhHtOASKT46/zibbrD2MxQO9qHJImdJfku0ChVQLIVPmRS7J/lB56pvf1HyQb3DzdCdtoNaatDBRwUEYATPG5vOlKxQnWjUKwEVvdSf4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0fb9d7-46a9-481b-3d25-08d8337c9a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 05:02:33.2947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RyPx0HHVW4CTR8BOqCpDMiDVd03N/H2/M4DJLlA3lkSeiIQJ9QZ9j4DHI9QxH/YRA1ax5DcxFTBdMG8GrscG4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2375
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggVjIgMS8yXSB3YXRjaGRvZzog
aW14N3VscDogU3RyaWN0bHkgZm9sbG93IHRoZSBzZXF1ZW5jZQ0KPiBmb3Igd2RvZyBvcGVyYXRp
b25zDQo+IA0KPiBIaSwgR3VlbnRlcg0KPiANCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBW
MiAxLzJdIHdhdGNoZG9nOiBpbXg3dWxwOiBTdHJpY3RseSBmb2xsb3cgdGhlDQo+ID4gc2VxdWVu
Y2UgZm9yIHdkb2cgb3BlcmF0aW9ucw0KPiA+DQo+ID4gT24gNy8yOC8yMCA3OjIwIFBNLCBBbnNv
biBIdWFuZyB3cm90ZToNCj4gPiA+IEFjY29yZGluZyB0byByZWZlcmVuY2UgbWFudWFsLCB0aGUg
aS5NWDdVTFAgV0RPRydzIG9wZXJhdGlvbnMgc2hvdWxkDQo+ID4gPiBmb2xsb3cgYmVsb3cgc2Vx
dWVuY2U6DQo+ID4gPg0KPiA+ID4gMS4gZGlzYWJsZSBnbG9iYWwgaW50ZXJydXB0czsNCj4gPiA+
IDIuIHVubG9jayB0aGUgd2RvZyBhbmQgd2FpdCB1bmxvY2sgYml0IHNldDsgMy4gcmVjb25maWd1
cmUgdGhlIHdkb2cNCj4gPiA+IGFuZCB3YWl0IGZvciByZWNvbmZpZ3VyYXRpb24gYml0IHNldDsg
NC4gZW5hYmVsIGdsb2JhbCBpbnRlcnJ1cHRzLg0KPiA+ID4NCj4gPiA+IFN0cmljdGx5IGZvbGxv
dyB0aGUgcmVjb21tZW5kZWQgc2VxdWVuY2UgY2FuIG1ha2UgaXQgbW9yZSByb2J1c3QuDQo+ID4g
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+
DQo+ID4gPiAtLS0NCj4gPiA+IENoYW5nZXMgc2luY2UgVjE6DQo+ID4gPiAJLSB1c2UgcmVhZGxf
cG9sbF90aW1lb3V0X2F0b21pYygpIGluc3RlYWQgb2YgdXNsZWVwX3JhbmdlcygpIHNpbmNlDQo+
ID4gPiBJUlEgaXMNCj4gPiBkaXNhYmxlZC4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvd2F0
Y2hkb2cvaW14N3VscF93ZHQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+ID4gPiBiL2RyaXZlcnMv
d2F0Y2hkb2cvaW14N3VscF93ZHQuYyBpbmRleCA3OTkzYzhjLi43ZDJiMTJlIDEwMDY0NA0KPiA+
ID4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL3dhdGNoZG9nL2lteDd1bHBfd2R0LmMNCj4gPiA+IEBAIC01LDYgKzUsNyBAQA0KPiA+ID4N
Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2lv
Lmg+DQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiA+ID4gICNpbmNsdWRlIDxs
aW51eC9rZXJuZWwuaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gPiAg
I2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gPiBAQCAtMzYsNiArMzcsNyBAQA0KPiA+ID4gICNk
ZWZpbmUgREVGQVVMVF9USU1FT1VUCTYwDQo+ID4gPiAgI2RlZmluZSBNQVhfVElNRU9VVAkxMjgN
Cj4gPiA+ICAjZGVmaW5lIFdET0dfQ0xPQ0tfUkFURQkxMDAwDQo+ID4gPiArI2RlZmluZSBXRE9H
X1dBSVRfVElNRU9VVAkxMDAwMA0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgYm9vbCBub3dheW91dCA9
IFdBVENIRE9HX05PV0FZT1VUOw0KPiA+IG1vZHVsZV9wYXJhbShub3dheW91dCwNCj4gPiA+IGJv
b2wsIDAwMDApOyBAQCAtNDgsMTcgKzUwLDMxIEBAIHN0cnVjdCBpbXg3dWxwX3dkdF9kZXZpY2Ug
ew0KPiA+ID4gIAlzdHJ1Y3QgY2xrICpjbGs7DQo+ID4gPiAgfTsNCj4gPiA+DQo+ID4gPiArc3Rh
dGljIGlubGluZSB2b2lkIGlteDd1bHBfd2R0X3dhaXQodm9pZCBfX2lvbWVtICpiYXNlLCB1MzIg
bWFzaykgew0KPiA+ID4gKwl1MzIgdmFsID0gcmVhZGwoYmFzZSArIFdET0dfQ1MpOw0KPiA+ID4g
Kw0KPiA+ID4gKwlpZiAoISh2YWwgJiBtYXNrKSkNCj4gPiA+ICsJCVdBUk5fT04ocmVhZGxfcG9s
bF90aW1lb3V0X2F0b21pYyhiYXNlICsgV0RPR19DUywgdmFsLA0KPiA+ID4gKwkJCQkJCSAgdmFs
ICYgbWFzaywgMCwNCj4gPiA+ICsJCQkJCQkgIFdET0dfV0FJVF9USU1FT1VUKSk7DQo+ID4NCj4g
PiBJIGFtIG5vdCBhIGZyaWVuZCBvZiBXQVJOX09OLCBlc3BlY2lhbGx5IGluIHNpdHVhdGlvbnMg
bGlrZSB0aGlzLg0KPiA+IFBsZWFzZSBleHBsYWluIHdoeSB0aGlzIGlzIG5lZWRlZCwgYW5kIHdo
eSBhIHJldHVybiBvZiAtRVRJTUVET1VUIGlzDQo+ID4gbm90IGZlYXNpYmxlLg0KPiANCj4gT0ss
IEkgd2lsbCB1c2UgcmV0dXJuIHZhbHVlIG9mIC1FVElNRU9VVCBhbmQgaGFuZGxlIGl0IGluIHRo
ZSBjYWxsZXIuDQoNCkFmdGVyIGEgZnVydGhlciBsb29rLCBzb21lIG9mIHRoZSBpbXg3dWxwX3dk
dF93YWl0ICgpIGNhbGxlcnMgYXJlIHZvaWQgZnVuY3Rpb24sIHNvIGlmIHdhbnQNCnRvIGhhbmRs
ZSB0aGUgcmV0dXJuIHZhbHVlLCBhbGwgdGhvc2UgZnVuY3Rpb25zIHJldHVybiB0eXBlIG5lZWQg
dG8gYmUgY2hhbmdlZC4gQW5kLCB3aGVuDQp0aGUgcmV0dXJuIHZhbHVlIGlzIC1FVElNRURPVVQs
IHRoZSBPTkxZIGFjdGlvbiBpcyB0byBwcmludCBvdXQgc29tZSBlcnJvciBtZXNzYWdlDQpmb3Ig
dGhlc2Ugdm9pZCBmdW5jdGlvbiwgbmVlZCB0byB1c2UgcHJfZXJyKCkgZHVlIHRvIG5vIGRldiBw
b2ludGVyIGF2YWlsYWJsZSwgc28NCmRvIHlvdSB0aGluayBpdCBpcyBhY2NlcHRhYmxlIHRvIGp1
c3QgcmVwbGFjZSB0aGUgV0FSTl9PTiB3aXRoIHByX2VycigpIGFzIGJlbG93Pw0KDQorCWlmICgh
KHZhbCAmIG1hc2spKSB7DQorCQlpZiAocmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhiYXNlICsg
V0RPR19DUywgdmFsLA0KKwkJCQkJCSAgdmFsICYgbWFzaywgMCwNCisJCQkJCQkgIFdET0dfV0FJ
VF9USU1FT1VUKSkNCisgICAgICAgICAgIHByX2Vycigid2RvZyB3YWl0IHRpbWVvdXQsIG1hc2sg
MHgleFxuIiwgbWFzayk7DQorICAgfQ0KDQpUaGFua3MsDQpBbnNvbg0KDQo=
