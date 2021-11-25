Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B3E45D355
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Nov 2021 03:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhKYDAj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 22:00:39 -0500
Received: from [113.204.237.245] ([113.204.237.245]:37706 "EHLO
        test.cqplus1.com" rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S239689AbhKYC6i (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 21:58:38 -0500
X-MailGates: (flag:1,DYNAMIC,RELAY,NOHOST,LAN:PASS)(compute_score:DELIVE
        R,40,3)
Received: from 172.27.96.203
        by cqmailgates with MailGates ESMTP Server V5.0(1206:0:AUTH_RELAY)
        (envelope-from <xt.hu@cqplus1.com>); Thu, 25 Nov 2021 10:52:33 +0800 (CST)
Received: from CQEXMAIL01.cqplus1.com (172.27.96.203) by
 CQEXMAIL01.cqplus1.com (172.27.96.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 25 Nov 2021 10:52:28 +0800
Received: from CQEXMAIL01.cqplus1.com ([::1]) by CQEXMAIL01.cqplus1.com
 ([::1]) with mapi id 15.01.2375.017; Thu, 25 Nov 2021 10:52:28 +0800
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
Subject: RE: [PATCH v2 0/2] Add watchdog driver for Sunplus SP7021 SoC
Thread-Topic: [PATCH v2 0/2] Add watchdog driver for Sunplus SP7021 SoC
Thread-Index: AQHX4SAsaIwYOAFNOkGFl2dRmzd7YKwSM7QAgAFWVBA=
Date:   Thu, 25 Nov 2021 02:52:28 +0000
Message-ID: <0d6a4dc2987b41fb8b9a9be2e5598f08@cqplus1.com>
References: <20211112105952.216280-1-xt.hu@cqplus1.com>
 <20211124104149.361019-1-xt.hu@cqplus1.com>
 <20211124141738.GA3802978@roeck-us.net>
In-Reply-To: <20211124141738.GA3802978@roeck-us.net>
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

SGkgR3VlbnRlciwNCglUaGlzIGlzIG15IHNlY29uZCBzdWJtaXR0aW5nLiBJIGFsc28gcmVmZXIg
dG8gdGhlIGZvcm1hdCBpbiBvdGhlcnMnIGVtYWlscy4NCglJZiB0aGUgZm9ybWF0IGlzIG5vdCBj
b3JyZWN0LCBJIHdpbGwgZHJvcCAtLWluLXJlcGx5LXRvIHdoZW4gc3VibWl0IHBhdGhjaCBuZXh0
IHRpbWUuDQoNCkJlc3QgUmVnYXJkcywNClhpYW50YW8NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayBbbWFpbHRvOmdyb2VjazdAZ21haWwuY29tXSBP
biBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI0
LCAyMDIxIDEwOjE4IFBNDQo+IFRvOiB4dC5odVvog6HlhYjpn6xdIDx4dC5odUBjcXBsdXMxLmNv
bT4NCj4gQ2M6IHdpbUBsaW51eC13YXRjaGRvZy5vcmc7IHAuemFiZWxAcGVuZ3V0cm9uaXguZGU7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LXdhdGNoZG9nQHZnZXIua2Vy
bmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsg
V2VsbHMgTHUg5ZGC6Iqz6aiwDQo+IDx3ZWxscy5sdUBzdW5wbHVzLmNvbT47IHFpbmppYW5b6KaD
5YGlXSA8cWluamlhbkBjcXBsdXMxLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJd
IEFkZCB3YXRjaGRvZyBkcml2ZXIgZm9yIFN1bnBsdXMgU1A3MDIxIFNvQw0KPiANCj4gT24gV2Vk
LCBOb3YgMjQsIDIwMjEgYXQgMDY6NDE6NDdQTSArMDgwMCwgWGlhbnRhbyBIdSB3cm90ZToNCj4g
PiBUaGlzIGlzIGEgcGF0Y2ggc2VyaWVzIGZvciB3YXRjaGRvZyBkcml2ZXIgZm9yIFN1bnBsdXMg
U1A3MDIxIFNvQy4NCj4gPg0KPiA+IFN1bnBsdXMgU1A3MDIxIGlzIGFuIEFSTSBDb3J0ZXggQTcg
KDQgY29yZXMpIGJhc2VkIFNvQy4gSXQgaW50ZWdyYXRlcw0KPiA+IG1hbnkgcGVyaXBoZXJhbHMg
KGV4OiBVQVJULCBJMkMsIFNQSSwgU0RJTywgZU1NQywgVVNCLCBTRCBjYXJkIGFuZA0KPiA+IGV0
Yy4pIGludG8gYSBzaW5nbGUgY2hpcC4gSXQgaXMgZGVzaWduZWQgZm9yIGluZHVzdHJpYWwgY29u
dHJvbC4NCj4gPg0KPiANCj4gV2h5IGFyZSBtb3JlIGFuZCBtb3JlIHBlb3BsZSBzZW5kaW5nIHBh
dGNoZXMgb3IgcGF0Y2ggc2VyaWVzIGFzIHJlcGx5IHRvDQo+IHByZXZpb3VzIHBhdGNoZXMgPyBU
aGlzIGFsbCBieSBlbnN1cmVzIHRoYXQgcGF0Y2hlcyBnZXQgbG9zdC4NCj4gDQo+IElzIHRoYXQg
cHJvbW90ZWQgc29tZXdoZXJlID8NCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRlcg0K
