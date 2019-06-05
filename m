Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C60A3560C
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 06:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfFEE4p (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 00:56:45 -0400
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:23571
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725268AbfFEE4p (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 00:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJPPycBznKxJLkOKwutPF332d45GfWJZXuNpSyXdk7s=;
 b=tLSKxH9i6H4dXlLurfZxoXoHnHcvJ5KAE+brwRiFS0QJDyRXWG4fTsI623302yOkYDah36iHdvdXobIso9czLQ3WOqwpBTCk0MJSntChXFN1SkZ3baT2mpuBf1ADWD8qz624FyeswKpaMOHulaL9W9iocodT7EvYEdh6NwXlDZA=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3986.jpnprd01.prod.outlook.com (20.178.103.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 04:56:41 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 04:56:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] watchdog: renesas_wdt: Add a few cycles delay
Thread-Topic: [PATCH] watchdog: renesas_wdt: Add a few cycles delay
Thread-Index: AQHVGe8P7w1/Z0ffD0aoOp2Q4vSn46aJsfYAgAAFHACAAA1eAIACvXxQ
Date:   Wed, 5 Jun 2019 04:56:41 +0000
Message-ID: <OSAPR01MB30890CB262FD70117707600ED8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559553957-5764-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWGBr+kwY18o657J_SCTONSJLZMUs2qMBvBU84p-UNfYA@mail.gmail.com>
 <OSAPR01MB3089AE3893A8DA4D77F34413D8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <CAMuHMdUKugUiqAi=o14BTG5Tihq_H04DOs0ixkGEHxc7vo9uCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUKugUiqAi=o14BTG5Tihq_H04DOs0ixkGEHxc7vo9uCQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd8e6dc5-e8ae-4c3b-12a3-08d6e972334b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3986;
x-ms-traffictypediagnostic: OSAPR01MB3986:
x-microsoft-antispam-prvs: <OSAPR01MB3986D730690D7AC05399D879D8160@OSAPR01MB3986.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(136003)(39860400002)(366004)(199004)(189003)(8936002)(6246003)(81166006)(52536014)(73956011)(81156014)(66946007)(14454004)(8676002)(66556008)(66446008)(64756008)(66476007)(76116006)(5660300002)(74316002)(71190400001)(2906002)(4326008)(478600001)(316002)(71200400001)(33656002)(7696005)(256004)(54906003)(305945005)(6916009)(7736002)(25786009)(6436002)(486006)(66066001)(6506007)(3846002)(9686003)(68736007)(6116002)(11346002)(86362001)(186003)(446003)(99286004)(26005)(476003)(102836004)(229853002)(55016002)(53936002)(76176011)(4744005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3986;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fDXyASHJg+U9yoWdLdAAXNwBcAWY+9QoMpBolU2sml84nkXE2bgHmEJw7RdF0Gs6b09Mu8meKQ2EsOcEcIb1w5zddI+oGoj3vru3/WBumgtblJs1mJxLzo+dQ4UlvmiviAkQYL3Gtf8doEHuUH1eUAyxQT5pKiRyplcsTPuVFBEriXX09scXH9koSHmKw5PMicoj/Ywr0qvYQtTfm/A+7/k2IuZXojaTw34R4Nh6uMzPYJUknKEqoosbhdVLZ+VVTb1ajKKm4vJi8NlFNLZzGnevsrG5tTG3u42Jey9Bfgmrb5HzidSC3Uc9fQu8wZ8Qnfk1FeSj+39G069b3dt8MyMGYTI7Xx94n2swvLBmpigh3YuWpYwfXShsi6+a5sQwxewY6SBiW1MYd7T1XvBi/PFVOvGZkzB2jm3pNniDzqA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8e6dc5-e8ae-4c3b-12a3-08d6e972334b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 04:56:41.3226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3986
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBKdW5lIDMsIDIwMTkgODowNSBQTQ0KPHNuaXA+DQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyBwZXJpb2RzLCBkZWxheXM7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAg
ICAgICBwZXJpb2RzID0gRElWX1JPVU5EX1VQKHByaXYtPmNsa19yYXRlLCBjeWNsZXMpOw0KPiA+
ID4NCj4gPiA+IFNob3VsZG4ndCB0aGUgYWJvdmUgYmUgYSBkaXZpc2lvbiB3aXRoIHJvdW5kaW5n
IGRvd24gKGkuZS4gYSBwbGFpbiBDDQo+ID4gPiBkaXZpc2lvbiksIGluc3RlYWQgb2YgYSBkaXZp
c2lvbiB3aXRoIHJvdW5kaW5nIHVwPw0KPiA+DQo+ID4gSSBoYXZlIG5vIGlkZWEgd2hpY2ggaXMg
dGhlIGNvcnJlY3Qgd2F5IChyb3VuZGluZyBkb3duIHZzIHJvdW5kaW5nIHVwIGhlcmUpLg0KPiA+
IEF0IGxlYXN0LCBJIHRyaWVkIHRvIHVzZSByb3VuZGluZyBkb3duIGJlZm9yZSBzdWJtaXR0aW5n
IHBhdGNoIGFuZCB0aGVuDQo+ID4gdGhlIHJlc3VsdCBzZWVtZWQgdGhlIHNhbWUuIFNvLCBJIHN1
Ym1pdHRlZCB0aGlzIHBhdGNoIHdpdGggcm91bmRpbmcgdXANCj4gPiAoYmVjYXVzZSB0aGUgbmV4
dCBzdGVwIGFsc28gdXNlZCByb3VuZGluZyB1cC4uLikuDQo+IA0KPiBJZiB5b3Ugcm91bmQgdXAg
cGVyaW9kcywgaXQgd2lsbCBkZWNyZWFzZSB0aGUgZGVsYXksIHdoaWNoIG1heSBiZWNvbWUNCj4g
dG9vIHNtYWxsLg0KPiBJZiB5b3Ugcm91bmQgdXAgZGVsYXlzLCBpdCB3aWxsIGluY3JlYXNlIHRo
ZSBkZWxheSwgd2hpY2ggZG9lc24ndCBodXJ0Lg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZXhwbGFu
YXRpb24gaW4gZGV0YWlsISBJIHVuZGVyc3Rvb2QgaXQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCg==
