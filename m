Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40F592A79BE
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 09:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730983AbgKEI43 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 03:56:29 -0500
Received: from mail-am6eur05on2050.outbound.protection.outlook.com ([40.107.22.50]:33856
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730830AbgKEI42 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 03:56:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lihwMQiDi+oqsYNh9+Iz4raDS3ss4k0w2iXSGhszvLfbSfxs5aehKcexiQ2/8OiO81PlNcvSz6NaUiji+w43+E+w/3SX4F7T58291F6fSrj+bzyAnOijw90mwyngjpVGy/HsQB7IXGkGZq208BOuTUZV8bHRdusGwjBedyvBHTeOdLD5tb3BmNTXv0BUveJoMM7hP4JPqZ+3RBPxwmqok0Q0Qa4m1JdzZYtsRcl7iK4QD+Z/hnUUiFCKH+Htvc/Ol9rFIGu/GZMgayZuEB+yha/kxa0Ti/x+YWTY6sa8HMAMcsspfUo3PrHoKFh7fRfnVeipMzfGkHxlQT+zw0zQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXIn3lOx9AOKufZKFFwoljtWHROLLDawpB2MZY3EQDw=;
 b=kM8PjA26quDQKyUgmSehzwD44lQd9t4fB14K+xKueLjfPqAGZjtVQ6MSa7dEAbn7//HAcJFZyYsPp2Qf4RKP6qvDFSlfpkxPLgQEcWuI2dTIUMszN0fOrjkW9uEf/q4K3COrnalnIfyDMome2XiCeAZ4clH4YJ24B/4KLynZ9TpDuxTdn4FJ7mpqIY+xkzTHzu08WQKGh3we4SPiuH4v8wXVlL3ozUJehXlFhNGDxsJgtssETTcNEorWw2xSyqLboqB+Ic6vyrR/500o6TcDl+KXYIGZVLD4w3AWjJkwkhBaUQlXTVhfvCo9F9nyh9cg76aknqiDP1LaC4JGRtGyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXIn3lOx9AOKufZKFFwoljtWHROLLDawpB2MZY3EQDw=;
 b=gQo2mCSBJwg7LN9XV75fq7K1lGO7Y3VAK/4AK5nsdcAfaWrbeLjjmCHnG7+FKaPwJPlEBWkwOH5lxVyY4VfR+4KAu9BSf0zrmrv+RNBJvY1KqdQrLOHhfVRXgl2z43FRIAxC1TtkNQrIhhOYCyHuusqfPGaIbWDtGsJifGs4LkU=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DB6PR0302MB2741.eurprd03.prod.outlook.com (2603:10a6:4:ac::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.32; Thu, 5 Nov 2020 08:56:18 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::f0fb:9677:5a21:6107%7]) with mapi id 15.20.3477.038; Thu, 5 Nov 2020
 08:56:17 +0000
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
Thread-Index: AQHWrQ9DwN0nkcfMkkiJSgq2+hhNRam4KrWAgAD53wCAAA83gIAAC2AAgAAJuoA=
Date:   Thu, 5 Nov 2020 08:56:17 +0000
Message-ID: <c969857d70c3fea3e5369651d09aa4ba668418f7.camel@fi.rohmeurope.com>
References: <cover.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <c7a838830b7d5ea1c281e419cf0eff0cc50363e0.1603877481.git.matti.vaittinen@fi.rohmeurope.com>
         <20201104155153.GQ4488@dell>
         <058913084af32743f2e23228a46944bbfcbd52d2.camel@fi.rohmeurope.com>
         <98d3a090462d21a97dd15490ac1e9de011819b35.camel@fi.rohmeurope.com>
         <20201105082122.GU4488@dell>
