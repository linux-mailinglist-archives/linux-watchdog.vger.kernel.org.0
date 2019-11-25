Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56550108665
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Nov 2019 02:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfKYBhX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 24 Nov 2019 20:37:23 -0500
Received: from cnshjsmin05.app.nokia-sbell.com ([116.246.26.45]:18494 "EHLO
        cnshjsmin05.nokia-sbell.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727085AbfKYBhW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 24 Nov 2019 20:37:22 -0500
X-AuditID: ac18929d-49dff700000014de-dc-5ddb304c7d48
Received: from CNSHPPEXCH1608.nsn-intra.net (Unknown_Domain [135.251.51.108])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin05.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id 00.7C.05342.C403BDD5; Mon, 25 Nov 2019 09:37:16 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1608.nsn-intra.net (135.251.51.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 25 Nov 2019 09:37:16 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Mon, 25 Nov 2019 09:37:16 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     Guenter Roeck <guenter@roeck-us.net>,
        Guenter Roeck <groeck7@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Topic: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Index: AdWgVy1kREB4bw5dQ4u+4ZEezt20uwAXODOAAJ8iyIA=
Date:   Mon, 25 Nov 2019 01:37:16 +0000
Message-ID: <ed8c4cc6116942ddbefa76a11846a857@nokia-sbell.com>
References: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
 <2b2a1beb-d735-210c-847a-e3211f9efeca@roeck-us.net>
In-Reply-To: <2b2a1beb-d735-210c-847a-e3211f9efeca@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsXS/ts4R9fH4HasQecRLYt9ndeZLBr/3We1
        uLxrDpvFjXX72C0ev/zH7MDqsXPWXXaPlWvWAFnfG9g9Pm+SC2CJ4rJJSc3JLEst0rdL4Mq4
        eegca0GPXMWFFRdZGxhXyHYxcnJICJhITLl5mrmLkYtDSOAQk8SNd1PYQRJCAn8ZJe5/doFI
        bGKUWP16HhtIgk3AXaJp0zowW0TAW+LZ7PlsIEXMArsZJeY2vmHpYuTgEBZIkfjSwQNRkyrx
        bcIBJgjbSmL5mb0sIDaLgKrExO99YHN4Bewkruw/C7W4RGJSSxsbyBhOAQeJE61hIGFGAVmJ
        aY/ug41hFhCXuPVkPhPEAwISS/acZ4awRSVePv7HCtIqIaAk0beBCcRkFtCUWL9LH6JTUWJK
        90N2iKWCEidnPmGZwCg2C8nQWQgds5B0zELSsYCRZRWjdHJecUZWcW5mnoGpXl5+dmaibnFS
        ak6OXnJ+7iZGYNStkZg0dwdjZ2f8IUYBDkYlHt4Na2/FCrEmlhVX5h5ilOBgVhLhdTt7I1aI
        NyWxsiq1KD++qDQntfgQozQHi5I4b8vkhbFCAumJJanZqakFqUUwWSYOTqkGxoysf3WVTtWt
        LpfcDi26mT2h6vMrjx1Wr5kvHJzO4PBvVddaNyevbYZ/rzBM3yaz9RDr6lfT/p1OUHvSaiNZ
        uOuP4IxTC+YwMm1de+I569kUW99Doo7pG07vezxxTbfpfu9j9hNZlZadynywfnbITmHLmXfe
        vuw0WbPvt92W1wIm3a16VdcVeziUWIozEg21mIuKEwEv5AN4tgIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PlNpZ2guIEkgc2hvdWxkIGhhdmUgcGFpZCBjbG9zZXIgYXR0ZW50aW9uLiBTaWduZWQtb2ZmLWJ5
OiBoYXMgdG8gYmUgYWhlYWQgb2YgLS0tLA0KPmFuZCB0aGUgY2hhbmdlIGxvZyBhZnRlciBpdC4g
VGhlIGFib3ZlIGZvcm1hdCBtZXNzZXMgdXAgZXZlcnl0aGluZy4NCj5BbHNvLCBwbGVhc2UgcnVu
IGNoZWNrcGF0Y2ggYW5kIGZpeCB0aGUgcHJvYmxlbXMgaXQgcmVwb3J0cy4NCj5Tb3JyeSBmb3Ig
bm90IG5vdGljaW5nIGl0IGVhcmxpZXIuIFBsZWFzZSBmaXggdGhlIHByb2JsZW1zIGFuZCByZXN1
Ym1pdC4NCg0KT2ssIEknbGwgcmUtc3VibWl0IHRoZSBwYXRjaC4NCg0KVGhhbmtzLA0KDQpQZW5n
IFdhbmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEd1ZW50ZXIgUm9lY2sg
W21haWx0bzpncm9lY2s3QGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNClNl
bnQ6IEZyaWRheSwgTm92ZW1iZXIgMjIsIDIwMTkgMTozOSBQTQ0KVG86IFdhbmcsIFBlbmcgMS4g
KE5TQiAtIENOL0hhbmd6aG91KSA8cGVuZy4xLndhbmdAbm9raWEtc2JlbGwuY29tPjsgR3VlbnRl
ciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+DQpDYzogd2ltQGxpbnV4LXdhdGNoZG9nLm9yZzsg
bGludXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB3YXRjaGRvZzogbWFrZSBEZXNpZ25XYXJlIHdh
dGNoZG9nIGFsbG93IHVzZXJzIHRvIHNldCBiaWdnZXIgdGltZW91dCB2YWx1ZQ0KDQpPbiAxMS8y
MS8xOSAyOjM1IEFNLCBXYW5nLCBQZW5nIDEuIChOU0IgLSBDTi9IYW5nemhvdSkgd3JvdGU6DQo+
ICBGcm9tIGFhYmFhNGI3MDliZDQ1MWU1NjZjOTA2ZThkMWRjYTQ4ZjkyZjliMTIgTW9uIFNlcCAx
NyAwMDowMDowMCANCj4gMjAwMQ0KPiBGcm9tOiBQZW5nIFdhbmcgPHBlbmcuMS53YW5nQG5va2lh
LXNiZWxsLmNvbT4NCj4gRGF0ZTogV2VkLCAyMCBOb3YgMjAxOSAxNToxMjo1OSArMDgwMA0KPiBT
dWJqZWN0OiBbUEFUQ0hdIHdhdGNoZG9nOiBtYWtlIERlc2lnbldhcmUgd2F0Y2hkb2cgYWxsb3cg
dXNlcnMgdG8gc2V0IGJpZ2dlcg0KPiAgIHRpbWVvdXQgdmFsdWUNCj4NCj4gd2F0Y2hkb2dfZGV2
LmMgcHJvdmlkZXMgbWVhbnMgdG8gYWxsb3cgdXNlcnMgdG8gc2V0IGJpZ2dlciB0aW1lb3V0IA0K
PiB2YWx1ZSB0aGFuIEhXIGNhbiBzdXBwb3J0LCBtYWtlIERlc2lnbldhcmUgd2F0Y2hkb2cgYWxp
Z24gd2l0aCB0aGlzLg0KPg0KPiAtLS0NCj4NCj4gdjIgLT4gdjE6DQo+ICAgICAgICAgLSB1c2Ug
dG9wX3MgdG8gY29tcGFyZSB3aXRoIHdkZC0+bWF4X2h3X2hlYXJ0YmVhdF9tcw0KPiAgICAgICAg
IC0gdXBkYXRlIHdkZC0+dGltZW91dCBpbiBjYXNlIGl0J3MgZ3JlYXRlciB0aGFuIEhXIHN1cHBv
cnRzDQo+ICAgICAgICAgLSBmaXggY29tbWVudHMgZXJyb3INCj4NCj4gdjE6IGluaXRpYWwgdmVy
c2lvbg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIFdhbmcgPHBlbmcuMS53YW5nQG5va2lhLXNi
ZWxsLmNvbT4NCg0KU2lnaC4gSSBzaG91bGQgaGF2ZSBwYWlkIGNsb3NlciBhdHRlbnRpb24uIFNp
Z25lZC1vZmYtYnk6IGhhcyB0byBiZSBhaGVhZCBvZiAtLS0sDQoNCmFuZCB0aGUgY2hhbmdlIGxv
ZyBhZnRlciBpdC4gVGhlIGFib3ZlIGZvcm1hdCBtZXNzZXMgdXAgZXZlcnl0aGluZy4NCg0KQWxz
bywgcGxlYXNlIHJ1biBjaGVja3BhdGNoIGFuZCBmaXggdGhlIHByb2JsZW1zIGl0IHJlcG9ydHMu
DQoNClNvcnJ5IGZvciBub3Qgbm90aWNpbmcgaXQgZWFybGllci4gUGxlYXNlIGZpeCB0aGUgcHJv
YmxlbXMgYW5kIHJlc3VibWl0Lg0KDQpUaGFua3MsDQoNCkd1ZW50ZXINCg0KPiAtLS0NCj4gICBk
cml2ZXJzL3dhdGNoZG9nL2R3X3dkdC5jIHwgMTAgKysrKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvd2F0Y2hkb2cvZHdfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL2R3X3dkdC5jIA0KPiBp
bmRleCBmZWY3YzYxLi4xMmMxMTZlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2R3
X3dkdC5jDQo+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvZHdfd2R0LmMNCj4gQEAgLTExNCw3ICsx
MTQsMTUgQEAgc3RhdGljIGludCBkd193ZHRfc2V0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2Rl
dmljZSAqd2RkLCB1bnNpZ25lZCBpbnQgdG9wX3MpDQo+ICAgCXdyaXRlbCh0b3BfdmFsIHwgdG9w
X3ZhbCA8PCBXRE9HX1RJTUVPVVRfUkFOR0VfVE9QSU5JVF9TSElGVCwNCj4gICAJICAgICAgIGR3
X3dkdC0+cmVncyArIFdET0dfVElNRU9VVF9SQU5HRV9SRUdfT0ZGU0VUKTsNCj4gICANCj4gLQl3
ZGQtPnRpbWVvdXQgPSBkd193ZHRfdG9wX2luX3NlY29uZHMoZHdfd2R0LCB0b3BfdmFsKTsNCj4g
KwkvKg0KPiArCSAqIEluIGNhc2UgdXNlcnMgc2V0IGJpZ2dlciB0aW1lb3V0IHZhbHVlIHRoYW4g
SFcgY2FuIHN1cHBvcnQsDQo+ICsJICoga2VybmVsKHdhdGNoZG9nX2Rldi5jKSBoZWxwcyB0byBm
ZWVkIHdhdGNoZG9nIGJlZm9yZQ0KPiArCSAqIHdkZC0+bWF4X2h3X2hlYXJ0YmVhdF9tcw0KPiAr
CSAqLw0KPiArCWlmICggdG9wX3MgKiAxMDAwIDw9IHdkZC0+bWF4X2h3X2hlYXJ0YmVhdF9tcyAp
DQo+ICsJCXdkZC0+dGltZW91dCA9IGR3X3dkdF90b3BfaW5fc2Vjb25kcyhkd193ZHQsIHRvcF92
YWwpOw0KPiArCWVsc2UNCj4gKwkJd2RkLT50aW1lb3V0ID0gdG9wX3M7DQo+ICAgDQo+ICAgCXJl
dHVybiAwOw0KPiAgIH0NCg0KDQo=
