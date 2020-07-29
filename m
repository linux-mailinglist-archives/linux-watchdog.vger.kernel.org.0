Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9568231C6F
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 12:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgG2KCg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 06:02:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54247 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726664AbgG2KCd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 06:02:33 -0400
X-UUID: 67651818c438449585071583ed6ddc9d-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PQhqwCQspnAXNFobjzXHfwsqOP2Lc1A+L/OtZnfUCGg=;
        b=YSM4RwS7CdHSnR+0/wj3NkKaYPdb8BQMtAEziLOQcxwkPe9/QKvEdRkHFuu4acYaPhCAZZ/XqsAVVvFCnavjVcdiWmd6UxGQahaNQvosfO3FbvUA1sz+RO4zEfCX+7TH5+d1HFxLDiThiBSa/dJ3aOOkkRElub6uX4Kx9nD51vc=;
X-UUID: 67651818c438449585071583ed6ddc9d-20200729
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 591561856; Wed, 29 Jul 2020 18:02:30 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 18:02:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 18:02:26 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, <erin.lo@mediatek.com>
Subject: [v2,0/3] add watchdog support for mt8192 
Date:   Wed, 29 Jul 2020 18:01:59 +0800
Message-ID: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

djEgY2hhbmdlczoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE2ODA0OTUv
DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNjgwNDk3Lw0KDQpDcnlzdGFs
IEd1byAoMyk6DQogIGR0LWJpbmRpbmc6IG1lZGlhdGVrOiBtdDgxOTI6IHVwZGF0ZSBtdGstd2R0
IGRvY3VtZW50DQogIGR0LWJpbmRpbmc6IG10ODE5MjogYWRkIHRvcHJndSByZXNldC1jb250cm9s
bGVyIGhlYWQgZmlsZQ0KICB3YXRjaGRvZzogbXQ4MTkyOiBhZGQgd2R0IHN1cHBvcnQNCg0KIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQudHh0ICAgICAgIHwgIDUgKyst
LQ0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDYgKysrKysNCiAuLi4vZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRz
LmggICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysNCiAzIGZpbGVzIGNoYW5nZWQsIDM5IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmgNCg0K

