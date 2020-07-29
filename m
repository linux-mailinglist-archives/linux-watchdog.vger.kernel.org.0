Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18313231994
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 08:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgG2Gb1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 02:31:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52502 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726536AbgG2Gb1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 02:31:27 -0400
X-UUID: 78c909727ed44807ad8c0b35ae1d9a81-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=W/S6wlW6rlHVWCPQFOfmo+0Q+i9GqsM92xqbMY9UD7Y=;
        b=XiA3lQ2VNHXC7L8u6I6yRaAIXNZvYhck9RwyFqLJEOQTqSaq/SeXbrVeCTJgfWCewoQCpOxN/btbPAuX5/CmpchotL3R/5qE3o9PQi20wDn4CMJY/2Tc22wErB2rwe6dw6qweOEUpZbhBlgbnyRMp7UxOeDvDkuylceE23Gbswg=;
X-UUID: 78c909727ed44807ad8c0b35ae1d9a81-20200729
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 322846917; Wed, 29 Jul 2020 14:31:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 14:31:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 14:31:20 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, <erin.lo@mediatek.com>,
        Crystal Guo <crystal.guo@mediatek.com>
Subject: [v2,1/3] dt-bindings: watchdog: modify description for mt2712 and mt8183
Date:   Wed, 29 Jul 2020 14:30:47 +0800
Message-ID: <1596004249-28655-2-git-send-email-crystal.guo@mediatek.com>
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

QmVzaWRlcyB3YXRjaGRvZywgbXQyNzEyIGFuZCBtdDgxODMgYWxzbyBwcm92aWRlIHN1Yi1zeXN0
ZW0gc29mdHdhcmUNCnJlc2V0IGZlYXR1cmVzLiBCdXQgbXQ2NTg5IG5vdCBzdXBwb3J0IHRoaXMg
ZmVhdHVyZS4NCg0KU2lnbmVkLW9mZi1ieTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlh
dGVrLmNvbT4NCi0tLQ0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRv
Zy9tdGstd2R0LnR4dCB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQNCmluZGV4IDRkZDM2YmQuLjQ1ZWVkYzIgMTAw
NjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRr
LXdkdC50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRv
Zy9tdGstd2R0LnR4dA0KQEAgLTQsMTMgKzQsMTMgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiAN
CiAtIGNvbXBhdGlibGUgc2hvdWxkIGNvbnRhaW46DQogCSJtZWRpYXRlayxtdDI3MDEtd2R0Iiwg
Im1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQyNzAxDQotCSJtZWRpYXRlayxtdDI3MTItd2R0
IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQyNzEyDQorCSJtZWRpYXRlayxtdDI3MTIt
d2R0IjogZm9yIE1UMjcxMg0KIAkibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY1ODkNCiAJ
Im1lZGlhdGVrLG10Njc5Ny13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDY3OTcN
CiAJIm1lZGlhdGVrLG10NzYyMi13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBNVDc2
MjINCiAJIm1lZGlhdGVrLG10NzYyMy13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZvciBN
VDc2MjMNCiAJIm1lZGlhdGVrLG10NzYyOS13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6IGZv
ciBNVDc2MjkNCi0JIm1lZGlhdGVrLG10ODE4My13ZHQiLCAibWVkaWF0ZWssbXQ2NTg5LXdkdCI6
IGZvciBNVDgxODMNCisJIm1lZGlhdGVrLG10ODE4My13ZHQiOiBmb3IgTVQ4MTgzDQogCSJtZWRp
YXRlayxtdDg1MTYtd2R0IiwgIm1lZGlhdGVrLG10NjU4OS13ZHQiOiBmb3IgTVQ4NTE2DQogDQog
LSByZWcgOiBTcGVjaWZpZXMgYmFzZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSBy
ZWdpc3RlcnMuDQotLSANCjEuOC4xLjEuZGlydHkNCg==

