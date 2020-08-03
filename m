Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5893323A02B
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Aug 2020 09:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgHCHQA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Aug 2020 03:16:00 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39511 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726125AbgHCHPz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Aug 2020 03:15:55 -0400
X-UUID: da9ff929f236497985a6641e3534a480-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CNroCAZ0RL2N4ZfavyHWU/kNJ5us1mqnMHLPTgRxTSI=;
        b=M0gif7lQTTZI2Kps5e9YXK+h5ChG3QBhzNG+n2X8uOG/5ggKCkI40KJ3gcXGaae+25iZyevPHqkTXF+nVNsD2m7ktid1gZ1vqbzkzH6uJ8woUO9hIi0RoY05WWU3TeXQw8a4Qd6ZIpYUaFmiiPCXA1JRuMypvZR2cIBIx7W3d6c=;
X-UUID: da9ff929f236497985a6641e3534a480-20200803
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1374218471; Mon, 03 Aug 2020 15:15:51 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 15:15:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 15:15:47 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, Crystal Guo <crystal.guo@mediatek.com>
Subject: [v4,4/5] dt-binding: mt8192: add toprgu reset-controller head file
Date:   Mon, 3 Aug 2020 15:15:00 +0800
Message-ID: <20200803071501.30634-5-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200803071501.30634-1-crystal.guo@mediatek.com>
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: CC8ACE99E7C3A2203BB499DE3F720B05598A06C197EC599126E29BFB8327004D2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

YWRkIHRvcHJndSByZXNldC1jb250cm9sbGVyIGhlYWQgZmlsZSBmb3IgTVQ4MTkyIHBsYXRmb3Jt
DQoNClNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+
DQpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4N
Ci0tLQ0KIC4uLi9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaCAgICAgICAgICB8IDMw
ICsrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIv
bXQ4MTkyLXJlc2V0cy5oDQoNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0
LWNvbnRyb2xsZXIvbXQ4MTkyLXJlc2V0cy5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1j
b250cm9sbGVyL210ODE5Mi1yZXNldHMuaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAw
MDAwMDAwMDAwMC4uODRmZWUzNGYxYzMyDQotLS0gL2Rldi9udWxsDQorKysgYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTkyLXJlc2V0cy5oDQpAQCAtMCwwICsxLDMw
IEBADQorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCisvKg0KKyAqIENv
cHlyaWdodCAoYykgMjAyMCBNZWRpYVRlayBJbmMuDQorICogQXV0aG9yOiBZb25nIExpYW5nIDx5
b25nLmxpYW5nQG1lZGlhdGVrLmNvbT4NCisgKi8NCisNCisjaWZuZGVmIF9EVF9CSU5ESU5HU19S
RVNFVF9DT05UUk9MTEVSX01UODE5Mg0KKyNkZWZpbmUgX0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRS
T0xMRVJfTVQ4MTkyDQorDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX01NX1NXX1JTVAkJCQkJMQ0K
KyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9NRkdfU1dfUlNUCQkJCTINCisjZGVmaW5lIE1UODE4M19U
T1BSR1VfVkVOQ19TV19SU1QJCQkJMw0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9WREVDX1NXX1JT
VAkJCQk0DQorI2RlZmluZSBNVDgxODNfVE9QUkdVX0lNR19TV19SU1QJCQkJNQ0KKyNkZWZpbmUg
TVQ4MTgzX1RPUFJHVV9NRF9TV19SU1QJCQkJCTcNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfQ09O
Tl9TV19SU1QJCQkJOQ0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9DT05OX01DVV9TV19SU1QJCQkx
Mg0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9JUFUwX1NXX1JTVAkJCQkxNA0KKyNkZWZpbmUgTVQ4
MTgzX1RPUFJHVV9JUFUxX1NXX1JTVAkJCQkxNQ0KKyNkZWZpbmUgTVQ4MTgzX1RPUFJHVV9BVURJ
T19TV19SU1QJCQkJMTcNCisjZGVmaW5lIE1UODE4M19UT1BSR1VfQ0FNU1lTX1NXX1JTVAkJCQkx
OA0KKyNkZWZpbmUgTVQ4MTkyX1RPUFJHVV9NSkNfU1dfUlNUCQkJCTE5DQorI2RlZmluZSBNVDgx
OTJfVE9QUkdVX0MyS19TMl9TV19SU1QJCQkJMjANCisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfQzJL
X1NXX1JTVAkJCQkyMQ0KKyNkZWZpbmUgTVQ4MTkyX1RPUFJHVV9QRVJJX1NXX1JTVAkJCQkyMg0K
KyNkZWZpbmUgTVQ4MTkyX1RPUFJHVV9QRVJJX0FPX1NXX1JTVAkJCTIzDQorDQorI2RlZmluZSBN
VDgxOTJfVE9QUkdVX1NXX1JTVF9OVU0JCQkJMjMNCisNCisjZW5kaWYgIC8qIF9EVF9CSU5ESU5H
U19SRVNFVF9DT05UUk9MTEVSX01UODE5MiAqLw0KLS0gDQoyLjE4LjANCg==

