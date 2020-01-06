Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68619130C6A
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2020 04:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgAFDLr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Jan 2020 22:11:47 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:6307 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727369AbgAFDLr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Jan 2020 22:11:47 -0500
X-UUID: 35623f3817284e81ad04a49dff7972cf-20200106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WwB4AGrud03Fgqpfaaa07NUMCVAw+pbHOjpMxql0HRM=;
        b=MRwFI+vD143WVaSCieA4ukYY9P4aSfRSkIu9yvmgA9ZiwwV0gBUE35Lswosw3kM0FZk5zOK1OLcZ688lVz9ZEHnv4sFwm0UfaQ6ZzYSBoTzzOnnzBUzePR2k9HRgY+0qHryg7YDrkkG90ZJqfM3o/7IXTIKkU4WGoNLCjKMDCMQ=;
X-UUID: 35623f3817284e81ad04a49dff7972cf-20200106
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1880673706; Mon, 06 Jan 2020 11:11:42 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 11:11:09 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 11:10:11 +0800
From:   Jiaxin Yu <jiaxin.yu@mediatek.com>
To:     <yong.liang@mediatek.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <chang-an.chen@mediatek.com>, <freddy.hsin@mediatek.com>
CC:     <yingjoe.chen@mediatek.com>, <sboyd@kernel.org>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v10 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Date:   Mon, 6 Jan 2020 11:11:35 +0800
Message-ID: <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWRkICNyZXNldC1jZWxscyBwcm9wZXJ0eSBhbmQgdXBkYXRlIGV4YW1wbGUNCg0KU2lnbmVkLW9m
Zi1ieTogeW9uZy5saWFuZyA8eW9uZy5saWFuZ0BtZWRpYXRlay5jb20+DQpTaWduZWQtb2ZmLWJ5
OiBKaWF4aW4gWXUgPGppYXhpbi55dUBtZWRpYXRlay5jb20+DQpSZXZpZXdlZC1ieTogWWluZ2pv
ZSBDaGVuIDx5aW5nam9lLmNoZW5AbWVkaWF0ZWsuY29tPg0KUmV2aWV3ZWQtYnk6IFBoaWxpcHAg
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCAgfCAxMCArKysrKystLS0NCiAuLi4vcmVzZXQtY29u
dHJvbGxlci9tdDI3MTItcmVzZXRzLmggICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysr
DQogLi4uL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oICAgICAgICAgIHwgMTcgKysr
KysrKysrKysrKysNCiAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29u
dHJvbGxlci9tdDI3MTItcmVzZXRzLmgNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KaW5kZXggOTIxODFiNjQ4ZjUy
Li41YTc2YWMyNjJmOGQgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dA0KQEAgLTQsNiArNCw3IEBAIFJlcXVpcmVk
IHByb3BlcnRpZXM6DQogDQogLSBjb21wYXRpYmxlIHNob3VsZCBjb250YWluOg0KIAkibWVkaWF0
ZWssbXQyNzAxLXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UMjcwMQ0KKwkibWVk
aWF0ZWssbXQyNzEyLXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0IjogZm9yIE1UMjcxMg0KIAki
bWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY1ODkNCiAJIm1lZGlhdGVrLG10Njc5Ny13ZHQi
LCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY3OTcNCiAJIm1lZGlhdGVrLG10NzYyMi13
ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2MjINCkBAIC0xNCwxMSArMTUsMTQg
QEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiANCiBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KIC0gdGlt
ZW91dC1zZWM6IGNvbnRhaW5zIHRoZSB3YXRjaGRvZyB0aW1lb3V0IGluIHNlY29uZHMuDQorLSAj
cmVzZXQtY2VsbHM6IFNob3VsZCBiZSAxLg0KIA0KIEV4YW1wbGU6DQogDQotd2R0OiB3YXRjaGRv
Z0AxMDAwMDAwMCB7DQotCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NTg5LXdkdCI7DQotCXJl
ZyA9IDwweDEwMDAwMDAwIDB4MTg+Ow0KK3dhdGNoZG9nOiB3YXRjaGRvZ0AxMDAwNzAwMCB7DQor
CWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXdkdCIsDQorCQkgICAgICJtZWRpYXRlayxt
dDY1ODktd2R0IjsNCisJcmVnID0gPDAgMHgxMDAwNzAwMCAwIDB4MTAwPjsNCiAJdGltZW91dC1z
ZWMgPSA8MTA+Ow0KKwkjcmVzZXQtY2VsbHMgPSA8MT47DQogfTsNCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oIGIvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaA0KbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uOWU3ZWU3NjJmMDc2DQotLS0gL2Rldi9u
dWxsDQorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJl
c2V0cy5oDQpAQCAtMCwwICsxLDIyIEBADQorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAgKi8NCisvKg0KKyAqIENvcHlyaWdodCAoYykgMjAxOSBNZWRpYVRlayBJbmMuDQorICog
QXV0aG9yOiBZb25nIExpYW5nIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCisgKi8NCisNCisj
aWZuZGVmIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01UMjcxMg0KKyNkZWZpbmUgX0RU
X0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQyNzEyDQorDQorI2RlZmluZSBNVDI3MTJfVE9Q
UkdVX0lORlJBX1NXX1JTVAkJCQkwDQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX01NX1NXX1JTVAkJ
CQkJMQ0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9NRkdfU1dfUlNUCQkJCTINCisjZGVmaW5lIE1U
MjcxMl9UT1BSR1VfVkVOQ19TV19SU1QJCQkJMw0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9WREVD
X1NXX1JTVAkJCQk0DQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX0lNR19TV19SU1QJCQkJNQ0KKyNk
ZWZpbmUgTVQyNzEyX1RPUFJHVV9JTkZSQV9BT19TV19SU1QJCQkJOA0KKyNkZWZpbmUgTVQyNzEy
X1RPUFJHVV9VU0JfU1dfUlNUCQkJCTkNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfQVBNSVhFRF9T
V19SU1QJCQkJMTANCisNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfU1dfUlNUX05VTQkJCQkxMQ0K
Kw0KKyNlbmRpZiAgLyogX0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQyNzEyICovDQpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1y
ZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxODMtcmVz
ZXRzLmgNCmluZGV4IDg4MDRlMzRlYmRkNC4uYTFiYmQ0MWUwZDEyIDEwMDY0NA0KLS0tIGEvaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaA0KKysrIGIv
aW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaA0KQEAg
LTc4LDQgKzc4LDIxIEBADQogI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfQU9fSTJDN19TV19SU1QJ
CQkJMTI2DQogI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfQU9fSTJDOF9TV19SU1QJCQkJMTI3DQog
DQorI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfU1dfUlNUX05VTQkJCQkxMjgNCisNCisjZGVmaW5l
IE1UODE4M19UT1BSR1VfTU1fU1dfUlNUCQkJCQkxDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX01G
R19TV19SU1QJCQkJMg0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9WRU5DX1NXX1JTVAkJCQkzDQor
I2RlZmluZSBNVDgxODNfVE9QUkdVX1ZERUNfU1dfUlNUCQkJCTQNCisjZGVmaW5lIE1UODE4M19U
T1BSR1VfSU1HX1NXX1JTVAkJCQk1DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX01EX1NXX1JTVAkJ
CQkJNw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9DT05OX1NXX1JTVAkJCQk5DQorI2RlZmluZSBN
VDgxODNfVE9QUkdVX0NPTk5fTUNVX1NXX1JTVAkJCQkxMg0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJH
VV9JUFUwX1NXX1JTVAkJCQkxNA0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9JUFUxX1NXX1JTVAkJ
CQkxNQ0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9BVURJT19TV19SU1QJCQkJMTcNCisjZGVmaW5l
IE1UODE4M19UT1BSR1VfQ0FNU1lTX1NXX1JTVAkJCQkxOA0KKw0KKyNkZWZpbmUgTVQ4MTgzX1RP
UFJHVV9TV19SU1RfTlVNCQkJCTE5DQorDQogI2VuZGlmICAvKiBfRFRfQklORElOR1NfUkVTRVRf
Q09OVFJPTExFUl9NVDgxODMgKi8NCi0tIA0KMi4xOC4wDQo=

