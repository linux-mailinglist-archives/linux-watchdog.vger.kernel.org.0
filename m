Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50835332338
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Mar 2021 11:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCIKjU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Mar 2021 05:39:20 -0500
Received: from smtp.asem.it ([151.1.184.197]:56882 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbhCIKiy (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Mar 2021 05:38:54 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000853175.MSG 
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Mar 2021 11:38:49 +0100
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 9 Mar
 2021 11:38:48 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.2176.009; Tue, 9 Mar 2021 11:38:48 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] watchdog: add global watchdog kernel module
 parameters structure
Thread-Topic: [PATCH v1 1/2] watchdog: add global watchdog kernel module
 parameters structure
Thread-Index: AQHXFA0+KLqSBTCHpUWsvQ8CKV5sFap7EBoAgABl4iA=
Date:   Tue, 9 Mar 2021 10:38:48 +0000
Message-ID: <5689370584614335b4f43660d80a5338@asem.it>
References: <20210308112151.716315-1-f.suligoi@asem.it>
 <20210308112151.716315-2-f.suligoi@asem.it>
 <0e203992-cbff-738f-4629-368578cb992d@infradead.org>
In-Reply-To: <0e203992-cbff-738f-4629-368578cb992d@infradead.org>
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
X-SGOP-RefID: str=0001.0A782F26.60475038.00AC,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PiBIaSwNCj4gDQoNCkhpIFJhbmR5LA0KDQo+IE9uIDMvOC8yMSAzOjIxIEFNLCBGbGF2aW8gU3Vs
aWdvaSB3cm90ZToNCj4gPiBEaWZmZXJlbnQgd2F0Y2hkb2cgbW9kdWxlcyBmcmVxdWVudGx5IHJl
cXVpcmUgdGhlIHNhbWUgdHlwZSBvZg0KPiA+IHBhcmFtZXRlcnMgKGZvciBleGFtcGxlOiB0aW1l
b3V0LCBub3dheW91dCBmZWF0dXJlLCBzdGFydCB3ZG9nIG9uDQo+ID4gbW9kdWxlIGluc2VydGlv
biwgZXRjLikuDQoNCi4uLg0KDQo+ID4gK0luIHRoaXMgd2F5LCBlYWNoIGRyaXZlciBjYW4gcmVh
ZCB0aGVzZSAiZ2xvYmFsIiBwYXJhbWV0ZXJzIGFuZCB0aGVuLA0KPiA+ICtpZiBuZWVkZWQsIGNh
biBpbXBsZW1lbnQgdGhlbSwgYWNjb3JkaW5nIHRvIHRoZSBwYXJ0aWN1bGFyIGh3DQo+ID4gK3dh
dGNoZG9nDQo+IA0KPiBQbGVhc2Ugc3BlbGwgb3V0ICJoYXJkd2FyZSIgKG5vdCAiaHciKS4NCg0K
T2shDQoNCj4gDQo+ID4gK2NoYXJhY3RlcmlzdGljLg0KPiA+ICsNCj4gPiArVXNpbmcgdGhpcyBh
cHByb2FjaCwgaXQgaXMgcG9zc2libGUgcmVkdWNlIHNvbWUgZHVwbGljYXRlIGNvZGUgaW4gdGhl
DQo+ID4gKypuZXcqDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3NzaWJs
ZSB0byByZWR1Y2UNCg0KVGhhbmtzIQ0KDQouLi4NCg0KPiA+ICsgKiBJbnN0ZWFkIG9mIGFkZCB0
aGlzIGtpbmQgb2YgbW9kdWxlIHBhcmFtZXRlcnMgaW5kZXBlbmRlbnRseSB0bw0KPiA+ICtlYWNo
IGRyaXZlciwNCj4gDQo+ICAgICAgICAgICAgICAgICAgYWRkaW5nDQoNClRoYW5rcyENCg0KLi4u
DQo+ID4gKyAqIGlmIG5lZWRlZCwgaW1wbGVtZW50cyB0aGVtLCBhY2NvcmRpbmcgdG8gdGhlIHBh
cnRpY3VsYXIgaHcNCj4gPiArIHdhdGNoZG9nDQo+IA0KPiBzL2h3L2hhcmR3YXJlLw0KDQpPaw0K
DQouLi4NCg0KPiBJZiBJIHdlcmUgZG9pbmcgKG9yIHVzaW5nKSB0aGlzLCBJIHdvdWxkIHByb2Jh
Ymx5IHdhbnQgJ3Rlc3RfbW9kZScgYW5kDQo+ICd2ZXJib3NpdHknIHRvIGJlIHVuc2lnbmVkIGlu
dCBtYXNrcyBpbnN0ZWFkIG9mIGEgYm9vbCwgc28gdGhhdCB0aGVyZSBjb3VsZCBiZQ0KPiBtdWx0
aXBsZSB0eXBlcyBvZiB0ZXN0X21vZGUgb3IgdmVyYm9zaXR5Lg0KDQpJIHVzZWQgYm9vbCBhcyBh
bHJlYWR5IGRvbmUgaW4gc29tZSB3YXRjaGRvZyBkcml2ZXJzLCBidXQgeW91ciBzdWdnZXN0aW9u
DQppcyBiZXR0ZXIsIHRoYW5rcy4NCg0KPiBUaGF0J3Mgc29tZXRoaW5nIHRoYXQgc29tZSBvdGhl
ciBzdWJzeXN0ZW1zIGRvLCBidXQgbWF5YmUgd2F0Y2hkb2cgaXMNCj4gc2ltcGxlIGVub3VnaCB0
aGF0IGl0J3Mgbm90IG5lZWRlZC4NCj4gSWYgaXQgaXMgbmVlZGVkLCB0aGVuIHdlIGFyZSBiYWNr
IHRvIGVhY2ggZHJpdmVyIGRvaW5nIGl0IGl0cyBvd24gd2F5ICh1bnRpbCB0aGlzDQo+IHBhdGNo
IGlzIHVwZGF0ZWQpLg0KPiANCj4gDQo+IEhUSC4gdGhhbmtzLg0KPiAtLQ0KPiB+UmFuZHkNCg0K
VGhhbmtzIFJhbmR5Lg0KDQpSZWdhcmRzLA0KRmxhdmlvDQoNCg==
