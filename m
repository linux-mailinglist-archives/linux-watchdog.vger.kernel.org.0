Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCDD2F9D20
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 11:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389078AbhARKro (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 05:47:44 -0500
Received: from www.zeus03.de ([194.117.254.33]:47934 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389257AbhARJqu (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 04:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=FSLRqQVx5AIjHrzsXlHfYW1hoLX
        /ybhefgKMMKyZ9Kk=; b=lw1nL1iugO/W2prcUTYf9ulmUZYt6lj73VHtoUUQOoR
        9k7VkYLjW+6//FwkeEXYH3nqgp1p/4F0BIc+U6sjfBd9D7vPE+q106nRWHvdsGeC
        9KyIz9mP3hH8Vs4PZVq6gy0nVX96gN4KAKN0sXjCNWbhws22G6XnCnY1ahQMgqOQ
        =
Received: (qmail 647582 invoked from network); 18 Jan 2021 10:46:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jan 2021 10:46:08 +0100
X-UD-Smtp-Session: l3s3148p1@ublqlym51oYgAwDPXwacAOByz8F9Mgm1
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] watchdog: renesas_wdt: add grace period before rebooting
Date:   Mon, 18 Jan 2021 10:45:58 +0100
Message-Id: <20210118094558.36814-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

arm64 does not have a grace period after calling reset handlers. It is
rightfully assumed that watchdog drivers should wait because they know
the time needed. Implement this for the Renesas watchdog driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/renesas_wdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index d2b5074bca65..5791198960e6 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -151,6 +151,9 @@ static int rwdt_restart(struct watchdog_device *wdev, unsigned long action,
 
 	rwdt_write(priv, RWTCSRA_TME, RWTCSRA);
 
+	/* wait 2 cycles, so watchdog will trigger */
+	udelay(DIV_ROUND_UP(2 * 1000000, priv->clk_rate));
+
 	return 0;
 }
 
-- 
2.28.0

