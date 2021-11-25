Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3832B45D33F
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Nov 2021 03:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhKYCuv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 21:50:51 -0500
Received: from [113.204.237.245] ([113.204.237.245]:37514 "EHLO
        test.cqplus1.com" rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S240035AbhKYCsv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 21:48:51 -0500
X-MailGates: (flag:1,DYNAMIC,RELAY,NOHOST,LAN:PASS)(compute_score:DELIVE
        R,40,3)
Received: from 172.27.96.203
        by cqmailgates with MailGates ESMTP Server V5.0(1190:0:AUTH_RELAY)
        (envelope-from <xt.hu@cqplus1.com>); Thu, 25 Nov 2021 10:42:34 +0800 (CST)
Received: from CQEXMAIL01.cqplus1.com (172.27.96.203) by
 CQEXMAIL01.cqplus1.com (172.27.96.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 25 Nov 2021 10:42:33 +0800
Received: from CQEXMAIL01.cqplus1.com ([::1]) by CQEXMAIL01.cqplus1.com
 ([::1]) with mapi id 15.01.2375.017; Thu, 25 Nov 2021 10:42:33 +0800
From:   =?utf-8?B?eHQuaHVb6IOh5YWI6Z+sXQ==?= <xt.hu@cqplus1.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?utf-8?B?V2VsbHMgTHUg5ZGC6Iqz6aiw?= <wells.lu@sunplus.com>,
        =?utf-8?B?cWluamlhblvopoPlgaVd?= <qinjian@cqplus1.com>
Subject: RE: [PATCH v2 1/2] watchdog: Add watchdog driver for Sunplus SP7021
Thread-Topic: [PATCH v2 1/2] watchdog: Add watchdog driver for Sunplus SP7021
Thread-Index: AQHX4SAshE/roTn600ef7AgHipZV4awSNd0AgAE7tVA=
Date:   Thu, 25 Nov 2021 02:42:33 +0000
Message-ID: <0024d27919c04c84a3f13ecba86a3c70@cqplus1.com>
References: <20211112105952.216280-1-xt.hu@cqplus1.com>
 <20211124104149.361019-1-xt.hu@cqplus1.com>
 <20211124104149.361019-2-xt.hu@cqplus1.com>
 <20211124142522.GA3939252@roeck-us.net>
In-Reply-To: <20211124142522.GA3939252@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.28.110.16]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkNCglUaGFua3MgZm9yIHlvdXIgcmV2aWV3LiBJIGV4cGxhaW4gdGhpcyBpbiBkZXRhaWwgYmVs
b3cgdGhlIGNvbW1lbnQuDQoNCkJlc3QgUmVnYXJkcywNClhpYW50YW8NCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayBbbWFpbHRvOmdyb2VjazdAZ21h
aWwuY29tXSBPbiBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiBTZW50OiBXZWRuZXNkYXksIE5v
dmVtYmVyIDI0LCAyMDIxIDEwOjI1IFBNDQo+IFRvOiB4dC5odVvog6HlhYjpn6xdIDx4dC5odUBj
cXBsdXMxLmNvbT4NCj4gQ2M6IHdpbUBsaW51eC13YXRjaGRvZy5vcmc7IHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LXdhdGNoZG9n
QHZnZXIua2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgV2VsbHMgTHUg5ZGC6Iqz6aiwDQo+IDx3ZWxscy5sdUBzdW5wbHVzLmNvbT47IHFp
bmppYW5b6KaD5YGlXSA8cWluamlhbkBjcXBsdXMxLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzJdIHdhdGNoZG9nOiBBZGQgd2F0Y2hkb2cgZHJpdmVyIGZvciBTdW5wbHVzIFNQNzAy
MQ0KPiANCj4gT24gV2VkLCBOb3YgMjQsIDIwMjEgYXQgMDY6NDE6NDhQTSArMDgwMCwgWGlhbnRh
byBIdSB3cm90ZToNCj4gPiBTdW5wbHVzIFNQNzAyMSByZXF1aXJlcyB3YXRjaGRvZyB0aW1lciBz
dXBwb3J0Lg0KPiA+IEFkZCB3YXRjaGRvZyBkcml2ZXIgdG8gZW5hYmxlIHRoaXMuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBYaWFudGFvIEh1IDx4dC5odUBjcXBsdXMxLmNvbT4NCj4gPiAtLS0N
Cj4gPiArDQo+ID4gKwlwcml2LT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNl
KHBkZXYsIDApOw0KPiA+ICsJaWYgKElTX0VSUihwcml2LT5iYXNlKSkNCj4gPiArCQlyZXR1cm4g
UFRSX0VSUihwcml2LT5iYXNlKTsNCj4gPiArDQo+ID4gKwkvKiBUaGUgcmVnaXN0ZXJzIGFjY2Vz
c2VkIGhlcmUgc2hhcmVkIGJ5IG11bHRpcGxlIGRyaXZlcnMuICovDQo+ID4gKwl3ZHRfcmVzID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAxKTsNCj4gDQo+IFRo
aXMgaXMgdW51c3VhbC4gV2h5IHdvdWxkIG90aGVyIGRyaXZlcnMgYWNjZXNzIFdEVF9DVFJMIGFu
ZCBXRFRfQ05UIHJlZ2lzdGVycywgYW5kIGhvdyBpcyBpdA0KPiBlbnN1cmVkIHRoYXQgdGhlIG90
aGVyIGRyaXZlcnMgZG8gbm90IGludGVyZmVyIHdpdGggdGhlIGFjY2Vzc2VzIGJ5IHRoaXMgZHJp
dmVyID8NCj4gDQo+IE5vcm1hbGx5IHN1Y2ggYSByZXNvdXJjZSB3b3VsZCBiZSBzaGFyZWQgdGhy
b3VnaCBhIHBhcmVudCBkcml2ZXIgd2l0aCBhcHByb3ByaWF0ZSBhY2Nlc3MgZnVuY3Rpb25zIHRv
DQo+IGVuc3VyZSB0aGF0IGFjY2Vzc2VzIGFyZSBzeW5jaHJvbml6ZWQuDQo+IA0KDQpUaGUgcmVn
aXN0ZXIgdXNlZCBieSB0aGlzIGRyaXZlciBjb25zaXN0cyBvZiB0d28gcGFydHMuIFRoZSBmaXJz
dCBwYXJ0IHdoaWNoIGNvbnRhaW5zIFdEVF9DVFJMIGFuZCBXRFRfQ05UIA0KcmVnaXN0ZXJzIGlz
IGV4Y2x1c2l2ZSBieSB3YXRjaGRvZy4gDQpJbiBzcGVjaWFsbHksIHRoZSBzZWNvbmQgcGFydCBp
cyBiZWxvbmcgdG8gYSBtdWx0aWZ1bmN0aW9uYWwgcmVnaXN0ZXIgZ3JvdXAgd2hpY2ggY29udHJv
bCBJUCBhbmQgYnVzLiBSZWZlciB0byANCnJlZ2lzdGVyIG1hbnVhbCBiZWxvdzoNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCk1PMV9TVENfV0RHX1JTVF9FTgk0CVJXCQlTVEMgV2F0
Y2hkb2cgVGltZW91dCBUcmlnZ2VyIFN5c3RlbSBSZXNldCBFbmFibGUNCgkJCQkJCQkJCTA6IFNU
QyB3YXRjaGRvZyAyIHRpbWVvdXQgd2lsbCBub3QgdHJpZ2dlciBzeXN0ZW0gcmVzZXQoZGVmYXVs
dCkNCgkJCQkJCQkJCTE6IFNUQyB3YXRjaGRvZyAyIHRpbWVvdXQgd2lsbCB0cmlnZ2VyIHN5c3Rl
bSByZXNldA0KTU8xX1JJX1dER19SU1RfRU4JCTEJUlcJCVJCVVMgV2F0Y2hkb2cgVGltZW91dCBU
cmlnZ2VyIFN5c3RlbSBSZXNldCBFbmFibGUNCgkJCQkJCQkJCTA6IFJCVVMgd2F0Y2hkb2cgdGlt
ZW91dCB3aWxsIG5vdCB0cmlnZ2VyIHN5c3RlbSByZXNldChkZWZhdWx0KQ0KCQkJCQkJCQkJMTog
UkJVUyB3YXRjaGRvZyB0aW1lb3V0IHdpbGwgdHJpZ2dlciBzeXN0ZW0gcmVzZXQNCk1PMV9USU1F
Ul9TVEFORF9CWV9FTgkwCVJXCQlUaW1lciBTdGFuZGJ5IE1vZGUgRW5hYmxlDQoJCQkJCQkJCQkw
OiBEaXNhYmxlIChkZWZhdWx0KQ0KCQkJCQkJCQkJMTogRW5hYmxlIEFjdGl2ZSBoaWdoIHRvIGVu
dGVyIHRpbWVyIHN0YW5kYnkgbW9kZSwgDQoJCQkJCQkJCQkJCWRlZmF1bHQgbm90IGluIHN0YW5k
YnkgbW9kZQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KWW91IGNhbiBzZWUgdGhh
dCBpbiBhZGRpdGlvbiB0byB0aGUgYml0cyBmb3Igd2F0Y2hkb2cgdGhlcmUgYXJlIGJpdCBmaWVs
ZHMgZm9yIG90aGVyIG1vZHVsZXMuDQpJIHVzZSB0aGlzIHJlZ2lzdGVyIGJpdDQgYW5kIGJpdDEu
IERlZmF1bHQgdmFsdWUgaXMgMCB0aGF0IHdhdGNoZG9nIGludGVybmFsIGludGVycnVwdCBzaWdu
YWwgY2FuJ3QgdHJpZ2dlciBzeXN0ZW0gDQphbmQgUkJVUyByZXNldC4gSSBuZWVkIHNldCAxIHdo
ZW4gd2F0Y2hkb2cgcHJvYmUuIEVhcmx5IEkgaW1wbGVtZW50IHRoZSBvcGVyYXRpb24gaW4gDQph
cmNoL2FybS9tYWNoLXN1bnBsdXMvc3A3MDIxLmMgYW5kIGNvbmZpZ3VyZSBieSBtYWNyby4gQnV0
IGluIGFyY2gvYXJtNjQsIGRpcmVjdG9yeSBtYWNoLVhYWCBpcyByZW1vdmVkLg0KU28gSSBzb2x2
ZSBpbiB0aGlzIHdheS4gQW55IGJldHRlciB3YXk/DQoNCj4gVGhhbmtzLA0KPiBHdWVudGVyDQo=
