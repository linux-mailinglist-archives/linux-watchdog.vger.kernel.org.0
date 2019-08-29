Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094C1A2894
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2019 23:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfH2VC3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Aug 2019 17:02:29 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36483 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2VC3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Aug 2019 17:02:29 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D1E09886BF;
        Fri, 30 Aug 2019 09:02:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1567112544;
        bh=ql4eAyFpTO1/R9hTDFeHyRmLW3TAmuspz5BHfGH8Z+s=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=jR1bJ33G9iResNdgrM0wh25WYR2a6wQU6XbHA8z70AtR1VeZa9aXr9hOOjed5A8uz
         kyM5Lc9S5qDLuCF+PvGggltAWKEHoCO/HXlY9AwWTYPJ/nCkfdwSaEwFetMQs6OfXs
         a8YSH74hUtwGbYko5AiHPmRqrw1BjaLnoADrm0xt3l6+XMkE0wscL4Q5KxSYG0bAvg
         SaClHUtKjW+lNBJ3AJXIhXXs+9CzcKtdYJi4goAgtpjYV1pIkUDtir4EZMNh2eDBAJ
         gTXG68KZud5TJVwzUz9mdaj0rpulOvwrDN2eMqH8EbiBnyMONYxmaqVn2iExwag6Qc
         VOLusX6N8OL1g==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d683d600001>; Fri, 30 Aug 2019 09:02:24 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Fri, 30 Aug 2019 09:02:24 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 30 Aug 2019 09:02:24 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v5] watchdog: orion_wdt: use timer1 as a pretimeout
Thread-Topic: [PATCH v5] watchdog: orion_wdt: use timer1 as a pretimeout
Thread-Index: AQHVXkbaBpCG00oUu0GMeMzmwHIzWacRSbgAgACKq4A=
Date:   Thu, 29 Aug 2019 21:02:23 +0000
Message-ID: <7ca9461424f81f396e139991a9b72d5f0fa3572c.camel@alliedtelesis.co.nz>
References: <20190829085042.30886-1-chris.packham@alliedtelesis.co.nz>
         <eb3c9f1b-5a60-cb36-8cc5-6a83bf9678ba@roeck-us.net>
