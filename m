Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E654231996
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 08:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgG2Gba (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 02:31:30 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52502 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726816AbgG2Gb2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 02:31:28 -0400
X-UUID: 5b1173f6ff6345429c19a9826aab50cc-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8tvvtJkUNQwkHhqk8KQuaR8AggmTBYNhX5fZW/pno7U=;
        b=Mld/gkseXutwsk6fiVrO3dzsUzOhHWWKvByj+bkeBeKg5sIRuwoyzoHmPm+2lsylpi/ERzwLz/FBnwQmiBppaNj+mEL0TqtexereCe9dB/TbjOFDiSqmGHVEhTfqKpHa1YXxhYssFrjKzSFyu/Shb1WdTXn44Y+DthwVUynk4QE=;
X-UUID: 5b1173f6ff6345429c19a9826aab50cc-20200729
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <crystal.guo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 258468352; Wed, 29 Jul 2020 14:31:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 14:31:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 14:31:21 +0800
From:   Crystal Guo <crystal.guo@mediatek.com>
To:     <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <seiya.wang@mediatek.com>, <erin.lo@mediatek.com>,
        Crystal Guo <crystal.guo@mediatek.com>
Subject: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu reset-controllers
Date:   Wed, 29 Jul 2020 14:30:48 +0800
Message-ID: <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

bWVyZ2UgYWxsIHRoZSByZXNldCBudW1iZXJzIGluIG9uZSBoZWFkIGZpbGUuDQoNClNpZ25lZC1v
ZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+DQotLS0NCiBpbmNs
dWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXRrLXJlc2V0cy5oIHwgMTMgKysrKysr
KysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdGstcmVzZXRzLmgN
Cg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdGst
cmVzZXRzLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0LWNvbnRyb2xsZXIvbXRrLXJlc2V0
cy5oDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uZDczYTRiYQ0KLS0tIC9k
ZXYvbnVsbA0KKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC1jb250cm9sbGVyL210ay1y
ZXNldHMuaA0KQEAgLTAsMCArMSwxMyBAQA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wICovDQorLyoNCisgKiBDb3B5cmlnaHQgKEMpIDIwMjAgTWVkaWF0ZWsgSW5jLg0KKyAq
DQorICovDQorDQorI2lmbmRlZiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVEsNCisj
ZGVmaW5lIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01USw0KKw0KKyNkZWZpbmUgTVQy
NzEyX1RPUFJHVV9TV19SU1RfTlVNCTExDQorI2RlZmluZSBNVDgxODNfVE9QUkdVX1NXX1JTVF9O
VU0gICAgICAgIDE5DQorDQorI2VuZGlmDQotLSANCjEuOC4xLjEuZGlydHkNCg==

