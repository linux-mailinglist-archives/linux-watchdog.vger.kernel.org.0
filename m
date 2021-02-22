Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D534321522
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 12:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhBVLaC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 06:30:02 -0500
Received: from smtp.asem.it ([151.1.184.197]:62715 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230474AbhBVL3t (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 06:29:49 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000821183.MSG 
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Feb 2021 12:28:19 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Feb 2021 12:28:18 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Mon, 22 Feb 2021 12:28:18 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>
Subject: RE: R: [PATCH v1] watchdog: wdat: add param. to start wdog on module
 insertion
Thread-Topic: R: [PATCH v1] watchdog: wdat: add param. to start wdog on module
 insertion
Thread-Index: AQHXBhOZhCefmAy4X0yS/T4Cg8tbv6pfPluAgAAygZCAABs6gIAEfpKw
Date:   Mon, 22 Feb 2021 11:28:18 +0000
Message-ID: <90ae006f2f3a47298122d53ba5e747b3@asem.it>
References: <20210218163200.1154812-1-f.suligoi@asem.it>
 <20210219105447.GI2542@lahna.fi.intel.com>
 <bf4e89bd11964f2e9f621f949adc338b@asem.it>
 <4ed7ec8c-d5bf-41b8-96c4-b34db670315d@roeck-us.net>
In-Reply-To: <4ed7ec8c-d5bf-41b8-96c4-b34db670315d@roeck-us.net>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.3]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F25.60339553.003E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgR3VlbnRlcg0KDQo+ID4+PiAgCSBjb25zdCBzdHJ1Y3Qgd2RhdF9pbnN0cnVjdGlvbiAqaW5z
dHIsIHUzMiAqdmFsdWUpICB7IEBAIC00MzcsNg0KPiA+Pj4gKzQ0Myw4IEBAIHN0YXRpYyBpbnQg
d2RhdF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiA+PiAqcGRldikNCj4gPj4+
ICAJfQ0KPiA+Pj4NCj4gPj4+ICAJd2RhdF93ZHRfYm9vdF9zdGF0dXMod2RhdCk7DQo+ID4+PiAr
CWlmIChzdGFydF9lbmFibGVkKQ0KPiA+Pj4gKwkJd2RhdF93ZHRfc3RhcnQoJndkYXQtPndkZCk7
DQo+ID4+DQo+ID4+IE5vIG9iamVjdGlvbnMgdG8gdGhpcyBpZiBpdCBpcyByZWFsbHkgbmVlZGVk
LiBIb3dldmVyLCBJIHRoaW5rIGl0IGlzDQo+ID4+IGJldHRlciBzdGFydCB0aGUgd2F0Y2hkb2cg
YWZ0ZXIgZGV2bV93YXRjaGRvZ19yZWdpc3Rlcl9kZXZpY2UoKSBoYXMNCj4gPj4gYmVlbiBjYWxs
ZWQgc28gd2UgaGF2ZSBldmVyeXRoaW5nIGluaXRpYWxpemVkLg0KPiA+DQo+ID4gWWVzLCBpdCBp
cyBuZWVkZWQuIFdlIG5lZWQgdGhpcyBmZWF0dXJlIHRvIGVuYWJsZSB0aGUgd2F0Y2hkb2cgYXMg
c29vbg0KPiA+IGFzIHBvc3NpYmxlIGFuZCB0aGlzIGlzIGVzc2VudGlhbCBmb3IgdW5tYW5uZWQg
YXBwbGljYXRpb25zLCBzdWNoIGFzDQo+ID4gcm91dGVycywgd2F0ZXIgcHVtcGluZyBzdGF0aW9u
cywgY2xpbWF0ZSBkYXRhIGNvbGxlY3Rpb25zLCBldGMuDQo+ID4NCj4gRldJVywgaW4geW91ciB1
c2UgY2FzZSB0aGUgd2F0Y2hkb2cgc2hvdWxkIGJlIGVuYWJsZWQgaW4gdGhlDQo+IEJJT1MvUk9N
TU9OLg0KDQpZZXMsIHlvdSBhcmUgcmlnaHQsICB3aXRoIHRoZSBuZXcgQklPUyB2ZXJzaW9uIGZv
ciB0aGUgbmV3IGJvYXJkcw0Kd2UnbGwgaW1wbGVtZW50IHRoaXMgZmVhdHVyZXMsIGJ1dCBmb3Ig
dGhlIG9sZCBib2FyZHMgaXQgaXMgbm8gbW9yZSBwb3NzaWJsZS4NCg0KPiANCj4gPiBSaWdodCwg
b2sgZm9yIHRoZSBjb3JyZWN0IHBvc2l0aW9uaW5nIG9mIHRoZSB3ZGF0X3dkdF9zdGFydCBmdW5j
dGlvbg0KPiA+IGF0IHRoZSBlbmQgb2YgdGhlIHdhdGNoZG9nIGRldmljZSBpbml0aWFsaXphdGlv
bi4gVGhhbmtzIQ0KPiA+DQo+IA0KPiBObywgaXQgaXNuJ3QsIGJlY2F1c2UgaXQgd29uJ3Qgc2V0
IFdET0dfSFdfUlVOTklORywgYW5kIHRoZSB3YXRjaGRvZw0KPiBjb3JlIHdvbid0IGtub3cgdGhh
dCB0aGUgd2F0Y2hkb2cgaXMgcnVubmluZy4NCg0KT2sNCg0KPiBUaGUgd2F0Y2hkb2cgaGFzIHRv
IGJlIHN0YXJ0ZWQgYmVmb3JlIHRoZSBjYWxsIHRvIHdkYXRfd2R0X3NldF9ydW5uaW5nKCkuDQo+
IElmIHRoYXQgaXNuJ3QgcG9zc2libGUgd2l0aCB0aGUgY3VycmVudCBsb2NhdGlvbiBvZiB3ZGF0
X3dkdF9zZXRfcnVubmluZygpLA0KPiB0aGVuDQo+IHdkYXRfd2R0X3NldF9ydW5uaW5nKCkgaGFz
IHRvIGJlIG1vdmVkIGFjY29yZGluZ2x5Lg0KPiBFaXRoZXIgY2FzZSwgYm90aCBoYXZlIHRvIGJl
IGNhbGxlZCBiZWZvcmUgY2FsbGluZw0KPiBkZXZtX3dhdGNoZG9nX3JlZ2lzdGVyX2RldmljZSgp
Lg0KDQpPaw0KDQo+IA0KPiBIYXZpbmcgc2FpZCB0aGF0LCBJJ2QgcHJlZmVyIHRvIGhhdmUgYSBt
b2R1bGUgcGFyYW1ldGVyIGluIHRoZSB3YXRjaGRvZw0KPiBjb3JlLiBXZSBhbHJlYWR5IGhhdmUg
YSBudW1iZXIgb2Ygc2ltaWxhciBtb2R1bGUgcGFyYW1ldGVycyBpbiB2YXJpb3VzDQo+IGRyaXZl
cnMsIGFsbCBuYW1lZCBkaWZmZXJlbnRseSwgYW5kIEknZCByYXRoZXIgbm90IGhhdmUgbW9yZS4N
Cg0KT2ssIEknbGwgc3R1ZHkgaG93IHRvIGludHJvZHVjZSBhIHRoaXMgbmV3IHBhcmFtZXRlciBp
biB0aGUgd2RvZyBjb3JlLA0Kc28gdGhhdCBpdCBjYW4gYmUgYXZhaWxhYmxlIGZvciBhbGwgd2F0
Y2hkb2cgZHJpdmVycy4NClRoZW4gd2UnbGwgaGF2ZSB0byB0aGluayB3aGF0IHRvIGRvIHdpdGgg
dGhlIGV4aXN0ZW50IHNpbWlsYXIgcGFyYW1ldGVycy4NCkkgdGhpbmsgd2UgaGF2ZSB0byBrZWVw
IHRoZW0gZm9yIGNvbXBhdGliaWxpdHkgcmVhc29ucy4NCg0KPiANCj4gR3VlbnRlcg0KPiANCg0K
UmVnYXJkcywNCkZsYXZpbw0K