In-Reply-To: <eb3c9f1b-5a60-cb36-8cc5-6a83bf9678ba@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3129:5b1d:dda7:5c4b]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6F9A7DDD7C1054E8CCEFD8F7B5AF634@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gVGh1LCAyMDE5LTA4LTI5IGF0IDA1OjQ2IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBPbiA4LzI5LzE5IDE6NTAgQU0sIENocmlzIFBhY2toYW0gd3JvdGU6DQo+ID4gVGhlIG9yaW9u
IHdhdGNoZG9nIGNhbiBlaXRoZXIgcmVzZXQgdGhlIENQVSBvciBnZW5lcmF0ZSBhbiBpbnRlcnJ1
cHQuDQo+ID4gVGhlIGludGVycnVwdCB3b3VsZCBiZSB1c2VmdWwgZm9yIGRlYnVnZ2luZyBhcyBp
dCBwcm92aWRlcyBwYW5pYygpDQo+ID4gb3V0cHV0IGFib3V0IHRoZSB3YXRjaGRvZyBleHBpcnks
IGhvd2V2ZXIgaWYgdGhlIGludGVycnVwdCBpcyB1c2VkIHRoZQ0KPiA+IHdhdGNoZG9nIGNhbid0
IHJlc2V0IHRoZSBDUFUgaW4gdGhlIGV2ZW50IG9mIGJlaW5nIHN0dWNrIGluIGEgbG9vcCB3aXRo
DQo+ID4gaW50ZXJydXB0cyBkaXNhYmxlZCBvciBpZiB0aGUgQ1BVIGlzIHByZXZlbnRlZCBmcm9t
IGFjY2Vzc2luZyBtZW1vcnkNCj4gPiAoZS5nLiBhbiB1bnRlcm1pbmF0ZWQgRE1BKS4NCj4gPiAN
Cj4gPiBUaGUgQXJtYWRhIFNvQ3MgaGF2ZSBzcGFyZSB0aW1lcnMgdGhhdCBhcmVuJ3QgY3VycmVu
dGx5IHVzZWQgYnkgdGhlDQo+ID4gTGludXgga2VybmVsLiBXZSBjYW4gdXNlIHRpbWVyMSB0byBw
cm92aWRlIGEgcHJlLXRpbWVvdXQgYWhlYWQgb2YgdGhlDQo+ID4gd2F0Y2hkb2cgdGltZXIgYW5k
IHByb3ZpZGUgdGhlIHBvc3NpYmlsaXR5IG9mIGdhdGhlcmluZyBkZWJ1ZyBiZWZvcmUgdGhlDQo+
ID4gcmVzZXQgdHJpZ2dlcnMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hh
bSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KDQo8c25pcD4NCg0KPiA+IEBA
IC0yNzcsNyArMjkxLDcgQEAgc3RhdGljIGludCBvcmlvbl9zdG9wKHN0cnVjdCB3YXRjaGRvZ19k
ZXZpY2UgKndkdF9kZXYpDQo+ID4gICBzdGF0aWMgaW50IGFybWFkYTM3NV9zdG9wKHN0cnVjdCB3
YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IG9yaW9uX3dh
dGNoZG9nICpkZXYgPSB3YXRjaGRvZ19nZXRfZHJ2ZGF0YSh3ZHRfZGV2KTsNCj4gPiAtCXUzMiBy
ZWc7DQo+ID4gKwl1MzIgcmVnLCBtYXNrOw0KPiA+ICAgDQo+ID4gICAJLyogRGlzYWJsZSByZXNl
dCBvbiB3YXRjaGRvZyAqLw0KPiA+ICAgCWF0b21pY19pb19tb2RpZnkoZGV2LT5yc3RvdXRfbWFz
aywgZGV2LT5kYXRhLT5yc3RvdXRfbWFza19iaXQsDQo+ID4gQEAgLTI4Nyw3ICszMDEsMTAgQEAg
c3RhdGljIGludCBhcm1hZGEzNzVfc3RvcChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZHRfZGV2
KQ0KPiA+ICAgCXdyaXRlbChyZWcsIGRldi0+cnN0b3V0KTsNCj4gPiAgIA0KPiA+ICAgCS8qIERp
c2FibGUgd2F0Y2hkb2cgdGltZXIgKi8NCj4gPiAtCWF0b21pY19pb19tb2RpZnkoZGV2LT5yZWcg
KyBUSU1FUl9DVFJMLCBkZXYtPmRhdGEtPndkdF9lbmFibGVfYml0LCAwKTsNCj4gPiArCW1hc2sg
PSBkZXYtPmRhdGEtPndkdF9lbmFibGVfYml0Ow0KPiA+ICsJaWYgKHdkdF9kZXYtPmluZm8tPm9w
dGlvbnMgJiBXRElPRl9QUkVUSU1FT1VUKQ0KPiA+ICsJCW1hc2sgJj0gflRJTUVSMV9FTkFCTEVf
QklUOw0KPiANCj4gU29ycnksIEkgYW0gbG9zdC4gV2h5ICY9IGFuZCB+ID8NCg0KQmxhbWUgbGF0
ZSBuaWdodCBjb2RpbmcuDQoNCkkgc2F3IHRoZSBsaW5lcyBhYm92ZSB3aXRoICdyZWcgJj0gfmRl
di0+ZGF0YS0+cnN0b3V0X2VuYWJsZV9iaXQnIGFuZA0Kd2l0aG91dCB0aGUgcmVxdWlzaXRlIGxl
dmVsIG9mIGNhZmZpbmUgaW4gbXkgc3lzdGVtIG15IGJyYWluIHNhaWQgInlvdQ0KbmVlZCB0byBj
bGVhciB0aGF0IGJpdCIuIFdoaWNoIGlzIGV4YWN0bHkgd2hhdCB0aGUgYXRvbWljX2lvX21vZGlm
eSgpDQpiZWxvdyB3b3VsZCBkbyBpZiBJIGFjdHVhbGx5IGdhdmUgaXQgdGhlIHJpZ2h0IG1hc2su
DQoNCj4gR3VlbnRlcg0KPiANCj4gPiArCWF0b21pY19pb19tb2RpZnkoZGV2LT5yZWcgKyBUSU1F
Ul9DVFJMLCBtYXNrLCAwKTsNCj4gPiAgIA0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+
IEBAIC0zNDksNyArMzY2LDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCBvcmlvbl93ZHRfZ2V0X3Rp
bWVsZWZ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYpDQo+ID4gICAJcmV0dXJuIHJl
YWRsKGRldi0+cmVnICsgZGV2LT5kYXRhLT53ZHRfY291bnRlcl9vZmZzZXQpIC8gZGV2LT5jbGtf
cmF0ZTsNCj4gPiAgIH0NCj4gPiAgIA0KPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHdhdGNoZG9n
X2luZm8gb3Jpb25fd2R0X2luZm8gPSB7DQo+ID4gK3N0YXRpYyBzdHJ1Y3Qgd2F0Y2hkb2dfaW5m
byBvcmlvbl93ZHRfaW5mbyA9IHsNCj4gPiAgIAkub3B0aW9ucyA9IFdESU9GX1NFVFRJTUVPVVQg
fCBXRElPRl9LRUVQQUxJVkVQSU5HIHwgV0RJT0ZfTUFHSUNDTE9TRSwNCj4gPiAgIAkuaWRlbnRp
dHkgPSAiT3Jpb24gV2F0Y2hkb2ciLA0KPiA+ICAgfTsNCj4gPiBAQCAtMzY4LDYgKzM4NSwxNiBA
QCBzdGF0aWMgaXJxcmV0dXJuX3Qgb3Jpb25fd2R0X2lycShpbnQgaXJxLCB2b2lkICpkZXZpZCkN
Cj4gPiAgIAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gICB9DQo+ID4gICANCj4gPiArc3RhdGlj
IGlycXJldHVybl90IG9yaW9uX3dkdF9wcmVfaXJxKGludCBpcnEsIHZvaWQgKmRldmlkKQ0KPiA+
ICt7DQo+ID4gKwlzdHJ1Y3Qgb3Jpb25fd2F0Y2hkb2cgKmRldiA9IGRldmlkOw0KPiA+ICsNCj4g
PiArCWF0b21pY19pb19tb2RpZnkoZGV2LT5yZWcgKyBUSU1FUl9BMzcwX1NUQVRVUywNCj4gPiAr
CQkJIFRJTUVSMV9TVEFUVVNfQklULCAwKTsNCj4gPiArCXdhdGNoZG9nX25vdGlmeV9wcmV0aW1l
b3V0KCZkZXYtPndkdCk7DQo+ID4gKwlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gK30NCj4gPiAr
DQo+ID4gICAvKg0KPiA+ICAgICogVGhlIG9yaWdpbmFsIGRldmljZXRyZWUgYmluZGluZyBmb3Ig
dGhpcyBkcml2ZXIgc3BlY2lmaWVkIG9ubHkNCj4gPiAgICAqIG9uZSBtZW1vcnkgcmVzb3VyY2Us
IHNvIGluIG9yZGVyIHRvIGtlZXAgRFQgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkNCj4gPiBAQCAt
NTg5LDYgKzYxNiwxOCBAQCBzdGF0aWMgaW50IG9yaW9uX3dkdF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgCQl9DQo+ID4gICAJfQ0KPiA+ICAgDQoNCkknbGwgYWRk
IGEgY29tbWVudCBhYm92ZSB0aGUgZmlyc3QgcGxhdGZvcm1fZ2V0X2lycSgpIGFib3V0DQppbnRl
bnRpb25hbGx5IG5vdCBoYW5kbGluZyBFUFJPQkVfREVGRVIuIEFuZCBhIGNvbW1lbnQgaGVyZSBh
Ym91dCB0aGUNCjJuZCBpbnRlcnJ1cHQgYmVpbmcgb3B0aW9uYWwuDQoNCj4gPiArCWlycSA9IHBs
YXRmb3JtX2dldF9pcnEocGRldiwgMSk7DQo+ID4gKwlpZiAoaXJxID4gMCkgew0KPiA+ICsJCW9y
aW9uX3dkdF9pbmZvLm9wdGlvbnMgfD0gV0RJT0ZfUFJFVElNRU9VVDsNCj4gPiArCQlyZXQgPSBk
ZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGlycSwgb3Jpb25fd2R0X3ByZV9pcnEsDQo+ID4g
KwkJCQkgICAgICAgMCwgcGRldi0+bmFtZSwgZGV2KTsNCj4gPiArCQlpZiAocmV0IDwgMCkgew0K
PiA+ICsJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVxdWVzdCBJUlFcbiIpOw0K
PiA+ICsJCQlnb3RvIGRpc2FibGVfY2xrOw0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+ID4g
Kw0KPiA+ICAgCXdhdGNoZG9nX3NldF9ub3dheW91dCgmZGV2LT53ZHQsIG5vd2F5b3V0KTsNCj4g
PiAgIAlyZXQgPSB3YXRjaGRvZ19yZWdpc3Rlcl9kZXZpY2UoJmRldi0+d2R0KTsNCj4gPiAgIAlp
ZiAocmV0KQ0KPiA+IA0KPiANCj4gDQo=
