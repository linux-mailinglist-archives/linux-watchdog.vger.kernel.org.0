Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128BC27BB77
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Sep 2020 05:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbgI2DWy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Sep 2020 23:22:54 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54508 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727177AbgI2DWw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Sep 2020 23:22:52 -0400
X-UUID: bdea6d9d644345e3b0230b60c2a8082d-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GH+44kRU1TnZbUE2nlOmR4VgS/G/oHtxMJIqsP+TCAI=;
        b=KCM72qlHLx0W9y65dKZBCuKOWd+XxqKBMRj1Ba5Z07rW7G59jR9znPb/scRYXBmwxhbbRfkywrrMBlZMOYDmwZ2dXFq0lc7o2vMKqahSD/XsJw9hBQSk+nY/fOHfSIPNPFvCM9wX49YuWhbjYsLzSjjp/TsOfZm3M5BolIn+rfo=;
X-UUID: bdea6d9d644345e3b0230b60c2a8082d-20200929
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1548421223; Tue, 29 Sep 2020 11:22:43 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 11:22:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 11:22:40 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>
Subject: [v5,0/4] watchdog: mt8192: add wdt support 
Date:   Tue, 29 Sep 2020 11:20:01 +0800
Message-ID: <20200929032005.15169-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

djUgY2hhbmdlczoNCmZpeCB0eXBvcyBvbjoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTE2OTc0OTMvDQoNCnY0IGNoYW5nZXM6DQpyZXZpc2UgY29tbWl0IG1lc3NhZ2VzLg0K
DQp2MyBjaGFuZ2VzOg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTY5Mjcz
MS8NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE2OTI3NjcvDQpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNjkyNzI5Lw0KaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMTY5Mjc3MS8NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTE2OTI3MzMvDQoNCkNyeXN0YWwgR3VvICg0KToNCiAgZHQtYmluZGluZzogbWVkaWF0
ZWs6IHdhdGNoZG9nOiBmaXggdGhlIGRlc2NyaXB0aW9uIG9mIGNvbXBhdGlibGUNCiAgZHQtYmlu
ZGluZzogbWVkaWF0ZWs6IG10ODE5MjogdXBkYXRlIG10ay13ZHQgZG9jdW1lbnQNCiAgZHQtYmlu
ZGluZzogbXQ4MTkyOiBhZGQgdG9wcmd1IHJlc2V0LWNvbnRyb2xsZXIgaGVhZCBmaWxlDQogIHdh
dGNoZG9nOiBtdDgxOTI6IGFkZCB3ZHQgc3VwcG9ydA0KDQogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvbXRrLXdkdC50eHQgICAgICAgfCAgNSArKy0tDQogZHJpdmVycy93YXRjaGRv
Zy9tdGtfd2R0LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrKw0KIC4uLi9kdC1i
aW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaCAgIHwgMzAgKysrKysrKysr
KysrKysrKysrKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1j
b250cm9sbGVyL210ODE5Mi1yZXNldHMuaA0KDQo=

