Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08066130C6B
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2020 04:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgAFDLu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Jan 2020 22:11:50 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:42063 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727307AbgAFDLs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Jan 2020 22:11:48 -0500
X-UUID: c26b29309ad14b9193f661be21e3c913-20200106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FkRY1My5B1PgeoXnFrF+vl3WKqPtlLa4QVmoHWkPs14=;
        b=iSPTjDMIJMRUyFqIE7jZmzRFLimKF9ejLzJ56s8gVdc2Hl9NCe10o+CNeje9EZ5duhPfKMuihaKP930lH4yTE6lWK1QMdDnrGT4Q/FU0I7d4/JUdNLI2ho9zA+xUNoWE5VISSp5Ub6ndnbT5WEql2Ct247F9G57YGz7ZJXxVjxw=;
X-UUID: c26b29309ad14b9193f661be21e3c913-20200106
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 374970942; Mon, 06 Jan 2020 11:11:41 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 11:11:11 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 11:10:10 +0800
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
Subject: [PATCH v10 0/2] ASoC: mt8183: fix audio playback slowly after playback
Date:   Mon, 6 Jan 2020 11:11:34 +0800
Message-ID: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
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
IGRlcGVuZCBvbiB0aGUgZm9yLW5leHQuDQoNCnYxMCBjaGFuZ2VzOg0KCTEuIE1vZGlmeSBtdGst
d2R0LnR4dCBkdC1iaW5kaW5ncy4NCg0KdjkgY2hhbmdlczoNCgkxLiBSZW1vdmUgQ2hhbmdlLUlk
Lg0KDQp2OCBjaGFuZ2VzOg0KCTEuIERlbGV0ZSBjYXN0OiAoc3RydWN0IG10a193ZHRfZGF0YSAq
KQ0KDQp2NyBjaGFuZ2VzOg0KCTEuIERlbGV0ZSBubyB1c2UgY29kZS4NCg0KdjYgY2hhbmdlczoN
CgkxLiBTaW1wbGlmeSB0b3BydWdfcmVzZXRfYXNzZXJ0KCkgJiB0b3BydWdfcmVzZXRfZGVhc3Nl
cnQoKS4NCgkyLiBBZGQgbWVtYmVycyBmb3IgbXQyNzEyX2RhdGEgJiBtdDgxODNfZGF0YS4NCg0K
djUgY2hhbmdlczoNCgkxLiBBZGQgU2lnbmVkLW9mZi1ieSB0YWcgYW5kIFJldmlld2VkLWJ5IHRh
Zy4NCg0KdjQgY2hhbmdlczoNCgkxLiBGaXhlZCB3cm9uZyBzaWduZWQtb2ZmIGFzIGNvcnJlY3Qg
bWFpbCBzdWZmaXguDQoJMi4gRml4ZWQgcGF0Y2ggc3ViamVjdCB0aGF0IGFkZCBwYXRjaCB2ZXJz
aW9uLg0KDQp2MyBjaGFuZ2VzOg0KCTEuIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTExNjQyODMvIGFuZCANCgkgICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzExMTY0MzA1LyBoYXMgYmVlbiBtZXJnZWQuDQoJMi4gQ2hhbmdlIHRoZSBuYW1lIG9mIG10a193
ZHRfY29tcGF0aWJsZSB0byBtdGtfd2R0X2RhdGEuDQoJMy4gUmVtb3ZlIHRvcHJndV9yZXNldCBz
dHJ1Y3QgYW5kIHVzZSBtdGtfd2R0X2RldiBpbnN0ZWFkLg0KCTQuIEdldCB0aGUgdmFsdWUgb2Yg
c3dfcnN0X251bSBmcm9tIC5oIGZpbGUuDQoJNS4gQWRkZGQgbXQyNzEyLXJlc2V0cy5oIGZvciBt
dDI3MTIuDQoJNi4gSW1wcm92ZSBjb21taXQgbWVzc2FnZS4NCg0KdjIgY2hhbmdlczoNCgkxLiBy
ZW1vdmUgIldJUCIgdGhhdCBpbiB0aGUgdGl0bGUgb2YgcGF0Y2hlcw0KCTIuIGFkZCBoeXBlciBs
aW5rIGZvciB0aGUgcGF0Y2ggdGhhdCBkZXBlbmRzIG9uDQoJMy4gcGF0Y2h3b3JrIGxpc3Q6DQoJ
CWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExNjQyODUvDQoJCWh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQyOTUvDQoJCWh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQyOTkvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTExNjQyODMvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTExNjQzMDUvDQoNCnYxIGNoYW5nZXM6DQoJMS4gcGF0Y2h3b3JrIGxpc3Q6DQoJCWh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExNjQxNzMvDQoJCWh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQxODEvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTExNjQxODUvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTExNjQxODcvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQxNzUv
DQoNCkppYXhpbiBZdSAoMik6DQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogbXQ4MTgzOiBBZGQg
I3Jlc2V0LWNlbGxzDQogIHdhdGNoZG9nOiBtdGtfd2R0OiBtdDgxODM6IEFkZCByZXNldCBjb250
cm9sbGVyDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCAg
fCAgMTAgKy0NCiBkcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyAgICAgICAgICAgICAgICAgICAg
fCAxMDUgKysrKysrKysrKysrKysrKystDQogLi4uL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJl
c2V0cy5oICAgICAgICAgIHwgIDIyICsrKysNCiAuLi4vcmVzZXQtY29udHJvbGxlci9tdDgxODMt
cmVzZXRzLmggICAgICAgICAgfCAgMTcgKysrDQogNCBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaA0KDQotLSANCjIuMTguMA0K

