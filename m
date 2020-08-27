Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFF4253FC2
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Aug 2020 09:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgH0H4A (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 Aug 2020 03:56:00 -0400
Received: from mail-eopbgr00087.outbound.protection.outlook.com ([40.107.0.87]:16061
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728483AbgH0Hzf (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 Aug 2020 03:55:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRUbg2kctkhAkaynb+r58qmJGfxmihGeWULmTtUzXmBcLRf0o81wMWwmz9jPIWXf946CMb96zse7Ts2fXP1LZJQeFUqFPipEBKwVZEmxP8LG3u7FwadL4SMgMVcwwj8by1CbbIrm24AGoIL5gC5xElBQxekmlPzq8FTMcuDiU0kttrXRA10WnfV+SKICPKC/UMWWUL151lx9x26uFKTNtZ4mev3MY+qI9uL0ohxaVBMuEwepepjw8MinNBOhduKiuGECB+PMc/Du4bZHGMqFbbMsA0m4ovsQPFbYL4/Qnkw81JQpB3JuTQxYKx8wICqARfXxDIcmd5jLjS2+MvSOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqQ3PfO4lTFtQEE/pauAjtgGHv3nmXuntFu1goRmARE=;
 b=BgFTsP7x8/YA+pL4Fc34ovRb8K8OmfG/7X0QjPlkRgSe7Us2KWGqn5EJk7yQKqxjTSUgDZw3RisuZTFxpazbwBzTrP46Vah5UlqijvvUZnnVgQBi4BvfsuTHogKiAshBqBvoGZ636VJjTd1jTPqj/14d1DzvpSgUKx1sOgbyvVnq05m1srINXFKmXTO3I1I/IJC4ENGeYh0IDSL5jAAhXa4hranoe51/e1zeAU9y3DPUU6J6et0jU9r5poGkNMcJ4w5cwDQ1FJWCvjC9yljfyYIvydbD/jHV5fyKSjf/F3/BTRFpF3i5S4NXolWkDBd2dlYAB1k3RSHSwibnqFYTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqQ3PfO4lTFtQEE/pauAjtgGHv3nmXuntFu1goRmARE=;
 b=Hq4IaKnltB6WLkR8VSXpJqzHEQ41rcilILKGhtsA+mniFNeOAKs8oLdI02wmg3354IRXRDG1djQGOClfZpTNN8m2hfPaCzVEOIcXedEObo4RiaVc9z9oiaWlsf+q5tFGtmZUJ8YpeOJKpj1inmi5AzHgCH8jMs2PZoTz+ZqBLUk=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (2603:10a6:803:129::26)
 by VI1PR04MB4543.eurprd04.prod.outlook.com (2603:10a6:803:6e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 27 Aug
 2020 07:55:31 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::9149:1826:669a:4d6f]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::9149:1826:669a:4d6f%7]) with mapi id 15.20.3326.021; Thu, 27 Aug 2020
 07:55:31 +0000
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] watchdog: sbsa_gwdt: add shutdown hook to driver
Thread-Topic: [PATCH] watchdog: sbsa_gwdt: add shutdown hook to driver
Thread-Index: AQHWefAjnrqJazWM50KAGHPpwcHNk6lHQSuAgARYKyA=
Date:   Thu, 27 Aug 2020 07:55:31 +0000
Message-ID: <VE1PR04MB67681C26D81E855A152043BE91550@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20200824081804.23206-1-qiang.zhao@nxp.com>
 <cdfd0c4d-3433-f952-0e49-ebc0f7474e1a@roeck-us.net>
