Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D31635DAB9
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Apr 2021 11:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236908AbhDMJJ6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Apr 2021 05:09:58 -0400
Received: from smtp.asem.it ([151.1.184.197]:60962 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhDMJJ6 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Apr 2021 05:09:58 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 8.0.0)
        with ESMTP id b07c5c8119c24e749c57200033198841.MSG
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Apr 2021 11:09:35 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 11:09:32 +0200
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.2176.009; Tue, 13 Apr 2021 11:09:32 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>
Subject: RE: [PATCH v1] watchdog: add new parameter to start the watchdog on
 module insertion
Thread-Topic: [PATCH v1] watchdog: add new parameter to start the watchdog on
 module insertion
Thread-Index: AQHXLSOOmAAsohE6hEGHBV7oGLFCBKqsNgyAgARSfzCAAE/NgIABU54A
Date:   Tue, 13 Apr 2021 09:09:32 +0000
Message-ID: <d209130522dc4752bb4ec56c783aac4a@asem.it>
References: <20210409093434.2089459-1-f.suligoi@asem.it>
 <e44f3366-cb12-7d7c-fe77-20b5bfea620d@roeck-us.net>
 <98f7ca84e44e4625b54e1aecef88f238@asem.it>
 <444e0f7e-c937-49a4-d960-549e70a8390d@roeck-us.net>
