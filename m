Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E882E2A2C
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Dec 2020 08:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgLYHbm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Dec 2020 02:31:42 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:42195 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725863AbgLYHbm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Dec 2020 02:31:42 -0500
X-UUID: 4d977d7f358f4cbf89c84b3d1ddaf3c4-20201225
X-UUID: 4d977d7f358f4cbf89c84b3d1ddaf3c4-20201225
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <freddy.hsin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 35544531; Fri, 25 Dec 2020 15:30:55 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 15:30:53 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 15:30:53 +0800
From:   Freddy Hsin <freddy.hsin@mediatek.com>
To:     Freddy Hsin <freddy.hsin@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <wsd_upstream@mediatek.com>, <chang-an.chen@mediatek.com>,
        <kuohong.wang@mediatek.com>
Subject: driver: watchdog: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem 
Date:   Fri, 25 Dec 2020 15:30:49 +0800
Message-ID: <1608881450-11081-1-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Before user space daemon start to access the watchdog device,
there is a time interval that watchdog is disabled in the
original flow. If the system freezing at this interval, it
cannot be rebooted by watchdog hardware automatically.

In order to solve this problem, the watchdog hardware should be
kept working, and start hrtimer in framework to ping it by
setting max_hw_heartbeat_ms and HW_RUNNING used in
watchdog_need_worker to determine whether the worker should be
started or not

