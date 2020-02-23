Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD0E169278
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Feb 2020 01:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgBWAQa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 22 Feb 2020 19:16:30 -0500
Received: from mail-eopbgr70072.outbound.protection.outlook.com ([40.107.7.72]:40475
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726895AbgBWAQa (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 22 Feb 2020 19:16:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laG8eGh7AVIJJWT84jjkp/ViX0dpKSK7YkCfVvh+cKtArYJ0vqyiSyx2w6umRFiubVIHEHOc77UFLODkGYbf9gLZzjQxNXC3Fxe8QA+dsb0UXmGa3llDWohdmP3Fuy2uWVV+2sI3bE4RFbKJz/n6/YPS57mjLzzLyLxS0az9K4ap2rMBePiAlsMgzOZfmSKz/IPiJtepRvXoEgxYQtmk19pcTD6fdI6OlWUSNgGPaPaOuPYJSm7hY3U0ncyTmBE0TxzQ1CyYQ3B2J65wvBd8DWupJzJ9DCz0GxY/1Tl1bvsFl9e/W3JBJSMXwPNBfVaG8MiOwLoZYtGd8uoc9Y3h9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1NiWeV1/eyy22ii5pupV6V05cwK8o2beU2pvNYmiDA=;
 b=MzphhQYa/SRWwxX3LA4ADxqcTpyJTVc+OtMcMcWqKkIkATUH8MC0WtwI+h6Oe7vDca/Qerc0ubqcju5ORvKLMM/dGXR0L1ra2LIXW+xH4CWcJR47qPfLPYU/BgcMW+7EmA37iJFXMVXqDh4cvTKvB1BYXUVi1lWeZBVFT5WNwUCzf3Med4VIEw36xaGssusNXUlEqTmVjKRDc6FxQzIxIzJtUD6+8r//YI2EyUmaVtvl8d6Hh4dGnkQVRKswTVNkTxjEKZqqbj5m7YONxKUueliDPun/TJ2t0ySMoM62dkfvZb1NBnx4dfB03StsC2dCy0yTmazi9+4kFuHA1SF+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1NiWeV1/eyy22ii5pupV6V05cwK8o2beU2pvNYmiDA=;
 b=kKVG2sm2JcC6fyMPtM2Yqcqn/1n7/nfRH4BogUPwiJ3CkytprG7Eh+JGsnRvE2pxbbqySrthQ95RjFvAW/ChDU20UgOmC4CRUuwNfq5lKk1p9l/drmv8GVqbwMOsp0y6F4qVeq8MQb0fIehwZ/k6fbCCxmL6qSdp6JO0FnYbUVw=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3755.eurprd04.prod.outlook.com (52.134.71.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Sun, 23 Feb 2020 00:16:26 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2750.021; Sun, 23 Feb 2020
 00:16:25 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>
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
Subject: RE: [PATCH 3/3] watchdog: imx2_wdt: Remove unused include of init.h
Thread-Topic: [PATCH 3/3] watchdog: imx2_wdt: Remove unused include of init.h
Thread-Index: AQHV6FuH8+3BpoBnsE6HuBUDScQ3YKgnYjMAgACJsTA=
Date:   Sun, 23 Feb 2020 00:16:25 +0000
Message-ID: <DB3PR0402MB3916C4CC9A79BFA49441EBEAF5EF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
 <1582250430-8872-3-git-send-email-Anson.Huang@nxp.com>
 <20200222160218.GA12740@roeck-us.net>
In-Reply-To: <20200222160218.GA12740@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [220.161.57.125]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ea07bfa-d0d3-44d7-2139-08d7b7f59f06
x-ms-traffictypediagnostic: DB3PR0402MB3755:|DB3PR0402MB3755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB375558408A168F98161776A7F5EF0@DB3PR0402MB3755.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0322B4EDE1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(86362001)(52536014)(81166006)(8676002)(81156014)(4744005)(8936002)(6916009)(7696005)(4326008)(54906003)(76116006)(66476007)(66946007)(66556008)(5660300002)(71200400001)(316002)(64756008)(66446008)(6506007)(44832011)(26005)(186003)(2906002)(33656002)(55016002)(9686003)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3755;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5V12hKo/vKASdUg5yIFT7RhEl98ozkXR/DIS2xcdCpmJr2FtOGDFFrfm/ScwN8613i7+W1ynePnfIXNKsvizx2ceu1juhAhdL69DmM8PIKTEh/RDYFJejpdxZFbNyZOG/pxOvzyoFod552p2hzJWe93WQYHBBToTcQyAjuu7unGvPAGYITdt93WtONpNO9dyGP14l2FdW9OWXWdcGyuJb071WEWWAmiQgLrQ+oxIBdvP80ljrKoQVvmDg2bLNH7N2U/bK/OtpJLcP9iwhBrnfGaQemWNGvNfsie91DNTFalmMyc02vXJu6CPYFC0akLmXN1wdQ4AInn6EgfEbT0+9toq/uMsi9T8yYWCukXvB7OD6XnqiN7z4jpHn3M219Lq68a7s8ZXFaR5mn8IzFUHuJ52NTr+EOTvUSojkx35mYYBP8jX8lkQDE6p3BgveBZv
x-ms-exchange-antispam-messagedata: Kxksb9hv51nXHCUx/8VnHdgWVqI25rCj0RUEb7vWh0aY28Y7WFUhqUJGzXwZv492AAHNni8YBrbTcPUoULuW05RIhagF2fPZOC8PFkWC0Jg9Tk/oOJwK8x4zsd11ULVwAlojz3oqBWB1mLnl4/Dwbw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea07bfa-d0d3-44d7-2139-08d7b7f59f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2020 00:16:25.5975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ODHdt42rzOcTjhMQNdNjFMN0m8+cnN/qDWAdCy4f0GM/Kbk5KSB+iQDbohzoyD5OPZmj5PPgIHj9q6X6GVp3JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3755
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gd2F0Y2hkb2c6IGlteDJf
d2R0OiBSZW1vdmUgdW51c2VkIGluY2x1ZGUgb2YNCj4gaW5pdC5oDQo+IA0KPiBPbiBGcmksIEZl
YiAyMSwgMjAyMCBhdCAxMDowMDozMEFNICswODAwLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gPiBU
aGVyZSBpcyBub3RoaW5nIGluIHVzZSBmcm9tIGluaXQuaCwgcmVtb3ZlIGl0Lg0KPiA+DQo+IA0K
PiBOQUNLLCBzb3JyeTsgdGhpcyBkcml2ZXIgdXNlcyBfX2luaXQgYW5kIF9fZXhpdF9wLg0KDQpB
aCwgeWVzLCBqdXN0IG5vdGljZSB0aGVtLiBCdXQgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGUg
LnByb2JlIGNhbGxiYWNrIG5lZWRzDQpfX2luaXQgYW5kIC5yZW1vdmUgY2FsbGJhY2sgbmVlZHMg
X19leGl0X3A/IFNob3VsZCB0aGV5IG5lZWQgdG8gYmUgcmVtb3ZlZD8NCiANClRoYW5rcywNCkFu
c29uDQoNCj4gR3VlbnRlcg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5z
b24uSHVhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy93YXRjaGRvZy9pbXgyX3dk
dC5jIHwgMSAtDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9pbXgyX3dkdC5jIGIvZHJpdmVycy93YXRjaGRv
Zy9pbXgyX3dkdC5jDQo+ID4gaW5kZXggZjhkNThiZi4uY2UyOGU0MCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3dhdGNoZG9nL2lteDJfd2R0LmMNCj4gPiArKysgYi9kcml2ZXJzL3dhdGNoZG9n
L2lteDJfd2R0LmMNCj4gPiBAQCAtMjAsNyArMjAsNiBAQA0KPiA+DQo+ID4gICNpbmNsdWRlIDxs
aW51eC9jbGsuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gLSNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4NCj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCg==
