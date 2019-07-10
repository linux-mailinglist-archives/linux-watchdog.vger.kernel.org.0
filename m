Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B826464CA8
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Jul 2019 21:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfGJTVn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Jul 2019 15:21:43 -0400
Received: from mail-eopbgr140078.outbound.protection.outlook.com ([40.107.14.78]:31302
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727923AbfGJTVn (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Jul 2019 15:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFtSsyACGhccZbdIhr+zP58+DmKZEiya14xZX7BbJfo=;
 b=RKiV1fFp6xQLl/9bg0IU75G1kCqRmTwORP6te5ZH1P4YpbRz8vDX8LICtL5ek5I6tL4WnpeCfs38hDI0KJXdKpnDh2lleFcJH3w1Q3ECUwhFXsVvqYj4O+a0sVXF9UzUGUWkmtsTNuuTGXMwAGigJJH7fGEL5kFzGsmGfqqpx8s=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB6322.eurprd06.prod.outlook.com (20.179.253.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Wed, 10 Jul 2019 19:20:59 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.022; Wed, 10 Jul 2019
 19:20:59 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Topic: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Index: AQHVNpIpwwoCbUKMfU6U33+0Mj8DZ6bCupCAgAA6IwD//9K3gIABdKSA
Date:   Wed, 10 Jul 2019 19:20:59 +0000
Message-ID: <66ed7888-7ab9-0600-78d5-f9f2ebd4bf01@vaisala.com>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-5-tomas.melin@vaisala.com>
 <20190709202113.GD27937@roeck-us.net>
 <4cc8b578-07f1-f0ec-1150-e0db9e47107c@vaisala.com>
 <20190709210713.GB29377@roeck-us.net>
In-Reply-To: <20190709210713.GB29377@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0401CA0055.eurprd04.prod.outlook.com
 (2603:10a6:3:19::23) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3350d22d-9b52-4a54-3453-08d7056bbd60
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB6322;
x-ms-traffictypediagnostic: AM0PR06MB6322:
x-microsoft-antispam-prvs: <AM0PR06MB6322933AA00E4ABDF287434BFDF00@AM0PR06MB6322.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(366004)(136003)(346002)(39850400004)(199004)(189003)(31686004)(81166006)(6246003)(26005)(81156014)(6486002)(186003)(8676002)(99286004)(36756003)(6116002)(6506007)(386003)(76176011)(102836004)(2906002)(53936002)(53546011)(229853002)(54906003)(6916009)(8936002)(68736007)(52116002)(14454004)(86362001)(2616005)(66446008)(6512007)(66556008)(316002)(66946007)(11346002)(478600001)(71200400001)(66476007)(64756008)(305945005)(446003)(4326008)(3846002)(7736002)(71190400001)(6436002)(486006)(25786009)(66066001)(476003)(256004)(5660300002)(31696002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB6322;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oyxgWHRm47ajBjcYsCsIsvjkpv+xDsnWxkI9Y7HPLd8diIZ5fR/EVwyS2Uq2LcNq7eWdknlXQ9VLrMed4Khnf30psWuJbX9PFrdvIsSSYtOMmAVRJdJvm3xvvxzIWphuHNSTdHoRuHnXLPAdhBRODSQ199DXWwHr11R+7a5FyYjmRBot2ffXXFYpB4BBav0rX5ttHQe11r7gw0Y+zPWRD6bBMkBtjXLr5bnlYfKo87ybBeomRzeOXE/56AaZRNpQwq+d7P+BvKAZox/1IcvoSid+WuvIV/hl7BuWWNgVg2pffUHiLbRf8gWSHSwVwxrn+rGhuwcHrNT9AcSOe/lVTH11nhS3CM1Z0vhs4Fh3D7bDD27kB+Erzth/ggETNdWK9VnFm18xxZcSjY/wVeVwgDDM+Nr8x5eQy8FtCr8mYus=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76B04116166AE445983CC20CF16A840D@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3350d22d-9b52-4a54-3453-08d7056bbd60
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 19:20:59.5011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6322
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

DQpPbiA3LzEwLzE5IDEyOjA3IEFNLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBBaCwgd2UgYXJl
IHRhbGtpbmcgYWJvdXQgdGhlIF9zbWFsbGVzdF8gdGltZW91dCBhbmQgYWJvdXQgcmVzb2x1dGlv
bi4NCj4gQnV0IHRoYXQgaXMgbm8gcmVhc29uIHRvIGRlY2xhcmUgdGhlIGNsb2NrIGludmFsaWQu
IEp1c3Qgc2V0IHRoZSBtaW5pbXVtDQo+IHRvIHRoZSBhY3R1YWwgbWluaW11bS4gIFRoZXJlIGlz
IG5vIHJlYXNvbiB0byByZWplY3Qgc2xvdyBjbG9ja3MgZW50aXJlbHksDQo+IGV2ZW4gaWYgdGhl
IGdyYW51bGFyaXR5IGlzIGluIHRoZSBtdWx0aS1zZWNvbmQgcmFuZ2UuIFRoZSBvbmx5IGNhdmVh
dCwNCj4gaWYgZ3JhbnVsYXJpdHkgaXMgbW9yZSB0aGFuIG9uZSBzZWNvbmQsIGlzIHRoYXQgdGhl
IHNldF90aW1lb3V0IGZ1bmN0aW9uDQo+IG11c3Qgc2VsZWN0IGFuZCByZXBvcnQgdGhlIGFjdHVh
bCB0aW1lb3V0Lg0KDQpJIGRpZCBjb25zaWRlciBzdXBwb3J0aW5nIHNsb3dlciBjbG9ja3MgYnV0
IHRob3VnaHQgdGhhdCB0aGUgcmVxdWlyZWQNCg0KYWRkaXRpb25hbCBsb2dpYyB3YXMgcGVyaGFw
cyBub3Qgd29ydGggaXQuIFNvIGluc3RlYWQganVzdCBkZWNsYXJlZA0KDQp0aG9zZSBjbG9jayBm
cmVxdWVuY2llcyBpbnZhbGlkLg0KDQpIb3dldmVyLCBpZiB0aGF0IGxvZ2ljIGlzIHJlcXVpcmVk
LCBzdXJlIEkgY2FuIHRyeSB0byBpbXBsZW1lbnQgaXQuDQoNCkl0IG1pZ2h0IHRha2Ugc29tZSB3
ZWVrcyBiZWZvcmUgSSBoYXZlIHRpbWUgdG8gbG9vayBhdCBpdCBwcm9wZXJseS4NCg0KDQpUaGFu
a3MsDQoNClRvbWFzDQoNCj4NCj4gVGhhbmtzLA0KPiBHdWVudGVyDQo+DQo+PiBUaGFua3MsDQo+
Pg0KPj4gVG9tYXMNCj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRvbWFzIE1lbGluIDx0b21hcy5t
ZWxpbkB2YWlzYWxhLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvd2F0Y2hkb2cvY2Fk
ZW5jZV93ZHQuYyB8IDIxICsrKysrKysrKysrKysrKy0tLS0tLQ0KPj4+PiAgICAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvY2FkZW5jZV93ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cv
Y2FkZW5jZV93ZHQuYw0KPj4+PiBpbmRleCAwYmRiMjc1ZDkwNGEuLjAzN2ZhZjU1N2Y5ZCAxMDA2
NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9jYWRlbmNlX3dkdC5jDQo+Pj4+ICsrKyBi
L2RyaXZlcnMvd2F0Y2hkb2cvY2FkZW5jZV93ZHQuYw0KPj4+PiBAQCAtMzMsMTYgKzMzLDE3IEBA
DQo+Pj4+ICAgICNkZWZpbmUgQ0ROU19XRFRfQ09VTlRFUl9WQUxVRV9ESVZJU09SIDB4MTAwMA0K
Pj4+PiAgICANCj4+Pj4gICAgLyogQ2xvY2sgcHJlc2NhbGVyIHZhbHVlIGFuZCBzZWxlY3Rpb24g
Ki8NCj4+Pj4gKyNkZWZpbmUgQ0ROU19XRFRfUFJFU0NBTEVfOAk4DQo+Pj4+ICAgICNkZWZpbmUg
Q0ROU19XRFRfUFJFU0NBTEVfNjQJNjQNCj4+Pj4gICAgI2RlZmluZSBDRE5TX1dEVF9QUkVTQ0FM
RV81MTIJNTEyDQo+Pj4+ICAgICNkZWZpbmUgQ0ROU19XRFRfUFJFU0NBTEVfNDA5Ngk0MDk2DQo+
Pj4+ICsjZGVmaW5lIENETlNfV0RUX1BSRVNDQUxFX1NFTEVDVF84CTANCj4+Pj4gICAgI2RlZmlu
ZSBDRE5TX1dEVF9QUkVTQ0FMRV9TRUxFQ1RfNjQJMQ0KPj4+PiAgICAjZGVmaW5lIENETlNfV0RU
X1BSRVNDQUxFX1NFTEVDVF81MTIJMg0KPj4+PiAgICAjZGVmaW5lIENETlNfV0RUX1BSRVNDQUxF
X1NFTEVDVF80MDk2CTMNCj4+Pj4gICAgDQo+Pj4+IC0vKiBJbnB1dCBjbG9jayBmcmVxdWVuY3kg
Ki8NCj4+Pj4gLSNkZWZpbmUgQ0ROU19XRFRfQ0xLXzEwTUhaCTEwMDAwMDAwDQo+Pj4+IC0jZGVm
aW5lIENETlNfV0RUX0NMS183NU1IWgk3NTAwMDAwMA0KPj4+PiArLyogQmFzZSBpbnB1dCBjbG9j
ayBmcmVxdWVuY3kgKi8NCj4+Pj4gKyNkZWZpbmUgQ0ROU19XRFRfQ0xLXzMyS0haIDMyNzY4DQo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gUGxlYXNlIHVzZSBhIHRhYiBoZXJl
DQo+Pj4NCj4+Pj4gICAgDQo+Pj4+ICAgIC8qIENvdW50ZXIgbWF4aW11bSB2YWx1ZSAqLw0KPj4+
PiAgICAjZGVmaW5lIENETlNfV0RUX0NPVU5URVJfTUFYIDB4RkZGDQo+Pj4+IEBAIC0zMTgsMTAg
KzMxOSwxOCBAQCBzdGF0aWMgaW50IGNkbnNfd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+Pj4+ICAgIAkJcmV0dXJuIHJldDsNCj4+Pj4gICAgDQo+Pj4+ICAgIAljbG9j
a19mID0gY2xrX2dldF9yYXRlKHdkdC0+Y2xrKTsNCj4+Pj4gLQlpZiAoY2xvY2tfZiA9PSAwKSB7
DQo+Pj4+IC0JCWRldl9lcnIoZGV2LCAiaW52YWxpZCBjbG9jayBmcmVxdWVuY3ksIChmPSVsdSlc
biIsIGNsb2NrX2YpOw0KPj4+PiArCWlmIChjbG9ja19mIDwgQ0ROU19XRFRfQ0xLXzMyS0haKSB7
DQo+Pj4+ICsJCWRldl9lcnIoZGV2LA0KPj4+PiArCQkJImNhbm5vdCBmaW5kIHN1aXRhYmxlIGNs
b2NrIHByZXNjYWxlciwgKGY9JWx1KVxuIiwNCj4+Pj4gKwkJCWNsb2NrX2YpOw0KPj4+PiAgICAJ
CXJldHVybiAtRUlOVkFMOw0KPj4+PiAtCX0gZWxzZSBpZiAoY2xvY2tfZiA8PSBDRE5TX1dEVF9D
TEtfNzVNSFopIHsNCj4+Pj4gKwl9IGVsc2UgaWYgKGNsb2NrX2YgPD0gQ0ROU19XRFRfQ0xLXzMy
S0haICogQ0ROU19XRFRfUFJFU0NBTEVfOCkgew0KPj4+PiArCQl3ZHQtPnByZXNjYWxlciA9IENE
TlNfV0RUX1BSRVNDQUxFXzg7DQo+Pj4+ICsJCXdkdC0+Y3RybF9jbGtzZWwgPSBDRE5TX1dEVF9Q
UkVTQ0FMRV9TRUxFQ1RfODsNCj4+Pj4gKwl9IGVsc2UgaWYgKGNsb2NrX2YgPD0gQ0ROU19XRFRf
Q0xLXzMyS0haICogQ0ROU19XRFRfUFJFU0NBTEVfNjQpIHsNCj4+Pj4gKwkJd2R0LT5wcmVzY2Fs
ZXIgPSBDRE5TX1dEVF9QUkVTQ0FMRV82NDsNCj4+Pj4gKwkJd2R0LT5jdHJsX2Nsa3NlbCA9IENE
TlNfV0RUX1BSRVNDQUxFX1NFTEVDVF82NDsNCj4+Pj4gKwl9IGVsc2UgaWYgKGNsb2NrX2YgPD0g
Q0ROU19XRFRfQ0xLXzMyS0haICogQ0ROU19XRFRfUFJFU0NBTEVfNTEyKSB7DQo+Pj4+ICAgIAkJ
d2R0LT5wcmVzY2FsZXIgPSBDRE5TX1dEVF9QUkVTQ0FMRV81MTI7DQo+Pj4+ICAgIAkJd2R0LT5j
dHJsX2Nsa3NlbCA9IENETlNfV0RUX1BSRVNDQUxFX1NFTEVDVF81MTI7DQo+Pj4+ICAgIAl9IGVs
c2Ugew0KPj4+PiAtLSANCj4+Pj4gMi4xNy4yDQo+Pj4+DQo=
