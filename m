Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38F713BBAB
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2020 09:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbgAOI6o (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jan 2020 03:58:44 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:65318 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729188AbgAOI6n (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jan 2020 03:58:43 -0500
X-UUID: ac4081afa8a34e2bbf0cc6981c875a44-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=U6iKhf6uYPrEgi3REmjZlRMPvQB9C+waid6ttTWHp3c=;
        b=Mydr4I9mx5azGMIgXkcH8EzodVbCb3N8zbquuoiA0CLiLloVsQSoUQu1ZJR6wzT0+2ugOgCtpq6tc9wfdd5gK+7a6JcoDp+p8DQDQeCMFFrzwjfa3XwPDUqvBcRDqzun6ULKk7qHHZvyYz6h1ztbs2fiFuEgxKqdgKvDaJC1bHs=;
X-UUID: ac4081afa8a34e2bbf0cc6981c875a44-20200115
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 958113555; Wed, 15 Jan 2020 16:58:39 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 16:57:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 Jan 2020 16:58:43 +0800
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
Subject: [PATCH v12 1/4] dt-bindings: mediatek: mt8183: Add #reset-cells
Date:   Wed, 15 Jan 2020 16:58:25 +0800
Message-ID: <20200115085828.27791-2-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200115085828.27791-1-yong.liang@mediatek.com>
References: <20200115085828.27791-1-yong.liang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3E993CFABE8082746CE03459EF01B1928F41185E6C47FF61257C188683AB69782000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogInlvbmcubGlhbmciIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCg0KQWRkICNyZXNl
dC1jZWxscyBwcm9wZXJ0eSBhbmQgdXBkYXRlIGV4YW1wbGUNCg0KU2lnbmVkLW9mZi1ieTogeW9u
Zy5saWFuZyA8eW9uZy5saWFuZ0BtZWRpYXRlay5jb20+DQpTaWduZWQtb2ZmLWJ5OiBKaWF4aW4g
WXUgPGppYXhpbi55dUBtZWRpYXRlay5jb20+DQpSZXZpZXdlZC1ieTogWWluZ2pvZSBDaGVuIDx5
aW5nam9lLmNoZW5AbWVkaWF0ZWsuY29tPg0KUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+DQpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4NClJldmlld2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4N
Ci0tLQ0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0ICAgIHwg
MTAgKysrKysrKy0tLQ0KIC4uLi9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaCAgICAg
ICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCmluZGV4IGZkMzgwZWIyOGRm
NS4uZWNiOWZmNzg0ODMyIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCkBAIC05LDE3ICs5LDIxIEBAIFJlcXVp
cmVkIHByb3BlcnRpZXM6DQogCSJtZWRpYXRlayxtdDc2MjItd2R0IiwgIm1lZGlhdGVrLG10NjU4
OS13ZHQiOiBmb3IgTVQ3NjIyDQogCSJtZWRpYXRlayxtdDc2MjMtd2R0IiwgIm1lZGlhdGVrLG10
NjU4OS13ZHQiOiBmb3IgTVQ3NjIzDQogCSJtZWRpYXRlayxtdDc2Mjktd2R0IiwgIm1lZGlhdGVr
LG10NjU4OS13ZHQiOiBmb3IgTVQ3NjI5DQorCSJtZWRpYXRlayxtdDgxODMtd2R0IiwgIm1lZGlh
dGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ4MTgzDQogCSJtZWRpYXRlayxtdDg1MTYtd2R0IiwgIm1l
ZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ4NTE2DQogDQogLSByZWcgOiBTcGVjaWZpZXMgYmFz
ZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSByZWdpc3RlcnMuDQogDQogT3B0aW9u
YWwgcHJvcGVydGllczoNCiAtIHRpbWVvdXQtc2VjOiBjb250YWlucyB0aGUgd2F0Y2hkb2cgdGlt
ZW91dCBpbiBzZWNvbmRzLg0KKy0gI3Jlc2V0LWNlbGxzOiBTaG91bGQgYmUgMS4NCiANCiBFeGFt
cGxlOg0KIA0KLXdkdDogd2F0Y2hkb2dAMTAwMDAwMDAgew0KLQljb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10NjU4OS13ZHQiOw0KLQlyZWcgPSA8MHgxMDAwMDAwMCAweDE4PjsNCit3YXRjaGRvZzog
d2F0Y2hkb2dAMTAwMDcwMDAgew0KKwljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My13ZHQi
LA0KKwkJICAgICAibWVkaWF0ZWssbXQ2NTg5LXdkdCI7DQorCXJlZyA9IDwwIDB4MTAwMDcwMDAg
MCAweDEwMD47DQogCXRpbWVvdXQtc2VjID0gPDEwPjsNCisJI3Jlc2V0LWNlbGxzID0gPDE+Ow0K
IH07DQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210
ODE4My1yZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgx
ODMtcmVzZXRzLmgNCmluZGV4IDg4MDRlMzRlYmRkNC4uYTFiYmQ0MWUwZDEyIDEwMDY0NA0KLS0t
IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaA0K
KysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMu
aA0KQEAgLTc4LDQgKzc4LDIxIEBADQogI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfQU9fSTJDN19T
V19SU1QJCQkJMTI2DQogI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfQU9fSTJDOF9TV19SU1QJCQkJ
MTI3DQogDQorI2RlZmluZSBNVDgxODNfSU5GUkFDRkdfU1dfUlNUX05VTQkJCQkxMjgNCisNCisj
ZGVmaW5lIE1UODE4M19UT1BSR1VfTU1fU1dfUlNUCQkJCQkxDQorI2RlZmluZSBNVDgxODNfVE9Q
UkdVX01GR19TV19SU1QJCQkJMg0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9WRU5DX1NXX1JTVAkJ
CQkzDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX1ZERUNfU1dfUlNUCQkJCTQNCisjZGVmaW5lIE1U
ODE4M19UT1BSR1VfSU1HX1NXX1JTVAkJCQk1DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX01EX1NX
X1JTVAkJCQkJNw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9DT05OX1NXX1JTVAkJCQk5DQorI2Rl
ZmluZSBNVDgxODNfVE9QUkdVX0NPTk5fTUNVX1NXX1JTVAkJCQkxMg0KKyNkZWZpbmUgTVQ4MTgz
X1RPUFJHVV9JUFUwX1NXX1JTVAkJCQkxNA0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9JUFUxX1NX
X1JTVAkJCQkxNQ0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9BVURJT19TV19SU1QJCQkJMTcNCisj
ZGVmaW5lIE1UODE4M19UT1BSR1VfQ0FNU1lTX1NXX1JTVAkJCQkxOA0KKw0KKyNkZWZpbmUgTVQ4
MTgzX1RPUFJHVV9TV19SU1RfTlVNCQkJCTE5DQorDQogI2VuZGlmICAvKiBfRFRfQklORElOR1Nf
UkVTRVRfQ09OVFJPTExFUl9NVDgxODMgKi8NCi0tIA0KMi4xOC4wDQo=

