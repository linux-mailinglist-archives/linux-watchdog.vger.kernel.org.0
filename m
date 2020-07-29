Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADDB232033
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 16:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgG2ORc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 10:17:32 -0400
Received: from mail-eopbgr130040.outbound.protection.outlook.com ([40.107.13.40]:48191
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726581AbgG2ORc (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 10:17:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeH90YbPlSt7ypRJ1veRKj16XcrGh3qr9aYxW54getdcELCuo6IKjqJOxpdfjlF4A+/l/PbrTawtjecZe/Pzq3scLo2Y42Fo0/XMZqJU3ZQsHa4ATUpxCMWVlW0fMOxF6uhj6wBKVw3rNAg/zJIJPeAvQx6/fGJTxrg3Jx2lXpy5g6qdo6A2mkiLHhKfCVAEH3UgM1M9GQWgyDYhHGfwP7iNjh4ZTuzHmAFOWdm9OgBy36HhFvRW5AasOj1U1M3X0Fny/nZ1m3SLTM/PsI5nB0KabulbKG05nFm3HP/kmEvWSP0/qysmYkT9jHcW7DA7SRbDXaYXFblYWIfJNZbBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zYvzCCJZJ11GKm/tLngDyensMDogiHTwj6aKXcLyrc=;
 b=M8OsS0s5AF35eceeWLpbDTqbHU9zAHD9VbDBUQ3xM4T6oeRFy+jySMQlzjAlPs8RifdwTSXgVapRl9QugsnsImQjfV/9xlifw+wC1vDI9cMYGL4H66eaq8bXphVrkOZVbFKBJytUbcukpvvta/bkAye9F48ndRNbNqDTofONDQ2LC42OoyiL934PBSvOUnEO+N2K2jB38/kdOQco0w2Ccc7YIlUq0WQQmnBPFwRyyjGy4WY9eE9lokNb3DVbwliv5rq7vQUzqAU1G0f5yD3cUWaXW+iyXVpirJCtt9+kRISIK+vu+Kld3zzr/yqs+Il5lqhZ+tQQ+ljCsYVNkabc6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zYvzCCJZJ11GKm/tLngDyensMDogiHTwj6aKXcLyrc=;
 b=RSYD1so/Kmi7yvddzTAIxbk2RlaysMhSe35il6sXy/xhKGEaZVRKMND22FOFmTHosxGQjg0lkzpvQ8lf4YplNREXQNAsxcEMFaBnz+iGgWPFZ+jal3JsETz98DsgZqRRTdWCQMamNfIWR8JaC+n0qZyZ/GKDKQCbhdpAkPCYqZk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB8PR04MB5658.eurprd04.prod.outlook.com (2603:10a6:10:b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 29 Jul
 2020 14:17:27 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 14:17:27 +0000
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
Thread-Index: AQHWZU9toVNXTyNlR0yNnyvd1DR7Makd8woAgAAEoFCAAKKOAIAAAOIg
Date:   Wed, 29 Jul 2020 14:17:26 +0000
Message-ID: <DB3PR0402MB3916A03896012BC96A861882F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
 <00587a78-8069-4fbd-7e02-b774d541f75a@roeck-us.net>
 <DB3PR0402MB3916C412DE1E83A2D40B2341F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <6ac07203-a966-f985-52ae-b3dd264b3786@roeck-us.net>
In-Reply-To: <6ac07203-a966-f985-52ae-b3dd264b3786@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.23.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0c0aaad0-3ffc-451c-05b0-08d833ca1f1a
x-ms-traffictypediagnostic: DB8PR04MB5658:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB565894CBED09C80427E9F36AF5700@DB8PR04MB5658.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nAa4eGBU7FY9YmvGqfPvgDspPC1ke4tIyIv7C2X2zZb/zG5cjpEZo6+9rWGOtonTIkELD+PyQRib/40n/arPaUGh8VDYktXTzsjpKK4AtrEvL+0HvYwu8I0bQXxuFYfubIWYkm2EyKjlUzPB9bvJHGnN8YuA/3c274L8M+mN99BoMHJFbpdcU3Y2z4pPBJuHvAe7DpvJ5b/PM0uQzS8eRW5cqE3Icb9IY3mnDa/wY8xhAmmX4YSMRfy+vpYUKwPDHeNFjG2TsalCXomVhuIuXhqg5B/8OobAzpDFol6erUWikv/VnU8QkIACuChvlEE6zKNDdEyOlN0Xh1oRcWdCOw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(478600001)(33656002)(83380400001)(9686003)(2906002)(8936002)(4326008)(8676002)(55016002)(44832011)(71200400001)(5660300002)(6506007)(52536014)(316002)(7696005)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(110136005)(53546011)(26005)(186003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 2K761aIKklb7DUObwnSSDAQGOWguZUudbS7PCXeWxkR8fJW/lvDCBp6rX3BruN7TA+TpOXO2wMLoRBQoXa3QxAyf7A4AD4aagfNNFHwq3gZXEoSSI+9sQFX65b3ZlWrUg0ksiV7UYepUJub3dnv+KYQC1L9HXamnJcjsj5qD/JhFabvNTGMq14xbx0kZqDMZj2jAXbUjVmFtVJ/SRpk53Mbd1v0sXJedcesjFYy3OI83BaOHriRu1hVPtGDfGJ5jA35ZTH10CLmmSsRGWosrMkUfpRwrsc1O6Ikda4Am+Q6OqNLfX1ta2wfV+Y2YcCPVdF7bX634lvUWX4FE20hLrTiyFiVRCMcu1Et1EFlt6jo3Z72l48hWAhNVWesH/0rgbAuTvgpPiYAi4XF8n838qQ+twmxFXfqdUuvi7NUiOc1rB4hzDp7pMJafOyY2UolfwcbyJ4FtrQrfhSzFpogFi/n4kC5jJbyWdVe2LFHaO4W0kLM6PE4rnvlx1va9PAZ+HH6mwGGP6wbLow5d49RQ8REJfik2g9vNzptWvWoxoJaVxfNtCe2z81UdBrxtSKV9nAz1/jeXO2fm4SAaEIiUyd3JpxQsEp3gqtSd8x4kOKtPadk7FPRgfrHPJ/vCvoQsTArOI0fOVv0Sfbyl3SqcTg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0aaad0-3ffc-451c-05b0-08d833ca1f1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 14:17:26.9715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdiBKDQw5I96BOwHE2hPzjPUIFl89a3DguZ2kyo2v9iHK3R9hS3WbeK+5yBE+mUiDUsHUyDOd3wD4grFQ/3Osw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5658
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS8yXSB3YXRjaGRvZzog
aW14N3VscDogU3RyaWN0bHkgZm9sbG93IHRoZSBzZXF1ZW5jZQ0KPiBmb3Igd2RvZyBvcGVyYXRp
b25zDQo+IA0KPiBPbiA3LzI4LzIwIDk6NTAgUE0sIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IEhp
LCBHdWVudGVyDQo+ID4NCj4gPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDEvMl0gd2F0
Y2hkb2c6IGlteDd1bHA6IFN0cmljdGx5IGZvbGxvdyB0aGUNCj4gPj4gc2VxdWVuY2UgZm9yIHdk
b2cgb3BlcmF0aW9ucw0KPiA+Pg0KPiA+PiBPbiA3LzI4LzIwIDc6MjAgUE0sIEFuc29uIEh1YW5n
IHdyb3RlOg0KPiA+Pj4gQWNjb3JkaW5nIHRvIHJlZmVyZW5jZSBtYW51YWwsIHRoZSBpLk1YN1VM
UCBXRE9HJ3Mgb3BlcmF0aW9ucyBzaG91bGQNCj4gPj4+IGZvbGxvdyBiZWxvdyBzZXF1ZW5jZToN
Cj4gPj4+DQo+ID4+PiAxLiBkaXNhYmxlIGdsb2JhbCBpbnRlcnJ1cHRzOw0KPiA+Pj4gMi4gdW5s
b2NrIHRoZSB3ZG9nIGFuZCB3YWl0IHVubG9jayBiaXQgc2V0OyAzLiByZWNvbmZpZ3VyZSB0aGUg
d2RvZw0KPiA+Pj4gYW5kIHdhaXQgZm9yIHJlY29uZmlndXJhdGlvbiBiaXQgc2V0OyA0LiBlbmFi
ZWwgZ2xvYmFsIGludGVycnVwdHMuDQo+ID4+Pg0KPiA+Pj4gU3RyaWN0bHkgZm9sbG93IHRoZSBy
ZWNvbW1lbmRlZCBzZXF1ZW5jZSBjYW4gbWFrZSBpdCBtb3JlIHJvYnVzdC4NCj4gPj4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPj4+
IC0tLQ0KPiA+Pj4gQ2hhbmdlcyBzaW5jZSBWMToNCj4gPj4+IAktIHVzZSByZWFkbF9wb2xsX3Rp
bWVvdXRfYXRvbWljKCkgaW5zdGVhZCBvZiB1c2xlZXBfcmFuZ2VzKCkgc2luY2UNCj4gPj4+IElS
USBpcw0KPiA+PiBkaXNhYmxlZC4NCj4gPj4+IC0tLQ0KPiA+Pj4gIGRyaXZlcnMvd2F0Y2hkb2cv
aW14N3VscF93ZHQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4+PiAg
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+ID4+PiBiL2RyaXZlcnMvd2F0Y2hk
b2cvaW14N3VscF93ZHQuYyBpbmRleCA3OTkzYzhjLi43ZDJiMTJlIDEwMDY0NA0KPiA+Pj4gLS0t
IGEvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+ID4+PiArKysgYi9kcml2ZXJzL3dh
dGNoZG9nL2lteDd1bHBfd2R0LmMNCj4gPj4+IEBAIC01LDYgKzUsNyBAQA0KPiA+Pj4NCj4gPj4+
ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ID4+PiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+
ID4+PiArI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiA+Pj4gICNpbmNsdWRlIDxsaW51eC9r
ZXJuZWwuaD4NCj4gPj4+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4+PiAgI2luY2x1
ZGUgPGxpbnV4L29mLmg+DQo+ID4+PiBAQCAtMzYsNiArMzcsNyBAQA0KPiA+Pj4gICNkZWZpbmUg
REVGQVVMVF9USU1FT1VUCTYwDQo+ID4+PiAgI2RlZmluZSBNQVhfVElNRU9VVAkxMjgNCj4gPj4+
ICAjZGVmaW5lIFdET0dfQ0xPQ0tfUkFURQkxMDAwDQo+ID4+PiArI2RlZmluZSBXRE9HX1dBSVRf
VElNRU9VVAkxMDAwMA0KPiA+Pj4NCj4gPj4+ICBzdGF0aWMgYm9vbCBub3dheW91dCA9IFdBVENI
RE9HX05PV0FZT1VUOw0KPiA+PiBtb2R1bGVfcGFyYW0obm93YXlvdXQsDQo+ID4+PiBib29sLCAw
MDAwKTsgQEAgLTQ4LDE3ICs1MCwzMSBAQCBzdHJ1Y3QgaW14N3VscF93ZHRfZGV2aWNlIHsNCj4g
Pj4+ICAJc3RydWN0IGNsayAqY2xrOw0KPiA+Pj4gIH07DQo+ID4+Pg0KPiA+Pj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBpbXg3dWxwX3dkdF93YWl0KHZvaWQgX19pb21lbSAqYmFzZSwgdTMyIG1hc2sp
IHsNCj4gPj4+ICsJdTMyIHZhbCA9IHJlYWRsKGJhc2UgKyBXRE9HX0NTKTsNCj4gPj4+ICsNCj4g
Pj4+ICsJaWYgKCEodmFsICYgbWFzaykpDQo+ID4+PiArCQlXQVJOX09OKHJlYWRsX3BvbGxfdGlt
ZW91dF9hdG9taWMoYmFzZSArIFdET0dfQ1MsIHZhbCwNCj4gPj4+ICsJCQkJCQkgIHZhbCAmIG1h
c2ssIDAsDQo+ID4+PiArCQkJCQkJICBXRE9HX1dBSVRfVElNRU9VVCkpOw0KPiA+Pg0KPiA+PiBJ
IGFtIG5vdCBhIGZyaWVuZCBvZiBXQVJOX09OLCBlc3BlY2lhbGx5IGluIHNpdHVhdGlvbnMgbGlr
ZSB0aGlzLg0KPiA+PiBQbGVhc2UgZXhwbGFpbiB3aHkgdGhpcyBpcyBuZWVkZWQsIGFuZCB3aHkg
YSByZXR1cm4gb2YgLUVUSU1FRE9VVCBpcw0KPiA+PiBub3QgZmVhc2libGUuDQo+ID4NCj4gPiBP
SywgSSB3aWxsIHVzZSByZXR1cm4gdmFsdWUgb2YgLUVUSU1FT1VUIGFuZCBoYW5kbGUgaXQgaW4g
dGhlIGNhbGxlci4NCj4gPg0KPiA+Pg0KPiA+PiBBbHNvLCBJIGRvIG5vdCBiZWxpZXZlIHRoYXQg
YSAxMCBtaWxsaS1zZWNvbmQgdGltZW91dCBpcyB3YXJyYW50ZWQuDQo+ID4+IFRoaXMgd2lsbCBu
ZWVkIHRvIGJlIGJhY2tlZCB1cCBieSB0aGUgZGF0YXNoZWV0Lg0KPiA+Pg0KPiA+DQo+ID4gVGhl
cmUgaXMgbm8gc3VjaCBpbmZvIHByb3ZpZGVkIGluIHJlZmVyZW5jZSBtYW51YWwgb3IgZGF0YXNo
ZWV0LCBidXQgSQ0KPiA+IGp1c3QgZGlkIGFuIGV4cGVyaW1lbnQsIHRoZSB1bmxvY2sgd2luZG93
IGlzIG9wZW4gaW4gbGVzcyB0aGFuIDF1cw0KPiA+IGFmdGVyIHNlbmRpbmcgdW5sb2NrIGNvbW1h
bmQsIGFuZCBPTkxZIGxhc3QgZm9yIE9OTFkgMn4zIHVzIHRoZW4NCj4gPiBjbG9zZSwgdGhlIHJl
Y29uZmlndXJhdGlvbiBzdGF0dXMgYml0IHdpbGwgYmUgc2V0IGluIGxlc3MgdGhhbiAxdXMgYWZ0
ZXIgcmVnaXN0ZXINCj4gd3JpdGUuIFNvIHdoYXQgZG8geW91IHJlY29tbWVuZCBmb3IgdGhpcyB0
aW1lb3V0IHZhbHVlPyAxMDBtUyBmb3Igc2FmZT8NCj4gPg0KPiANCj4gVGhhdCB3b3VsZCBiZSBl
dmVuIHdvcnNlLiBZb3Ugc2F5IHlvdXJzZWxmIHRoYXQgdGhlIHdpbmRvdyBpcyBvbmx5IG9wZW4g
Zm9yIGENCj4gZmV3IG1pY3Jvc2Vjb25kcy4gTm93IHlvdSBhcmUgc3VnZ2VzdGluZyB0byBob2xk
IHRoZSBlbnRpcmUgc3lzdGVtIGhvc3RhZ2UNCj4gZm9yIHVwIHRvDQo+IDEwMCBtUyBpZiB0aGUg
Y29kZSBtaXNzZXMgdGhhdCB3aW5kb3cgZm9yIHNvbWUgcmVhc29uLiBCYXNlZCBvbiB3aGF0IHlv
dQ0KPiBzYWlkLA0KPiAxMDAgdVMgbWlnaHQgYmUgYmFyZWx5IGFjY2VwdGFibGUuIDEwLTIwIHVT
IHdvdWxkIGJlIHJlYXNvbmFibGUuIEJ1dCBub3QNCj4gMTAwIG1TLg0KDQpPSywgSSB3aWxsIHVz
ZSAyMHVzLg0KDQpUaGFua3MsDQpBbnNvbg0KDQoNCg==
