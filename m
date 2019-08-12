Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2CC8954E
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 04:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfHLCDr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 11 Aug 2019 22:03:47 -0400
Received: from mail-eopbgr140047.outbound.protection.outlook.com ([40.107.14.47]:19394
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726200AbfHLCDr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 11 Aug 2019 22:03:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idHGjKn+uz71cp0GvPsvBxF755AOuvXo3z/dDGKQx1Du7Woo+JFjV2go/qT16w6F1zbxLaZ/X1pAqhtu4ephZGUlB44eQSdso/Oc6HCabWjUW1MABzRD7CsdQGJZQHk+zJdHuK0a51BDg58WUufWAy8ZNM98mc6yD2FT4Zyl2IwYdmOF/3czEzbmhXsZmx97/uW6MX8V6qctqUaGgR7gxyM0TWNG71w5eZvPP0IWWmYmo/IP85ympfpIIBUaKNPAqVmNMegFNUb+sPxWyuVGjnNeD/nT+Te/3zQTSAT0DX6WwXFDaaJFVqmqidlSU2kty0R1OmxWxi1TDtpv2r8csg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arWxFWLs/I/Yt9qT6aFIGOPRsxen3mDIw01xD4jgdjU=;
 b=HpxsPwkpIqqy4n5iDRcbp/tB6qz9Ny48SjSafG4HlS4Etl4cgE2H2qdzExleJYh3rqKgOHZmGyc5r4FUiCnUwiSOHEzyCyhwb1bIe/1U9SfzXg3RAjwH1yadeEWEUMaKAQN7vG8e0+hqDBiOab4hp63Tpo8OhRhv3C0V/71kl1xaFpqAsVx0Oy+bKSRrJz+BNKAd4IT/hwQj9Optd6jfc4fGxU1ygqkv6QYjno+RH/0Yvy1yd0+R/781/ALJ9ZqBjuU8egOyp0kNXu2ooYv3i4x6umdsk7aR5aZQbkS2diOPvQAbclqHCfBE65zp5fMf6URKz6O3yPXiuefEXyq2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arWxFWLs/I/Yt9qT6aFIGOPRsxen3mDIw01xD4jgdjU=;
 b=PKpTKrgEHtEcSDiPk5Q7Z6qvqEdueHSnwzWFaFcfOtZrQIFHzHIzKeQ68MExpK70Axd0P9dWfczhKI65pDw08qmVqKnDsaO9qTse30mJpyDRG/Aw51FLTkprf3PpI8ouIt0xg3jDoUUYSnFUSN0w4ZatlcbAw/ke0uB9CG0G7DU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3771.eurprd04.prod.outlook.com (52.134.67.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Mon, 12 Aug 2019 02:03:03 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e%4]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 02:03:03 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "jan.tuerk@emtrion.com" <jan.tuerk@emtrion.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/4] dt-bindings: watchdog: Add i.MX7ULP bindings
Thread-Topic: [PATCH 1/4] dt-bindings: watchdog: Add i.MX7ULP bindings
Thread-Index: AQHVToVB4MOOtXDeCkyHClI34d9xYKbzBeaAgAO7LsA=
Date:   Mon, 12 Aug 2019 02:03:03 +0000
Message-ID: <DB3PR0402MB39161E58AFF5681757DE1C06F5D30@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1565334842-28161-1-git-send-email-Anson.Huang@nxp.com>
 <20190809164245.GA17136@roeck-us.net>
