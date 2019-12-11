Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7F5311B89E
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2019 17:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbfLKQXI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Dec 2019 11:23:08 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:10999 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730571AbfLKQXG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Dec 2019 11:23:06 -0500
X-UUID: 14a59d9eee5944789d8c9ae7788ba1f3-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xMYI/rBhHY4Sx0dFvP6i+g8yPPuQV+8OY+pjlW+wWM8=;
        b=EvXF3RnxSWxiv2c1tBtEICNgrR7YzBlZcAJB+hqUUnAVxU5JRvl82Bsjj6dTu7cOO3WEE7bnuUZEqRuhf+CRHNO89aNYOi2IDxFINQG1ZWhuIScYiIJjfuh2KADpKs6RKR+irCsaQ798JUnIi4BdCQ+J4TcCGgKE0stIcVZrsNs=;
X-UUID: 14a59d9eee5944789d8c9ae7788ba1f3-20191212
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1850835644; Thu, 12 Dec 2019 00:23:03 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 00:22:23 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 00:22:13 +0800
From:   Jiaxin Yu <jiaxin.yu@mediatek.com>
To:     <yong.liang@mediatek.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC:     <yingjoe.chen@mediatek.com>, <sboyd@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Date:   Thu, 12 Dec 2019 00:22:35 +0800
Message-ID: <1576081356-18298-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1576081356-18298-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1576081356-18298-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 53FB9AB0FF4671BAF7EB700E0F72317E5E11C0BE438D010CF69C6EE81A75401F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogInlvbmcubGlhbmciIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCg0KQWRkICNyZXNl
dC1jZWxscyBwcm9wZXJ0eSBhbmQgdXBkYXRlIGV4YW1wbGUNCg0KU2lnbmVkLW9mZi1ieTogeW9u
Zy5saWFuZyA8eW9uZy5saWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCAgfCAxMCArKysrKystLS0NCiAuLi4vcmVzZXQt
Y29udHJvbGxlci9tdDI3MTItcmVzZXRzLmggICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysr
KysrDQogLi4uL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oICAgICAgICAgIHwgMTcg
KysrKysrKysrKysrKysNCiAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQt
Y29udHJvbGxlci9tdDI3MTItcmVzZXRzLmgNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KaW5kZXggOTIxODFiNjQ4
ZjUyLi41YTc2YWMyNjJmOGQgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KQEAgLTQsNiArNCw3IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXM6DQogDQogLSBjb21wYXRpYmxlIHNob3VsZCBjb250YWluOg0KIAkibWVk
aWF0ZWssbXQyNzAxLXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UMjcwMQ0KKwki
bWVkaWF0ZWssbXQyNzEyLXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UMjcxMg0K
IAkibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY1ODkNCiAJIm1lZGlhdGVrLG10Njc5Ny13
ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY3OTcNCiAJIm1lZGlhdGVrLG10NzYy
Mi13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjINCkBAIC0xNCwxMSArMTUs
MTQgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiANCiBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KIC0g
dGltZW91dC1zZWM6IGNvbnRhaW5zIHRoZSB3YXRjaGRvZyB0aW1lb3V0IGluIHNlY29uZHMuDQor
LSAjcmVzZXQtY2VsbHM6IFNob3VsZCBiZSAxLg0KIA0KIEV4YW1wbGU6DQogDQotd2R0OiB3YXRj
aGRvZ0AxMDAwMDAwMCB7DQotCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NTg5LXdkdCI7DQot
CXJlZyA9IDwweDEwMDAwMDAwIDB4MTg+Ow0KK3dhdGNoZG9nOiB3YXRjaGRvZ0AxMDAwNzAwMCB7
DQorCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXdkdCIsDQorCQkgICAgICJtZWRpYXRl
ayxtdDY1ODktd2R0IjsNCisJcmVnID0gPDAgMHgxMDAwNzAwMCAwIDB4MTAwPjsNCiAJdGltZW91
dC1zZWMgPSA8MTA+Ow0KKwkjcmVzZXQtY2VsbHMgPSA8MT47DQogfTsNCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaA0KbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uOWU3ZWU3NjJmMDc2DQotLS0gL2Rl
di9udWxsDQorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEy
LXJlc2V0cy5oDQpAQCAtMCwwICsxLDIyIEBADQorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAgKi8NCisvKg0KKyAqIENvcHlyaWdodCAoYykgMjAxOSBNZWRpYVRlayBJbmMuDQor
ICogQXV0aG9yOiBZb25nIExpYW5nIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCisgKi8NCisN
CisjaWZuZGVmIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01UMjcxMg0KKyNkZWZpbmUg
X0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQyNzEyDQorDQorI2RlZmluZSBNVDI3MTJf
VE9QUkdVX0lORlJBX1NXX1JTVAkJCQkwDQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX01NX1NXX1JT
VAkJCQkJMQ0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9NRkdfU1dfUlNUCQkJCTINCisjZGVmaW5l
IE1UMjcxMl9UT1BSR1VfVkVOQ19TV19SU1QJCQkJMw0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9W
REVDX1NXX1JTVAkJCQk0DQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX0lNR19TV19SU1QJCQkJNQ0K
KyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9JTkZSQV9BT19TV19SU1QJCQkJOA0KKyNkZWZpbmUgTVQy
NzEyX1RPUFJHVV9VU0JfU1dfUlNUCQkJCTkNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfQVBNSVhF
RF9TV19SU1QJCQkJMTANCisNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfU1dfUlNUX05VTQkJCQkx
MQ0KKw0KKyNlbmRpZiAgLyogX0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQyNzEyICov
DQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4
My1yZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxODMt
cmVzZXRzLmgNCmluZGV4IDg4MDRlMzRlYmRkNC4uYTFiYmQ0MWUwZDEyIDEwMDY0NA0KLS0tIGEv
aW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaA0KKysr
IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaA0K
QEAgLTc4LDQgKzc4LDIxIEBADQogI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfQU9fSTJDN19TV19S
U1QJCQkJMTI2DQogI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfQU9fSTJDOF9TV19SU1QJCQkJMTI3
DQogDQorI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfU1dfUlNUX05VTQkJCQkxMjgNCisNCisjZGVm
aW5lIE1UODE4M19UT1BSR1VfTU1fU1dfUlNUCQkJCQkxDQorI2RlZmluZSBNVDgxODNfVE9QUkdV
X01GR19TV19SU1QJCQkJMg0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9WRU5DX1NXX1JTVAkJCQkz
DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX1ZERUNfU1dfUlNUCQkJCTQNCisjZGVmaW5lIE1UODE4
M19UT1BSR1VfSU1HX1NXX1JTVAkJCQk1DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX01EX1NXX1JT
VAkJCQkJNw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9DT05OX1NXX1JTVAkJCQk5DQorI2RlZmlu
ZSBNVDgxODNfVE9QUkdVX0NPTk5fTUNVX1NXX1JTVAkJCQkxMg0KKyNkZWZpbmUgTVQ4MTgzX1RP
UFJHVV9JUFUwX1NXX1JTVAkJCQkxNA0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9JUFUxX1NXX1JT
VAkJCQkxNQ0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9BVURJT19TV19SU1QJCQkJMTcNCisjZGVm
aW5lIE1UODE4M19UT1BSR1VfQ0FNU1lTX1NXX1JTVAkJCQkxOA0KKw0KKyNkZWZpbmUgTVQ4MTgz
X1RPUFJHVV9TV19SU1RfTlVNCQkJCTE5DQorDQogI2VuZGlmICAvKiBfRFRfQklORElOR1NfUkVT
RVRfQ09OVFJPTExFUl9NVDgxODMgKi8NCi0tIA0KMi4xOC4wDQo=

