Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB5913BBA8
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2020 09:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgAOI6l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jan 2020 03:58:41 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:17729 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729016AbgAOI6l (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jan 2020 03:58:41 -0500
X-UUID: 96895815a59941749d5acafda371faf9-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UunoMdrTa5yiW8ikAsKa+Kru5ZGQaRL2GDjuh52c1xM=;
        b=WKM4s8x7uySODSryQ9BraD5Fba8+6UAiH/siwKu7CWdp2lUzmpVDAL5EF0qgqnEWngs8PACPwAnWfA3G+K25kULmS7oAIU3zYRfl/XZacNsDC89A2Fwx/leBinCcgMZgIXd/MDNeqhQAas1l3wG6+I4FS+yudMyfI5hy8ZI5EB4=;
X-UUID: 96895815a59941749d5acafda371faf9-20200115
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <yong.liang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1759698765; Wed, 15 Jan 2020 16:58:37 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 16:57:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 15 Jan 2020 16:58:42 +0800
From:   Yong Liang <yong.liang@mediatek.com>
To:     <yong.liang@mediatek.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <p.zabel@pengutronix.de>,
        <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <chang-an.chen@mediatek.com>, <freddy.hsin@mediatek.com>,
        <jiaxin.yu@mediatek.com>
CC:     <yingjoe.chen@mediatek.com>, <sboyd@kernel.org>
Subject: [PATCH v12 0/4] ASoC: mt8183: fix audio playback slowly after playback
Date:   Wed, 15 Jan 2020 16:58:24 +0800
Message-ID: <20200115085828.27791-1-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

RnJvbTogInlvbmcubGlhbmciIDx5b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCg0KVGhpcyBzZXJp
ZXMgcGF0Y2hlcyBhZGQgcmVzZXQgY29udHJvbGxlciBmb3IgTVQ4MTgzIGFuZCBNVDI3MTIsIGFu
ZCBhdWRpbyB3aWxsIHVzZSBpdCBpbiANCm1hY2hpbmUgZHJpdmVyIGR1cmluZyBib290dXAsIHRo
ZXkgZGVwZW5kIG9uIHRoZSBmb3ItbmV4dC4NCg0KdjEyIGNoYW5nZXM6DQoxLiBTcGxpdCBNVDI3
MTIgZnJvbSBNVDgxODMgZm9yIG10ay13ZHQudHh0DQoNCnYxMSBjaGFuZ2VzOg0KMS4gQ3JlYXRl
IGEgbmV3IHBhdGNoIGZvciBNVDI3MTIuDQoNCnYxMCBjaGFuZ2VzOg0KMS4gTW9kaWZ5IG10ay13
ZHQudHh0IGR0LWJpbmRpbmdzLg0KDQp2OSBjaGFuZ2VzOg0KMS4gUmVtb3ZlIENoYW5nZS1JZC4N
Cg0KdjggY2hhbmdlczoNCjEuIERlbGV0ZSBjYXN0OiAoc3RydWN0IG10a193ZHRfZGF0YSAqKQ0K
DQp2NyBjaGFuZ2VzOg0KMS4gRGVsZXRlIG5vIHVzZSBjb2RlLg0KDQp2NiBjaGFuZ2VzOg0KMS4g
U2ltcGxpZnkgdG9wcnVnX3Jlc2V0X2Fzc2VydCgpICYgdG9wcnVnX3Jlc2V0X2RlYXNzZXJ0KCku
DQoyLiBBZGQgbWVtYmVycyBmb3IgbXQyNzEyX2RhdGEgJiBtdDgxODNfZGF0YS4NCg0KdjUgY2hh
bmdlczoNCjEuIEFkZCBTaWduZWQtb2ZmLWJ5IHRhZyBhbmQgUmV2aWV3ZWQtYnkgdGFnLg0KDQp2
NCBjaGFuZ2VzOg0KMS4gRml4ZWQgd3Jvbmcgc2lnbmVkLW9mZiBhcyBjb3JyZWN0IG1haWwgc3Vm
Zml4Lg0KMi4gRml4ZWQgcGF0Y2ggc3ViamVjdCB0aGF0IGFkZCBwYXRjaCB2ZXJzaW9uLg0KDQp2
MyBjaGFuZ2VzOg0KMS4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDI4
My8gYW5kIA0KICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MzA1LyBo
YXMgYmVlbiBtZXJnZWQuDQoyLiBDaGFuZ2UgdGhlIG5hbWUgb2YgbXRrX3dkdF9jb21wYXRpYmxl
IHRvIG10a193ZHRfZGF0YS4NCjMuIFJlbW92ZSB0b3ByZ3VfcmVzZXQgc3RydWN0IGFuZCB1c2Ug
bXRrX3dkdF9kZXYgaW5zdGVhZC4NCjQuIEdldCB0aGUgdmFsdWUgb2Ygc3dfcnN0X251bSBmcm9t
IC5oIGZpbGUuDQo1LiBBZGRkZCBtdDI3MTItcmVzZXRzLmggZm9yIG10MjcxMi4NCjYuIEltcHJv
dmUgY29tbWl0IG1lc3NhZ2UuDQoNCnYyIGNoYW5nZXM6DQoxLiByZW1vdmUgIldJUCIgdGhhdCBp
biB0aGUgdGl0bGUgb2YgcGF0Y2hlcw0KMi4gYWRkIGh5cGVyIGxpbmsgZm9yIHRoZSBwYXRjaCB0
aGF0IGRlcGVuZHMgb24NCjMuIHBhdGNod29yayBsaXN0Og0KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9jb3Zlci8xMTE2NDI4NS8NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTExNjQyOTUvDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0Mjk5
Lw0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDI4My8NCmh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQzMDUvDQoNCnYxIGNoYW5nZXM6DQoxLiBw
YXRjaHdvcmsgbGlzdDoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExNjQx
NzMvDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0MTgxLw0KaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDE4NS8NCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQxODcvDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzExMTY0MTc1Lw0KDQp5b25nLmxpYW5nICg0KToNCiAgZHQtYmluZGluZ3M6IG1lZGlh
dGVrOiBtdDgxODM6IEFkZCAjcmVzZXQtY2VsbHMNCiAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBt
dDI3MTI6IEFkZCAjcmVzZXQtY2VsbHMNCiAgd2F0Y2hkb2c6IG10a193ZHQ6IG10ODE4MzogQWRk
IHJlc2V0IGNvbnRyb2xsZXINCiAgd2F0Y2hkb2c6IG10a193ZHQ6IG10MjcxMjogQWRkIHJlc2V0
IGNvbnRyb2xsZXINCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL210ay13ZHQu
dHh0ICB8ICAxMSArLQ0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jICAgICAgICAgICAgICAg
ICAgICB8IDEwNSArKysrKysrKysrKysrKysrKy0NCiAuLi4vcmVzZXQtY29udHJvbGxlci9tdDI3
MTItcmVzZXRzLmggICAgICAgICAgfCAgMjIgKysrKw0KIC4uLi9yZXNldC1jb250cm9sbGVyL210
ODE4My1yZXNldHMuaCAgICAgICAgICB8ICAxNyArKysNCiA0IGZpbGVzIGNoYW5nZWQsIDE1MSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJlc2V0cy5oDQoNCi0tIA0KMi4x
OC4wDQo=

