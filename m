Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36099299E70
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Oct 2020 01:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439255AbgJ0ALN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Oct 2020 20:11:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:60798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439253AbgJ0ALN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Oct 2020 20:11:13 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 070C720791;
        Tue, 27 Oct 2020 00:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603757472;
        bh=XWmWiMNyqi8F2iWBt3yqZc4NMaU6I2PQm1M1GdJkqRY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RO91yU39WvV8i4G9hUvEIjJhbRee2LRmK9JLVGo1yl9REM9mh7AjnLoI971TkMoTY
         Fux8w0QhH7cOo7KkzurDZPFt/jDhBRxEruV1NGUPWS/WrdSDy1GqRj/BBD6lmFK42Z
         rRIshbaVJgevhWtsYGRfGMH2jZ/JMyJJ0Nc4ekXU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Sasha Levin <sashal@kernel.org>, linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 24/30] drivers: watchdog: rdc321x_wdt: Fix race condition bugs
Date:   Mon, 26 Oct 2020 20:10:38 -0400
Message-Id: <20201027001044.1027349-24-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027001044.1027349-1-sashal@kernel.org>
References: <20201027001044.1027349-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

[ Upstream commit 4b2e7f99cdd314263c9d172bc17193b8b6bba463 ]

In rdc321x_wdt_probe(), rdc321x_wdt_device.queue is initialized
after misc_register(), hence if ioctl is called before its
initialization which can call rdc321x_wdt_start() function,
it will see an uninitialized value of rdc321x_wdt_device.queue,
hence initialize it before misc_register().
Also, rdc321x_wdt_device.default_ticks is accessed in reset()
function called from write callback, thus initialize it before
misc_register().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Link: https://lore.kernel.org/r/20200807112902.28764-1-madhuparnabhowmik10@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/rdc321x_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
index 47a8f1b1087d4..4568af9a165be 100644
--- a/drivers/watchdog/rdc321x_wdt.c
+++ b/drivers/watchdog/rdc321x_wdt.c
@@ -244,6 +244,8 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
 
 	rdc321x_wdt_device.sb_pdev = pdata->sb_pdev;
 	rdc321x_wdt_device.base_reg = r->start;
+	rdc321x_wdt_device.queue = 0;
+	rdc321x_wdt_device.default_ticks = ticks;
 
 	err = misc_register(&rdc321x_wdt_misc);
 	if (err < 0) {
@@ -258,14 +260,11 @@ static int rdc321x_wdt_probe(struct platform_device *pdev)
 				rdc321x_wdt_device.base_reg, RDC_WDT_RST);
 
 	init_completion(&rdc321x_wdt_device.stop);
-	rdc321x_wdt_device.queue = 0;
 
 	clear_bit(0, &rdc321x_wdt_device.inuse);
 
 	setup_timer(&rdc321x_wdt_device.timer, rdc321x_wdt_trigger, 0);
 
-	rdc321x_wdt_device.default_ticks = ticks;
-
 	dev_info(&pdev->dev, "watchdog init success\n");
 
 	return 0;
-- 
2.25.1

