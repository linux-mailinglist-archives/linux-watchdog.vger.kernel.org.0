Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA601308F8
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Jan 2020 17:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgAEQV5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Jan 2020 11:21:57 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:25312 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726260AbgAEQV5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Jan 2020 11:21:57 -0500
X-UUID: d33768b93e4a4a14b11dd0a43b439f77-20200106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XD8Uu4BnHuTQ0SAQN7pYtOUZCXAex4eTN2QKMTQnF0E=;
        b=EtntGBPKPZWdsMUun3mpEEKOeNz60Ds74oRphGnyFg6fY/czRggA5L6OzGq5i0Ys0BH5C7wfF2bDNxUR/LWhMrKz56r4pqNVrb3+lsX6IHQyGkmN88f90AyKkvXUMIZhruhA0BIoa78kEd2bI60Jb2V9lmNMyAFDLgql5Mi3rcY=;
X-UUID: d33768b93e4a4a14b11dd0a43b439f77-20200106
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1540074764; Mon, 06 Jan 2020 00:21:49 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 00:21:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 00:20:50 +0800
From:   Jiaxin Yu <jiaxin.yu@mediatek.com>
To:     <yong.liang@mediatek.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <chang-an.chen@mediatek.com>, <freddy.hsin@mediatek.com>
CC:     <yingjoe.chen@mediatek.com>, <sboyd@kernel.org>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v9 0/2] ASoC: mt8183: fix audio playback slowly after playback
Date:   Mon, 6 Jan 2020 00:21:39 +0800
Message-ID: <1578241301-14618-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhpcyBzZXJpZXMgcGF0Y2hlcyBhZGQgcmVzZXQgY29udHJvbGxlciBmb3IgTVQ4MTgzLCBhbmQg
YXVkaW8gd2lsbCB1c2UgaXQgaW4gDQptYWNoaW5lIGRyaXZlciBkdXJpbmcgYm9vdHVwLCB0aGV5
IGRlcGVuZCBvbiB0aGUgZm9yLW5leHQuDQoNCnY5IGNoYW5nZXM6DQoJMS4gUmVtb3ZlIENoYW5n
ZS1JZCBpbiBjb21tZW50Lg0KDQp2OCBjaGFuZ2VzOg0KCTEuIERlbGV0ZSBjYXN0OiAoc3RydWN0
IG10a193ZHRfZGF0YSAqKQ0KDQp2NyBjaGFuZ2VzOg0KCTEuIERlbGV0ZSBubyB1c2UgY29kZS4N
Cg0KdjYgY2hhbmdlczoNCgkxLiBTaW1wbGlmeSB0b3BydWdfcmVzZXRfYXNzZXJ0KCkgJiB0b3By
dWdfcmVzZXRfZGVhc3NlcnQoKS4NCgkyLiBBZGQgbWVtYmVycyBmb3IgbXQyNzEyX2RhdGEgJiBt
dDgxODNfZGF0YS4NCg0KdjUgY2hhbmdlczoNCgkxLiBBZGQgU2lnbmVkLW9mZi1ieSB0YWcgYW5k
IFJldmlld2VkLWJ5IHRhZy4NCg0KdjQgY2hhbmdlczoNCgkxLiBGaXhlZCB3cm9uZyBzaWduZWQt
b2ZmIGFzIGNvcnJlY3QgbWFpbCBzdWZmaXguDQoJMi4gRml4ZWQgcGF0Y2ggc3ViamVjdCB0aGF0
IGFkZCBwYXRjaCB2ZXJzaW9uLg0KDQp2MyBjaGFuZ2VzOg0KCTEuIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQyODMvIGFuZCANCgkgICBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzExMTY0MzA1LyBoYXMgYmVlbiBtZXJnZWQuDQoJMi4gQ2hhbmdlIHRo
ZSBuYW1lIG9mIG10a193ZHRfY29tcGF0aWJsZSB0byBtdGtfd2R0X2RhdGEuDQoJMy4gUmVtb3Zl
IHRvcHJndV9yZXNldCBzdHJ1Y3QgYW5kIHVzZSBtdGtfd2R0X2RldiBpbnN0ZWFkLg0KCTQuIEdl
dCB0aGUgdmFsdWUgb2Ygc3dfcnN0X251bSBmcm9tIC5oIGZpbGUuDQoJNS4gQWRkZGQgbXQyNzEy
LXJlc2V0cy5oIGZvciBtdDI3MTIuDQoJNi4gSW1wcm92ZSBjb21taXQgbWVzc2FnZS4NCg0KdjIg
Y2hhbmdlczoNCgkxLiByZW1vdmUgIldJUCIgdGhhdCBpbiB0aGUgdGl0bGUgb2YgcGF0Y2hlcw0K
CTIuIGFkZCBoeXBlciBsaW5rIGZvciB0aGUgcGF0Y2ggdGhhdCBkZXBlbmRzIG9uDQoJMy4gcGF0
Y2h3b3JrIGxpc3Q6DQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExNjQy
ODUvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQyOTUvDQoJCWh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQyOTkvDQoJCWh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQyODMvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTExNjQzMDUvDQoNCnYxIGNoYW5nZXM6DQoJMS4gcGF0Y2h3b3JrIGxp
c3Q6DQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExNjQxNzMvDQoJCWh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQxODEvDQoJCWh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQxODUvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTExNjQxODcvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTExNjQxNzUvDQoNCkppYXhpbiBZdSAoMik6DQogIGR0LWJpbmRpbmdzOiBtZWRpYXRl
azogbXQ4MTgzOiBBZGQgI3Jlc2V0LWNlbGxzDQogIHdhdGNoZG9nOiBtdGtfd2R0OiBtdDgxODM6
IEFkZCByZXNldCBjb250cm9sbGVyDQoNCiBkcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyAgICAg
ICAgICAgICAgICAgICAgfCAxMDUgKysrKysrKysrKysrKysrKystDQogLi4uL3Jlc2V0LWNvbnRy
b2xsZXIvbXQyNzEyLXJlc2V0cy5oICAgICAgICAgIHwgIDIyICsrKysNCiAuLi4vcmVzZXQtY29u
dHJvbGxlci9tdDgxODMtcmVzZXRzLmggICAgICAgICAgfCAgMTcgKysrDQogMyBmaWxlcyBjaGFu
Z2VkLCAxNDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oDQoN
Ci0tIA0KMi4xOC4wDQo=

