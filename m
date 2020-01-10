Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A77931367DB
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Jan 2020 08:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgAJHEl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Jan 2020 02:04:41 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:21528 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727252AbgAJHEk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Jan 2020 02:04:40 -0500
X-UUID: 1e09392339954ee59ba2cff79afd8cd0-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EtBpZsyRZeOg+YTxLjb7goz1Tx2WcaUlTsVNrxzU2u0=;
        b=WF3QiK20AeJG6x1ctEkdEQgrbSbkdRZ9NA4n/OyHQ+UOqMMmw0o3I8CIyvcqzuRSocvSOlHBXue4uysz7HddF3tHkRVsnWYp8+mfRZyzn1j4GNVsoQnou5sk7z6rEExxDKyeVR9OivzHVf64ZlCsyF1Dexw3H4qX8XZsNo2C4Yc=;
X-UUID: 1e09392339954ee59ba2cff79afd8cd0-20200110
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1533640683; Fri, 10 Jan 2020 15:04:36 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 15:03:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 15:03:56 +0800
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
Subject: [PATCH v11 1/3] dt-bindings: mediatek: mt8183: Add #reset-cells
Date:   Fri, 10 Jan 2020 15:04:20 +0800
Message-ID: <1578639862-14480-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 22CD3F83C09152772F61CC0AF48C994E1F0A92C8C97D1CCAE64503399B852B092000:8
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
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4NClJldmlld2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxncm9lY2s3QGdt
YWlsLmNvbT4NCi0tLQ0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQu
dHh0ICB8IDEwICsrKysrKy0tLQ0KIC4uLi9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMu
aCAgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysNCiAuLi4vcmVzZXQtY29udHJvbGxl
ci9tdDgxODMtcmVzZXRzLmggICAgICAgICAgfCAxNyArKysrKysrKysrKysrKw0KIDMgZmlsZXMg
Y2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMu
aA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNo
ZG9nL210ay13ZHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNo
ZG9nL210ay13ZHQudHh0DQppbmRleCA5MjE4MWI2NDhmNTIuLjVhNzZhYzI2MmY4ZCAxMDA2NDQN
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0
LnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210
ay13ZHQudHh0DQpAQCAtNCw2ICs0LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiANCiAtIGNv
bXBhdGlibGUgc2hvdWxkIGNvbnRhaW46DQogCSJtZWRpYXRlayxtdDI3MDEtd2R0IiwgIm1lZGlh
dGVrLG10NjU4OS13ZHQiOiBmb3IgTVQyNzAxDQorCSJtZWRpYXRlayxtdDI3MTItd2R0IiwgIm1l
ZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQyNzEyDQogCSJtZWRpYXRlayxtdDY1ODktd2R0Ijog
Zm9yIE1UNjU4OQ0KIAkibWVkaWF0ZWssbXQ2Nzk3LXdkdCIsICJtZWRpYXRlayxtdDY1ODktd2R0
IjogZm9yIE1UNjc5Nw0KIAkibWVkaWF0ZWssbXQ3NjIyLXdkdCIsICJtZWRpYXRlayxtdDY1ODkt
d2R0IjogZm9yIE1UNzYyMg0KQEAgLTE0LDExICsxNSwxNCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
Og0KIA0KIE9wdGlvbmFsIHByb3BlcnRpZXM6DQogLSB0aW1lb3V0LXNlYzogY29udGFpbnMgdGhl
IHdhdGNoZG9nIHRpbWVvdXQgaW4gc2Vjb25kcy4NCistICNyZXNldC1jZWxsczogU2hvdWxkIGJl
IDEuDQogDQogRXhhbXBsZToNCiANCi13ZHQ6IHdhdGNoZG9nQDEwMDAwMDAwIHsNCi0JY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDY1ODktd2R0IjsNCi0JcmVnID0gPDB4MTAwMDAwMDAgMHgxOD47
DQord2F0Y2hkb2c6IHdhdGNoZG9nQDEwMDA3MDAwIHsNCisJY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxODMtd2R0IiwNCisJCSAgICAgIm1lZGlhdGVrLG10NjU4OS13ZHQiOw0KKwlyZWcgPSA8
MCAweDEwMDA3MDAwIDAgMHgxMDA+Ow0KIAl0aW1lb3V0LXNlYyA9IDwxMD47DQorCSNyZXNldC1j
ZWxscyA9IDwxPjsNCiB9Ow0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQt
Y29udHJvbGxlci9tdDI3MTItcmVzZXRzLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNv
bnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMDAwMDAwLi45ZTdlZTc2MmYwNzYNCi0tLSAvZGV2L251bGwNCisrKyBiL2luY2x1ZGUvZHQt
YmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDI3MTItcmVzZXRzLmgNCkBAIC0wLDAgKzEsMjIg
QEANCisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29w
eXJpZ2h0IChjKSAyMDE5IE1lZGlhVGVrIEluYy4NCisgKiBBdXRob3I6IFlvbmcgTGlhbmcgPHlv
bmcubGlhbmdAbWVkaWF0ZWsuY29tPg0KKyAqLw0KKw0KKyNpZm5kZWYgX0RUX0JJTkRJTkdTX1JF
U0VUX0NPTlRST0xMRVJfTVQyNzEyDQorI2RlZmluZSBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJP
TExFUl9NVDI3MTINCisNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfSU5GUkFfU1dfUlNUCQkJCTAN
CisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfTU1fU1dfUlNUCQkJCQkxDQorI2RlZmluZSBNVDI3MTJf
VE9QUkdVX01GR19TV19SU1QJCQkJMg0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9WRU5DX1NXX1JT
VAkJCQkzDQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX1ZERUNfU1dfUlNUCQkJCTQNCisjZGVmaW5l
IE1UMjcxMl9UT1BSR1VfSU1HX1NXX1JTVAkJCQk1DQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX0lO
RlJBX0FPX1NXX1JTVAkJCQk4DQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX1VTQl9TV19SU1QJCQkJ
OQ0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9BUE1JWEVEX1NXX1JTVAkJCQkxMA0KKw0KKyNkZWZp
bmUgTVQyNzEyX1RPUFJHVV9TV19SU1RfTlVNCQkJCTExDQorDQorI2VuZGlmICAvKiBfRFRfQklO
RElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDI3MTIgKi8NCmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oIGIvaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaA0KaW5kZXggODgwNGUzNGVi
ZGQ0Li5hMWJiZDQxZTBkMTIgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0
LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oDQorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jl
c2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oDQpAQCAtNzgsNCArNzgsMjEgQEANCiAjZGVm
aW5lIE1UODE4M19JTkZSQUNGR19BT19JMkM3X1NXX1JTVAkJCQkxMjYNCiAjZGVmaW5lIE1UODE4
M19JTkZSQUNGR19BT19JMkM4X1NXX1JTVAkJCQkxMjcNCiANCisjZGVmaW5lIE1UODE4M19JTkZS
QUNGR19TV19SU1RfTlVNCQkJCTEyOA0KKw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9NTV9TV19S
U1QJCQkJCTENCisjZGVmaW5lIE1UODE4M19UT1BSR1VfTUZHX1NXX1JTVAkJCQkyDQorI2RlZmlu
ZSBNVDgxODNfVE9QUkdVX1ZFTkNfU1dfUlNUCQkJCTMNCisjZGVmaW5lIE1UODE4M19UT1BSR1Vf
VkRFQ19TV19SU1QJCQkJNA0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9JTUdfU1dfUlNUCQkJCTUN
CisjZGVmaW5lIE1UODE4M19UT1BSR1VfTURfU1dfUlNUCQkJCQk3DQorI2RlZmluZSBNVDgxODNf
VE9QUkdVX0NPTk5fU1dfUlNUCQkJCTkNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfQ09OTl9NQ1Vf
U1dfUlNUCQkJCTEyDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0lQVTBfU1dfUlNUCQkJCTE0DQor
I2RlZmluZSBNVDgxODNfVE9QUkdVX0lQVTFfU1dfUlNUCQkJCTE1DQorI2RlZmluZSBNVDgxODNf
VE9QUkdVX0FVRElPX1NXX1JTVAkJCQkxNw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9DQU1TWVNf
U1dfUlNUCQkJCTE4DQorDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX1NXX1JTVF9OVU0JCQkJMTkN
CisNCiAjZW5kaWYgIC8qIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01UODE4MyAqLw0K
LS0gDQoyLjE4LjANCg==

