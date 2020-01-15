Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F65F13BBAA
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2020 09:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgAOI6o (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jan 2020 03:58:44 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:17729 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729143AbgAOI6n (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jan 2020 03:58:43 -0500
X-UUID: 862fdf080fa54b0b87180e3b16218436-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NY1THKQZPmMzBG2Y7OvUGXadUajPTI3HDuB+P5+oLaI=;
        b=PcYxKLFpIiQoZQ7FOYJCHr8pWLmnTMwZS+rZbDioITCbiHARot6+uPeZOQQsfebnLBzUP/ySZqvgiPA5fO98DoUOhFypnVIJByWzKVaKtlDnD1opYpD6vP983ufuabRfCxcVsM55RUmCtsZnzpJganLNqztmnfexasYuaaRWXsk=;
X-UUID: 862fdf080fa54b0b87180e3b16218436-20200115
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 217106368; Wed, 15 Jan 2020 16:58:39 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 16:58:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 Jan 2020 16:58:44 +0800
From:   Yong Liang <yong.liang@mediatek.com>
To:     <yong.liang@mediatek.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <chang-an.chen@mediatek.com>, <freddy.hsin@mediatek.com>,
        <jiaxin.yu@mediatek.com>
CC:     <yingjoe.chen@mediatek.com>, <sboyd@kernel.org>
Subject: [PATCH v12 2/4] dt-bindings: mediatek: mt2712: Add #reset-cells
Date:   Wed, 15 Jan 2020 16:58:26 +0800
Message-ID: <20200115085828.27791-3-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200115085828.27791-1-yong.liang@mediatek.com>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogInlvbmcubGlhbmciIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCg0KQWRkICNyZXNl
dC1jZWxscyBhbmQgdXBkYXRlIG10ay13ZHQudHh0DQoNClNpZ25lZC1vZmYtYnk6IHlvbmcubGlh
bmcgPHlvbmcubGlhbmdAbWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTogSmlheGluIFl1IDxq
aWF4aW4ueXVAbWVkaWF0ZWsuY29tPg0KUmV2aWV3ZWQtYnk6IFlpbmdqb2UgQ2hlbiA8eWluZ2pv
ZS5jaGVuQG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPg0KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+DQpSZXZpZXdlZC1ieTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+DQotLS0N
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCAgfCAgMSArDQog
Li4uL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oICAgICAgICAgIHwgMjIgKysrKysr
KysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEy
LXJlc2V0cy5oDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCmluZGV4IGVjYjlmZjc4NDgzMi4uNGRkMzZiZDNmMWFk
IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9n
L210ay13ZHQudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0
Y2hkb2cvbXRrLXdkdC50eHQNCkBAIC00LDYgKzQsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
IA0KIC0gY29tcGF0aWJsZSBzaG91bGQgY29udGFpbjoNCiAJIm1lZGlhdGVrLG10MjcwMS13ZHQi
LCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDI3MDENCisJIm1lZGlhdGVrLG10MjcxMi13
ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDI3MTINCiAJIm1lZGlhdGVrLG10NjU4
OS13ZHQiOiBmb3IgTVQ2NTg5DQogCSJtZWRpYXRlayxtdDY3OTctd2R0IiwgIm1lZGlhdGVrLG10
NjU4OS13ZHQiOiBmb3IgTVQ2Nzk3DQogCSJtZWRpYXRlayxtdDc2MjItd2R0IiwgIm1lZGlhdGVr
LG10NjU4OS13ZHQiOiBmb3IgTVQ3NjIyDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5n
cy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3Mv
cmVzZXQtY29udHJvbGxlci9tdDI3MTItcmVzZXRzLmgNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQpp
bmRleCAwMDAwMDAwMDAwMDAuLjllN2VlNzYyZjA3Ng0KLS0tIC9kZXYvbnVsbA0KKysrIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaA0KQEAgLTAs
MCArMSwyMiBAQA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQorLyoN
CisgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWVkaWFUZWsgSW5jLg0KKyAqIEF1dGhvcjogWW9uZyBM
aWFuZyA8eW9uZy5saWFuZ0BtZWRpYXRlay5jb20+DQorICovDQorDQorI2lmbmRlZiBfRFRfQklO
RElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDI3MTINCisjZGVmaW5lIF9EVF9CSU5ESU5HU19SRVNF
VF9DT05UUk9MTEVSX01UMjcxMg0KKw0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9JTkZSQV9TV19S
U1QJCQkJMA0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9NTV9TV19SU1QJCQkJCTENCisjZGVmaW5l
IE1UMjcxMl9UT1BSR1VfTUZHX1NXX1JTVAkJCQkyDQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX1ZF
TkNfU1dfUlNUCQkJCTMNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfVkRFQ19TV19SU1QJCQkJNA0K
KyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9JTUdfU1dfUlNUCQkJCTUNCisjZGVmaW5lIE1UMjcxMl9U
T1BSR1VfSU5GUkFfQU9fU1dfUlNUCQkJCTgNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfVVNCX1NX
X1JTVAkJCQk5DQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX0FQTUlYRURfU1dfUlNUCQkJCTEwDQor
DQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX1NXX1JTVF9OVU0JCQkJMTENCisNCisjZW5kaWYgIC8q
IF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01UMjcxMiAqLw0KLS0gDQoyLjE4LjANCg==

