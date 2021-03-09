Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC893322F9
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Mar 2021 11:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhCIK0y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Mar 2021 05:26:54 -0500
Received: from smtp.asem.it ([151.1.184.197]:57463 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229656AbhCIK0v (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Mar 2021 05:26:51 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000853118.MSG 
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Mar 2021 11:26:46 +0100
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 9 Mar
 2021 11:26:45 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.2176.009; Tue, 9 Mar 2021 11:26:45 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: RE: [PATCH v1 0/2] Watchdog Core Global Parameters
Thread-Topic: [PATCH v1 0/2] Watchdog Core Global Parameters
Thread-Index: AQHXFA0+cWfgLr2kCEq1cRkIJfL71qp6bJ+AgAEHLsA=
Date:   Tue, 9 Mar 2021 10:26:45 +0000
Message-ID: <984953abc23c4cd6a4a6a5b77ae72e66@asem.it>
References: <20210308112151.716315-1-f.suligoi@asem.it>
 <d47fcc00-58fa-5850-7599-74644b34e39f@roeck-us.net>
In-Reply-To: <d47fcc00-58fa-5850-7599-74644b34e39f@roeck-us.net>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [5.90.207.91]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F23.60474D66.0007,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciwNCg0KPiA+IEluc3RlYWQgb2YgYWRkaW5nIHRoaXMga2luZCBvZiBtb2R1bGUg
cGFyYW1ldGVycyBpbmRlcGVuZGVudGx5IHRvIGVhY2gNCj4gPiBkcml2ZXIsIHRoZSBiZXN0IHNv
bHV0aW9uIGlzIGRlY2xhcmluZyBlYWNoIGZlYXR1cmUgb25seSBvbmNlLCBpbiB0aGUNCj4gPiB3
YXRjaGRvZyBjb3JlLg0KPiA+DQo+IA0KPiBJIGFncmVlIHRvIGFuZCBsaWtlIHRoZSBpZGVhLCBi
dXQgSSBkb24ndCBzZWUgdGhlIHBvaW50IG9mIGxldHRpbmcgZHJpdmVycyBvcHQgaW4NCj4gb3Ig
b3B0IG91dC4gVGhpcyBhZGRzIGEgbG90IG9mIGNvbXBsZXhpdHkgZm9yIGxpdHRsZSBpZiBhbnkg
Z2Fpbi4NCg0KRG8geW91IG1lYW4gdGhhdCBhbGwgdGhlIHN1cHBvcnQgZm9yIHRoaXMgImdsb2Jh
bCBwYXJhbWV0ZXJzIiBzaG91bGQgYmUgZG9uZQ0KaW4gdGhlIHdhdGNoZG9nLWNvcmUgb25seSwg
d2l0aG91dCB3cml0ZSBhbnkgY29kZSBpbiBlYWNoIHNpbmdsZQ0KImhhcmR3YXJlIiBkcml2ZXI/
DQo+IA0KPiBHdWVudGVyDQoNClJlZ2FyZHMsDQoNCkZsYXZpbw0KDQo+IA0KPiA+IEFkZGl0aW9u
YWxseSwgSSBhZGRlZCBhIGltcGxlbWVudGF0aW9uIGV4YW1wbGUgb2YgdGhpcyAiZ2xvYmFsIg0K
PiA+IHBhcmFtZXRlcnMgdXNpbmcgdGhlIG1vZHVsZSAid2RhdF93ZHQiDQo+ID4NCj4gPiBJbiBk
ZXRhaWxzOg0KPiA+DQo+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+IFdh
dGNoZG9nIENvcmUgR2xvYmFsIFBhcmFtZXRlcnMNCj4gPiA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQo+ID4NCj4gPiBJbmZvcm1hdGlvbiBmb3Igd2F0Y2hkb2cga2VybmVsIG1vZHVs
ZXMgZGV2ZWxvcGVycy4NCj4gPg0KPiA+IEludHJvZHVjdGlvbg0KPiA+ID09PT09PT09PT09PQ0K
PiA+DQo+ID4gRGlmZmVyZW50IHdhdGNoZG9nIG1vZHVsZXMgZnJlcXVlbnRseSByZXF1aXJlIHRo
ZSBzYW1lIHR5cGUgb2YNCj4gPiBwYXJhbWV0ZXJzIChmb3IgZXhhbXBsZTogKnRpbWVvdXQqLCAq
bm93YXlvdXQqIGZlYXR1cmUsDQo+ID4gKnN0YXJ0X2VuYWJsZWQqIHRvIHN0YXJ0IHRoZSB3YXRj
aGRvZyBvbiBtb2R1bGUgaW5zZXJ0aW9uLCBldGMuKS4NCj4gPiBJbnN0ZWFkIG9mIGFkZGluZyB0
aGlzIGtpbmQgb2YgbW9kdWxlIHBhcmFtZXRlcnMgaW5kZXBlbmRlbnRseSB0byBlYWNoDQo+ID4g
ZHJpdmVyLCB0aGUgYmVzdCBzb2x1dGlvbiBpcyBkZWNsYXJpbmcgZWFjaCBmZWF0dXJlIG9ubHkg
b25jZSwgaW4gdGhlDQo+ID4gd2F0Y2hkb2cgY29yZS4NCj4gPg0KPiA+IEluIHRoaXMgd2F5LCBl
YWNoIGRyaXZlciBjYW4gcmVhZCB0aGVzZSAiZ2xvYmFsIiBwYXJhbWV0ZXJzIGFuZCB0aGVuLA0K
PiA+IGlmIG5lZWRlZCwgY2FuIGltcGxlbWVudCB0aGVtLCBhY2NvcmRpbmcgdG8gdGhlIHBhcnRp
Y3VsYXIgaHcgd2F0Y2hkb2cNCj4gPiBjaGFyYWN0ZXJpc3RpYy4NCj4gPg0KPiA+IFVzaW5nIHRo
aXMgYXBwcm9hY2gsIGl0IGlzIHBvc3NpYmxlIHJlZHVjZSBzb21lIGR1cGxpY2F0ZSBjb2RlIGlu
IHRoZQ0KPiA+ICpuZXcqIHdhdGNoZG9nIGRyaXZlcnMgYW5kIHNpbXBsaWZ5IHRoZSBjb2RlIG1h
aW50ZW5hbmNlLiAgTW9yZW92ZXIsDQo+ID4gdGhlIGNvZGUgd2lsbCBiZSBjbGVhcmVyLCBzaW5j
ZSB0aGUgc2FtZSBraW5kIG9mIHBhcmFtZXRlcnMgYXJlIG9mdGVuDQo+ID4gY2FsbGVkIHdpdGgg
ZGlmZmVyZW50IG5hbWVzIChzZWUgRG9jdW1lbnRhdGlvbi93YXRjaGRvZy93YXRjaGRvZy0NCj4g
cGFyYW1ldGVycy5yc3QpLg0KPiA+IE9idmlvdXNseSwgZm9yIGNvbXBhdGliaWxpdHkgcmVhc29u
cywgd2UgY2Fubm90IHJlbW92ZSB0aGUgYWxyZWFkeQ0KPiA+IGV4aXN0aW5nIHBhcmFtZXRlcnMg
ZnJvbSB0aGUgY29kZSBvZiB0aGUgdmFyaW91cyB3YXRjaGRvZyBtb2R1bGVzLCBidXQNCj4gPiB3
ZSBjYW4gdXNlIHRoaXMgImdsb2JhbCIgYXBwcm9hY2ggZm9yIHRoZSBuZXcgd2F0Y2hkb2cgZHJp
dmVycy4NCj4gPg0KPiA+DQo+ID4gR2xvYmFsIHBhcmFtZXRlcnMgZGVjbGFyYXRpb24NCj4gPiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPg0KPiA+IFRoZSBnbG9iYWwgcGFyYW1l
dGVycyBkYXRhIHN0cnVjdHVyZSBpcyBkZWNsYXJlZCBpbg0KPiA+IGluY2x1ZGUvbGludXgvd2F0
Y2hkb2cuaCwgYXM6Og0KPiA+DQo+ID4gCXN0cnVjdCB3YXRjaGRvZ19nbG9iYWxfcGFyYW1ldGVy
c19zdHJ1Y3Qgew0KPiA+IAkJaW50IHRpbWVvdXQ7DQo+ID4gCQlpbnQgaW9wb3J0Ow0KPiA+IAkJ
aW50IGlycTsNCj4gPiAJCXVuc2lnbmVkIGxvbmcgZmVhdHVyZXM7DQo+ID4gCQkvKiBCaXQgbnVt
YmVycyBmb3IgZmVhdHVyZXMgZmxhZ3MgKi8NCj4gPiAJCSNkZWZpbmUgV0RPR19HTE9CQUxfUEFS
QU1fVkVSQk9TRQkwDQo+ID4gCQkjZGVmaW5lIFdET0dfR0xPQkFMX1BBUkFNX1RFU1RfTU9ERQkx
DQo+ID4gCQkjZGVmaW5lIFdET0dfR0xPQkFMX1BBUkFNX1NUQVJUX0VOQUJMRUQJMg0KPiA+IAkJ
I2RlZmluZSBXRE9HX0dMT0JBTF9QQVJBTV9OT1dBWU9VVAkzDQo+ID4gCX07DQo+ID4NCj4gPiBU
aGUgdmFyaWFibGUgImZlYXR1cmUiIGlzIGEgYml0d2lzZSBmbGFncyBjb250YWluZXIsIHRvIHN0
b3JlIGJvb2xlYW4NCj4gPiBmZWF0dXJlcywgc3VjaCBhczoNCj4gPg0KPiA+ICogbm93YXlvdXQN
Cj4gPiAqIHN0YXJ0X2VuYWJsZQ0KPiA+ICogZXRjLi4uDQo+ID4NCj4gPiBPdGhlciB2YXJpYWJs
ZXMgY2FuIGJlIGFkZGVkLCB0byBzdG9yZSBzb21lIG51bWVyaWNhbCB2YWx1ZXMgYW5kIG90aGVy
DQo+ID4gZGF0YSByZXF1aXJlZC4NCj4gPg0KPiA+IFRoZSBnbG9iYWwgcGFyYW1ldGVycyBhcmUg
ZGVjbGFyZWQgKGFzIHVzdWFsIGZvciB0aGUgbW9kdWxlDQo+ID4gcGFyYW1ldGVycykgaW4gdGhl
IGZpcnN0IHBhcnQgb2YgZHJpdmVycy93YXRjaGRvZy93YXRjaGRvZ19jb3JlLmMgZmlsZS4NCj4g
PiBUaGUgYWJvdmUgZ2xvYmFsIGRhdGEgc3RydWN0dXJlIGlzIHRoZW4gbWFuYWdlZCBieSB0aGUg
ZnVuY3Rpb24gKnZvaWQNCj4gPiBnbG9iYWxfcGFyYW1ldGVyc19pbml0KCkqLCBpbiB0aGUgc2Ft
ZSBmaWxlLg0KPiA+DQo+ID4gR2xvYmFsIHBhcmFtZXRlcnMgdXNlDQo+ID4gPT09PT09PT09PT09
PT09PT09PT09DQo+ID4NCj4gPiBFYWNoIHdhdGNoZG9nIGRyaXZlciwgdG8gY2hlY2sgaWYgb25l
IG9mIHRoZSBnbG9iYWwgcGFyYW1ldGVycyBpcw0KPiA+IGVuYWJsZWQsIGNhbiB1c2UgdGhlIGNv
cnJlc3BvbmRpbmcgaW4tbGluZSBmdW5jdGlvbiBkZWNsYXJlZCBpbg0KPiA+IGluY2x1ZGUvbGlu
dXgvd2F0Y2hkb2cuaC4NCj4gPiBBdCB0aGUgbW9tZW50IHRoZSBmb2xsb3dpbmcgZnVuY3Rpb25z
IGFyZSByZWFkeSB0byB1c2U6DQo+ID4NCj4gPiAqIHdhdGNoZG9nX2dsb2JhbF9wYXJhbV92ZXJi
b3NlX2VuYWJsZWQoKQ0KPiA+ICogd2F0Y2hkb2dfZ2xvYmFsX3BhcmFtX3Rlc3RfbW9kZV9lbmFi
bGVkKCkNCj4gPiAqIHdhdGNoZG9nX2dsb2JhbF9wYXJhbV9zdGFydF9lbmFibGVkKCkNCj4gPiAq
IHdhdGNoZG9nX2dsb2JhbF9wYXJhbV9ub3dheW91dF9lbmFibGVkKCkNCj4gPg0KPiA+DQo+ID4N
Cj4gPiBGbGF2aW8gU3VsaWdvaSAoMik6DQo+ID4gICB3YXRjaGRvZzogYWRkIGdsb2JhbCB3YXRj
aGRvZyBrZXJuZWwgbW9kdWxlIHBhcmFtZXRlcnMgc3RydWN0dXJlDQo+ID4gICB3YXRjaGRvZzog
d2RhdDogYWRkIHN0YXJ0X2VuYWJsZSBnbG9iYWwgcGFyYW1ldGVyDQo+ID4NCj4gPiAgRG9jdW1l
bnRhdGlvbi93YXRjaGRvZy9pbmRleC5yc3QgICAgICAgICAgICAgIHwgIDEgKw0KPiA+ICAuLi4v
d2F0Y2hkb2ctY29yZS1nbG9iYWwtcGFyYW1ldGVycy5yc3QgICAgICAgfCA3NCArKysrKysrKysr
KysrKysrKysrDQo+ID4gIGRyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hkb2dfY29yZS5jICAgICAgICAg
ICAgICB8IDc0ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy93YXRjaGRvZy93ZGF0
X3dkdC5jICAgICAgICAgICAgICAgICAgIHwgIDIgKw0KPiA+ICBpbmNsdWRlL2xpbnV4L3dhdGNo
ZG9nLmggICAgICAgICAgICAgICAgICAgICAgfCA0MiArKysrKysrKysrKw0KPiA+ICA1IGZpbGVz
IGNoYW5nZWQsIDE5MyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+
IERvY3VtZW50YXRpb24vd2F0Y2hkb2cvd2F0Y2hkb2ctY29yZS1nbG9iYWwtcGFyYW1ldGVycy5y
c3QNCj4gPg0KDQo=