In-Reply-To: <444e0f7e-c937-49a4-d960-549e70a8390d@roeck-us.net>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F27.60755FCD.004B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlciwNCg0KLi4uDQoNCj4gPj4+IFRoZSBuZXcgcGFyYW1ldGVyICJzdGFydF9lbmFi
bGVkIiBzdGFydHMgdGhlIHdhdGNoZG9nIGF0IHRoZSBzYW1lIHRpbWUNCj4gPj4+IG9mIHRoZSBt
b2R1bGUgaW5zZXJ0aW9uLg0KPiA+Pj4gVGhpcyBmZWF0dXJlIGlzIHZlcnkgdXNlZnVsIGluIGVt
YmVkZGVkIHN5c3RlbXMsIHRvIGF2b2lkIGNhc2VzIHdoZXJlDQo+ID4+PiB0aGUgc3lzdGVtIGhh
bmdzIGJlZm9yZSByZWFjaGluZyB1c2Vyc3BhY2UuDQo+ID4+Pg0KPiA+Pj4gVGhpcyBmdW5jdGlv
biBjYW4gYmUgYWxzbyBlbmFibGVkIGluIHRoZSBrZXJuZWwgY29uZmlnLCBzbyBjYW4gYmUNCj4g
Pj4+IHVzZWQgd2hlbiB0aGUgd2F0Y2hkb2cgZHJpdmVyIGlzIGJ1aWxkIGFzIGJ1aWx0LWluLg0K
PiA+Pj4NCj4gPj4+IFRoaXMgcGFyYW1ldGVyIGludm9sdmVzIHRoZSAiY29yZSIgc2VjdGlvbiBv
ZiB0aGUgd2F0Y2hkb2cgZHJpdmVyOw0KPiA+Pj4gaW4gdGhpcyB3YXkgaXQgaXMgY29tbW9uIGZv
ciBhbGwgdGhlIHdhdGNoZG9nIGhhcmR3YXJlIGltcGxlbWVudGF0aW9ucy4NCj4gPj4+DQo+ID4+
PiBOb3RlOiB0byB1c2Ugb25seSBmb3Igd2F0Y2hkb2cgZHJpdmVycyB3aGljaCBkb2Vzbid0IHN1
cHBvcnQgdGhpcw0KPiA+Pj4gICAgICAgcGFyYW1ldGVyIGJ5IGl0c2VsZi4NCj4gPj4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBGbGF2aW8gU3VsaWdvaSA8Zi5zdWxpZ29pQGFzZW0uaXQ+DQo+ID4+
PiAtLS0NCj4gPj4+ICBEb2N1bWVudGF0aW9uL3dhdGNoZG9nL3dhdGNoZG9nLXBhcmFtZXRlcnMu
cnN0IHwgIDUgKysrKysNCj4gPj4+ICBkcml2ZXJzL3dhdGNoZG9nL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysNCj4gPj4+ICBkcml2ZXJzL3dhdGNoZG9n
L3dhdGNoZG9nX2NvcmUuYyAgICAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysrDQo+ID4+PiAg
MyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vd2F0Y2hkb2cvd2F0Y2hkb2ctcGFyYW1ldGVycy5yc3QNCj4gPj4g
Yi9Eb2N1bWVudGF0aW9uL3dhdGNoZG9nL3dhdGNoZG9nLXBhcmFtZXRlcnMucnN0DQo+ID4+PiBp
bmRleCAyMjNjOTkzNjFhMzAuLjYyM2ZkMDY0ZGY5MSAxMDA2NDQNCj4gPj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vd2F0Y2hkb2cvd2F0Y2hkb2ctcGFyYW1ldGVycy5yc3QNCj4gPj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vd2F0Y2hkb2cvd2F0Y2hkb2ctcGFyYW1ldGVycy5yc3QNCj4gPj4+IEBAIC0y
MSw2ICsyMSwxMSBAQCB3YXRjaGRvZyBjb3JlOg0KPiA+Pj4gIAl0aW1lb3V0LiBTZXR0aW5nIHRo
aXMgdG8gYSBub24temVybyB2YWx1ZSBjYW4gYmUgdXNlZnVsIHRvIGVuc3VyZSB0aGF0DQo+ID4+
PiAgCWVpdGhlciB1c2Vyc3BhY2UgY29tZXMgdXAgcHJvcGVybHksIG9yIHRoZSBib2FyZCBnZXRz
IHJlc2V0IGFuZCBhbGxvd3MNCj4gPj4+ICAJZmFsbGJhY2sgbG9naWMgaW4gdGhlIGJvb3Rsb2Fk
ZXIgdG8gdHJ5IHNvbWV0aGluZyBlbHNlLg0KPiA+Pj4gKyAgICBzdGFydF9lbmFibGVkOg0KPiA+
Pj4gKwlXYXRjaGRvZyBpcyBzdGFydGVkIG9uIG1vZHVsZSBpbnNlcnRpb24uIFRoaXMgb3B0aW9u
IGNhbiBiZSBhbHNvDQo+ID4+PiArCXNlbGVjdGVkIGJ5IGtlcm5lbCBjb25maWcgKGRlZmF1bHQ9
a2VybmVsIGNvbmZpZyBwYXJhbWV0ZXIpLg0KPiA+Pj4gKwlVc2Ugb25seSBmb3Igd2F0Y2hkb2cg
ZHJpdmVycyB3aGljaCBkb2Vzbid0IHN1cHBvcnQgdGhpcyBwYXJhbWV0ZXINCj4gPj4+ICsJYnkg
aXRzZWxmLg0KPiA+Pg0KPiA+PiBXaHkgPw0KPiA+DQo+ID4gVGhlcmUgYXJlIHR3byBkcml2ZXJz
IHdpdGggYW4gYW5hbG9nb3VzIGZlYXR1cmUgKHBueDgzM3hfd2R0IGFuZA0KPiA+IG9tYXBfd2R0
KSBhbmQgaXQgaXMgaW1wb3J0YW50IG5vdCB0byBlbmFibGUgdGhlIHdhdGNoZG9nIHR3aWNlLg0K
PiA+DQo+IFdoeSA/DQoNCnJpZ2h0LCBpdCBpcyBhIG5vbnNlbnNlIC4uLg0KDQo+IA0KPiA+IE9r
LCBJIGNhbiBzdWJzdGl0dXRlIHRoZSBzZW50ZW5jZTogIiBVc2Ugb25seSBmb3Igd2F0Y2hkb2cg
ZHJpdmVycw0KPiA+IHdoaWNoIGRvZXNuJ3Qgc3VwcG9ydCB0aGlzIHBhcmFtZXRlciBpdHNlbGYu
IiB3aXRoIGFub3RoZXIgb25lLCBsaWtlOg0KPiA+ICJJZiB0aGUgZHJpdmVyIHN1cHBvcnRzIHRo
aXMgZmVhdHVyZSBieSBpdHNlbGYsIGJlIGNhcmVmdWxseSBub3QgdG8gZW5hYmxlDQo+ID4gdGhl
IHdhdGNoZG9nIHR3aWNlIi4NCj4gPg0KPiA+IFdoYXQgZG8geW91IHRoaW5rPw0KPiA+DQo+IA0K
PiBJIGFtIHN0aWxsIG1pc3NpbmcgdGhlIGV4cGxhbmF0aW9uIF93aHlfIGl0IHdvdWxkIGJlIGlt
cG9ydGFudCBub3QgdG8gZW5hYmxlDQo+IGEgd2F0Y2hkb2cgdHdpY2UuIFdoeSBkb2VzIGl0IG1h
dHRlciA/IFdoYXQgaXMgdGhlIGRpZmZlcmVuY2UgPw0KPiANCj4gSWYgdGhlcmUgaXMgYSBjb25j
ZXJuIHRoYXQgdGhlIHN0YXJ0IGZ1bmN0aW9uIHNob3VsZCBub3QgYmUgY2FsbGVkIG9uIGFuIGFs
cmVhZHkNCj4gcnVubmluZyB3YXRjaGRvZywgdGhlIGNvZGUgY291bGQgY2hlY2sgZm9yIHRoYXQg
YW5kIGVuc3VyZSB0aGF0DQo+IFdET0dfSFdfUlVOTklORw0KPiBpcyBub3QgYWxyZWFkeSBzZXQg
YmVmb3JlIGVuYWJsaW5nIGl0LiBUaGF0IHdvdWxkIHByb2JhYmx5IG1ha2Ugc2Vuc2UgYW55d2F5
Lg0KPiBCdXQgYWRkaW5nIGEgbGltaXRhdGlvbi9yZXN0cmljdGlvbiBsaWtlIHRoZSBhYm92ZSwg
d2hpY2ggaXMgbm90IGVuZm9yY2VhYmxlLA0KPiBpcyBub3QgYSBnb29kIGlkZWEuIEhvdyB3b3Vs
ZCB0aGUgY29tbW9uIHVzZXIga25vdyBpZiBhIHdhdGNoZG9nIGlzIGFscmVhZHkNCj4gcnVubmlu
ZyAoZWcgYmVjYXVzZSBpdCB3YXMgc3RhcnRlZCBpbiBCSU9TL1JPTU1PTikgPw0KDQpZZXMsIHJp
Z2h0ISBJIGhhdmUgdG8gY2hlY2sgV0RPR19IV19SVU5OSU5HIGJlZm9yZSBzdGFydGluZyB0aGUg
d2F0Y2hkb2cuDQpJdCBpcyB0aGUgY29ycmVjdCB3YXkgdG8gbWFuYWdlIHRoaXMgZmVhdHVyZSwg
aW4gYW55IGNhc2UgYW5kIGZvciBhbnkgd2RvZyBkcml2ZXIuDQoNCj4gDQo+IFRoYW5rcywNCj4g
R3VlbnRlcg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIEd1ZW50ZXIhDQpSZWdhcmRzLA0KRmxhdmlv
DQo=
