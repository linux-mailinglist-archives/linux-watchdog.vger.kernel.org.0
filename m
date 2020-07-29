Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1710F231C72
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 12:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgG2KCd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 06:02:33 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:11230 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726645AbgG2KCd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 06:02:33 -0400
X-UUID: 07cf1b3bbb104299ae64643edbc6e453-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Rx7lqPlUO6eBPjJnE7Gk7n6FgLIwydc+DSCMweEF+uU=;
        b=IkQRjfE4wG81gNGpInR317/ecy/fIJoYDw4amI2n36KGY18PvAw2ZHlPxDBbhItL1w1G6Mo3987Y3KrXbwviK0iAIwpz5dhDybppj4uOyuKkHHU9i9q8SdHD6udpk69RdvzgYHj9kSqO0FkzSMp2XUG5d0O8Ffwct2/sYVGHsZ0=;
X-UUID: 07cf1b3bbb104299ae64643edbc6e453-20200729
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1866553248; Wed, 29 Jul 2020 18:02:30 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 18:02:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 18:02:28 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, <erin.lo@mediatek.com>,
        Crystal Guo <crystal.guo@mediatek.com>
Subject: [v2,2/3] dt-binding: mt8192: add toprgu reset-controller head file
Date:   Wed, 29 Jul 2020 18:02:01 +0800
Message-ID: <1596016922-13184-3-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

YWRkIHRvcHJndSByZXNldC1jb250cm9sbGVyIGhlYWQgZmlsZSBmb3IgTVQ4MTkyIHBsYXRmb3Jt
DQoNClNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+
DQotLS0NCiAuLi4vZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmgg
ICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNv
bnRyb2xsZXIvbXQ4MTkyLXJlc2V0cy5oDQoNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXQ4MTkyLXJlc2V0cy5oIGIvaW5jbHVkZS9kdC1iaW5kaW5n
cy9yZXNldC1jb250cm9sbGVyL210ODE5Mi1yZXNldHMuaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAuLmJlOWE3Y2ENCi0tLSAvZGV2L251bGwNCisrKyBiL2luY2x1ZGUvZHQt
YmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxOTItcmVzZXRzLmgNCkBAIC0wLDAgKzEsMzAg
QEANCisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KKy8qDQorICogQ29w
eXJpZ2h0IChjKSAyMDIwIE1lZGlhVGVrIEluYy4NCisgKiBBdXRob3I6IFlvbmcgTGlhbmcgPHlv
bmcubGlhbmdAbWVkaWF0ZWsuY29tPg0KKyAqLw0KKw0KKyNpZm5kZWYgX0RUX0JJTkRJTkdTX1JF
U0VUX0NPTlRST0xMRVJfTVQ4MTkyDQorI2RlZmluZSBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJP
TExFUl9NVDgxOTINCisNCisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfTU1fU1dfUlNUCQkJCQkxDQor
I2RlZmluZSBNVDgxOTJfVE9QUkdVX01GR19TV19SU1QJCQkJMg0KKyNkZWZpbmUgTVQ4MTkyX1RP
UFJHVV9WRU5DX1NXX1JTVAkJCQkzDQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX1ZERUNfU1dfUlNU
CQkJCTQNCisjZGVmaW5lIE1UODE5Ml9UT1BSR1VfSU1HX1NXX1JTVAkJCQk1DQorI2RlZmluZSBN
VDgxOTJfVE9QUkdVX01EX1NXX1JTVAkJCQkJNw0KKyNkZWZpbmUgTVQ4MTkyX1RPUFJHVV9DT05O
X1NXX1JTVAkJCQk5DQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX0NPTk5fTUNVX1NXX1JTVAkJCTEy
DQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX0lQVTBfU1dfUlNUCQkJCTE0DQorI2RlZmluZSBNVDgx
OTJfVE9QUkdVX0lQVTFfU1dfUlNUCQkJCTE1DQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX0FVRElP
X1NXX1JTVAkJCQkxNw0KKyNkZWZpbmUgTVQ4MTkyX1RPUFJHVV9DQU1TWVNfU1dfUlNUCQkJCTE4
DQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX01KQ19TV19SU1QJCQkJMTkNCisjZGVmaW5lIE1UODE5
Ml9UT1BSR1VfQzJLX1MyX1NXX1JTVAkJCQkyMA0KKyNkZWZpbmUgTVQ4MTkyX1RPUFJHVV9DMktf
U1dfUlNUCQkJCTIxDQorI2RlZmluZSBNVDgxOTJfVE9QUkdVX1BFUklfU1dfUlNUCQkJCTIyDQor
I2RlZmluZSBNVDgxOTJfVE9QUkdVX1BFUklfQU9fU1dfUlNUCQkJMjMNCisNCisjZGVmaW5lIE1U
ODE5Ml9UT1BSR1VfU1dfUlNUX05VTQkJCQkyMw0KKw0KKyNlbmRpZiAgLyogX0RUX0JJTkRJTkdT
X1JFU0VUX0NPTlRST0xMRVJfTVQ4MTkyICovDQotLSANCjEuOC4xLjEuZGlydHkNCg==