In-Reply-To: <cdfd0c4d-3433-f952-0e49-ebc0f7474e1a@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e1de29fe-d48c-4bb0-e012-08d84a5e9272
x-ms-traffictypediagnostic: VI1PR04MB4543:
x-microsoft-antispam-prvs: <VI1PR04MB454352DFACAAF0D335A4D62091550@VI1PR04MB4543.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aBPIF7aM1UN1zI21LXY+lQPxpS9si2x8qYShzoCtiPK/FBc07lJDLfjKnALsk3z1m+/VxoZ8XLrVp/nqNXwafx4oaP42QedJ3r0fpTYcj66C1iJCOZHXmTK9/acB46RcFEJTZtldX2YXMZNIy+CN8YIdD4oO/E1zePVU7LrJBdk/3gCHPX/4n/VTDIRttHaBeykBBxye1SU6p9weWHGYzs6xTEJmwII2wuWNpz2Hbrw8wkP+/QQ2GJb8xNJmifCnfdggxhLKQq7H6/QfHz7BOZwhGhEmDEiMWK7MeSeUn8fdMvr8A7RDbEFJC9U7leL2GshqSPkEow3TYtkjKRoyLA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6768.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(55016002)(33656002)(26005)(9686003)(8676002)(5660300002)(83380400001)(478600001)(186003)(76116006)(44832011)(66946007)(66446008)(66476007)(4744005)(64756008)(8936002)(66556008)(316002)(54906003)(53546011)(6506007)(110136005)(2906002)(86362001)(52536014)(71200400001)(4326008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: MfW+JLyurTaKxJHGcVrJwL7L9a454QfF3C57YyMdBbV7zBVZT2WXGeUVHmsWcpDoAK6IHmOpJFSZnsP1xOYsftr6RS9u78fA5AJ0LuftEQiZxhpUh4jJtuVvPS7WQWPVLMzoK39+dma2OVyvTWN3fEKpLqngxMADy19uughtOlxVYIbLFQRhr1kBLEi3Ke1GIP9nc1a3l+n5ahK9Tj3DUhwfDS+KQJHXboby7nd5kVJCW3iCAoKLqNK2WXFZuLy4fuBaQyJQ3auTXxAJYAW2g52DmKEcwq8+RW0xW6a2zIOLfbEO3uwoyP9CCSoSgpPtbl+mZMaXWx2lKVLD3LL0rNDjGIlKAQEOY1zHiJFf8dUVOSTEKgvMaMQWha+u6qaxfoYtjUXBedKIgzF7gYdCLzK0ML7Je7ZJvh+a2fProZVYNx41pmRTnHooF7ZuHwLBKutZDfg/5ulqro76iz4RUAehXtKRGtLmpwP1NFhgdA7yiPj3jxCk63grFF/WDtBqX9+xJgoY7+KJkImrMTQ+Vd4sfKv/Q9Ybgp1xefjWBscEIEdFqmtVUwOrKPZuhiKhOlbSKUe6huMhAD+eBVboHJb3+YTu4ZI8af6F0GjVd6FV61oCrONKNDHX6ajJS2qFXy7wl1wGUUj46RsAez/m/w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6768.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1de29fe-d48c-4bb0-e012-08d84a5e9272
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2020 07:55:31.5609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3wHE1JFw+d9uvqAuE/oWGDCD37e2adUIi6Rylam98HWyN99PnkOJUHb0wpT/k3yVb5CGo2/DMXiCgYk51Xo9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4543
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gOC8yNC8yMCAyMToyOSBBTSwgR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3
cm90ZToNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJv
ZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2Vu
dDogMjAyMOW5tDjmnIgyNOaXpSAyMToyOQ0KPiBUbzogUWlhbmcgWmhhbyA8cWlhbmcuemhhb0Bu
eHAuY29tPjsgd2ltQGxpbnV4LXdhdGNoZG9nLm9yZw0KPiBDYzogbGludXgtd2F0Y2hkb2dAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIHdhdGNoZG9nOiBzYnNhX2d3ZHQ6IGFkZCBzaHV0ZG93biBob29rIHRvIGRyaXZl
cg0KPiANCj4gT24gOC8yNC8yMCAxOjE4IEFNLCBRaWFuZyBaaGFvIHdyb3RlOg0KPiA+IEZyb206
IFpoYW8gUWlhbmcgPHFpYW5nLnpoYW9AbnhwLmNvbT4NCj4gPg0KPiA+IEtleGVjIG1heWJlIG5l
ZWQgbW9yZSB0aW1lIHRoYW4gdGltZW91dCBvZiB3ZHQoc2JzYSkgd2hpY2ggd2lsbCByZXNldA0K
PiA+IHRoZSBzeXN0ZW0uDQo+ID4gU28gaXQgaXMgbmVjZXNzYXJ5IHRvIGFkZCBzaHV0ZG93biBo
b29rIHRvIGRpc2FibGUgdGhlIHdkdCB3aGVuIHJ1bg0KPiA+IGtleGVjLg0KPiA+DQo+IA0KPiBQ
bGVhc2UgZXhwbGFpbiB3aHkgd2F0Y2hkb2dfc3RvcF9vbl9yZWJvb3QoKSBkb2VzIG5vdCB3b3Jr
Lg0KPiANCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLCBpdCBpcyBoZWxwZnVsLg0KSSBp
bnZlc3RpZ2F0ZSB0aGlzIGlzc3VlIGFnYWluLCBmb3VuZCB0aGF0IHRoaXMgd2F0Y2hkb2cgYXJl
IGVuYWJsZWQgYnkgdWJvb3QsDQpNZWFud2hpbGUgaW4ga2VybmVsLCBpdCBpcyBub3QgdGhlIGRl
ZmF1bHQgd2F0Y2hkb2csIGluIGFub3RoZXIgd29yZHMsIGl0IGlzIG5vdCBhY3RpdmUgaW4ga2Vy
bmVsLg0KU28gd2F0Y2hkb2dfc3RvcF9vbl9yZWJvb3QoKSBkb2VzIG5vdCB3b3JrLg0KVGhpcyBw
YXRjaCBpcyBub3QgdGhlIHJpZ2h0IHNvbHV0aW9uIGZvciB0aGUgc2l0dWF0aW9uLCBJIHdpbGwg
YWJhbmRvbiBpdC4gDQoNCkJlc3QgUmVnYXJkcw0KUWlhbmcgWmhhbw0K
