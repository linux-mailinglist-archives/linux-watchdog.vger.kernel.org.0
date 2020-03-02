Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC73E17563E
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2020 09:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgCBIqm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Mar 2020 03:46:42 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:47841 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726887AbgCBIql (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Mar 2020 03:46:41 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R441e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=zhangliguang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0TrOpVf5_1583138783;
Received: from localhost(mailfrom:zhangliguang@linux.alibaba.com fp:SMTPD_---0TrOpVf5_1583138783)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 02 Mar 2020 16:46:30 +0800
From:   luanshi <zhangliguang@linux.alibaba.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        luanshi <zhangliguang@linux.alibaba.com>
Subject: [PATCH] watchdog: sbsa_gwdt: disable watchdog when system panic was trigged by signal WS0
Date:   Mon,  2 Mar 2020 16:46:21 +0800
Message-Id: <1583138781-40936-1-git-send-email-zhangliguang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When ARM SBSA Generic Watchdog worked in the two stages mode by setting
module parameter action to 1, when the timeout is reached, the first
signal (WS0) will trigger panic. Before panic, the value of register
SBSA_GWDT_WCS was 0x0, after panic and system startup, the value of
register SBSA_GWDT_WCS was 0x7, status bits SBSA_GWDT_WCS_EN
SBSA_GWDT_WCS_WS0 and SBSA_GWDT_WCS_WS1 were set, this will increase the
refcnt of module sbsa_gwdt by function watchdog_cdev_register because
flag WDOG_HW_RUNNING was set, so we cannot unload the module again. To be
consistent with reboot, watchdog should be disabled when system panic was
trigged by signal(WS0).

Signed-off-by: Liguang Zhang <zhangliguang@linux.alibaba.com>
---
 drivers/watchdog/sbsa_gwdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index f0f1e3b..6bee5bb 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -194,6 +194,12 @@ static int sbsa_gwdt_stop(struct watchdog_device *wdd)
 
 static irqreturn_t sbsa_gwdt_interrupt(int irq, void *dev_id)
 {
+	struct sbsa_gwdt *gwdt = (struct sbsa_gwdt *)dev_id;
+	struct watchdog_device *wdd = &gwdt->wdd;
+
+	if (wdd->ops->stop)
+		wdd->ops->stop(wdd);
+
 	panic(WATCHDOG_NAME " timeout");
 
 	return IRQ_HANDLED;
-- 
1.8.3.1

