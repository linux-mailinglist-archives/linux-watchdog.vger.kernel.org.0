Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88CF6105097
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 11:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfKUKfS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 05:35:18 -0500
Received: from cnshjsmin05.app.nokia-sbell.com ([116.246.26.45]:56124 "EHLO
        cnshjsmin05.nokia-sbell.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726613AbfKUKfS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 05:35:18 -0500
X-AuditID: ac18929d-483ff700000014de-52-5dd668616efd
Received: from CNSHPPEXCH1604.nsn-intra.net (Unknown_Domain [135.251.51.104])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by cnshjsmin05.nokia-sbell.com (Symantec Messaging Gateway) with SMTP id 24.6B.05342.16866DD5; Thu, 21 Nov 2019 18:35:13 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1604.nsn-intra.net (135.251.51.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 21 Nov 2019 18:35:13 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.1713.007;
 Thu, 21 Nov 2019 18:35:13 +0800
From:   "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
To:     Guenter Roeck <groeck7@gmail.com>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Topic: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
Thread-Index: AdWgVy1kREB4bw5dQ4u+4ZEezt20uw==
Date:   Thu, 21 Nov 2019 10:35:12 +0000
Message-ID: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42Jp/22coZuYcS3W4G+XiMW+zutMFpd3zWGz
        uLFuH7vF45f/mB1YPHbOusvusXLNGlaPz5vkApijuGxSUnMyy1KL9O0SuDKOHlnFVnBGoGLL
        IfMGxikCXYycHBICJhLLf39h7GLk4hASOMQkcfTbMXYI5y+jxIZ1J5ghnE2MEvP2vWcBaWET
        cJdo2rSODcQWEVCV2LdjJVgRs8BuRom5jW/AioQFEiQu7mxngihKlfg24QCUrScxY/MmsBoW
        oObOczfABvEK2EnsPDqHGcRmFJCVmPboPlg9s4C4xK0n85kgbhWQWLLnPDOELSrx8vE/1i5G
        DiBbSaJvAxOIySygKbF+lz5Ep6LElO6H7BDTBSVOznzCMoFRZBaSobMQOmYh6ZiFpGMBI8sq
        RunkvOKMrOLczDwDU728/OzMRN3ipNScHL3k/NxNjMCoWSMxae4Oxs7O+EOMAhyMSjy8GRpX
        Y4VYE8uKK3MPMUpwMCuJ8O65fiVWiDclsbIqtSg/vqg0J7X4EKM0B4uSOG/L5IWxQgLpiSWp
        2ampBalFMFkmDk6pBsYV7UZX7y9YKnL7Ksexl4c2Hq7ncBbUiWh04feqnV62RaCr5OqWsvXP
        b3b9CT0axpw/rWZBJuf7rb9WWsiXP9r+X+j57KD9Gyecz3p77HqV8M5P9mwm33glgrb1yv+c
        Ozej407/s/y1E+PVz0mVvV/HuddpwgcdB9eDDYorY73nrFEWbnYzP2ivxFKckWioxVxUnAgA
        M7xmhJYCAAA=
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbSBhYWJhYTRiNzA5YmQ0NTFlNTY2YzkwNmU4ZDFkY2E0OGY5MmY5YjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGVuZyBXYW5nIDxwZW5nLjEud2FuZ0Bub2tpYS1zYmVsbC5j
b20+DQpEYXRlOiBXZWQsIDIwIE5vdiAyMDE5IDE1OjEyOjU5ICswODAwDQpTdWJqZWN0OiBbUEFU
Q0hdIHdhdGNoZG9nOiBtYWtlIERlc2lnbldhcmUgd2F0Y2hkb2cgYWxsb3cgdXNlcnMgdG8gc2V0
IGJpZ2dlcg0KIHRpbWVvdXQgdmFsdWUNCg0Kd2F0Y2hkb2dfZGV2LmMgcHJvdmlkZXMgbWVhbnMg
dG8gYWxsb3cgdXNlcnMgdG8gc2V0IGJpZ2dlciB0aW1lb3V0IHZhbHVlDQp0aGFuIEhXIGNhbiBz
dXBwb3J0LCBtYWtlIERlc2lnbldhcmUgd2F0Y2hkb2cgYWxpZ24gd2l0aCB0aGlzLg0KDQotLS0N
Cg0KdjIgLT4gdjE6DQogICAgICAgLSB1c2UgdG9wX3MgdG8gY29tcGFyZSB3aXRoIHdkZC0+bWF4
X2h3X2hlYXJ0YmVhdF9tcw0KICAgICAgIC0gdXBkYXRlIHdkZC0+dGltZW91dCBpbiBjYXNlIGl0
J3MgZ3JlYXRlciB0aGFuIEhXIHN1cHBvcnRzDQogICAgICAgLSBmaXggY29tbWVudHMgZXJyb3IN
Cg0KdjE6IGluaXRpYWwgdmVyc2lvbg0KDQpTaWduZWQtb2ZmLWJ5OiBQZW5nIFdhbmcgPHBlbmcu
MS53YW5nQG5va2lhLXNiZWxsLmNvbT4NCi0tLQ0KIGRyaXZlcnMvd2F0Y2hkb2cvZHdfd2R0LmMg
fCAxMCArKysrKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9kd193ZHQuYyBiL2RyaXZl
cnMvd2F0Y2hkb2cvZHdfd2R0LmMNCmluZGV4IGZlZjdjNjEuLjEyYzExNmUgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL3dhdGNoZG9nL2R3X3dkdC5jDQorKysgYi9kcml2ZXJzL3dhdGNoZG9nL2R3X3dk
dC5jDQpAQCAtMTE0LDcgKzExNCwxNSBAQCBzdGF0aWMgaW50IGR3X3dkdF9zZXRfdGltZW91dChz
dHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGQsIHVuc2lnbmVkIGludCB0b3BfcykNCiAJd3JpdGVs
KHRvcF92YWwgfCB0b3BfdmFsIDw8IFdET0dfVElNRU9VVF9SQU5HRV9UT1BJTklUX1NISUZULA0K
IAkgICAgICAgZHdfd2R0LT5yZWdzICsgV0RPR19USU1FT1VUX1JBTkdFX1JFR19PRkZTRVQpOw0K
IA0KLQl3ZGQtPnRpbWVvdXQgPSBkd193ZHRfdG9wX2luX3NlY29uZHMoZHdfd2R0LCB0b3BfdmFs
KTsNCisJLyoNCisJICogSW4gY2FzZSB1c2VycyBzZXQgYmlnZ2VyIHRpbWVvdXQgdmFsdWUgdGhh
biBIVyBjYW4gc3VwcG9ydCwNCisJICoga2VybmVsKHdhdGNoZG9nX2Rldi5jKSBoZWxwcyB0byBm
ZWVkIHdhdGNoZG9nIGJlZm9yZSANCisJICogd2RkLT5tYXhfaHdfaGVhcnRiZWF0X21zDQorCSAq
Lw0KKwlpZiAoIHRvcF9zICogMTAwMCA8PSB3ZGQtPm1heF9od19oZWFydGJlYXRfbXMgKQ0KKwkJ
d2RkLT50aW1lb3V0ID0gZHdfd2R0X3RvcF9pbl9zZWNvbmRzKGR3X3dkdCwgdG9wX3ZhbCk7DQor
CWVsc2UNCisJCXdkZC0+dGltZW91dCA9IHRvcF9zOw0KIA0KIAlyZXR1cm4gMDsNCiB9DQotLSAN
CjEuOC4zLjENCg0K
