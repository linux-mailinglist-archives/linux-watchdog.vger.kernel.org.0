Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86040231997
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 08:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgG2Gbd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 02:31:33 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43381 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726548AbgG2Gb2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 02:31:28 -0400
X-UUID: 0ea0ecdcaa5c4cd89c68df2938baf999-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BdJ2r7/FoQTlh/kyQIChiopClhLjq/Zo9T1MCUvBGSY=;
        b=ujOkxuaaFzS5pxa5T+ahY3/pNAxY5y5qTy8w0N2AZfsgIo+Dmftp3b5zXPrb4dCzuYlrN/HejxVlEz3E4GQaY/XXwGDTrN6Rxqb1JkA/wlL/GbK+QY0TCZZP611nBDg1+DwiRmv/0h5W+96erCDHFZaqGEPndL+fN0utH1mhZko=;
X-UUID: 0ea0ecdcaa5c4cd89c68df2938baf999-20200729
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 370366815; Wed, 29 Jul 2020 14:31:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 14:31:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 14:31:22 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, <erin.lo@mediatek.com>,
        Crystal Guo <crystal.guo@mediatek.com>
Subject: [v3,3/3] watchdog: mtk_wdt: merge all the reset numbers in one head file
Date:   Wed, 29 Jul 2020 14:30:49 +0800
Message-ID: <1596004249-28655-4-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

bXQ4eHh4LXJlc2V0cy5oIGFjdHVhbGx5IGp1c3QgdXNlZCB0byBkZWZpbmUgVE9QUkdVX1NXX1JT
VF9OVU0uDQpJbnN0ZWFkIG9mIHJlc3VibWl0IGEgbmV3IG10OHh4eC1yZXNldC5oIGZvciBhIG5l
dyBJQywgbWVyZ2UgYWxsDQp0aGUgcmVzZXQgbnVtYmVycyBpbiBvbmUgaGVhZCBmaWxlLg0KDQpT
aWduZWQtb2ZmLWJ5OiBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KLS0t
DQogZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMgfCAzICstLQ0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0
Y2hkb2cvbXRrX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCmluZGV4IGQ2YTYz
OTMuLjUwMDBhNDkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYw0KKysr
IGIvZHJpdmVycy93YXRjaGRvZy9tdGtfd2R0LmMNCkBAIC05LDggKzksNyBAQA0KICAqIEJhc2Vk
IG9uIHN1bnhpX3dkdC5jDQogICovDQogDQotI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0LWNv
bnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oPg0KLSNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC1j
b250cm9sbGVyL210ODE4My1yZXNldHMuaD4NCisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQt
Y29udHJvbGxlci9tdGstcmVzZXRzLmg+DQogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQogI2lu
Y2x1ZGUgPGxpbnV4L2Vyci5oPg0KICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQotLSANCjEuOC4x
LjEuZGlydHkNCg==

