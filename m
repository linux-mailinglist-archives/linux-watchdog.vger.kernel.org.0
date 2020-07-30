Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E848233039
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 12:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbgG3KWc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 06:22:32 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:65091 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729140AbgG3KW1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 06:22:27 -0400
X-UUID: b64e2d8b526146dbb1017a7bd3ffb8e3-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3k0kVNO88tHkCKWTChsoc7KVWWIDowKBe7aJrkR/NCI=;
        b=po32Poj8kCkAvsGQ0W4jFI7u2NaHA57V2BH91jKPruYEqnJtxTFofbLWbMqg5WRwByRz6UWJIXzN5iBG2/if6a+/yFz8wV6O9EsujrcGVeD3Ql+LfD9mJljrH7/QAiHu1XlyT9XnwIsKm63JeDe7jcP13yJGmvG3VukS7xibrPs=;
X-UUID: b64e2d8b526146dbb1017a7bd3ffb8e3-20200730
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1215805369; Thu, 30 Jul 2020 18:22:22 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:22:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 18:22:17 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v3,2/5] arm64: dts: mt8183: update watchdog device node
Date:   Thu, 30 Jul 2020 18:21:47 +0800
Message-ID: <1596104510-11113-3-git-send-email-crystal.guo@mediatek.com>
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

dXBkYXRlIHdhdGNoZG9nIGRldmljZSBub2RlIGZvciBNVDgxODMNCg0KU2lnbmVkLW9mZi1ieTog
Q3J5c3RhbCBHdW8gPGNyeXN0YWwuZ3VvQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCAzICstLQ0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE4My5kdHNpDQppbmRleCAxZTAzYzg0Li5mOGQ4MzU3IDEwMDY0NA0KLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KQEAgLTMxMCw4ICszMTAsNyBAQA0KIAkJfTsN
CiANCiAJCXdhdGNoZG9nOiB3YXRjaGRvZ0AxMDAwNzAwMCB7DQotCQkJY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxODMtd2R0IiwNCi0JCQkJICAgICAibWVkaWF0ZWssbXQ2NTg5LXdkdCI7DQor
CQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtd2R0IjsNCiAJCQlyZWcgPSA8MCAweDEw
MDA3MDAwIDAgMHgxMDA+Ow0KIAkJCSNyZXNldC1jZWxscyA9IDwxPjsNCiAJCX07DQotLSANCjEu
OC4xLjEuZGlydHkNCg==

