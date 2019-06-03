Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096B632DB1
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Jun 2019 12:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfFCK2F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Jun 2019 06:28:05 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:51704
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726055AbfFCK2F (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Jun 2019 06:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HR+hJ/fJi/p98/a9zRDd30MZuXhBwd4LUAsOKvv8sJQ=;
 b=l8OKhMXoyEY5iZ5WUXfOpuFcO0Zl/YJRxU+CeBXBppO+kP7VVs+Zly5q50tcrOqW76YihMrvwlcWLFndCsu4HFV8f1588Vb1nuBtHDIViTNXFSKhtj/jCh5AlBHay7xARmyM12ntuNAZZ5wB4UDN4IjgDvjrjA48mluaUqg5JKQ=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2034.jpnprd01.prod.outlook.com (52.134.235.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 10:28:01 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 10:28:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] watchdog: renesas_wdt: Add a few cycles delay
Thread-Topic: [PATCH] watchdog: renesas_wdt: Add a few cycles delay
Thread-Index: AQHVGe8P7w1/Z0ffD0aoOp2Q4vSn46aJsfYAgAAFHAA=
Date:   Mon, 3 Jun 2019 10:28:00 +0000
Message-ID: <OSAPR01MB3089AE3893A8DA4D77F34413D8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559553957-5764-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWGBr+kwY18o657J_SCTONSJLZMUs2qMBvBU84p-UNfYA@mail.gmail.com>
In-Reply-To: <CAMuHMdWGBr+kwY18o657J_SCTONSJLZMUs2qMBvBU84p-UNfYA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42f6aa0f-9cc3-4301-8d61-08d6e80e279d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2034;
x-ms-traffictypediagnostic: OSAPR01MB2034:
x-microsoft-antispam-prvs: <OSAPR01MB2034A416129E00830BB2DD4CD8140@OSAPR01MB2034.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:276;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(199004)(189003)(478600001)(256004)(6916009)(316002)(14454004)(11346002)(81166006)(81156014)(8676002)(486006)(5660300002)(446003)(8936002)(476003)(7736002)(52536014)(305945005)(74316002)(53936002)(229853002)(4326008)(3846002)(76176011)(7696005)(2906002)(6436002)(9686003)(6116002)(99286004)(55016002)(33656002)(86362001)(66556008)(66066001)(66476007)(6246003)(73956011)(66946007)(76116006)(64756008)(66446008)(53546011)(6506007)(186003)(25786009)(71190400001)(71200400001)(102836004)(54906003)(68736007)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2034;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jAUss0DmTIVru+m/6j62P1Vco9HpgWnD5AZnqIKnxbvspX0hTBdZsEgMpSBapUB0KpaTGGEvYwNKk2UXAD+Z0NQLPNx9ih7hQbLADuWBwKTvE+9DZ26SJEyjr75eFGf6R/9RD+rpYj5MnXQvbFJ0wXVfId928rU/w9Kvm5GRNxhp9YhN0ILULB72MZOfgY9yncGxtRZFcGptNmJ6eIkAo7F29WewrRlQ8DBeuWXBd+J/6+TOO9GJyiTytAb17khybYLKAZ7TX7m3+c5a7UTyJX1Q1NCcazY1Z0kc1H4mIcZivGeiyaHqBKxGpKefhMAlyhev4o1rw399KqXTSSmAPezBA0MojkZjzAgZAgud/lvWhwLTPKjBz+wlr8Wc39cOPux4kb5+jOaoZLGwQH9+mdY4WJ1L4K0InfxV+MewOqQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f6aa0f-9cc3-4301-8d61-08d6e80e279d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 10:28:01.0097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2034
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBKdW5lIDMsIDIwMTkgNjo1OSBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBPbiBN
b24sIEp1biAzLCAyMDE5IGF0IDExOjMxIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3NoaWhp
cm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWNjb3JkaW5nIHRvIHRoZSBo
YXJkd2FyZSBtYW51YWwgb2YgUi1DYXIgR2VuMiBhbmQgR2VuMywNCj4gPiBzb2Z0d2FyZSBzaG91
bGQgd2FpdCBhIGZldyBSTENLIGN5Y2xlcyBhcyBmb2xsb3dpbmc6DQo+ID4gIC0gRGVsYXkgMiBj
eWNsZXMgYmVmb3JlIHNldHRpbmcgd2F0Y2hkb2cgY291bnRlci4NCj4gPiAgLSBEZWxheSAzIGN5
Y2xlcyBiZWZvcmUgZGlzYWJsaW5nIG1vZHVsZSBjbG9jay4NCj4gPg0KPiA+IFNvLCB0aGlzIHBh
dGNoIGFkZHMgc3VjaCBkZWxheXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8g
U2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4gPiAtLS0g
YS9kcml2ZXJzL3dhdGNoZG9nL3JlbmVzYXNfd2R0LmMNCj4gPiArKysgYi9kcml2ZXJzL3dhdGNo
ZG9nL3JlbmVzYXNfd2R0LmMNCj4gDQo+ID4gQEAgLTcwLDYgKzcxLDE2IEBAIHN0YXRpYyBpbnQg
cndkdF9pbml0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RldikNCj4gPiAgICAg
ICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgcndkdF93YWl0KHN0
cnVjdCByd2R0X3ByaXYgKnByaXYsIHVuc2lnbmVkIGxvbmcgY3ljbGVzKQ0KPiANCj4gInVuc2ln
bmVkIGludCIgc2hvdWxkIGJlIHN1ZmZpY2llbnRseSBsYXJnZS4NCg0KSSBnb3QgaXQuDQoNCj4g
PiArew0KPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBwZXJpb2RzLCBkZWxheXM7DQo+ID4gKw0K
PiA+ICsgICAgICAgcGVyaW9kcyA9IERJVl9ST1VORF9VUChwcml2LT5jbGtfcmF0ZSwgY3ljbGVz
KTsNCj4gDQo+IFNob3VsZG4ndCB0aGUgYWJvdmUgYmUgYSBkaXZpc2lvbiB3aXRoIHJvdW5kaW5n
IGRvd24gKGkuZS4gYSBwbGFpbiBDDQo+IGRpdmlzaW9uKSwgaW5zdGVhZCBvZiBhIGRpdmlzaW9u
IHdpdGggcm91bmRpbmcgdXA/DQoNCkkgaGF2ZSBubyBpZGVhIHdoaWNoIGlzIHRoZSBjb3JyZWN0
IHdheSAocm91bmRpbmcgZG93biB2cyByb3VuZGluZyB1cCBoZXJlKS4NCkF0IGxlYXN0LCBJIHRy
aWVkIHRvIHVzZSByb3VuZGluZyBkb3duIGJlZm9yZSBzdWJtaXR0aW5nIHBhdGNoIGFuZCB0aGVu
DQp0aGUgcmVzdWx0IHNlZW1lZCB0aGUgc2FtZS4gU28sIEkgc3VibWl0dGVkIHRoaXMgcGF0Y2gg
d2l0aCByb3VuZGluZyB1cA0KKGJlY2F1c2UgdGhlIG5leHQgc3RlcCBhbHNvIHVzZWQgcm91bmRp
bmcgdXAuLi4pLg0KDQo+ID4gKyAgICAgICBkZWxheXMgPSBESVZfUk9VTkRfVVAoMTAwMDAwMFVM
LCBwZXJpb2RzKTsNCj4gDQo+IEdpdmVuIGN5Y2xlcyBpcyBhbHdheXMgYSBzbWFsbCBudW1iZXIs
IGFjY3VyYWN5IGNhbiBiZSBpbXByb3ZlZCwgYW5kIG9uZQ0KPiBkaXZpc2lvbiBjYW4gYmUgYXZv
aWRlZCwgYnkgY2FsY3VsYXRpb24gdGhpcyBhczoNCj4gDQo+ICAgICBkZWxheXMgPSBESVZfUk9V
TkRfVVAoY3ljbGVzICogMTAwMDAwMCAvICBwcml2LT5jbGtfcmF0ZSk7DQoNClRoYW5rIHlvdSBm
b3IgeW91ciBzdWdnZXN0ISBJIHRoaW5rIHNvLg0KSXQgc2hvdWxkIGJlICJzLyBcLy8sLyIgbGlr
ZSBiZWxvdyB0aG91Z2ggOikNCg0KCWRlbGF5cyA9IERJVl9ST1VORF9VUChjeWNsZXMgKiAxMDAw
MDAwLCBwcml2LT5jbGtfcmF0ZSk7DQoNCj4gPiArDQo+ID4gKyAgICAgICB1c2xlZXBfcmFuZ2Uo
ZGVsYXlzLCAyICogZGVsYXlzKTsNCj4gPiArfQ0KPiANCj4gVGhlIHJlc3QgbG9va3MgZ29vZCB0
byBtZSwgc28NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+DQoNClRoYW5rIHlvdSBmb3IgeW91ciBSZXZpZXdlZC1ieSB0YWchIEknbGwg
c3VibWl0IHYyIHBhdGNoIGxhdGVyLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9k
YQ0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
