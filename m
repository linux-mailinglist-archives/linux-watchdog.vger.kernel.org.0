Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE8812B36A
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2019 10:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfL0JF7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Dec 2019 04:05:59 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:3970 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726014AbfL0JF6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Dec 2019 04:05:58 -0500
X-UUID: fcd971ffecbd4daebf9e707193770998-20191227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=A/2ymTZqQ2jkPG8u32ExgoxYm7lzBLEHJ316WhcxO0U=;
        b=EKoEhgkmG/+Fl8+U2S3NLVeGhFx46M83wvkEPz3gxF3ULtmb1KO7gUqdqhh1x801glxot4Kb5ozOM9E/yTjco8rKTMTQcJlkR81EVasDGRrmHWrxwNf7+/gXvgMvqoxtNGs/uhlHAtLSVY1NJ6k3RBSyik9PXZ1xgl6wBIZCZRY=;
X-UUID: fcd971ffecbd4daebf9e707193770998-20191227
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 738864263; Fri, 27 Dec 2019 17:05:52 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 17:05:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Dec 2019 17:05:18 +0800
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
Subject: [PATCH v7 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Date:   Fri, 27 Dec 2019 17:04:53 +0800
Message-ID: <1577437494-738-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577437494-738-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1577437494-738-1-git-send-email-jiaxin.yu@mediatek.com>
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
ZSBDaGVuIDx5aW5nam9lLmNoZW5AbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4uL3Jlc2V0LWNvbnRy
b2xsZXIvbXQyNzEyLXJlc2V0cy5oICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKw0K
IC4uLi9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaCAgICAgICAgICB8IDE3ICsrKysr
KysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDI3MTItcmVz
ZXRzLmgNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxl
ci9tdDI3MTItcmVzZXRzLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIv
bXQyNzEyLXJlc2V0cy5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAw
Li45ZTdlZTc2MmYwNzYNCi0tLSAvZGV2L251bGwNCisrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3Mv
cmVzZXQtY29udHJvbGxlci9tdDI3MTItcmVzZXRzLmgNCkBAIC0wLDAgKzEsMjIgQEANCisvKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29weXJpZ2h0IChj
KSAyMDE5IE1lZGlhVGVrIEluYy4NCisgKiBBdXRob3I6IFlvbmcgTGlhbmcgPHlvbmcubGlhbmdA
bWVkaWF0ZWsuY29tPg0KKyAqLw0KKw0KKyNpZm5kZWYgX0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRS
T0xMRVJfTVQyNzEyDQorI2RlZmluZSBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDI3
MTINCisNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfSU5GUkFfU1dfUlNUCQkJCTANCisjZGVmaW5l
IE1UMjcxMl9UT1BSR1VfTU1fU1dfUlNUCQkJCQkxDQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX01G
R19TV19SU1QJCQkJMg0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9WRU5DX1NXX1JTVAkJCQkzDQor
I2RlZmluZSBNVDI3MTJfVE9QUkdVX1ZERUNfU1dfUlNUCQkJCTQNCisjZGVmaW5lIE1UMjcxMl9U
T1BSR1VfSU1HX1NXX1JTVAkJCQk1DQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX0lORlJBX0FPX1NX
X1JTVAkJCQk4DQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX1VTQl9TV19SU1QJCQkJOQ0KKyNkZWZp
bmUgTVQyNzEyX1RPUFJHVV9BUE1JWEVEX1NXX1JTVAkJCQkxMA0KKw0KKyNkZWZpbmUgTVQyNzEy
X1RPUFJHVV9TV19SU1RfTlVNCQkJCTExDQorDQorI2VuZGlmICAvKiBfRFRfQklORElOR1NfUkVT
RVRfQ09OVFJPTExFUl9NVDI3MTIgKi8NCmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdz
L3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaA0KaW5kZXggODgwNGUzNGViZGQ0Li5hMWJi
ZDQxZTBkMTIgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xs
ZXIvbXQ4MTgzLXJlc2V0cy5oDQorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRy
b2xsZXIvbXQ4MTgzLXJlc2V0cy5oDQpAQCAtNzgsNCArNzgsMjEgQEANCiAjZGVmaW5lIE1UODE4
M19JTkZSQUNGR19BT19JMkM3X1NXX1JTVAkJCQkxMjYNCiAjZGVmaW5lIE1UODE4M19JTkZSQUNG
R19BT19JMkM4X1NXX1JTVAkJCQkxMjcNCiANCisjZGVmaW5lIE1UODE4M19JTkZSQUNGR19TV19S
U1RfTlVNCQkJCTEyOA0KKw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9NTV9TV19SU1QJCQkJCTEN
CisjZGVmaW5lIE1UODE4M19UT1BSR1VfTUZHX1NXX1JTVAkJCQkyDQorI2RlZmluZSBNVDgxODNf
VE9QUkdVX1ZFTkNfU1dfUlNUCQkJCTMNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfVkRFQ19TV19S
U1QJCQkJNA0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9JTUdfU1dfUlNUCQkJCTUNCisjZGVmaW5l
IE1UODE4M19UT1BSR1VfTURfU1dfUlNUCQkJCQk3DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0NP
Tk5fU1dfUlNUCQkJCTkNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfQ09OTl9NQ1VfU1dfUlNUCQkJ
CTEyDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0lQVTBfU1dfUlNUCQkJCTE0DQorI2RlZmluZSBN
VDgxODNfVE9QUkdVX0lQVTFfU1dfUlNUCQkJCTE1DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0FV
RElPX1NXX1JTVAkJCQkxNw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9DQU1TWVNfU1dfUlNUCQkJ
CTE4DQorDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX1NXX1JTVF9OVU0JCQkJMTkNCisNCiAjZW5k
aWYgIC8qIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01UODE4MyAqLw0KLS0gDQoyLjE4
LjANCg==

