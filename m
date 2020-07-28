Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E2C2307DE
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jul 2020 12:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgG1KnW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 06:43:22 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:18882 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728686AbgG1KnW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 06:43:22 -0400
X-UUID: e08ada8fc8f847769d1a5a75c59385a6-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fGh635YPSKDx8TpTukFSxvqdKrdqDpycLk2vh1BFhDc=;
        b=L08uOlwa8o0OzVxkLlQNxVJCWRJ/nuGiMBlG0ISqkQ1S/9aaI3tqoqJdaOtkCQCRHC5/nyY2ay8Oj0ODUVN5D/PT5k/swk659JtO7TY+GYUc5ySgZaRXNrXaVaXFu+Ijr/V3a0+bI7X+LTJ3i7B0WmZVcy87hZbNWEPC1wHn0rI=;
X-UUID: e08ada8fc8f847769d1a5a75c59385a6-20200728
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2144090476; Tue, 28 Jul 2020 18:43:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 18:43:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jul 2020 18:43:14 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [PATCH 1/3] watchdog: mtk_wdt: remove mt8xxx-resets.h
Date:   Tue, 28 Jul 2020 18:42:27 +0800
Message-ID: <1595932949-7033-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 71B9F2D85162E9CD930E185F74479062C12A56CDD28885323C9E66983C5603302000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

bXQ4eHh4LXJlc2V0cy5oIGFjdHVhbGx5IGp1c3QgdXNlZCB0byBkZWZpbmUgVE9QUkdVX1NXX1JT
VF9OVU0uDQpJbnN0ZWFkIG9mIHJlc3VibWl0IHRoZSBtdDh4eHgtcmVzZXQuaCBmb3IgYSBuZXcg
SUMsIGdldCB0aGUgbnVtYmVyDQpvZiByZXNldCBiaXRzIGZyb20gZHRzaSBpcyBtb3JlIGVhc2ll
ciB0byBtYWludGFpbi4NCg0KU2lnbmVkLW9mZi1ieTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3Vv
QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIHwgMjYgKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAyMSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dk
dC5jIGIvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCmluZGV4IGQ2YTYzOTMuLmFkYzg4YzIg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KKysrIGIvZHJpdmVycy93
YXRjaGRvZy9tdGtfd2R0LmMNCkBAIC05LDggKzksNiBAQA0KICAqIEJhc2VkIG9uIHN1bnhpX3dk
dC5jDQogICovDQogDQotI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQy
NzEyLXJlc2V0cy5oPg0KLSNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210
ODE4My1yZXNldHMuaD4NCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCiAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+DQogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCkBAIC02NCwxOCArNjIsNiBAQCBz
dHJ1Y3QgbXRrX3dkdF9kZXYgew0KIAlzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgcmNkZXY7
DQogfTsNCiANCi1zdHJ1Y3QgbXRrX3dkdF9kYXRhIHsNCi0JaW50IHRvcHJndV9zd19yc3RfbnVt
Ow0KLX07DQotDQotc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfd2R0X2RhdGEgbXQyNzEyX2RhdGEg
PSB7DQotCS50b3ByZ3Vfc3dfcnN0X251bSA9IE1UMjcxMl9UT1BSR1VfU1dfUlNUX05VTSwNCi19
Ow0KLQ0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3dkdF9kYXRhIG10ODE4M19kYXRhID0gew0K
LQkudG9wcmd1X3N3X3JzdF9udW0gPSBNVDgxODNfVE9QUkdVX1NXX1JTVF9OVU0sDQotfTsNCi0N
CiBzdGF0aWMgaW50IHRvcHJndV9yZXNldF91cGRhdGUoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJf
ZGV2ICpyY2RldiwNCiAJCQkgICAgICAgdW5zaWduZWQgbG9uZyBpZCwgYm9vbCBhc3NlcnQpDQog
ew0KQEAgLTI0OCw3ICsyMzQsNyBAQCBzdGF0aWMgaW50IG10a193ZHRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCiB7DQogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5k
ZXY7DQogCXN0cnVjdCBtdGtfd2R0X2RldiAqbXRrX3dkdDsNCi0JY29uc3Qgc3RydWN0IG10a193
ZHRfZGF0YSAqd2R0X2RhdGE7DQorCXUzMiB0b3ByZ3Vfc3dfcnN0X251bTsNCiAJaW50IGVycjsN
CiANCiAJbXRrX3dkdCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqbXRrX3dkdCksIEdGUF9L
RVJORUwpOw0KQEAgLTI4NCwxMCArMjcwLDEwIEBAIHN0YXRpYyBpbnQgbXRrX3dkdF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlkZXZfaW5mbyhkZXYsICJXYXRjaGRvZyBl
bmFibGVkICh0aW1lb3V0PSVkIHNlYywgbm93YXlvdXQ9JWQpXG4iLA0KIAkJIG10a193ZHQtPndk
dF9kZXYudGltZW91dCwgbm93YXlvdXQpOw0KIA0KLQl3ZHRfZGF0YSA9IG9mX2RldmljZV9nZXRf
bWF0Y2hfZGF0YShkZXYpOw0KLQlpZiAod2R0X2RhdGEpIHsNCi0JCWVyciA9IHRvcHJndV9yZWdp
c3Rlcl9yZXNldF9jb250cm9sbGVyKHBkZXYsDQotCQkJCQkJICAgICAgIHdkdF9kYXRhLT50b3By
Z3Vfc3dfcnN0X251bSk7DQorCWVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5v
Zl9ub2RlLCAicnN0LW51bSIsDQorCQkJCSZ0b3ByZ3Vfc3dfcnN0X251bSk7DQorCWlmICghZXJy
KSB7DQorCQllcnIgPSB0b3ByZ3VfcmVnaXN0ZXJfcmVzZXRfY29udHJvbGxlcihwZGV2LCB0b3By
Z3Vfc3dfcnN0X251bSk7DQogCQlpZiAoZXJyKQ0KIAkJCXJldHVybiBlcnI7DQogCX0NCkBAIC0z
MTksOSArMzA1LDcgQEAgc3RhdGljIGludCBtdGtfd2R0X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQogI2VuZGlmDQogDQogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX3dk
dF9kdF9pZHNbXSA9IHsNCi0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItd2R0Iiwg
LmRhdGEgPSAmbXQyNzEyX2RhdGEgfSwNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY1
ODktd2R0IiB9LA0KLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My13ZHQiLCAuZGF0
YSA9ICZtdDgxODNfZGF0YSB9LA0KIAl7IC8qIHNlbnRpbmVsICovIH0NCiB9Ow0KIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIG10a193ZHRfZHRfaWRzKTsNCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

