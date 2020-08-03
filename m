Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE2623A025
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Aug 2020 09:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgHCHPx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Aug 2020 03:15:53 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55485 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725831AbgHCHPw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Aug 2020 03:15:52 -0400
X-UUID: c2537ea433c54336b342b289ab9c929e-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lpuSKaOUayTd7d3eBZZ9hu+OIt66WFsS5MXoXt1AMMA=;
        b=JDChQfHQ9So2Gfdu9O5IMh1k+Q5DnwCaHDJCTXPAhl9FTlClyNY5//GJsE67qSJz5bp1owv1aZJyTOXjQVCzi0xREKuqAYx0DP8fP7A1JA7moUXXl64O1sblQbw797HXJO5OQZE6eO1q1D6XpRW/7NIcSWMaUbHtM17UCPuuNaY=;
X-UUID: c2537ea433c54336b342b289ab9c929e-20200803
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1811670260; Mon, 03 Aug 2020 15:15:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 15:15:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 15:15:45 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v4,2/5] arm64: dts: mt8183: update watchdog device node
Date:   Mon, 3 Aug 2020 15:14:58 +0800
Message-ID: <20200803071501.30634-3-crystal.guo@mediatek.com>
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

VGhlIHdhdGNoZG9nIGRyaXZlciBmb3IgTVQ4MTgzIHJlbGllcyBvbiBEVCBkYXRhLCBzbyB0aGUg
ZmFsbGJhY2sNCmNvbXBhdGlibGUgTVQ2NTg5IHdvbid0IHdvcmssIG5lZWQgdG8gdXBkYXRlIHdh
dGNoZG9nIGRldmljZSBub2RlDQp0byBzeW5jIHdpdGggd2F0Y2hkb2cgZHQtYmluZGluZyBkb2N1
bWVudC4NCg0KU2lnbmVkLW9mZi1ieTogQ3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlhdGVr
LmNvbT4NCi0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCAz
ICstLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpDQppbmRleCAxZTAzYzg0OWRj
NWQuLmY4ZDgzNTc0NmFiOCAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTgzLmR0c2kNCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgz
LmR0c2kNCkBAIC0zMTAsOCArMzEwLDcgQEANCiAJCX07DQogDQogCQl3YXRjaGRvZzogd2F0Y2hk
b2dAMTAwMDcwMDAgew0KLQkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXdkdCIsDQot
CQkJCSAgICAgIm1lZGlhdGVrLG10NjU4OS13ZHQiOw0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTgzLXdkdCI7DQogCQkJcmVnID0gPDAgMHgxMDAwNzAwMCAwIDB4MTAwPjsNCiAJCQkj
cmVzZXQtY2VsbHMgPSA8MT47DQogCQl9Ow0KLS0gDQoyLjE4LjANCg==

