Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEF8231991
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 08:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgG2Gb1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 02:31:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43381 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726314AbgG2Gb1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 02:31:27 -0400
X-UUID: 7c679754fc954461b5ac247a2ed635ea-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7d434J+8AGhHBRMsSJUUAUNurMmar1Y1icwYzPXviTE=;
        b=te5uAQYcYuJ0/XfyRUu7vI/xT6KNaWK7F8oS54bTmYS/nODZyEHD0HpgcxPmMiSg8Q8+zKa7f27Fqn8oMvUVO+ZXpgcKa9AMxaEXANDcydBX7cErZw+NZ8Hcwi7MHBbI8A7CwGj9NIbQ833oEwt/bjKIdMb/BRK9vCxd9XQv2Qk=;
X-UUID: 7c679754fc954461b5ac247a2ed635ea-20200729
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 46817652; Wed, 29 Jul 2020 14:31:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 14:31:19 +0800
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
        <seiya.wang@mediatek.com>, <erin.lo@mediatek.com>
Subject: [v2,0/3] mtk_wdt: merge all the reset numbers in one head file 
Date:   Wed, 29 Jul 2020 14:30:46 +0800
Message-ID: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: A14E659C9980EA793FBB66FB1FB60E4DE883D1B2A701CEC04D273F5B3671698B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhpcyBzZXJpZXMgcGF0Y2hlcyBtZXJnZSBhbGwgdGhlIHJlc2V0IG51bWJlcnMgaW4gb25lIGhl
YWQgZmlsZQ0KDQp2MiBjaGFuZ2VzOg0KbWVyZ2UgYWxsIHRoZSByZXNldCBudW1iZXJzIGluIG9u
ZSBoZWFkIGZpbGUsDQppbnN0ZWFkIG9mIHBhc3MgdGhlIHJlc2V0IG51bWJlciB2aWEgRFRTICh2
MSkuIA0KDQp2MSBjaGFuZ2VzOg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MTY4ODkxNS8NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE2ODg5MjUvDQpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNjg4OTIzLw0KDQpDcnlzdGFsIEd1
byAoMyk6DQogIGR0LWJpbmRpbmdzOiB3YXRjaGRvZzogbW9kaWZ5IGRlc2NyaXB0aW9uIGZvciBt
dDI3MTIgYW5kIG10ODE4Mw0KICBkdC1iaW5kaW5nczogd2F0Y2hkb2c6IGFkZCBhIG5ldyBoZWFk
IGZpbGUgZm9yIHRvcHJndSByZXNldC1jb250cm9sbGVycw0KICB3YXRjaGRvZzogbXRrX3dkdDog
bWVyZ2UgYWxsIHRoZSByZXNldCBudW1iZXJzIGluIG9uZSBoZWFkIGZpbGUNCg0KICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgfCAgNCArKy0t
DQogIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAzICstLQ0KICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXRrLXJl
c2V0cy5oICAgICAgfCAxMyArKysrKysrKysrKysrDQogIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdGstcmVzZXRzLmgNCg==

