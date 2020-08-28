Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C557B25559D
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 09:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgH1Htu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 03:49:50 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:20893 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726571AbgH1Htt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 03:49:49 -0400
X-UUID: 552b9658b9b740db87259b1cbdace8cb-20200828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0EKafp0Drld7nVRG3II9HXY8sizTyEYsQ0QqqSX3Mxw=;
        b=a8d/peyy+GFrYEF9CYvnWm8+9kIJPVnJqhyXSuwUP9asBnqEA9mtfcOABJMTCUnXTfzAqnhVdk2TUlP1GKOQ62vq2e+iNmlToJalzwBREXamkeh7buqxW+5svNfoGo5So3eEWkgR4pjro6OAnQwnqScw/FO9QvIioUoYMXXY1QY=;
X-UUID: 552b9658b9b740db87259b1cbdace8cb-20200828
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <freddy.hsin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2003930412; Fri, 28 Aug 2020 15:49:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 15:49:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Aug 2020 15:49:46 +0800
From:   Freddy Hsin <freddy.hsin@mediatek.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
CC:     <wsd_upstream@mediatek.com>, <chang-an.chen@mediatek.com>,
        <kuohong.wang@mediatek.com>, <chun-hung.wu@mediatek.com>
Subject: [PATCH 0/1] Refine mtk wdt driver init flow
Date:   Fri, 28 Aug 2020 15:49:27 +0800
Message-ID: <1598600968-28498-1-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F61C1D996371B3870C761BAAAB54EFE1717CDD80FFDF00FED470060D87C340982000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

QWRkIG10a193ZHRfaW5pdCgpIGZ1bmN0aW4gaW4gcHJvYmUgZmxvdyB0byBkZXRlcm1pbmUNCmVu
YWJsZS9kaXNhYmxlIHRoZSBodyB3YXRjaGRvZyBieSBpdHMgb3JpZ2luYWwgc2V0dGluZw0KDQpG
cmVkZHkgSHNpbiAoMSk6DQogIGRyaXZlcjogd2F0Y2hkb2c6IEFkZCBtdGtfd2R0X2luaXQgZm9y
IG1lZGlhdGVrIHdhdGNoZG9nIGh3IGluaXQNCg0KIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5j
IHwgICAyMiArKysrKysrKysrKysrKysrKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg==

