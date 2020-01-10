Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59F331367D0
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Jan 2020 08:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgAJHEf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Jan 2020 02:04:35 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:32701 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726598AbgAJHEf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Jan 2020 02:04:35 -0500
X-UUID: 1d66aa46506b476ca302409391d1c1e9-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=P3n5D3Gnhy1NP5hvBdfMtlX5qxR8Gfe2dv5Rnak/iM4=;
        b=NKCRyL+IQH4InU6kj0lC7MK1MX+8njEDuQyH1yChSocxJYcsPMfGDXXRHWNaN3fXlURrsBPuPe340RSrTKvqNvsaplaYSPAl7IkJ9F152yhbauweGnAhcYCMoOdVSKnehFJHer0VR/3ekkBc4AR05GKpK6KFHW1zcq1jCzIWJmU=;
X-UUID: 1d66aa46506b476ca302409391d1c1e9-20200110
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <jiaxin.yu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 896783736; Fri, 10 Jan 2020 15:04:28 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 15:03:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 15:03:55 +0800
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
Subject: [PATCH v11 0/3] ASoC: mt8183: fix audio playback slowly after playback
Date:   Fri, 10 Jan 2020 15:04:19 +0800
Message-ID: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

VGhpcyBzZXJpZXMgcGF0Y2hlcyBhZGQgcmVzZXQgY29udHJvbGxlciBmb3IgTVQ4MTgzIGFuZCBN
VDI3MTIsIGFuZCBhdWRpbyB3aWxsIHVzZSBpdCBpbiANCm1hY2hpbmUgZHJpdmVyIGR1cmluZyBi
b290dXAsIHRoZXkgZGVwZW5kIG9uIHRoZSBmb3ItbmV4dC4NCg0KdjExIGNoYW5nZXM6DQoJMS4g
Q3JlYXRlIGEgbmV3IHBhdGNoIGZvciBNVDI3MTIuDQoNCnYxMCBjaGFuZ2VzOg0KCTEuIE1vZGlm
eSBtdGstd2R0LnR4dCBkdC1iaW5kaW5ncy4NCg0KdjkgY2hhbmdlczoNCgkxLiBSZW1vdmUgQ2hh
bmdlLUlkLg0KDQp2OCBjaGFuZ2VzOg0KCTEuIERlbGV0ZSBjYXN0OiAoc3RydWN0IG10a193ZHRf
ZGF0YSAqKQ0KDQp2NyBjaGFuZ2VzOg0KCTEuIERlbGV0ZSBubyB1c2UgY29kZS4NCg0KdjYgY2hh
bmdlczoNCgkxLiBTaW1wbGlmeSB0b3BydWdfcmVzZXRfYXNzZXJ0KCkgJiB0b3BydWdfcmVzZXRf
ZGVhc3NlcnQoKS4NCgkyLiBBZGQgbWVtYmVycyBmb3IgbXQyNzEyX2RhdGEgJiBtdDgxODNfZGF0
YS4NCg0KdjUgY2hhbmdlczoNCgkxLiBBZGQgU2lnbmVkLW9mZi1ieSB0YWcgYW5kIFJldmlld2Vk
LWJ5IHRhZy4NCg0KdjQgY2hhbmdlczoNCgkxLiBGaXhlZCB3cm9uZyBzaWduZWQtb2ZmIGFzIGNv
cnJlY3QgbWFpbCBzdWZmaXguDQoJMi4gRml4ZWQgcGF0Y2ggc3ViamVjdCB0aGF0IGFkZCBwYXRj
aCB2ZXJzaW9uLg0KDQp2MyBjaGFuZ2VzOg0KCTEuIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTExNjQyODMvIGFuZCANCgkgICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzExMTY0MzA1LyBoYXMgYmVlbiBtZXJnZWQuDQoJMi4gQ2hhbmdlIHRoZSBuYW1lIG9m
IG10a193ZHRfY29tcGF0aWJsZSB0byBtdGtfd2R0X2RhdGEuDQoJMy4gUmVtb3ZlIHRvcHJndV9y
ZXNldCBzdHJ1Y3QgYW5kIHVzZSBtdGtfd2R0X2RldiBpbnN0ZWFkLg0KCTQuIEdldCB0aGUgdmFs
dWUgb2Ygc3dfcnN0X251bSBmcm9tIC5oIGZpbGUuDQoJNS4gQWRkZGQgbXQyNzEyLXJlc2V0cy5o
IGZvciBtdDI3MTIuDQoJNi4gSW1wcm92ZSBjb21taXQgbWVzc2FnZS4NCg0KdjIgY2hhbmdlczoN
CgkxLiByZW1vdmUgIldJUCIgdGhhdCBpbiB0aGUgdGl0bGUgb2YgcGF0Y2hlcw0KCTIuIGFkZCBo
eXBlciBsaW5rIGZvciB0aGUgcGF0Y2ggdGhhdCBkZXBlbmRzIG9uDQoJMy4gcGF0Y2h3b3JrIGxp
c3Q6DQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExNjQyODUvDQoJCWh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQyOTUvDQoJCWh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQyOTkvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTExNjQyODMvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTExNjQzMDUvDQoNCnYxIGNoYW5nZXM6DQoJMS4gcGF0Y2h3b3JrIGxpc3Q6DQoJCWh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExNjQxNzMvDQoJCWh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExNjQxODEvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTExNjQxODUvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTExNjQxODcvDQoJCWh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEx
NjQxNzUvDQoNCkppYXhpbiBZdSAoMyk6DQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogbXQ4MTgz
OiBBZGQgI3Jlc2V0LWNlbGxzDQogIHdhdGNoZG9nOiBtdGtfd2R0OiBtdDgxODM6IEFkZCByZXNl
dCBjb250cm9sbGVyDQogIHdhdGNoZG9nOiBtdGtfd2R0OiBtdDI3MTI6IEFkZCByZXNldCBjb250
cm9sbGVyDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRjaGRvZy9tdGstd2R0LnR4dCAg
fCAgMTAgKy0NCiBkcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyAgICAgICAgICAgICAgICAgICAg
fCAxMDUgKysrKysrKysrKysrKysrKystDQogLi4uL3Jlc2V0LWNvbnRyb2xsZXIvbXQyNzEyLXJl
c2V0cy5oICAgICAgICAgIHwgIDIyICsrKysNCiAuLi4vcmVzZXQtY29udHJvbGxlci9tdDgxODMt
cmVzZXRzLmggICAgICAgICAgfCAgMTcgKysrDQogNCBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210MjcxMi1yZXNldHMuaA0KDQotLSANCjIuMTguMA0K

