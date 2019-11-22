Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 604DF105EF6
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 04:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfKVDUw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 22:20:52 -0500
Received: from cnshjsmin03.alcatel-sbell.com.cn ([116.246.26.71]:50881 "EHLO
        cnshjsmin03.nokia-sbell.com" rhost-flags-OK-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726335AbfKVDUw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 22:20:52 -0500
X-AuditID: ac189297-c7bff7000000115a-11-5dd753fdd173
Received: from CNSHPPEXCH1603.nsn-intra.net (Unknown_Domain [135.251.51.103])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin03.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id 79.1A.04442.DF357DD5; Fri, 22 Nov 2019 11:20:29 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1603.nsn-intra.net (135.251.51.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 22 Nov 2019 11:20:29 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Fri, 22 Nov 2019 11:20:29 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Guenter Roeck <groeck7@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Topic: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Index: AdWgVy1kREB4bw5dQ4u+4ZEezt20u///t7KA//7BtxCAAg65gP//bxeg
Date:   Fri, 22 Nov 2019 03:20:29 +0000
Message-ID: <60d07860dedf45f9bd3e41fd90a9b636@nokia-sbell.com>
References: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
 <20191121141508.GA13249@roeck-us.net>
 <a66f73ba253b41f8956eb85e3cc67a4a@nokia-sbell.com>
 <8c198e4e-488b-efd0-4caf-b2dddb830ea3@roeck-us.net>
In-Reply-To: <8c198e4e-488b-efd0-4caf-b2dddb830ea3@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsXS/ts4Xfdv8PVYg4b1lhb7Oq8zWVzeNYfN
        4sa6fewWTxaeYbJ4/PIfswOrx85Zd9k9Vq5ZA2R9b2D3+LxJLoAlissmJTUnsyy1SN8ugSvj
        y27pgjOKFfNOnmNpYLyj0MXIySEhYCLRuOUVE4gtJHCISWLSHJkuRi4g+y+jxJIfCxghnE2M
        Envm3mABqWITcJdo2rSODcQWEVCTaD7VwgZSxCzwgFHi/ZG9QA4Hh7BAisSXDh6ImlSJbxMO
        MIGERQTcJFbv5QAJswioSrx70cUCEuYVsJPobCmEuOEio0TzskwQm1PAQWL9jj9gmxgFZCWm
        PboPdiezgLjErSfzmSDuF5BYsuc8M4QtKvHy8T9WkJESAkoSfRvAljILaEqs36UP0akoMaX7
        ITuIzSsgKHFy5hOWCYxis5AMnYXQMQtJxywkHQsYWVYxSifnFWdkFedm5hkY6+XlZ2cm6hYn
        pebk6CXn525iBEbcGolJ03cwHjvgfYhRgINRiYf3ReW1WCHWxLLiytxDjBIczEoivHuuX4kV
        4k1JrKxKLcqPLyrNSS0+xCjNwaIkztsyeWGskEB6YklqdmpqQWoRTJaJg1OqgTHd4lfH/a1V
        SW069fMZb8QJ7uT1jeOZWV/o2J63e3L+xd/NqdE11w26xZ8ppMcf/5NS9F3A/8rVHUc3Fm2L
        aujSnNnAqn/N+epFsbi8svT4rfWXPv/kv75Yr2b+Uq6zOsHMTyw3uuUf9313jUvMrNQ2Yt2+
        FYeY9BjnbXvptvCtndbU4+m/ziixFGckGmoxFxUnAgCig5M9tAIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PiBObywgdGhhdCB3b24ndCBiZSBuZWNlc3NhcnkuDQoNCm9rLCB0aGFuayB5b3UgdmVyeSBtdWNo
IGFnYWluIDopDQoNClBlbmcgV2FuZw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEd1ZW50ZXIgUm9lY2sgW21haWx0bzpncm9lY2s3QGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIEd1
ZW50ZXIgUm9lY2sNClNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjIsIDIwMTkgMTA6NDEgQU0NClRv
OiBXYW5nLCBQZW5nIDEuIChOU0IgLSBDTi9IYW5nemhvdSkgPHBlbmcuMS53YW5nQG5va2lhLXNi
ZWxsLmNvbT4NCkNjOiBHdWVudGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT47IHdpbUBsaW51
eC13YXRjaGRvZy5vcmc7IGxpbnV4LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gd2F0Y2hkb2c6IG1h
a2UgRGVzaWduV2FyZSB3YXRjaGRvZyBhbGxvdyB1c2VycyB0byBzZXQgYmlnZ2VyIHRpbWVvdXQg
dmFsdWUNCg0KT24gMTEvMjEvMTkgNToxNiBQTSwgV2FuZywgUGVuZyAxLiAoTlNCIC0gQ04vSGFu
Z3pob3UpIHdyb3RlOg0KPj4gUmV2aWV3ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4NCj4gDQo+IFJvZWNrLCB0aGFua3MgZm9yIHlvdXIgdGltZSB0byBndWlkZSBtZSB0
byBmaW5pc2ggdGhlIHJldmlldy4gRG8gSSBuZWVkIHRvIHJlLXNlbmQgYSBtYWlsIHdpdGggeW91
ciBzaWduPw0KPiANCg0KTm8sIHRoYXQgd29uJ3QgYmUgbmVjZXNzYXJ5Lg0KDQpHdWVudGVyDQoN
Cj4gUGVuZyBXYW5nDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBH
dWVudGVyIFJvZWNrIFttYWlsdG86Z3JvZWNrN0BnbWFpbC5jb21dIE9uIEJlaGFsZiBPZiBHdWVu
dGVyIA0KPiBSb2Vjaw0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMjEsIDIwMTkgMTA6MTUg
UE0NCj4gVG86IFdhbmcsIFBlbmcgMS4gKE5TQiAtIENOL0hhbmd6aG91KSA8cGVuZy4xLndhbmdA
bm9raWEtc2JlbGwuY29tPg0KPiBDYzogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+
OyB3aW1AbGludXgtd2F0Y2hkb2cub3JnOyANCj4gbGludXgtd2F0Y2hkb2dAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djJdIHdhdGNoZG9nOiBtYWtlIERlc2lnbldhcmUgd2F0Y2hkb2cgYWxsb3cgdXNlcnMgDQo+IHRv
IHNldCBiaWdnZXIgdGltZW91dCB2YWx1ZQ0KPiANCj4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQg
MTA6MzU6MTJBTSArMDAwMCwgV2FuZywgUGVuZyAxLiAoTlNCIC0gQ04vSGFuZ3pob3UpIHdyb3Rl
Og0KPj4gIEZyb20gYWFiYWE0YjcwOWJkNDUxZTU2NmM5MDZlOGQxZGNhNDhmOTJmOWIxMiBNb24g
U2VwIDE3IDAwOjAwOjAwIA0KPj4gMjAwMQ0KPj4gRnJvbTogUGVuZyBXYW5nIDxwZW5nLjEud2Fu
Z0Bub2tpYS1zYmVsbC5jb20+DQo+PiBEYXRlOiBXZWQsIDIwIE5vdiAyMDE5IDE1OjEyOjU5ICsw
ODAwDQo+PiBTdWJqZWN0OiBbUEFUQ0hdIHdhdGNoZG9nOiBtYWtlIERlc2lnbldhcmUgd2F0Y2hk
b2cgYWxsb3cgdXNlcnMgdG8gDQo+PiBzZXQgYmlnZ2VyICB0aW1lb3V0IHZhbHVlDQo+Pg0KPj4g
d2F0Y2hkb2dfZGV2LmMgcHJvdmlkZXMgbWVhbnMgdG8gYWxsb3cgdXNlcnMgdG8gc2V0IGJpZ2dl
ciB0aW1lb3V0IA0KPj4gdmFsdWUgdGhhbiBIVyBjYW4gc3VwcG9ydCwgbWFrZSBEZXNpZ25XYXJl
IHdhdGNoZG9nIGFsaWduIHdpdGggdGhpcy4NCj4+DQo+PiAtLS0NCj4+DQo+PiB2MiAtPiB2MToN
Cj4+ICAgICAgICAgLSB1c2UgdG9wX3MgdG8gY29tcGFyZSB3aXRoIHdkZC0+bWF4X2h3X2hlYXJ0
YmVhdF9tcw0KPj4gICAgICAgICAtIHVwZGF0ZSB3ZGQtPnRpbWVvdXQgaW4gY2FzZSBpdCdzIGdy
ZWF0ZXIgdGhhbiBIVyBzdXBwb3J0cw0KPj4gICAgICAgICAtIGZpeCBjb21tZW50cyBlcnJvcg0K
Pj4NCj4+IHYxOiBpbml0aWFsIHZlcnNpb24NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQZW5nIFdh
bmcgPHBlbmcuMS53YW5nQG5va2lhLXNiZWxsLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQo+IA0KPj4gLS0tDQo+PiAgIGRyaXZlcnMv
d2F0Y2hkb2cvZHdfd2R0LmMgfCAxMCArKysrKysrKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy93YXRjaGRvZy9kd193ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvZHdfd2R0LmMgDQo+PiBpbmRl
eCBmZWY3YzYxLi4xMmMxMTZlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9kd193
ZHQuYw0KPj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9kd193ZHQuYw0KPj4gQEAgLTExNCw3ICsx
MTQsMTUgQEAgc3RhdGljIGludCBkd193ZHRfc2V0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2Rl
dmljZSAqd2RkLCB1bnNpZ25lZCBpbnQgdG9wX3MpDQo+PiAgIAl3cml0ZWwodG9wX3ZhbCB8IHRv
cF92YWwgPDwgV0RPR19USU1FT1VUX1JBTkdFX1RPUElOSVRfU0hJRlQsDQo+PiAgIAkgICAgICAg
ZHdfd2R0LT5yZWdzICsgV0RPR19USU1FT1VUX1JBTkdFX1JFR19PRkZTRVQpOw0KPj4gICANCj4+
IC0Jd2RkLT50aW1lb3V0ID0gZHdfd2R0X3RvcF9pbl9zZWNvbmRzKGR3X3dkdCwgdG9wX3ZhbCk7
DQo+PiArCS8qDQo+PiArCSAqIEluIGNhc2UgdXNlcnMgc2V0IGJpZ2dlciB0aW1lb3V0IHZhbHVl
IHRoYW4gSFcgY2FuIHN1cHBvcnQsDQo+PiArCSAqIGtlcm5lbCh3YXRjaGRvZ19kZXYuYykgaGVs
cHMgdG8gZmVlZCB3YXRjaGRvZyBiZWZvcmUNCj4+ICsJICogd2RkLT5tYXhfaHdfaGVhcnRiZWF0
X21zDQo+PiArCSAqLw0KPj4gKwlpZiAoIHRvcF9zICogMTAwMCA8PSB3ZGQtPm1heF9od19oZWFy
dGJlYXRfbXMgKQ0KPj4gKwkJd2RkLT50aW1lb3V0ID0gZHdfd2R0X3RvcF9pbl9zZWNvbmRzKGR3
X3dkdCwgdG9wX3ZhbCk7DQo+PiArCWVsc2UNCj4+ICsJCXdkZC0+dGltZW91dCA9IHRvcF9zOw0K
Pj4gICANCj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiAtLQ0KPj4gMS44LjMuMQ0KPj4NCj4g
DQoNCg==
