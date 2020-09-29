Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55F527BB7B
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Sep 2020 05:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgI2DXD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Sep 2020 23:23:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54568 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727035AbgI2DWv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Sep 2020 23:22:51 -0400
X-UUID: 30accb53c9c9408d81d24f10d702c6a5-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MSvWctba+IbOd/a2WBji6T1/shGFuBINQUNZk7gS9c8=;
        b=ZALbqekWnEchaxuxeBM4Qw+arq0ZG4wAvNuvY/i5diezCQaFjIBX07eYS6yfiWWscXHeH5g4hKRqH7h+X0fR8nEt2gnHnkK+h9iy6i4+qb5CNB/yVMEgiWfJZGCsv6qWrFIAu8jPCiiC0NwLRqqM4KWvb5FsDTNHJ7EyO3ur2gE=;
X-UUID: 30accb53c9c9408d81d24f10d702c6a5-20200929
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 970873089; Tue, 29 Sep 2020 11:22:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 11:22:43 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 11:22:43 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v5,4/4] watchdog: mt8192: add wdt support
Date:   Tue, 29 Sep 2020 11:20:05 +0800
Message-ID: <20200929032005.15169-5-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200929032005.15169-1-crystal.guo@mediatek.com>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWRkIHN1cHBvcnQgZm9yIHdhdGNoZG9nIGRldmljZSBmb3VuZCBpbiBNVDgxOTIgU29DDQoNClNp
Z25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+DQpSZXZp
ZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NClJldmll
d2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQotLS0NCiBkcml2ZXJz
L3dhdGNoZG9nL210a193ZHQuYyB8IDYgKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgYi9kcml2
ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KaW5kZXggZDZhNjM5M2Y2MDlkLi5hZWYwYzJkYjZhMTEg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KKysrIGIvZHJpdmVycy93
YXRjaGRvZy9tdGtfd2R0LmMNCkBAIC0xMSw2ICsxMSw3IEBADQogDQogI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oPg0KICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaD4NCisjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmg+DQogI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+DQogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KICNpbmNsdWRlIDxsaW51eC9p
bml0Lmg+DQpAQCAtNzYsNiArNzcsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfd2R0X2Rh
dGEgbXQ4MTgzX2RhdGEgPSB7DQogCS50b3ByZ3Vfc3dfcnN0X251bSA9IE1UODE4M19UT1BSR1Vf
U1dfUlNUX05VTSwNCiB9Ow0KIA0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3dkdF9kYXRhIG10
ODE5Ml9kYXRhID0gew0KKwkudG9wcmd1X3N3X3JzdF9udW0gPSBNVDgxOTJfVE9QUkdVX1NXX1JT
VF9OVU0sDQorfTsNCisNCiBzdGF0aWMgaW50IHRvcHJndV9yZXNldF91cGRhdGUoc3RydWN0IHJl
c2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwNCiAJCQkgICAgICAgdW5zaWduZWQgbG9uZyBpZCwg
Ym9vbCBhc3NlcnQpDQogew0KQEAgLTMyMiw2ICszMjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBtdGtfd2R0X2R0X2lkc1tdID0gew0KIAl7IC5jb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10MjcxMi13ZHQiLCAuZGF0YSA9ICZtdDI3MTJfZGF0YSB9LA0KIAl7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10NjU4OS13ZHQiIH0sDQogCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTgzLXdkdCIsIC5kYXRhID0gJm10ODE4M19kYXRhIH0sDQorCXsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTkyLXdkdCIsIC5kYXRhID0gJm10ODE5Ml9kYXRhIH0sDQogCXsgLyog
c2VudGluZWwgKi8gfQ0KIH07DQogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRrX3dkdF9kdF9p
ZHMpOw0KLS0gDQoyLjE4LjANCg==