In-Reply-To: <20201105082122.GU4488@dell>
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
x-ms-office365-filtering-correlation-id: 3171f514-502c-4e09-d72f-08d88168a887
x-ms-traffictypediagnostic: DB6PR0302MB2741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0302MB2741D17E59C1F3D0B255F16CADEE0@DB6PR0302MB2741.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I4lX6pq8pxYB8YPmJFj95XTDBBiV6UGxJgM8J862MKn7D1jAIn8eF/b+UYcWfOI0gRPK+G024ULB66J/snzFjFhN66mg3THdokLmBEgZo7h1G7WAzxRaYzrz+6qZ6Uw03BUwewWzwelurmf6WuelQiuB77l53DtGv0wKXky07WjBISPoSUCRI5oYD2731mlN5SPae5EiiBf2VBmMr4GVnBJy1KyTVsoMoUdkX8jV7SMOoG0jnOeaBLYymGqJR9NGBVsNxbM4o9upDIaoueCQtLB5x/cseVXXMn5s/uGcH7foRAa6UaFv93Bzlkgoo0bjNvZNT7XEGDX3iVlT6R/WMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(396003)(366004)(346002)(376002)(66556008)(6506007)(91956017)(186003)(76116006)(66476007)(8936002)(66946007)(83380400001)(478600001)(8676002)(26005)(64756008)(66446008)(2616005)(6512007)(316002)(4326008)(54906003)(2906002)(6486002)(3450700001)(5660300002)(71200400001)(86362001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WZTwJIe3dWq26qTbC6xdwczBvqqIj7X/9xQv/Xf1sAs8nmFyO9uIyMLF1SHbmbz5UVDAs22k4GM0DHfIbdgnWIIERaeL3D3xgJ3YscIaPt2xgkqegw7WVgpP7KdEGF3r8u8EhOP4/omjhbRyWOwnfvE6YLMZHfObqtE0ewMe/Kkhjt9Eb+iejvCp3fulHq9YCSRV/YLsY218Q6VyQlDSTcJYUr9RT1e1t4cUOVs0C6eIdFxUTxgQIzDM7+y/K2AmqEA/1qKSSxblhxXAluvx7nKnZk1LFTAhWagT9rPfpQ8hj2mSav1WqtMiE1lsEtfgOGtYf12EY1VdajuZhms+bkc5QPqM7TGOJapkHk5vun55djY21XHeRP9ebqMwUGG6qf+Zr/sU5MV915/3c6MiNBkxOnlfiRKyDzdv8yOzeLKkBGgtmZRxCj9RWIAolprF2B1AKES0Xr4z1n1XxLBe9uopgBL7eBoq8oH0O42pHLepicpyihTyVPhqPDazvAab/SiWxlGYdimY4so+WvJ4Cy6TotivnoP+tN26zNVzI5YQpSdPJBkYNPvBAOItV7oSBrnaFhVKK+fXzBaQfGxrcL2wiK8ftEHSRUKmfYAPxOpf8hKZgFdU6hPia78HM5sQiX1JcVHz+P/2QOlvz1OvWg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <60513F9E95CC8F44B7FC931D0BDC6195@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3171f514-502c-4e09-d72f-08d88168a887
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 08:56:17.5742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Rkw8Er2AhuKQ9zu4a39xJEV7hAmUC67iCg70ALaSxl7rU8mU1uT2ufnun0z9tSXWSq9RFy1hoEczoX7BBEwzg9LxyZBEAHXgihNpyFtBfqzbFlAvpdHpUVDlGGiXugb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0302MB2741
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiBUaHUsIDIwMjAtMTEtMDUgYXQgMDg6MjEgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gVGh1LCAwNSBOb3YgMjAyMCwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToNCj4gDQo+ID4gT24g
VGh1LCAyMDIwLTExLTA1IGF0IDA4OjQ2ICswMjAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+
ID4gPiBNb3JuaW5nIExlZSwNCj4gPiA+IA0KPiA+ID4gVGhhbmtzIGZvciB0YWtpbmcgYSBsb29r
IGF0IHRoaXMgOikgSSBzZWUgbW9zdCBvZiB0aGUgY29tbWVudHMNCj4gPiA+IGJlaW5nDQo+ID4g
PiB2YWxpZC4gVGhlcmUncyB0d28gSSB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgdGhvdWdoLi4uDQo+
ID4gPiANCj4gPiA+IE9uIFdlZCwgMjAyMC0xMS0wNCBhdCAxNTo1MSArMDAwMCwgTGVlIEpvbmVz
IHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIDI4IE9jdCAyMDIwLCBNYXR0aSBWYWl0dGluZW4gd3Jv
dGU6DQo+ID4gPiA+IA0KPiA+ID4gPiA+IEFkZCBjb3JlIHN1cHBvcnQgZm9yIFJPSE0gQkQ5NTc2
TVVGIGFuZCBCRDk1NzNNVUYgUE1JQ3Mgd2hpY2gNCj4gPiA+ID4gPiBhcmUNCj4gPiA+ID4gPiBt
YWlubHkgdXNlZCB0byBwb3dlciB0aGUgUi1DYXIgc2VyaWVzIHByb2Nlc3NvcnMuDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDwNCj4gPiA+ID4g
PiBtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20NCj4gPiA+ID4gPiAtLS0NCj4gPiA+
ID4gPiArCXVuc2lnbmVkIGludCBjaGlwX3R5cGU7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJ
Y2hpcF90eXBlID0gKHVuc2lnbmVkIGludCkodWludHB0cl90KQ0KPiA+ID4gPiA+ICsJCSAgICBv
Zl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJmkyYy0+ZGV2KTsNCj4gPiA+ID4gDQo+ID4gPiA+IE5v
dCBvdmVybHkga2VlbiBvbiB0aGlzIGNhc3RpbmcuDQo+ID4gPiA+IA0KPiA+ID4gPiBXaHkgbm90
IGp1c3QgbGVhdmUgaXQgYXMgKHVpbnRwdHJfdCk/DQo+ID4gPiANCj4gPiA+IEkgZGlkbid0IGRv
IHNvIGJlY2F1c2Ugb24geDg2XzY0IHRoZSBhZGRyZXNzIHdpZHRoIGlzIHByb2JhYmx5IDY0DQo+
ID4gPiBiaXRzDQo+ID4gPiB3aGVyZWFzIHRoZSB1bnNpZ25lZCBpbnQgaXMgbGlrZWx5IHRvIGJl
IDMyIGJpdHMuIFNvIHRoZQ0KPiA+ID4gYXNzaWdubWVudA0KPiA+ID4gd2lsbCBjcm9wIGhhbGYg
b2YgdGhlIHZhbHVlLiBJdCBkb2VzIG5vdCByZWFsbHkgbWF0dGVyIGFzIHZhbHVlcw0KPiA+ID4g
YXJlDQo+ID4gPiBzbWFsbCAtIGJ1dCBJIHdvdWxkIGJlIHN1cnByaXplZCBpZiBubyBjb21waWxl
cnMvYW5hbHl6ZXJzDQo+ID4gPiBlbWl0dGVkIGENCj4gPiA+IHdhcm5pbmcuDQo+ID4gPiANCj4g
PiA+IEkgbXVzdCBhZG1pdCBJIGFtIG5vdCAxMDAlIHN1cmUgdGhvdWdoLiBJIHN1cmUgY2FuIGNo
YW5nZSB0aGlzIGlmDQo+ID4gPiB5b3UNCj4gPiA+IGtub3cgaXQgYmV0dGVyPw0KPiANCj4gV2hh
dCBpZiB5b3UgdXNlZCAnbG9uZycsIHdoaWNoIEkgYmVsaWV2ZSBjaGFuZ2VkIHdpdGggdGhlDQo+
IGFyY2hpdGVjdHVyZSdzIGJ1cyB3aWR0aCBpbiBMaW51eD8NCg0KSSB0aGluayB0aGlzIGlzIGV4
YWN0bHkgd2hhdCB1aW50cHRyX3Qgd2FzIGNyZWF0ZWQgZm9yLiBUbyBwcm92aWRlIHR5cGUNCndo
aWNoIGFzc3VyZXMgYSBwb2ludGVyIGNvbnZlcnNpb24gdG8gaW50ZWdlciBhbmQgYmFjayB3b3Jr
cy4NCg0KSSBndWVzcyBJIGNhbiBjaGFuZ2UgdGhlDQoNCnVuc2lnbmVkIGludCBjaGlwX3R5cGU7
DQoNCnRvIHVpbnRwdHJfdCBhbmQgZ2V0IGF3YXkgd2l0aCBzaW5nbGUgY2FzdCBpZiBpdCBsb29r
cyBiZXR0ZXIgdG8geW91Lg0KRm9yIG1lIHRoZSBkb3VibGUgY2FzdCBkb2VzIG5vdCBsb29rIHRo
YXQgYmFkIHdoZW4gaXQgYWxsb3dzIHVzZSBvZg0KbmF0aXZlIGludCBzaXplIHZhcmlhYmxlIC0g
YnV0IGluIHRoaXMgY2FzZSBpdCdzIHJlYWxseSBqdXN0IGEgbWF0dGVyDQpvZiB0YXN0ZS4gQm90
aCBzaG91bGQgd29yayBmaW5lLg0KDQpJJ2xsIGNvb2sgdjUuDQoNCi0tTWF0dGkNCg0K
