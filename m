Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591B123303F
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 12:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbgG3KWj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 06:22:39 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:13093 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729143AbgG3KW2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 06:22:28 -0400
X-UUID: ed3745d291e7428c98bf4b7c5c9ee8a1-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BJIvEQojTWHUoFsviCh26y09bDiTiAOtQb+FKP21A8g=;
        b=gVq6JnDkmSgSZxAfQGIX3deUFGl7oiAdzmefVcE0P9ZNeTUsVotCQjmaevAF14/+bb+mIAi0IHWvTzIhGo5A+sGMYXQKc2gc8Hbp0DDP4C9c5VVidoTCsmkHKgWvJmWyC70nJJNCG4Nq8TlDRZjBB6N5RuDw1jwqAMZxADm9Xuw=;
X-UUID: ed3745d291e7428c98bf4b7c5c9ee8a1-20200730
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1062283760; Thu, 30 Jul 2020 18:22:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:22:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 18:22:20 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v3,5/5] watchdog: mt8192: add wdt support
Date:   Thu, 30 Jul 2020 18:21:50 +0800
Message-ID: <1596104510-11113-6-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
References: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWRkIHN1cHBvcnQgZm9yIHdhdGNoZG9nIGRldmljZSBmb3VuZCBpbiBNVDgxOTIgU29DDQoNClNp
Z25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+DQpSZXZp
ZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIHwgNiArKysrKysNCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQu
YyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQppbmRleCBkNmE2MzkzLi5hZWYwYzJkIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCisrKyBiL2RyaXZlcnMvd2F0
Y2hkb2cvbXRrX3dkdC5jDQpAQCAtMTEsNiArMTEsNyBAQA0KIA0KICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaD4NCiAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxODMtcmVzZXRzLmg+DQorI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTkyLXJlc2V0cy5oPg0KICNpbmNsdWRlIDxsaW51
eC9kZWxheS5oPg0KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCiAjaW5jbHVkZSA8bGludXgvaW5p
dC5oPg0KQEAgLTc2LDYgKzc3LDEwIEBAIHN0cnVjdCBtdGtfd2R0X2RhdGEgew0KIAkudG9wcmd1
X3N3X3JzdF9udW0gPSBNVDgxODNfVE9QUkdVX1NXX1JTVF9OVU0sDQogfTsNCiANCitzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a193ZHRfZGF0YSBtdDgxOTJfZGF0YSA9IHsNCisJLnRvcHJndV9zd19y
c3RfbnVtID0gTVQ4MTkyX1RPUFJHVV9TV19SU1RfTlVNLA0KK307DQorDQogc3RhdGljIGludCB0
b3ByZ3VfcmVzZXRfdXBkYXRlKHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsDQog
CQkJICAgICAgIHVuc2lnbmVkIGxvbmcgaWQsIGJvb2wgYXNzZXJ0KQ0KIHsNCkBAIC0zMjIsNiAr
MzI3LDcgQEAgc3RhdGljIGludCBtdGtfd2R0X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQog
CXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLXdkdCIsIC5kYXRhID0gJm10MjcxMl9k
YXRhIH0sDQogCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NTg5LXdkdCIgfSwNCiAJeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtd2R0IiwgLmRhdGEgPSAmbXQ4MTgzX2RhdGEg
fSwNCisJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItd2R0IiwgLmRhdGEgPSAmbXQ4
MTkyX2RhdGEgfSwNCiAJeyAvKiBzZW50aW5lbCAqLyB9DQogfTsNCiBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBtdGtfd2R0X2R0X2lkcyk7DQotLSANCjEuOC4xLjEuZGlydHkNCg==