In-Reply-To: <20190809164245.GA17136@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ef953b6-18d9-475b-2d17-08d71ec935a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3771;
x-ms-traffictypediagnostic: DB3PR0402MB3771:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3771E2CB34DAA7ABEAEC49ECF5D30@DB3PR0402MB3771.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(189003)(199004)(186003)(53936002)(71190400001)(71200400001)(86362001)(26005)(486006)(66066001)(9686003)(6916009)(3846002)(6116002)(229853002)(44832011)(8936002)(256004)(81156014)(81166006)(7736002)(4326008)(7416002)(305945005)(74316002)(8676002)(25786009)(52536014)(102836004)(6246003)(6436002)(54906003)(478600001)(7696005)(6506007)(2906002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(11346002)(316002)(55016002)(446003)(5660300002)(99286004)(33656002)(476003)(14454004)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3771;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3PGCiGJVhQMuNFPqIaFwKs8mxISmuxPkWRa72htJ/sHtPxo3yO6Bpf2O3UVHwYmdJb+qbO2IEzVnaByIZabumDDDyvLqXe6aZuX18+Y4Nm+Jm0fRNzcJvIHDvrHkV4lcme6E3jED6bbaDmSDDuvFJ2GsdPqd8skZdSEYS0/cgVv9w/NktoVCxlCtzjhgJ6zcLo7SV7QwzX9g9VB6dvyv6WVBOGG6f7VsW3E2stkAO6wDeWBrjdGvwbAGuLtCVcHvxHjHSN8tuwCEoWZI99/gHcURrHrc6hrR2XpR1q/Lm7qSBTD6lGpXjaY9AI1Iy7VZaIybzYcyyBT8IHTIZKFC01XEcR8P5ynaql3jr7ZNbYwQ13Dc2ZVujWOncJLmPPuim7JgQSRS2vNp4V+YLhBHBT4OqGtvfXXvi9eYKF3JUOk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef953b6-18d9-475b-2d17-08d71ec935a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 02:03:03.2763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aT8N0ZwayjIGjlu8M/uF7JmxdEqM0AVk1diAAOWR3ym1QtKyjdoaSIH7MSDJEh5gmW7ZsYQ928mVwV8dW+UReA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3771
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGksIEd1ZW50ZXINCg0KPiBPbiBGcmksIEF1ZyAwOSwgMjAxOSBhdCAwMzoxMzo1OVBNICswODAw
LCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gPiBBZGQgdGhlIHdhdGNoZG9nIGJpbmRpbmdzIGZvciBG
cmVlc2NhbGUgaS5NWDdVTFAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8
QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3dhdGNoZG9n
L2ZzbC1pbXg3dWxwLXdkdC50eHQgICAgICAgICAgfCAyMg0KPiArKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRv
Zy9mc2wtaW14N3VscC13ZHQudHh0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZnNsLWlteDd1bHAtd2R0LnR4dA0K
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2ZzbC1pbXg3
dWxwLXdkdC50eHQNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAu
LmQ4M2ZjNWMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2ZzbC1pbXg3dWxwLXdkdC50eHQNCj4gPiBAQCAtMCww
ICsxLDIyIEBADQo+ID4gKyogRnJlZXNjYWxlIGkuTVg3VUxQIFdhdGNoZG9nIFRpbWVyIChXRFQp
IENvbnRyb2xsZXINCj4gPiArDQo+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gKy0gY29t
cGF0aWJsZSA6IFNob3VsZCBiZSAiZnNsLGlteDd1bHAtd2R0Ig0KPiA+ICstIHJlZyA6IFNob3Vs
ZCBjb250YWluIFdEVCByZWdpc3RlcnMgbG9jYXRpb24gYW5kIGxlbmd0aA0KPiA+ICstIGludGVy
cnVwdHMgOiBTaG91bGQgY29udGFpbiBXRFQgaW50ZXJydXB0DQo+ID4gKy0gY2xvY2tzOiBTaG91
bGQgY29udGFpbiBhIHBoYW5kbGUgcG9pbnRpbmcgdG8gdGhlIGdhdGVkIHBlcmlwaGVyYWwgY2xv
Y2suDQo+IA0KPiBUaGUgZHJpdmVyIGFzIHN1Ym1pdHRlZCBkb2VzIG5vdCBpbmNsdWRlIGNsb2Nr
IG9yIGludGVycnVwdCBoYW5kbGluZy4NCj4gV2h5IGFyZSB0aG9zZSBwcm9wZXJ0aWVzIGxpc3Rl
ZCBhcyBtYW5kYXRvcnkgaWYgdGhleSBhcmUgbm90IHJlYWxseSBuZWVkZWQNCj4gKG5vciB1c2Vk
KSA/DQoNCkkgbWlzc2VkIHRoZSBjbGsgcGFydCBpbiBkcml2ZXIsIGl0IGlzIHdvcmtpbmcgT05M
WSBiZWNhdXNlIHRoZSB3ZG9nIGNsb2NrIGlzIGVuYWJsZWQNCnVuZXhwZWN0ZWQsIEkgd2lsbCBh
ZGQgaXQgaW4gVjIsIHRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHN1Y2ggYmlnIG1pc3Rha2UhDQoN
CkFuc29uDQoNCj4gDQo+ID4gKw0KPiA+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ICstIHRp
bWVvdXQtc2VjIDogQ29udGFpbnMgdGhlIHdhdGNoZG9nIHRpbWVvdXQgaW4gc2Vjb25kcw0KPiA+
ICsNCj4gPiArRXhhbXBsZXM6DQo+ID4gKw0KPiA+ICt3ZG9nMTogd2RvZ0A0MDNkMDAwMCB7DQo+
ID4gKwljb21wYXRpYmxlID0gImZzbCxpbXg3dWxwLXdkdCI7DQo+ID4gKwlyZWcgPSA8MHg0MDNk
MDAwMCAweDEwMDAwPjsNCj4gPiArCWludGVycnVwdHMgPSA8R0lDX1NQSSA1NSBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsNCj4gPiArCWNsb2NrcyA9IDwmcGNjMiBJTVg3VUxQX0NMS19XREcxPjsNCj4g
PiArCWFzc2lnbmVkLWNsb2NrcyA9IDwmcGNjMiBJTVg3VUxQX0NMS19XREcxPjsNCj4gPiArCWFz
c2lnbmVkLWNsb2Nrcy1wYXJlbnRzID0gPCZzY2cxIElNWDdVTFBfQ0xLX0ZJUkNfQlVTX0NMSz47
DQo+ID4gKwl0aW1lb3V0LXNlYyA9IDw0MD47DQo+ID4gK307DQo+ID4gLS0NCj4gPiAyLjcuNA0K
PiA+DQo=
