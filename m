Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF7C10866B
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Nov 2019 03:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfKYCEQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 24 Nov 2019 21:04:16 -0500
Received: from cnshjsmin05.nokia-sbell.com ([116.246.26.45]:29508 "EHLO
        cnshjsmin05.nokia-sbell.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726830AbfKYCEQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 24 Nov 2019 21:04:16 -0500
X-AuditID: ac18929d-483ff700000014de-56-5ddb369d4d8f
Received: from CNSHPPEXCH1608.nsn-intra.net (Unknown_Domain [135.251.51.108])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin05.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id 81.3E.05342.D963BDD5; Mon, 25 Nov 2019 10:04:13 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1608.nsn-intra.net (135.251.51.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 25 Nov 2019 10:04:13 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Mon, 25 Nov 2019 10:04:13 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     Guenter Roeck <guenter@roeck-us.net>,
        Guenter Roeck <groeck7@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2.1] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Topic: [PATCH v2.1] watchdog: make DesignWare watchdog allow users to
 set bigger timeout value
Thread-Index: AdWjNIrZT/zI+n3RTkOdyUq1ShRV4Q==
Date:   Mon, 25 Nov 2019 02:04:13 +0000
Message-ID: <8fa54e92c6cd4544a7a3eb60a373ac43@nokia-sbell.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42Jp/22cozvX7Haswd8juhb7Oq8zWTT+u89q
        cXnXHDaLG+v2sVs8fvmP2YHVY+esu+weK9esAbK+N7B7fN4kF8ASxWWTkpqTWZZapG+XwJWx
        aec/loJVghWn78g3MH4Q6GLk5JAQMJFY/e81excjF4eQwCEmiRs9R9hBEkICfxklTr6whkhs
        YpR4e2s5G0iCTcBdomnTOjBbRMBb4tns+WwgRcwCuxkl5ja+YQFJCAskSWzYt5AJoihdYtLt
        3VC2nsSpW9uYQWwWAVWJa/fOgW3jFbCTWLW1A6yXUUBWYtqj+2D1zALiEreezGeCOFVAYsme
        88wQtqjEy8f/WLsYOYBsJYm+DUwgJrOApsT6XfoQnYoSU7ofQk0XlDg58wnLBEaRWUiGzkLo
        mIWkYxaSjgWMLKsYpZPzijOyinMz8wxM9fLyszMTdYuTUnNy9JLzczcxAuNojcSkuTsYOzvj
        DzEKcDAq8fBuWHsrVog1say4MvcQowQHs5IIr9vZG7FCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
        eVsmL4wVEkhPLEnNTk0tSC2CyTJxcEo1MGpcOPjcnS04Znqp6hOmF/WLovblrvyycm623v1v
        3xSi1sfeu3z8yN053dLqImLuUnK3+vfOV2IPs3hQFxQ4cVFK/6u0B76zJXhO9k2elFyQkB6w
        PcDxzClBeY8OwcCj59T3ffK7Mt/UZ0/1ScO4Zz5vN/PH+06y2PrO51zNYe+LGzjkNs5OalNi
        Kc5INNRiLipOBAA+x4qanwIAAA==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbSBhYWJhYTRiNzA5YmQ0NTFlNTY2YzkwNmU4ZDFkY2E0OGY5MmY5YjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGVuZyBXYW5nIDxwZW5nLjEud2FuZ0Bub2tpYS1zYmVsbC5j
b20+DQpEYXRlOiBXZWQsIDIwIE5vdiAyMDE5IDE1OjEyOjU5ICswODAwDQpTdWJqZWN0OiBbUEFU
Q0ggdjIuMV0gd2F0Y2hkb2c6IG1ha2UgRGVzaWduV2FyZSB3YXRjaGRvZyBhbGxvdyB1c2VycyB0
byBzZXQgYmlnZ2VyDQogdGltZW91dCB2YWx1ZQ0KDQp3YXRjaGRvZ19kZXYuYyBwcm92aWRlcyBt
ZWFucyB0byBhbGxvdyB1c2VycyB0byBzZXQgYmlnZ2VyIHRpbWVvdXQgdmFsdWUNCnRoYW4gSFcg
Y2FuIHN1cHBvcnQsIG1ha2UgRGVzaWduV2FyZSB3YXRjaGRvZyBhbGlnbiB3aXRoIHRoaXMuDQoN
ClNpZ25lZC1vZmYtYnk6IFBlbmcgV2FuZyA8cGVuZy4xLndhbmdAbm9raWEtc2JlbGwuY29tPg0K
LS0tDQoNCnYyIC0+IHYyLjE6DQogICAgLSBtb3ZlIFNpZ25lZC1vZmYtYnkgdG8gYmUgYWhlYWQg
b2Ygc2VjdGlvbiBzZXBhcmF0b3INCg0KdjEgLT4gdjI6DQogICAgLSB1c2UgdG9wX3MgdG8gY29t
cGFyZSB3aXRoIHdkZC0+bWF4X2h3X2hlYXJ0YmVhdF9tcw0KICAgIC0gdXBkYXRlIHdkZC0+dGlt
ZW91dCBpbiBjYXNlIGl0J3MgZ3JlYXRlciB0aGFuIEhXIHN1cHBvcnRzDQogICAgLSBmaXggY29t
bWVudHMgZXJyb3INCg0KdjE6IGluaXRpYWwgdmVyc2lvbg0KDQotLS0NCiBkcml2ZXJzL3dhdGNo
ZG9nL2R3X3dkdC5jIHwgMTAgKysrKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvZHdf
d2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL2R3X3dkdC5jDQppbmRleCBmZWY3YzYxLi4xMmMxMTZl
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy93YXRjaGRvZy9kd193ZHQuYw0KKysrIGIvZHJpdmVycy93
YXRjaGRvZy9kd193ZHQuYw0KQEAgLTExNCw3ICsxMTQsMTUgQEAgc3RhdGljIGludCBkd193ZHRf
c2V0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RkLCB1bnNpZ25lZCBpbnQgdG9w
X3MpDQogCXdyaXRlbCh0b3BfdmFsIHwgdG9wX3ZhbCA8PCBXRE9HX1RJTUVPVVRfUkFOR0VfVE9Q
SU5JVF9TSElGVCwNCiAJICAgICAgIGR3X3dkdC0+cmVncyArIFdET0dfVElNRU9VVF9SQU5HRV9S
RUdfT0ZGU0VUKTsNCiANCi0Jd2RkLT50aW1lb3V0ID0gZHdfd2R0X3RvcF9pbl9zZWNvbmRzKGR3
X3dkdCwgdG9wX3ZhbCk7DQorCS8qDQorCSAqIEluIGNhc2UgdXNlcnMgc2V0IGJpZ2dlciB0aW1l
b3V0IHZhbHVlIHRoYW4gSFcgY2FuIHN1cHBvcnQsDQorCSAqIGtlcm5lbCh3YXRjaGRvZ19kZXYu
YykgaGVscHMgdG8gZmVlZCB3YXRjaGRvZyBiZWZvcmUNCisJICogd2RkLT5tYXhfaHdfaGVhcnRi
ZWF0X21zDQorCSAqLw0KKwlpZiAodG9wX3MgKiAxMDAwIDw9IHdkZC0+bWF4X2h3X2hlYXJ0YmVh
dF9tcykNCisJCXdkZC0+dGltZW91dCA9IGR3X3dkdF90b3BfaW5fc2Vjb25kcyhkd193ZHQsIHRv
cF92YWwpOw0KKwllbHNlDQorCQl3ZGQtPnRpbWVvdXQgPSB0b3BfczsNCiANCiAJcmV0dXJuIDA7
DQogfQ0KLS0gDQoxLjguMy4xDQoNCg==
