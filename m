Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E37511AE93
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2019 15:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfLKO6f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Dec 2019 09:58:35 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:33490 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727477AbfLKO6f (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Dec 2019 09:58:35 -0500
X-UUID: da00ba6805f94925b085c01ccc4c087c-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iimza8cqkvrV1lF7V0mYtKiaYJScHBfp3AjzMCxE4gQ=;
        b=McbfYxin0QzvYRwbfiyfmOWg4ApFUFf/WLl05Ijxl4NwINWOblsTVAUgcAtJt1L5tlW+GeBRco5odUuqAHwECDHayxBJUexDkaDzzsqYhK7hjljmj2kcO9cmNvm/P2NCL2EtqptbPJuwZxxTKXtZtzs7aJiukRiNyRRdJhmI/nc=;
X-UUID: da00ba6805f94925b085c01ccc4c087c-20191211
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 238543770; Wed, 11 Dec 2019 22:58:19 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 22:57:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 22:58:12 +0800
From:   Jiaxin Yu <jiaxin.yu@mediatek.com>
To:     <yong.liang@mediatek.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC:     <yinjoe.chen@mediatek.com>, <sboyd@kernel.org>
Subject: [PATCH 0/2] ASoC: mt8183: fix audio playback slowly after playback
Date:   Wed, 11 Dec 2019 22:58:10 +0800
Message-ID: <1576076292-17860-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 5F62D8D084A80CC349A3731985D8F145B72F874C43D6FF6BC54D7F63ECB79F4C2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogInlvbmcubGlhbmciIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCg0KVGhpcyBzZXJp
ZXMgcGF0Y2hlcyBhZGQgcmVzZXQgY29udHJvbGxlciBmb3IgTVQ4MTgzLCBhbmQgYXVkaW8gd2ls
bCB1c2UgaXQgaW4gDQptYWNoaW5lIGRyaXZlciBkdXJpbmcgYm9vdHVwLCB0aGV5IGRlcGVuZCBv
biB0aGUgZm9yLW5leHQuDQoNCnY2IGNoYW5nZXM6DQoJMS4gU2ltcGxpZnkgdG9wcnVnX3Jlc2V0
X2Fzc2VydCgpICYgdG9wcnVnX3Jlc2V0X2RlYXNzZXJ0KCkuDQoJMi4gQWRkIG1lbWJlcnMgZm9y
IG10MjcxMl9kYXRhICYgbXQ4MTgzX2RhdGEuDQoNCnY1IGNoYW5nZXM6DQoJMS4gQWRkIFNpZ25l
ZC1vZmYtYnkgdGFnIGFuZCBSZXZpZXdlZC1ieSB0YWcuDQoNCnY0IGNoYW5nZXM6DQoJMS4gRml4
ZWQgd3Jvbmcgc2lnbmVkLW9mZiBhcyBjb3JyZWN0IG1haWwgc3VmZml4Lg0KCTIuIEZpeGVkIHBh
dGNoIHN1YmplY3QgdGhhdCBhZGQgcGF0Y2ggdmVyc2lvbi4NCg0KdjMgY2hhbmdlczoNCgkxLiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MjgzLyBhbmQgDQoJICAgaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDMwNS8gaGFzIGJlZW4gbWVyZ2Vk
Lg0KCTIuIENoYW5nZSB0aGUgbmFtZSBvZiBtdGtfd2R0X2NvbXBhdGlibGUgdG8gbXRrX3dkdF9k
YXRhLg0KCTMuIFJlbW92ZSB0b3ByZ3VfcmVzZXQgc3RydWN0IGFuZCB1c2UgbXRrX3dkdF9kZXYg
aW5zdGVhZC4NCgk0LiBHZXQgdGhlIHZhbHVlIG9mIHN3X3JzdF9udW0gZnJvbSAuaCBmaWxlLg0K
CTUuIEFkZGRkIG10MjcxMi1yZXNldHMuaCBmb3IgbXQyNzEyLg0KCTYuIEltcHJvdmUgY29tbWl0
IG1lc3NhZ2UuDQoNCnYyIGNoYW5nZXM6DQoJMS4gcmVtb3ZlICJXSVAiIHRoYXQgaW4gdGhlIHRp
dGxlIG9mIHBhdGNoZXMNCgkyLiBhZGQgaHlwZXIgbGluayBmb3IgdGhlIHBhdGNoIHRoYXQgZGVw
ZW5kcyBvbg0KCTMuIHBhdGNod29yayBsaXN0Og0KCQlodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL2NvdmVyLzExMTY0Mjg1Lw0KCQlodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzExMTY0Mjk1Lw0KCQlodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0Mjk5
Lw0KCQlodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MjgzLw0KCQlodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MzA1Lw0KDQp2MSBjaGFuZ2VzOg0K
CTEuIHBhdGNod29yayBsaXN0Og0KCQlodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVy
LzExMTY0MTczLw0KCQlodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MTgx
Lw0KCQlodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MTg1Lw0KCQlodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MTg3Lw0KCQlodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MTc1Lw0KDQp5b25nLmxpYW5nICgyKToNCiAgYXJt
NjQ6IGR0czogbXQ4MTgzOiBBZGQgcmVzZXQtY2VsbHMgaW4gaW5mcmFjZmcNCiAgY2xrOiByZXNl
dDogTW9kaWZ5IHJlc2V0LWNvbnRyb2xsZXIgZHJpdmVyDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCAgfCAgMTAgKy0NCiBkcml2ZXJzL3dhdGNoZG9nL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRr
X3dkdC5jICAgICAgICAgICAgICAgICAgICB8IDEwOSArKysrKysrKysrKysrKysrKy0NCiAuLi4v
cmVzZXQtY29udHJvbGxlci9tdDI3MTItcmVzZXRzLmggICAgICAgICAgfCAgMjIgKysrKw0KIC4u
Li9yZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaCAgICAgICAgICB8ICAxNyArKysNCiA1
IGZpbGVzIGNoYW5nZWQsIDE1NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEy
LXJlc2V0cy5oDQoNCi0tIA0KMi4xOC4wDQo=

