Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0693923A028
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Aug 2020 09:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgHCHPz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Aug 2020 03:15:55 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:55879 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726077AbgHCHPy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Aug 2020 03:15:54 -0400
X-UUID: 0a3e5537fda44713a809bef3a2fb8372-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CHjYwY83mGtQyAozDroVVTm5cwJQTRU4xw97Fx3g4E4=;
        b=KV7eRf6US1Dn1adMUwV+ROkMxKfDagXQcv1G4gsLN9fql8pB67wjdG7lAHMtqgWtTgW7uIsydGkWEapIdIWrLgnFYtNSZ+Zgma9W1G2wSdtSQv3hhGj16ES+NE1Raoys4VS89FnFnaDAfEbnaJtvqC/ON23LNAvjd8+8Q4cUylQ=;
X-UUID: 0a3e5537fda44713a809bef3a2fb8372-20200803
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1312730950; Mon, 03 Aug 2020 15:15:51 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 15:15:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 15:15:48 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v4,5/5] watchdog: mt8192: add wdt support
Date:   Mon, 3 Aug 2020 15:15:01 +0800
Message-ID: <20200803071501.30634-6-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200803071501.30634-1-crystal.guo@mediatek.com>
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
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
YyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQppbmRleCBkNmE2MzkzZjYwOWQuLmFlZjBj
MmRiNmExMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jDQorKysgYi9k
cml2ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KQEAgLTExLDYgKzExLDcgQEANCiANCiAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDI3MTItcmVzZXRzLmg+DQogI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTgzLXJlc2V0cy5oPg0KKyNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaD4NCiAjaW5j
bHVkZSA8bGludXgvZGVsYXkuaD4NCiAjaW5jbHVkZSA8bGludXgvZXJyLmg+DQogI2luY2x1ZGUg
PGxpbnV4L2luaXQuaD4NCkBAIC03Niw2ICs3NywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a193ZHRfZGF0YSBtdDgxODNfZGF0YSA9IHsNCiAJLnRvcHJndV9zd19yc3RfbnVtID0gTVQ4MTgz
X1RPUFJHVV9TV19SU1RfTlVNLA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfd2R0
X2RhdGEgbXQ4MTkyX2RhdGEgPSB7DQorCS50b3ByZ3Vfc3dfcnN0X251bSA9IE1UODE5Ml9UT1BS
R1VfU1dfUlNUX05VTSwNCit9Ow0KKw0KIHN0YXRpYyBpbnQgdG9wcmd1X3Jlc2V0X3VwZGF0ZShz
dHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LA0KIAkJCSAgICAgICB1bnNpZ25lZCBs
b25nIGlkLCBib29sIGFzc2VydCkNCiB7DQpAQCAtMzIyLDYgKzMyNyw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a193ZHRfZHRfaWRzW10gPSB7DQogCXsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQyNzEyLXdkdCIsIC5kYXRhID0gJm10MjcxMl9kYXRhIH0sDQogCXsg
LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NTg5LXdkdCIgfSwNCiAJeyAuY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDgxODMtd2R0IiwgLmRhdGEgPSAmbXQ4MTgzX2RhdGEgfSwNCisJeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItd2R0IiwgLmRhdGEgPSAmbXQ4MTkyX2RhdGEgfSwN
CiAJeyAvKiBzZW50aW5lbCAqLyB9DQogfTsNCiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdGtf
d2R0X2R0X2lkcyk7DQotLSANCjIuMTguMA0K

