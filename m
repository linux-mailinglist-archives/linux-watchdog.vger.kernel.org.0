Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533AA63CDC
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfGIUt0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:49:26 -0400
Received: from mail-eopbgr130083.outbound.protection.outlook.com ([40.107.13.83]:41858
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726401AbfGIUt0 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Is4TCfi4tJb9B/e7zqJsZT9mtTQXN+CicJogRgfP9Y=;
 b=fsNjhs1ZfF9sSppEFaQDX3eNuqVFzhIvKDOh5XiLk7B/SsOUDFHzKNm2ewrYeF+G/govmQLjhB1vD8IqX4gO395Fv8kUFZVaGwuFlz5aWK7GFsgxJIsGNaEtVV7FEAQ6JbcY5rPJhbAnZA4lS/kuaWtqynNnWSikSs40VovGcfc=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB5890.eurprd06.prod.outlook.com (20.178.113.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 20:49:20 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 20:49:20 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Topic: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Index: AQHVNpIpwwoCbUKMfU6U33+0Mj8DZ6bCupCAgAAH2QA=
Date:   Tue, 9 Jul 2019 20:49:20 +0000
Message-ID: <4cc8b578-07f1-f0ec-1150-e0db9e47107c@vaisala.com>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
 <20190709200801.42313-5-tomas.melin@vaisala.com>
 <20190709202113.GD27937@roeck-us.net>
In-Reply-To: <20190709202113.GD27937@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0350.eurprd05.prod.outlook.com
 (2603:10a6:7:92::45) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29bf5101-d1a8-4d6a-3f81-08d704aeeab7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB5890;
x-ms-traffictypediagnostic: AM0PR06MB5890:
x-microsoft-antispam-prvs: <AM0PR06MB58906DCB0BA7C4C9BC5A6804FDF10@AM0PR06MB5890.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39850400004)(366004)(136003)(396003)(189003)(199004)(4326008)(3846002)(6116002)(81166006)(316002)(66066001)(2906002)(8936002)(11346002)(81156014)(102836004)(386003)(476003)(8676002)(14454004)(64756008)(6506007)(66946007)(186003)(26005)(305945005)(66556008)(31696002)(5660300002)(53546011)(86362001)(7736002)(52116002)(71190400001)(486006)(256004)(66446008)(68736007)(36756003)(25786009)(71200400001)(6436002)(446003)(6512007)(6486002)(31686004)(2616005)(54906003)(478600001)(66476007)(53936002)(6916009)(99286004)(76176011)(6246003)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5890;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 817iW+UAYL/h4Bq5VIbpLWLW0dqREOoL523IUwQtzwWol8a/B5CPXgcvIUCAspJ4iJxD4CRuBQ/Gf8I8su5acyoxOEgFuDt3UXZ55xEMy0HQcybZVvcZ+K1BsA2N4UJtGNcJtFUQs0NFi7HA5dcskU4AQtEXc7LD7O3P86NXP/LMhUB6a24WPuP8M8wVW6sdDnGJcCyQM4msQB4SrRNDvkbwbBgYrMgvR6t5ZMqtcsRuWUgqMyA42CZR+Ycd5uxnH845IaC/SFfCZxGyFwhCqC5kVckq9fAeQme7Sj/qFnLbhQlSPHkao43erbv15odBs0MD/llXK1MoLjzbfcrtQrRfLrA2fzhsSywhKAGDQRD+2JVKi4TH4nWh2uQCdnjqwx/dOFOQ3zgHPIpSSxmlqOz4V/hQciKdl+WyQQupoEY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4214378F0DF81949A3AE97E47FCA88C1@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bf5101-d1a8-4d6a-3f81-08d704aeeab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 20:49:20.6192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5890
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gNy85LzE5IDExOjIxIFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KDQo+IE9uIFR1ZSwgSnVs
IDA5LCAyMDE5IGF0IDA4OjA5OjA2UE0gKzAwMDAsIE1lbGluIFRvbWFzIHdyb3RlOg0KPj4gQ2Fk
ZW5jZSB3YXRjaGRvZyBIVyBzdXBwb3J0cyBwcmVzY2FsZXIgdmFsdWVzIG9mDQo+PiA4LCA2NCwg
NTEyIGFuZCA0MDk2Lg0KPj4NCj4+IEFkZCBzdXBwb3J0IHRvIHNlbGVjdCBwcmVzY2FsZXIgdmFs
dWVzIG9mIDggYW5kIDY0IGZvciBsb3dlcg0KPj4gaW5wdXQgY2xvY2sgZnJlcXVlbmNpZXMuDQo+
Pg0KPj4gUHJlc2NhbGVyIHZhbHVlIGlzIHNlbGVjdGVkIHRvIGtlZXAgdGltZW91dCByZXNvbHV0
aW9uIG9mIDEgc2Vjb25kLg0KPj4gRm9yIGNsb2NrIGZyZXF1ZW5jaWVzIGJlbG93IDMya0h6LCAx
IHNlY29uZCByZXNvbHV0aW9uIGRvZXMNCj4+IG5vIGxvbmdlciBob2xkLCB0aGVyZWJ5IHJldHVy
bmluZyBhbiBlcnJvci4NCj4+DQo+IEkgdGhpbmsgSSBhbSBtaXNzaW5nIHNvbWV0aGluZy4gV2h5
IHdhcyB0aGlzIHZhbGlkL3N1cHBvcnRlZCB1cCB0byBub3csDQo+IGFuZCBpZiBpdCB3YXMsIHdo
eSBpcyBpdCBubyBsb25nZXIgcG9zc2libGUgdG8gc3VwcG9ydCBpdCA/DQoNClRoaXMgZHJpdmVy
IGhhc24ndCByZWFsbHkgc3VwcG9ydGVkIHNtYWxsZXIgaW5wdXQgY2xvY2sgZnJlcXVlbmNpZXMu
IFRoZSANCndhdGNoZG9nDQoNCmNhbiBiZSBkcml2ZW4gZnJvbSBhbiBpbnRlcm5hbCBjbG9jayB3
aXRoIHJhdGhlciBoaWdoIGZyZXF1ZW5jeSwgd2hpY2gNCg0KSSB0aGluayBpcyB0aGUgZGVmYXVs
dCBzZXR0aW5nLiBTbyB0eXBpY2FsbHksIG9uZSBtaWdodCBub3QgZXZlbiB1c2UgdGhlIA0Kc21h
bGxlciBwcmVzY2FsZXJzLg0KDQo+DQo+IEkgYW0gYWxzbyBhIGJpdCBjb25mdXNlZCBhYm91dCB0
aGUgbG9naWMuIFdpdGggYSBzbG93ZXIgY2xvY2ssIEkgd291bGQNCj4gZXhwZWN0IHRoYXQgdGhl
IHRpbWVvdXRzIGFyZSBnZXR0aW5nIGxhcmdlciwgbm90IHNtYWxsZXIuIENhbiB5b3UgZXhwbGFp
biA/DQoNClllcywgdGhhdCBpcyBjb3JyZWN0LiBTbyB3aXRoIGEgMzJrSHogY2xvY2sgdXNpbmcg
c21hbGxlc3QgYXZhaWxhYmxlIA0KcHJlc2NhbGVyLA0KDQp3ZSBnZXQgMSBzZWNvbmQgcmVzb2x1
dGlvbiAoYW5kIDEgc2Vjb25kIGFzIHNtYWxsZXN0IHRpbWVvdXQpLg0KDQpXaXRoIGFuIGV2ZW4g
c2xvd2VyIGNsb2NrIHRoYW4gdGhhdCwgd2Ugd291bGQgZW5kIHVwIHdpdGggZ3JhbnVsYXJpdHkN
Cg0KYW5kIHNtYWxsZXN0IHZhbHVlIGxhcmdlciB0aGFuIDEgc2Vjb25kLg0KDQoNClRoYW5rcywN
Cg0KVG9tYXMNCg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogVG9tYXMgTWVsaW4gPHRvbWFzLm1lbGlu
QHZhaXNhbGEuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvd2F0Y2hkb2cvY2FkZW5jZV93ZHQu
YyB8IDIxICsrKysrKysrKysrKysrKy0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93
YXRjaGRvZy9jYWRlbmNlX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9jYWRlbmNlX3dkdC5jDQo+
PiBpbmRleCAwYmRiMjc1ZDkwNGEuLjAzN2ZhZjU1N2Y5ZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvd2F0Y2hkb2cvY2FkZW5jZV93ZHQuYw0KPj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9jYWRl
bmNlX3dkdC5jDQo+PiBAQCAtMzMsMTYgKzMzLDE3IEBADQo+PiAgICNkZWZpbmUgQ0ROU19XRFRf
Q09VTlRFUl9WQUxVRV9ESVZJU09SIDB4MTAwMA0KPj4gICANCj4+ICAgLyogQ2xvY2sgcHJlc2Nh
bGVyIHZhbHVlIGFuZCBzZWxlY3Rpb24gKi8NCj4+ICsjZGVmaW5lIENETlNfV0RUX1BSRVNDQUxF
XzgJOA0KPj4gICAjZGVmaW5lIENETlNfV0RUX1BSRVNDQUxFXzY0CTY0DQo+PiAgICNkZWZpbmUg
Q0ROU19XRFRfUFJFU0NBTEVfNTEyCTUxMg0KPj4gICAjZGVmaW5lIENETlNfV0RUX1BSRVNDQUxF
XzQwOTYJNDA5Ng0KPj4gKyNkZWZpbmUgQ0ROU19XRFRfUFJFU0NBTEVfU0VMRUNUXzgJMA0KPj4g
ICAjZGVmaW5lIENETlNfV0RUX1BSRVNDQUxFX1NFTEVDVF82NAkxDQo+PiAgICNkZWZpbmUgQ0RO
U19XRFRfUFJFU0NBTEVfU0VMRUNUXzUxMgkyDQo+PiAgICNkZWZpbmUgQ0ROU19XRFRfUFJFU0NB
TEVfU0VMRUNUXzQwOTYJMw0KPj4gICANCj4+IC0vKiBJbnB1dCBjbG9jayBmcmVxdWVuY3kgKi8N
Cj4+IC0jZGVmaW5lIENETlNfV0RUX0NMS18xME1IWgkxMDAwMDAwMA0KPj4gLSNkZWZpbmUgQ0RO
U19XRFRfQ0xLXzc1TUhaCTc1MDAwMDAwDQo+PiArLyogQmFzZSBpbnB1dCBjbG9jayBmcmVxdWVu
Y3kgKi8NCj4+ICsjZGVmaW5lIENETlNfV0RUX0NMS18zMktIWiAzMjc2OA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeIFBsZWFzZSB1c2UgYSB0YWIgaGVyZQ0KPg0KPj4gICANCj4+
ICAgLyogQ291bnRlciBtYXhpbXVtIHZhbHVlICovDQo+PiAgICNkZWZpbmUgQ0ROU19XRFRfQ09V
TlRFUl9NQVggMHhGRkYNCj4+IEBAIC0zMTgsMTAgKzMxOSwxOCBAQCBzdGF0aWMgaW50IGNkbnNf
d2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgIAkJcmV0dXJuIHJl
dDsNCj4+ICAgDQo+PiAgIAljbG9ja19mID0gY2xrX2dldF9yYXRlKHdkdC0+Y2xrKTsNCj4+IC0J
aWYgKGNsb2NrX2YgPT0gMCkgew0KPj4gLQkJZGV2X2VycihkZXYsICJpbnZhbGlkIGNsb2NrIGZy
ZXF1ZW5jeSwgKGY9JWx1KVxuIiwgY2xvY2tfZik7DQo+PiArCWlmIChjbG9ja19mIDwgQ0ROU19X
RFRfQ0xLXzMyS0haKSB7DQo+PiArCQlkZXZfZXJyKGRldiwNCj4+ICsJCQkiY2Fubm90IGZpbmQg
c3VpdGFibGUgY2xvY2sgcHJlc2NhbGVyLCAoZj0lbHUpXG4iLA0KPj4gKwkJCWNsb2NrX2YpOw0K
Pj4gICAJCXJldHVybiAtRUlOVkFMOw0KPj4gLQl9IGVsc2UgaWYgKGNsb2NrX2YgPD0gQ0ROU19X
RFRfQ0xLXzc1TUhaKSB7DQo+PiArCX0gZWxzZSBpZiAoY2xvY2tfZiA8PSBDRE5TX1dEVF9DTEtf
MzJLSFogKiBDRE5TX1dEVF9QUkVTQ0FMRV84KSB7DQo+PiArCQl3ZHQtPnByZXNjYWxlciA9IENE
TlNfV0RUX1BSRVNDQUxFXzg7DQo+PiArCQl3ZHQtPmN0cmxfY2xrc2VsID0gQ0ROU19XRFRfUFJF
U0NBTEVfU0VMRUNUXzg7DQo+PiArCX0gZWxzZSBpZiAoY2xvY2tfZiA8PSBDRE5TX1dEVF9DTEtf
MzJLSFogKiBDRE5TX1dEVF9QUkVTQ0FMRV82NCkgew0KPj4gKwkJd2R0LT5wcmVzY2FsZXIgPSBD
RE5TX1dEVF9QUkVTQ0FMRV82NDsNCj4+ICsJCXdkdC0+Y3RybF9jbGtzZWwgPSBDRE5TX1dEVF9Q
UkVTQ0FMRV9TRUxFQ1RfNjQ7DQo+PiArCX0gZWxzZSBpZiAoY2xvY2tfZiA8PSBDRE5TX1dEVF9D
TEtfMzJLSFogKiBDRE5TX1dEVF9QUkVTQ0FMRV81MTIpIHsNCj4+ICAgCQl3ZHQtPnByZXNjYWxl
ciA9IENETlNfV0RUX1BSRVNDQUxFXzUxMjsNCj4+ICAgCQl3ZHQtPmN0cmxfY2xrc2VsID0gQ0RO
U19XRFRfUFJFU0NBTEVfU0VMRUNUXzUxMjsNCj4+ICAgCX0gZWxzZSB7DQo+PiAtLSANCj4+IDIu
MTcuMg0KPj4NCg==
