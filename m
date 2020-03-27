Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40F61195B08
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Mar 2020 17:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgC0QZA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Mar 2020 12:25:00 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:52785 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgC0QZA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Mar 2020 12:25:00 -0400
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 4148F22FEC;
        Fri, 27 Mar 2020 17:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1585326298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ng+Lsq19j4XccySd1d6Zbq1RgEHID3cA0n98wcptYNM=;
        b=Z1ioTCPtpUNNJjGvqanMVFj1JmYt5B8tJ2dbXANqJBgo+15dPaIlW8kwnOK6OJTL2Irgr5
        dzrQns9ckAW1p6tAErtD8//jekH1RrJAXLSbWnjYIujeVk+PWmDi8Wt6e9dj4ubXWW1t/b
        Fqa3j5vCmjtiHYV3d0TNgV+LjsWVzUM=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Jongsung Kim <neidhard.kim@lge.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH] watchdog: sp805: fix restart handler
Date:   Fri, 27 Mar 2020 17:24:50 +0100
Message-Id: <20200327162450.28506-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++
X-Spam-Level: ****
X-Rspamd-Server: web
X-Spam-Status: No, score=4.90
X-Spam-Score: 4.90
X-Rspamd-Queue-Id: 4148F22FEC
X-Spamd-Result: default: False [4.90 / 15.00];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         NEURAL_SPAM(0.00)[0.335];
         BROKEN_CONTENT_TYPE(1.50)[];
         RCPT_COUNT_FIVE(0.00)[6];
         DKIM_SIGNED(0.00)[];
         MID_CONTAINS_FROM(1.00)[];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:31334, ipnet:2a02:810c:8000::/33, country:DE]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The restart handler is missing two things, first, the registers
has to be unlocked and second there is no synchronization for the
write_relaxed() calls.

This was tested on a custom board with the NXP LS1028A SoC.

Fixes: 6c5c0d48b686c ("watchdog: sp805: add restart handler")
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/watchdog/sp805_wdt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index 53e04926a7b2..190d26e2e75f 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -137,10 +137,14 @@ wdt_restart(struct watchdog_device *wdd, unsigned long mode, void *cmd)
 {
 	struct sp805_wdt *wdt = watchdog_get_drvdata(wdd);
 
+	writel_relaxed(UNLOCK, wdt->base + WDTLOCK);
 	writel_relaxed(0, wdt->base + WDTCONTROL);
 	writel_relaxed(0, wdt->base + WDTLOAD);
 	writel_relaxed(INT_ENABLE | RESET_ENABLE, wdt->base + WDTCONTROL);
 
+	/* Flush posted writes. */
+	readl_relaxed(wdt->base + WDTLOCK);
+
 	return 0;
 }
 
-- 
2.20.1

