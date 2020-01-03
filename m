Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4272F12F621
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Jan 2020 10:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgACJhi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Jan 2020 04:37:38 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:36980 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725972AbgACJhi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Jan 2020 04:37:38 -0500
X-UUID: 3804e35a6dd749e6a1d639b7d58d7ed0-20200103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aylJ44w3RnTZ4WfVk5V4D/nP65Vc+4LNLwxEH2TCevk=;
        b=bXFfRsWxUF2ifN7RFio4pbJcW9ZEisoKmG8ER4OEl9r6COwUYrqP95NEVvoRKhT5C45nf8+pPQzytLZytAKgPoKdXYAPlJLEbjJaBDxlUre5DajuXF2PkxLnaP1DiZXVh+waV0H15ogPuABzChnBXczoZpksoCrGrbWMkuJfelQ=;
X-UUID: 3804e35a6dd749e6a1d639b7d58d7ed0-20200103
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 187937677; Fri, 03 Jan 2020 17:37:32 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 17:37:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 17:37:29 +0800
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
Subject: [PATCH v8 0/2] ASoC: mt8183: fix audio playback slowly after playback
Date:   Fri, 3 Jan 2020 17:37:23 +0800
Message-ID: <1578044245-26939-1-git-send-email-jiaxin.yu@mediatek.com>
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
IGRlcGVuZCBvbiB0aGUgZm9yLW5leHQuDQoNClY4IGNoYW5nZXM6DQoJMS4gRGVsZXRlIGNhc3Q6
IChzdHJ1Y3QgbXRrX3dkdF9kYXRhICopDQoNClY3IGNoYW5nZXM6DQoJMS4gRGVsZXRlIG5vIHVz
ZSBjb2RlLg0KDQp2NiBjaGFuZ2VzOg0KCTEuIFNpbXBsaWZ5IHRvcHJ1Z19yZXNldF9hc3NlcnQo
KSAmIHRvcHJ1Z19yZXNldF9kZWFzc2VydCgpLg0KCTIuIEFkZCBtZW1iZXJzIGZvciBtdDI3MTJf
ZGF0YSAmIG10ODE4M19kYXRhLg0KDQp2NSBjaGFuZ2VzOg0KCTEuIEFkZCBTaWduZWQtb2ZmLWJ5
IHRhZyBhbmQgUmV2aWV3ZWQtYnkgdGFnLg0KDQp2NCBjaGFuZ2VzOg0KCTEuIEZpeGVkIHdyb25n
IHNpZ25lZC1vZmYgYXMgY29ycmVjdCBtYWlsIHN1ZmZpeC4NCgkyLiBGaXhlZCBwYXRjaCBzdWJq
ZWN0IHRoYXQgYWRkIHBhdGNoIHZlcnNpb24uDQoNCnYzIGNoYW5nZXM6DQoJMS4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDI4My8gYW5kIA0KCSAgIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQzMDUvIGhhcyBiZWVuIG1lcmdlZC4NCgkyLiBD
aGFuZ2UgdGhlIG5hbWUgb2YgbXRrX3dkdF9jb21wYXRpYmxlIHRvIG10a193ZHRfZGF0YS4NCgkz
LiBSZW1vdmUgdG9wcmd1X3Jlc2V0IHN0cnVjdCBhbmQgdXNlIG10a193ZHRfZGV2IGluc3RlYWQu
DQoJNC4gR2V0IHRoZSB2YWx1ZSBvZiBzd19yc3RfbnVtIGZyb20gLmggZmlsZS4NCgk1LiBBZGRk
ZCBtdDI3MTItcmVzZXRzLmggZm9yIG10MjcxMi4NCgk2LiBJbXByb3ZlIGNvbW1pdCBtZXNzYWdl
Lg0KDQp2MiBjaGFuZ2VzOg0KCTEuIHJlbW92ZSAiV0lQIiB0aGF0IGluIHRoZSB0aXRsZSBvZiBw
YXRjaGVzDQoJMi4gYWRkIGh5cGVyIGxpbmsgZm9yIHRoZSBwYXRjaCB0aGF0IGRlcGVuZHMgb24N
CgkzLiBwYXRjaHdvcmsgbGlzdDoNCgkJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zl
ci8xMTE2NDI4NS8NCgkJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDI5
NS8NCgkJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDI5OS8NCgkJaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDI4My8NCgkJaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDMwNS8NCg0KdjEgY2hhbmdlczoNCgkxLiBwYXRj
aHdvcmsgbGlzdDoNCgkJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTE2NDE3
My8NCgkJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDE4MS8NCgkJaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDE4NS8NCgkJaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NDE4Ny8NCgkJaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMTE2NDE3NS8NCg0KSmlheGluIFl1ICgyKToNCiAgZHQtYmluZGluZ3M6
IG1lZGlhdGVrOiBtdDgxODM6IEFkZCAjcmVzZXQtY2VsbHMNCiAgd2F0Y2hkb2c6IG10a193ZHQ6
IG10ODE4MzogQWRkIHJlc2V0IGNvbnRyb2xsZXINCg0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dk
dC5jICAgICAgICAgICAgICAgICAgICB8IDEwNSArKysrKysrKysrKysrKysrKy0NCiAuLi4vcmVz
ZXQtY29udHJvbGxlci9tdDI3MTItcmVzZXRzLmggICAgICAgICAgfCAgMjIgKysrKw0KIC4uLi9y
ZXNldC1jb250cm9sbGVyL210ODE4My1yZXNldHMuaCAgICAgICAgICB8ICAxNyArKysNCiAzIGZp
bGVzIGNoYW5nZWQsIDE0MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDI3MTItcmVz
ZXRzLmgNCg0KLS0gDQoyLjE4LjANCg==

