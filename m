Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE133169C6C
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2020 03:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgBXCyM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Feb 2020 21:54:12 -0500
Received: from mail-eopbgr80073.outbound.protection.outlook.com ([40.107.8.73]:39539
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727156AbgBXCyL (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Feb 2020 21:54:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbfhP6l+JOS88y+5vIhFUn6mZDctXRVbERxDwkGRwpaIQDQg85itSR5cTuao44EWGIQTAFZRcQyhTfl+9CIyyhoZ4IkpzJ9yNjQK5OoMKSNYBHj7gqojgDrkYuEE/MW/2g0A63IC+phtr8BUgOIa6tUZU+JYxzggCmNi+NLT9OEH394E3a9Zk8Ve8E3+iRu2bgVLwM32r67aBJyWnFt5ecplpUFIOEzMFwOs+62gnQkfGq1PzqLukeKp262EWMx7SzU8ga8/yO3B9Jrd9rV4qw+h1ls1RgMSlsfQUec/09wERRBPkjF1lMawVVum2Zk4CIlUOx4bVWuX/q4bq1A1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTooC8lbNMKsq+iGhksXUjSHkckElzAgu2brk0x7FvY=;
 b=NYvTxsSk1v4FjtCmEibvLN1frXrj+ijifmhtdQTLetonszdYn0zVg3CT4gQh1I1EZY8L3kE+yhN+0NhJLMyby/HSuBm/eXKGxWnSDSDHy46T4oPjPyWU5LVCHYZo2h6lfsRIX+Ad3evX57f4tSw1PqkopjXhO4a43Kto73okGZcGgPyS1HbIKCIOlbvFLC1/I1JMQ2YM/dIGF4eFhDSPsq2LauSWOIFXMC6J2bPOkNBghJX++ZUFp4kQZjOqZ2PJTuSBsLcnbZq33yYQFWuZ9iUzaNZXj+Dxk09W9VGnlz5oQUI3qS+BmetAc3JLWBanB/p9oY9tsQP+nOa4W6kCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTooC8lbNMKsq+iGhksXUjSHkckElzAgu2brk0x7FvY=;
 b=AWSFylZ2fI0SteZvfPLJtiqkYP5/hMfk7vyAy25VIOe6rTEmhnqUmS5TBZg+zaq+zu/UenokAzTbeFXRO6wy56thiQim4MvIWl9yJeSWibN4YgUXappdUdD3gdxM10nbw0uwNO4jntuWnqAsgdIbr2GcbWaJ91TAr/l/T+Fc5ls=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3788.eurprd04.prod.outlook.com (52.134.72.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Mon, 24 Feb 2020 02:54:08 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 02:54:08 +0000
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
Thread-Index: AQHV6FuH8+3BpoBnsE6HuBUDScQ3YKgnYjMAgACJsTCAAOi7AIAA1T5g
Date:   Mon, 24 Feb 2020 02:54:08 +0000
Message-ID: <DB3PR0402MB391631B945FB45877B43EEDEF5EC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
 <1582250430-8872-3-git-send-email-Anson.Huang@nxp.com>
 <20200222160218.GA12740@roeck-us.net>
 <DB3PR0402MB3916C4CC9A79BFA49441EBEAF5EF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <a45aeb79-7918-42e9-1c47-3cc631057a59@roeck-us.net>
In-Reply-To: <a45aeb79-7918-42e9-1c47-3cc631057a59@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [27.157.70.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aecc0e8a-bd5a-4457-0922-08d7b8d4d171
x-ms-traffictypediagnostic: DB3PR0402MB3788:|DB3PR0402MB3788:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB378898F0D962F2F4E8F45B34F5EC0@DB3PR0402MB3788.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(189003)(33656002)(5660300002)(316002)(55016002)(52536014)(9686003)(54906003)(2906002)(4326008)(6506007)(53546011)(66556008)(66446008)(64756008)(478600001)(66476007)(66946007)(76116006)(7696005)(8936002)(8676002)(186003)(26005)(6916009)(44832011)(71200400001)(81166006)(81156014)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3788;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ss0CwNCgBlEjT06WEpCVdGYeCSBO/w+tF3oFraBkpy9Kse1T2ZD1szDWPAFLPQQ/mOXh8gj9c1sBqnW9PITm/shu25NJTLBlUCz7hc5FgRUrP4kTneMykxYP/GiXTwdbUOA8vHxVI0Uw3bm0+QDj5SIGMskAD81jBsFBWD6SX52pHo9lIxSRXywUEHJBcMaLQUJ57jKIobqNE7Xj7xR4HKhaL0cydcUBWQAHu3bvPtE1b6ORbfx2plnCOAh4Zcduvg3lFwvj3aTNI+3xyMlYYh0rqcgTUCr+GuJGwA2Clc1RoFf+lMNgUg8krpcF1eWlG9aI21Yt6U/RkMuBseqOq9DAeJe1LpM1T3MPWa5j67wG4K/I881rHoMqLY/PPwlD30QGqxJI995xr97Wh3BszJ8RnWcRJFNRlG0NuNe1sJFyVaibKAYOCq12in4DlHRJ
x-ms-exchange-antispam-messagedata: Nvvz6q/fg5gRuDZEKZNXbLOnesC4CVNj3i1L0nbzreqF2qlN22K83iF0JZaL5efiriXyl+ZBJPy0GnoC+hU6sCRmJILUO45/cqy3WrCqmj0XmIyr1JXRJ+dbhi6iOoSszGRiBCLNGCEuS/WmuK0Icw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecc0e8a-bd5a-4457-0922-08d7b8d4d171
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 02:54:08.1258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBOkncC8uCvb6OAYpITfmyKkI2wCl18mnFzJRs4aTQSjy44JIbu41EArFsq72HKhXKVgIe4fgf3m/t7TRYvruw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3788
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gd2F0Y2hkb2c6IGlteDJf
d2R0OiBSZW1vdmUgdW51c2VkIGluY2x1ZGUgb2YNCj4gaW5pdC5oDQo+IA0KPiBPbiAyLzIyLzIw
IDQ6MTYgUE0sIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IEhpLCBHdWVudGVyDQo+ID4NCj4gPj4g
U3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIHdhdGNoZG9nOiBpbXgyX3dkdDogUmVtb3ZlIHVudXNl
ZCBpbmNsdWRlIG9mDQo+ID4+IGluaXQuaA0KPiA+Pg0KPiA+PiBPbiBGcmksIEZlYiAyMSwgMjAy
MCBhdCAxMDowMDozMEFNICswODAwLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gPj4+IFRoZXJlIGlz
IG5vdGhpbmcgaW4gdXNlIGZyb20gaW5pdC5oLCByZW1vdmUgaXQuDQo+ID4+Pg0KPiA+Pg0KPiA+
PiBOQUNLLCBzb3JyeTsgdGhpcyBkcml2ZXIgdXNlcyBfX2luaXQgYW5kIF9fZXhpdF9wLg0KPiA+
DQo+ID4gQWgsIHllcywganVzdCBub3RpY2UgdGhlbS4gQnV0IEkgZG9uJ3QgdW5kZXJzdGFuZCB3
aHkgdGhlIC5wcm9iZQ0KPiA+IGNhbGxiYWNrIG5lZWRzIF9faW5pdCBhbmQgLnJlbW92ZSBjYWxs
YmFjayBuZWVkcyBfX2V4aXRfcD8gU2hvdWxkIHRoZXkNCj4gbmVlZCB0byBiZSByZW1vdmVkPw0K
PiA+DQo+IA0KPiBUaGF0IGlzIG5vdCBhIG1hdHRlciBvZiAibmVlZHMiLiBfX2luaXQgY2F1c2Vz
IHRoZSBjb2RlIHRvIGJlIHJlbW92ZWQgYWZ0ZXINCj4gaW5pdGlhbGl6YXRpb24uIFRoaXMgaXMg
b2sgYW5kIGRlc2lyYWJsZSBpZiBpdCBpcyBrbm93biB0aGF0IHRoZSBoYXJkd2FyZSBpcyBidWls
dC0NCj4gaW4gYW5kIHdpbGwgb25seSBldmVyIGJlIHByb2JlZCBvbmNlLg0KPiANCj4gZXhpdF9w
IGNhdXNlcyB0aGUgY29kZSB0byBiZSByZW1vdmVkIGlmIGl0IGlzIGJ1aWx0IGludG8gdGhlIGtl
cm5lbC4gVGhpcyBpcw0KPiBkZXNpcmFibGUgYW5kIG1ha2VzIHNlbnNlIGlmIHRoZSBkZXZpY2Ug
aXMga25vd24gdG8gbmV2ZXIgYmUgcmVtb3ZlZC4NCg0KDQpNYWtlIHNlbnNlLCBmb3Igbm93LCB0
aGVyZSBpcyBubyBpLk1YIFNvQyBuZWVkcyB3YXRjaGRvZyBkcml2ZXIgYXMgbW9kdWxlLA0Kc28g
SSB3aWxsIGtlZXAgaXQgaGVyZS4NCg0KDQo+IA0KPiBIYXZpbmcgc2FpZCB0aGF0LCB3aGF0IF9p
c18gdW5uZWNlc3NhcnkgaXMgdGhlIHJlbW92ZSBmdW5jdGlvbi4gUmVnaXN0cmF0aW9uDQo+IGNv
dWxkIHVzZSBkZXZtX3dhdGNoZG9nX3JlZ2lzdGVyX2RldmljZSgpLCBhbmQgdGhlIHdhdGNoZG9n
IHN1YnN5c3RlbQ0KPiBzaG91bGQgcHJldmVudCByZW1vdmFsIGlmIHRoZSB3YXRjaGRvZyBpcyBy
dW5uaW5nLiBQbHVzLCB0aGUgcmVtb3ZhbA0KPiBmdW5jdGlvbiBpcw0KPiBidWdneTogSXQgZG9l
c24nIGNhbGwgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgKGJ1dCB0aGF0IGNvdWxkIGJlIGhhbmRs
ZWQgd2l0aA0KPiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBpbiB0aGUgcHJvYmUgZnVuY3Rp
b24pLiBJbiBteSBvcGluaW9uLCBmaXhpbmcgYWxsDQo+IHRoYXQgd291bGQgYmUgbW9yZSB2YWx1
YWJsZSB0aGFuIHRyeWluZyB0byBkcm9wIGFuIGluY2x1ZGUgZmlsZS4NCg0KVGhhbmtzIGZvciBw
b2ludGluZyBvdXQgdGhlIGNsb2NrIG9wZXJhdGlvbiBpc3N1ZSBpbiAucmVtb3ZlIGNhbGxiYWNr
LCBJIHdpbGwgY3V0DQphIHBhdGNoIHVzaW5nIGRldm1fd2F0Y2hkb2dfcmVnaXN0ZXJfZGV2aWNl
KCkgYW5kICBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKQ0KdG8gaGFuZGxlIGFsbCBuZWNlc3Nh
cnkgb3BlcmF0aW9ucyBmb3IgcmVtb3ZlIGFjdGlvbiwgdGhlbiBkcm9wIC5yZW1vdmUgY2FsbGJh
Y2suDQoNClRoYW5rcywNCkFuc29uDQo=
