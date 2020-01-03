Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3C3412F625
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Jan 2020 10:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbgACJhl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Jan 2020 04:37:41 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:37277 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727313AbgACJhk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Jan 2020 04:37:40 -0500
X-UUID: 5362e1790f8b49ae900f3bddf30469f3-20200103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2ygKXqFwUs1V77AEhlvVn6P6Uj9IxO5PEyPkf2HolIU=;
        b=BwW4gDARckvnOD6CH3EkCfA94h+sVOsY2tfqZ7pZvtmBIzeZueLeLrthz4EiGUPPG7+5MuDKKDWqDuH9ssrE7XxCQo7C6m/JKCsPNJX+TMZBCAuok2zKUDOUewGJqcOWWEJAB14rWYMqKbNiN03URFi9/IF33VczsNbBugpl+iw=;
X-UUID: 5362e1790f8b49ae900f3bddf30469f3-20200103
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 126146627; Fri, 03 Jan 2020 17:37:33 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 17:37:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 17:37:30 +0800
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
Subject: [PATCH 1/2] [PATCH v8 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Date:   Fri, 3 Jan 2020 17:37:24 +0800
Message-ID: <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578044245-26939-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1578044245-26939-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWRkICNyZXNldC1jZWxscyBwcm9wZXJ0eSBhbmQgdXBkYXRlIGV4YW1wbGUNCg0KQ2hhbmdlLUlk
OiBJZjNmNGYwMTcwZDQxNzgxOWZhY2ZmMWZkMGEwZTVlM2M2Y2M5OTQ0ZA0KU2lnbmVkLW9mZi1i
eTogeW9uZy5saWFuZyA8eW9uZy5saWFuZ0BtZWRpYXRlay5jb20+DQpTaWduZWQtb2ZmLWJ5OiBK
aWF4aW4gWXUgPGppYXhpbi55dUBtZWRpYXRlay5jb20+DQpSZXZpZXdlZC1ieTogWWluZ2pvZSBD
aGVuIDx5aW5nam9lLmNoZW5AbWVkaWF0ZWsuY29tPg0KUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQotLS0NCiAuLi4vcmVzZXQtY29udHJvbGxlci9t
dDI3MTItcmVzZXRzLmggICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrDQogLi4uL3Jl
c2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oICAgICAgICAgIHwgMTcgKysrKysrKysrKysr
KysNCiAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaA0K
DQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210Mjcx
Mi1yZXNldHMuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDI3MTIt
cmVzZXRzLmgNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjllN2Vl
NzYyZjA3Ng0KLS0tIC9kZXYvbnVsbA0KKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1j
b250cm9sbGVyL210MjcxMi1yZXNldHMuaA0KQEAgLTAsMCArMSwyMiBAQA0KKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQorLyoNCisgKiBDb3B5cmlnaHQgKGMpIDIwMTkg
TWVkaWFUZWsgSW5jLg0KKyAqIEF1dGhvcjogWW9uZyBMaWFuZyA8eW9uZy5saWFuZ0BtZWRpYXRl
ay5jb20+DQorICovDQorDQorI2lmbmRlZiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9N
VDI3MTINCisjZGVmaW5lIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01UMjcxMg0KKw0K
KyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9JTkZSQV9TV19SU1QJCQkJMA0KKyNkZWZpbmUgTVQyNzEy
X1RPUFJHVV9NTV9TV19SU1QJCQkJCTENCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfTUZHX1NXX1JT
VAkJCQkyDQorI2RlZmluZSBNVDI3MTJfVE9QUkdVX1ZFTkNfU1dfUlNUCQkJCTMNCisjZGVmaW5l
IE1UMjcxMl9UT1BSR1VfVkRFQ19TV19SU1QJCQkJNA0KKyNkZWZpbmUgTVQyNzEyX1RPUFJHVV9J
TUdfU1dfUlNUCQkJCTUNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfSU5GUkFfQU9fU1dfUlNUCQkJ
CTgNCisjZGVmaW5lIE1UMjcxMl9UT1BSR1VfVVNCX1NXX1JTVAkJCQk5DQorI2RlZmluZSBNVDI3
MTJfVE9QUkdVX0FQTUlYRURfU1dfUlNUCQkJCTEwDQorDQorI2RlZmluZSBNVDI3MTJfVE9QUkdV
X1NXX1JTVF9OVU0JCQkJMTENCisNCisjZW5kaWYgIC8qIF9EVF9CSU5ESU5HU19SRVNFVF9DT05U
Uk9MTEVSX01UMjcxMiAqLw0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQt
Y29udHJvbGxlci9tdDgxODMtcmVzZXRzLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNv
bnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oDQppbmRleCA4ODA0ZTM0ZWJkZDQuLmExYmJkNDFlMGQx
MiAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgx
ODMtcmVzZXRzLmgNCisrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9t
dDgxODMtcmVzZXRzLmgNCkBAIC03OCw0ICs3OCwyMSBAQA0KICNkZWZpbmUgTVQ4MTgzX0lORlJB
Q0ZHX0FPX0kyQzdfU1dfUlNUCQkJCTEyNg0KICNkZWZpbmUgTVQ4MTgzX0lORlJBQ0ZHX0FPX0ky
QzhfU1dfUlNUCQkJCTEyNw0KIA0KKyNkZWZpbmUgTVQ4MTgzX0lORlJBQ0ZHX1NXX1JTVF9OVU0J
CQkJMTI4DQorDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX01NX1NXX1JTVAkJCQkJMQ0KKyNkZWZp
bmUgTVQ4MTgzX1RPUFJHVV9NRkdfU1dfUlNUCQkJCTINCisjZGVmaW5lIE1UODE4M19UT1BSR1Vf
VkVOQ19TV19SU1QJCQkJMw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9WREVDX1NXX1JTVAkJCQk0
DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0lNR19TV19SU1QJCQkJNQ0KKyNkZWZpbmUgTVQ4MTgz
X1RPUFJHVV9NRF9TV19SU1QJCQkJCTcNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfQ09OTl9TV19S
U1QJCQkJOQ0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9DT05OX01DVV9TV19SU1QJCQkJMTINCisj
ZGVmaW5lIE1UODE4M19UT1BSR1VfSVBVMF9TV19SU1QJCQkJMTQNCisjZGVmaW5lIE1UODE4M19U
T1BSR1VfSVBVMV9TV19SU1QJCQkJMTUNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfQVVESU9fU1df
UlNUCQkJCTE3DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0NBTVNZU19TV19SU1QJCQkJMTgNCisN
CisjZGVmaW5lIE1UODE4M19UT1BSR1VfU1dfUlNUX05VTQkJCQkxOQ0KKw0KICNlbmRpZiAgLyog
X0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQ4MTgzICovDQotLSANCjIuMTguMA0K

