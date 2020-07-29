Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC622231C71
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 12:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgG2KCk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 06:02:40 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:52293 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726645AbgG2KCg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 06:02:36 -0400
X-UUID: 6792aa04c7e14555b13847bce6b20a09-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vh67dDG+PPF5w/5q7NusigBDM+ZZIr+ZRqBQV1zStds=;
        b=UotqtxYZ19vdsC5qy2/SGNztYUUbhjAeJNhEGKQNZKmg823MAXWHucEIrS4oHBph7Ogg5++8MRwpXlpu05fOezRRdhmvGjBOpL/aUkQGGhraSIQ+/PNPuj/0Wc3ETWHUkdAtbmVa8oUbfmTVg9DtEzakujKr3h6efB3uQy8hss4=;
X-UUID: 6792aa04c7e14555b13847bce6b20a09-20200729
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2119183333; Wed, 29 Jul 2020 18:02:32 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 18:02:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 18:02:29 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, <erin.lo@mediatek.com>,
        Crystal Guo <crystal.guo@mediatek.com>
Subject: [v2,3/3] watchdog: mt8192: add wdt support
Date:   Wed, 29 Jul 2020 18:02:02 +0800
Message-ID: <1596016922-13184-4-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

YWRkIGRyaXZlciBzZXR0aW5nIHRvIHN1cHBvcnQgbXQ4MTkyIHdkdA0KDQpTaWduZWQtb2ZmLWJ5
OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy93
YXRjaGRvZy9tdGtfd2R0LmMgfCA2ICsrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIGIvZHJpdmVy
cy93YXRjaGRvZy9tdGtfd2R0LmMNCmluZGV4IGQ2YTYzOTMuLmFlZjBjMmQgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KKysrIGIvZHJpdmVycy93YXRjaGRvZy9tdGtf
d2R0LmMNCkBAIC0xMSw2ICsxMSw3IEBADQogDQogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0
LWNvbnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oPg0KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNl
dC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaD4NCisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVz
ZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmg+DQogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+
DQogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQpAQCAt
NzYsNiArNzcsMTAgQEAgc3RydWN0IG10a193ZHRfZGF0YSB7DQogCS50b3ByZ3Vfc3dfcnN0X251
bSA9IE1UODE4M19UT1BSR1VfU1dfUlNUX05VTSwNCiB9Ow0KIA0KK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRrX3dkdF9kYXRhIG10ODE5Ml9kYXRhID0gew0KKwkudG9wcmd1X3N3X3JzdF9udW0gPSBN
VDgxOTJfVE9QUkdVX1NXX1JTVF9OVU0sDQorfTsNCisNCiBzdGF0aWMgaW50IHRvcHJndV9yZXNl
dF91cGRhdGUoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwNCiAJCQkgICAgICAg
dW5zaWduZWQgbG9uZyBpZCwgYm9vbCBhc3NlcnQpDQogew0KQEAgLTMyMiw2ICszMjcsNyBAQCBz
dGF0aWMgaW50IG10a193ZHRfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCiAJeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItd2R0IiwgLmRhdGEgPSAmbXQyNzEyX2RhdGEgfSwNCiAJ
eyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY1ODktd2R0IiB9LA0KIAl7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE4My13ZHQiLCAuZGF0YSA9ICZtdDgxODNfZGF0YSB9LA0KKwl7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi13ZHQiLCAuZGF0YSA9ICZtdDgxOTJfZGF0YSB9
LA0KIAl7IC8qIHNlbnRpbmVsICovIH0NCiB9Ow0KIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10
a193ZHRfZHRfaWRzKTsNCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

