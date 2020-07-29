Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A74E232153
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 17:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgG2PNd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 11:13:33 -0400
Received: from mail-eopbgr150072.outbound.protection.outlook.com ([40.107.15.72]:27268
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726502AbgG2PNb (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 11:13:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jc+9cISRsvHVPoUp5m4ip0hW1UHCJq7DsYJ0X0xiAQ7V9GghEF6zl1Xc5sEBDJfPv4JXlAfyGnOY42CoNstkluf6yMCK0korHCf5kEwruxSohngDdkJ/3HLVEH89tn4HBSP2Z1lBIJGrMdxKsCEUDBfnNaoaE5ynqZe2e3Awc4txhaUHWB1qXidqzyaA6OeyrZL6KomA9lU9HnQoWWUTPFPdz9lnzS+JZkCpOQRErty5co3cUnGxABaV9jr+sGyoIdcCNycHFb+GQny7ngG7CM+i+KBnsOLn+emmLbYKX3/WiwOFcQXHaMVMi3r1mtGDpa+s9sSChtQDNrrDFGQHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NbUSNDIldX7IS5Oy8go0ExfmOX+v8vCTjl0ndzcI1I=;
 b=PmPtlpCB5tVwICp6XeoA4PVl7xgL+nWzsKNzaei4tYFCF0rG8fagw9LkAwSmah2bTL2vu95PYcpHqeAkoLCkQQjxe8luVpplTV6b3lje0MEnuG61dbJ7rRX5P+hK7RVdP52CRvM7fimWYtsB4kLqyZ+RWw3CJcHfn4FI3tJL7IWuyNk5n067AR0kpe7+Qc4yf4Pru1XejvHDnmzWDGqdIEXH4qCUnBQSlJlidDkwGj78XGqBlMzwRIsoNBPigtoR0X47f4oyVeOA5CEtd0H/F1rzGNhqxOy/x6mwnOSU9wHGYl91f0IXNOpJwBIkOujOasC9dUtlwpSkQrkIHNIU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NbUSNDIldX7IS5Oy8go0ExfmOX+v8vCTjl0ndzcI1I=;
 b=cm39eP+FhpAKYeQy/Nnc/RrfE/lGpvFJCtuyVszSlF6nEriwelny152V7WV2uvt3ClwIGsPeJ7UcDMTA9C5fVi7S0uAEf9vaDMocm5BRi3GdueUPmTcUzd9O89aOGm9jzO6DnvJzRXRB++793NMB5jb1QOxEne/zUCfmYM9a/YE=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB5242.eurprd04.prod.outlook.com (2603:10a6:10:18::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 29 Jul
 2020 15:13:27 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::49f8:20ce:cf20:80b3%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 15:13:27 +0000
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
Thread-Index: AQHWZU9toVNXTyNlR0yNnyvd1DR7Makd8woAgAAEoFCAAAamIIAAp48AgAAEAtA=
Date:   Wed, 29 Jul 2020 15:13:27 +0000
Message-ID: <DB3PR0402MB3916042D0F5A19BA3922C9EDF5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
 <00587a78-8069-4fbd-7e02-b774d541f75a@roeck-us.net>
 <DB3PR0402MB3916C412DE1E83A2D40B2341F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916B38E7DA20A35403F5B1EF5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <22e16ed3-355a-70c4-ccc7-aece498b29fb@roeck-us.net>
In-Reply-To: <22e16ed3-355a-70c4-ccc7-aece498b29fb@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.23.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0045917f-c36c-4baf-bba8-08d833d1f1ef
x-ms-traffictypediagnostic: DB7PR04MB5242:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB524258E092329207118E3BECF5700@DB7PR04MB5242.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cCgJLRefcUDY2BExr18TY9eR7SCmzARUq9yjjC2H3QQaDChf7EomIf9rWc1pHcVwYg6k+nyO19mI2SlWy539zTxT1olfLhC7OGTI5nnBQi3JKIxuFJHwFB/bz7VVN96/7+08w4gkJdejiJkvqWQOh5IMMVrrJj3l0BgjAKzP604Lb3bdyPqzYkdXAk5rzKKwOuu7I/ys9VRART9nvK1XQo9p5q7K+J2OP06cebpELejRs4kKxUoWYoMSVVsmKjKFClY8OYkpYC3mgHv8Aaam4Vf6GJRbxyyMknsB8GBmQLtN6fHLtZcUgrmK+PggDBLoDhxJA5v3btR8OKFQ0Me6Vw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(76116006)(316002)(66946007)(8676002)(83380400001)(55016002)(2906002)(33656002)(8936002)(66446008)(52536014)(26005)(4326008)(478600001)(9686003)(186003)(64756008)(86362001)(71200400001)(66476007)(66556008)(44832011)(53546011)(6506007)(7696005)(110136005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: I9hEISRR/B6cRqjILyig5VezvOY17Mcitmqt5Ja+8EvMw93zzer0CpjJZhWTFAfACnwxwxzun8qzbSQ0dE0x2OaAn/TGpN+slGDDhDjWyjrpBHMBHRJ09rLTyqyEBzSO4QqLp9Mn/tcFMwTq1zZUHPY2qmpSTymhOcEeptNAqgMrYPm3ZTOA6GIBFhTOYCL9xnd/1QOke0FWcRJ3iTe5nb7C8hBi2ufEW0IgJ5KGK+EWP/71/tfC13eMhNcsoaKaLFZCWOqyr/0DOG087p50JuTIAEnXThQ3jmscVRtfQaY38bpYwk4IShvpwJncqCBjkKI0COhopcWPGkhLd9GECVBAHiMQHsU1gPhgn4cBz3FiJ74HRENWllX8SzsgnRDRmISKWzVkryRmLeMNffkcUGNT3IBGGT0+TS5zhFqgg9E2yszB4AfBzKUgtoCVRDtPtXYKngNZDUD38wHRhSvjYsO1tl7hkOx7NygY7FrNWxKvw01kLHTLe8HlvwH/UV3A
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0045917f-c36c-4baf-bba8-08d833d1f1ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 15:13:27.1737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiIEa3bb+rZuQkY7lwdcLSfEaAcob8uxOPAaxoUxlyQV4TrfEmlZ5xyvuetfZnXKXUazmjkbgQhQVQlJf8naQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5242
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS8yXSB3YXRjaGRvZzog
aW14N3VscDogU3RyaWN0bHkgZm9sbG93IHRoZSBzZXF1ZW5jZQ0KPiBmb3Igd2RvZyBvcGVyYXRp
b25zDQo+IA0KPiBPbiA3LzI4LzIwIDEwOjAyIFBNLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gPiBI
aSwgR3VlbnRlcg0KPiA+DQo+ID4NCj4gPj4gU3ViamVjdDogUkU6IFtQQVRDSCBWMiAxLzJdIHdh
dGNoZG9nOiBpbXg3dWxwOiBTdHJpY3RseSBmb2xsb3cgdGhlDQo+ID4+IHNlcXVlbmNlIGZvciB3
ZG9nIG9wZXJhdGlvbnMNCj4gPj4NCj4gPj4gSGksIEd1ZW50ZXINCj4gPj4NCj4gPj4NCj4gPj4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMS8yXSB3YXRjaGRvZzogaW14N3VscDogU3RyaWN0bHkg
Zm9sbG93IHRoZQ0KPiA+Pj4gc2VxdWVuY2UgZm9yIHdkb2cgb3BlcmF0aW9ucw0KPiA+Pj4NCj4g
Pj4+IE9uIDcvMjgvMjAgNzoyMCBQTSwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4+Pj4gQWNjb3Jk
aW5nIHRvIHJlZmVyZW5jZSBtYW51YWwsIHRoZSBpLk1YN1VMUCBXRE9HJ3Mgb3BlcmF0aW9ucw0K
PiA+Pj4+IHNob3VsZCBmb2xsb3cgYmVsb3cgc2VxdWVuY2U6DQo+ID4+Pj4NCj4gPj4+PiAxLiBk
aXNhYmxlIGdsb2JhbCBpbnRlcnJ1cHRzOw0KPiA+Pj4+IDIuIHVubG9jayB0aGUgd2RvZyBhbmQg
d2FpdCB1bmxvY2sgYml0IHNldDsgMy4gcmVjb25maWd1cmUgdGhlIHdkb2cNCj4gPj4+PiBhbmQg
d2FpdCBmb3IgcmVjb25maWd1cmF0aW9uIGJpdCBzZXQ7IDQuIGVuYWJlbCBnbG9iYWwgaW50ZXJy
dXB0cy4NCj4gPj4+Pg0KPiA+Pj4+IFN0cmljdGx5IGZvbGxvdyB0aGUgcmVjb21tZW5kZWQgc2Vx
dWVuY2UgY2FuIG1ha2UgaXQgbW9yZSByb2J1c3QuDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPj4+PiAtLS0NCj4gPj4+
PiBDaGFuZ2VzIHNpbmNlIFYxOg0KPiA+Pj4+IAktIHVzZSByZWFkbF9wb2xsX3RpbWVvdXRfYXRv
bWljKCkgaW5zdGVhZCBvZiB1c2xlZXBfcmFuZ2VzKCkgc2luY2UNCj4gPj4+PiBJUlEgaXMNCj4g
Pj4+IGRpc2FibGVkLg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICBkcml2ZXJzL3dhdGNoZG9nL2lteDd1
bHBfd2R0LmMgfCAyOQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4+ICAx
IGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvd2F0Y2hkb2cvaW14N3VscF93ZHQuYw0KPiA+Pj4+IGIvZHJpdmVycy93YXRj
aGRvZy9pbXg3dWxwX3dkdC5jIGluZGV4IDc5OTNjOGMuLjdkMmIxMmUgMTAwNjQ0DQo+ID4+Pj4g
LS0tIGEvZHJpdmVycy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+ID4+Pj4gKysrIGIvZHJpdmVy
cy93YXRjaGRvZy9pbXg3dWxwX3dkdC5jDQo+ID4+Pj4gQEAgLTUsNiArNSw3IEBADQo+ID4+Pj4N
Cj4gPj4+PiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiA+Pj4+ICAjaW5jbHVkZSA8bGludXgv
aW8uaD4NCj4gPj4+PiArI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiA+Pj4+ICAjaW5jbHVk
ZSA8bGludXgva2VybmVsLmg+DQo+ID4+Pj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4g
Pj4+PiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4+Pj4gQEAgLTM2LDYgKzM3LDcgQEANCj4g
Pj4+PiAgI2RlZmluZSBERUZBVUxUX1RJTUVPVVQJNjANCj4gPj4+PiAgI2RlZmluZSBNQVhfVElN
RU9VVAkxMjgNCj4gPj4+PiAgI2RlZmluZSBXRE9HX0NMT0NLX1JBVEUJMTAwMA0KPiA+Pj4+ICsj
ZGVmaW5lIFdET0dfV0FJVF9USU1FT1VUCTEwMDAwDQo+ID4+Pj4NCj4gPj4+PiAgc3RhdGljIGJv
b2wgbm93YXlvdXQgPSBXQVRDSERPR19OT1dBWU9VVDsNCj4gPj4+IG1vZHVsZV9wYXJhbShub3dh
eW91dCwNCj4gPj4+PiBib29sLCAwMDAwKTsgQEAgLTQ4LDE3ICs1MCwzMSBAQCBzdHJ1Y3QgaW14
N3VscF93ZHRfZGV2aWNlIHsNCj4gPj4+PiAgCXN0cnVjdCBjbGsgKmNsazsNCj4gPj4+PiAgfTsN
Cj4gPj4+Pg0KPiA+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgaW14N3VscF93ZHRfd2FpdCh2b2lk
IF9faW9tZW0gKmJhc2UsIHUzMiBtYXNrKSB7DQo+ID4+Pj4gKwl1MzIgdmFsID0gcmVhZGwoYmFz
ZSArIFdET0dfQ1MpOw0KPiA+Pj4+ICsNCj4gPj4+PiArCWlmICghKHZhbCAmIG1hc2spKQ0KPiA+
Pj4+ICsJCVdBUk5fT04ocmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhiYXNlICsgV0RPR19DUywg
dmFsLA0KPiA+Pj4+ICsJCQkJCQkgIHZhbCAmIG1hc2ssIDAsDQo+ID4+Pj4gKwkJCQkJCSAgV0RP
R19XQUlUX1RJTUVPVVQpKTsNCj4gPj4+DQo+ID4+PiBJIGFtIG5vdCBhIGZyaWVuZCBvZiBXQVJO
X09OLCBlc3BlY2lhbGx5IGluIHNpdHVhdGlvbnMgbGlrZSB0aGlzLg0KPiA+Pj4gUGxlYXNlIGV4
cGxhaW4gd2h5IHRoaXMgaXMgbmVlZGVkLCBhbmQgd2h5IGEgcmV0dXJuIG9mIC1FVElNRURPVVQg
aXMNCj4gPj4+IG5vdCBmZWFzaWJsZS4NCj4gPj4NCj4gPj4gT0ssIEkgd2lsbCB1c2UgcmV0dXJu
IHZhbHVlIG9mIC1FVElNRU9VVCBhbmQgaGFuZGxlIGl0IGluIHRoZSBjYWxsZXIuDQo+ID4NCj4g
PiBBZnRlciBhIGZ1cnRoZXIgbG9vaywgc29tZSBvZiB0aGUgaW14N3VscF93ZHRfd2FpdCAoKSBj
YWxsZXJzIGFyZSB2b2lkDQo+ID4gZnVuY3Rpb24sIHNvIGlmIHdhbnQgdG8gaGFuZGxlIHRoZSBy
ZXR1cm4gdmFsdWUsIGFsbCB0aG9zZSBmdW5jdGlvbnMNCj4gPiByZXR1cm4gdHlwZSBuZWVkIHRv
IGJlIGNoYW5nZWQuIEFuZCwgd2hlbiB0aGUgcmV0dXJuIHZhbHVlIGlzDQo+ID4gLUVUSU1FRE9V
VCwgdGhlIE9OTFkgYWN0aW9uIGlzIHRvIHByaW50IG91dCBzb21lIGVycm9yIG1lc3NhZ2UgZm9y
DQo+ID4gdGhlc2Ugdm9pZCBmdW5jdGlvbiwgbmVlZCB0byB1c2UgcHJfZXJyKCkgZHVlIHRvIG5v
IGRldiBwb2ludGVyIGF2YWlsYWJsZSwgc28NCj4gZG8geW91IHRoaW5rIGl0IGlzIGFjY2VwdGFi
bGUgdG8ganVzdCByZXBsYWNlIHRoZSBXQVJOX09OIHdpdGggcHJfZXJyKCkgYXMNCj4gYmVsb3c/
DQo+ID4NCj4gRmlyc3QsIHRoZSBwb2ludCBoZXJlIGlzIHRoYXQgdGhlIGNhbGxlcnMgY2FuJ3Qg
ZG8gdGhlaXIgd29yayBpZiB0aGUgZnVuY3Rpb24gdGltZXMNCj4gb3V0LiBTbywgaWYgdGhlIHJl
dHVybiB2YWx1ZSBpc24ndCBuZWNlc3NhcnksIGFuZCBjYWxsZXJzIGRvbid0IG5lZWQgdG8gY2hl
Y2sgaXQsDQo+IHRoZSBmdW5jdGlvbiB3b3VsZCBub3QgYmUgbmVjZXNzYXJ5IHRvIHN0YXJ0IHdp
dGguIElmIGl0IGlzIG5lY2Vzc2FyeSwgYW5kIGlmIHRoZXJlDQo+IGlzIGEgY29uY2VybiB0aGF0
IGl0IGNhbiBmYWlsLCBjYWxsZXJzIHNob3VsZCBtYWtlIHN1cmUgdGhhdCBpdCBhY3R1YWxseSBz
dWNjZWVkZWQuDQo+IFdpdGggdGhhdCBpbiBtaW5kLCB5ZXMsIGlteDd1bHBfd2R0X2luaXQoKSBz
aG91bGQgZmFpbCBhbmQgcmV0dXJuIGFuIGVycm9yLA0KPiBiZWNhdXNlIHByZXN1bWFibHkgdGhh
dCBpcyB3aGF0IGhhcHBlbmVkLiBUaGUgc2FtZSBpcyB0cnVlIGZvcg0KPiBpbXg3dWxwX3dkdF9l
bmFibGUoKS4NCj4gUmVhbGx5LCB3aGF0IGlzIHRoZSBwb2ludCBvZiBkZXRlY3RpbmcgYSBwcm9i
bGVtIGp1c3QgdG8gaWdub3JlIGl0ID8NCg0KVW5kZXJzdG9vZCwgdGhlbiBJIHdpbGwgY2hhbmdl
IHRob3NlIHZvaWQgY2FsbGVyIGZ1bmN0aW9ucyB0byBpbnQgdHlwZSwgYW5kIHJldHVybiBlcnJv
cg0KaWYgdGltZW91dC4gQW5kIG1heWJlIHNvbWUgJ2dvdG8nIHdpbGwgYmUgYWRkZWQsIHNpbmNl
IHdoZW5ldmVyIGVycm9yIGhhcHBlbiwgaXQNCmhhcyB0byBnbyB0byBlbmFibGUgbG9jYWwgaXJx
IHRoZW4gcmV0dXJuLg0KDQo+IA0KPiBTZWNvbmQsIHRoZSB3YWl0IGZ1bmN0aW9uIGlzIGFsc28g
Y2FsbGVkIF9hZnRlcl8gYSByZWdpc3RlciB3YXMgc2V0LiBJbiBtYW55DQo+IGNhc2VzIHRoYXQg
d29uJ3QgZG8gYW55IGdvb2Qgb3IgYmFkLiBXaGlsZSBpdCBpcyBvayB0byBpZ25vcmUgdGhlIGVy
cm9yIGluIHRoYXQNCj4gY2FzZSAod2hlbiBub3RoaW5nIGVsc2UgaXMgZG9uZSksIHRoZSBlcnJv
ciBtZXNzYWdlIGlzIHBvaW50bGVzcyBpbiB0aGF0DQo+IHNpdHVhdGlvbi4NCg0KT0ssIGZvciB0
aGUgUkNTIGJpdCBjaGVjaywgSSB3aWxsIGp1c3QgaWdub3JlIHRoZSByZXR1cm4gdmFsdWUgY2hl
Y2ssIHNpbWlsYXIgd2l0aCB0aGUNCmNsa19kaXNhYmxlX3VucHJlcGFyZSgpLCBub3RoaW5nIGNh
biBiZSBkb25lIGZvciBzdWNoIHNjZW5hcmlvLg0KDQpUaGFua3MsDQpBbnNvbg0KDQo=
