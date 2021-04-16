Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E53C3616AF
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Apr 2021 02:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbhDPAMn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Apr 2021 20:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234764AbhDPAMn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Apr 2021 20:12:43 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E180C061574;
        Thu, 15 Apr 2021 17:12:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id t23so12975384pjy.3;
        Thu, 15 Apr 2021 17:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uOD33pWWzSYPL/0r0lD9kRWmPd2Gntdg/sWshNtZopQ=;
        b=s1H68uyiA8xZr1m0pvhQEKXukTF7w0kdfEjKzTB7M0AslrsTUFnckgp6j5PjoMi0/V
         A8dClVXat85tcE1+h1Ph0Hw6PXrknoaUDXPzKC61pdls3wN9f0zxSent7iHTnrdPKFcn
         Q84fWDl6P8WNvpLENrboT274s5+HBcrh+Nbm8gkmR8QRXLo5Z8uokTjva9/txgahX9FT
         LjGeOYsbxQ4dgHZ81c6ejSDhWkGp6dJhFg9KYB37298PzoiDSVEWKfZf3qcflyZtcZZF
         mTr5EaoKarVxSTmYVAuxQXwdw44T/B1WdhxrF8ATzLdPusShyX3JHN4rB5eU2VsLUNIF
         tPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uOD33pWWzSYPL/0r0lD9kRWmPd2Gntdg/sWshNtZopQ=;
        b=c6BEylMvKZ9UgoDG4K02EJbrQYIyqZLPogE9uG1Rupb6abjRSyA4NR/jf22K/YgQ5Z
         CTdiG17mwx3PJwIElf31PgDOQXz7zkXHGmTbdjwwW172YjryFbwOMVxm98hbY13cEXcw
         hpRcouf+YMvci64OPexGX7Y8fn/7BN9JGHfOCGRUWqsojr0t7tDHNTYKswfU4Tt8fN2N
         7NEPeC15Umscpfj02WHmVko1pHrctkV/RwV4nvRwlK5RXD5WOqq/QWhu4k2owrr11SZR
         HZL7TY23DseiFWz7Z7pTH34EUN2WN8HHoa0iDNjkcDB2cqyGi/JHFL3EmE7tz4PD8Rvw
         nWcA==
X-Gm-Message-State: AOAM533q9m7ge5sBTeSakQvTzIuJKU8AyR03LqlsQyrD6gOF26nWgq88
        X+sJX2svGmiCK5YWYOEnn2QGrUBVqyYB0/0A
X-Google-Smtp-Source: ABdhPJziviff8FmqFA3GpFk3TKqox3jUoOSSMevoRcrU2y1YmgbUbciZYiBwxLlCoVyAGMxBE42qVw==
X-Received: by 2002:a17:90a:352:: with SMTP id 18mr6329781pjf.223.1618531939116;
        Thu, 15 Apr 2021 17:12:19 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id p10sm3312611pgn.85.2021.04.15.17.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 17:12:18 -0700 (PDT)
From:   rentao.bupt@gmail.com
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>,
        Amithash Prasad <amithash@fb.com>
Cc:     Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH] watchdog: aspeed: fix integer overflow in set_timeout handler
Date:   Thu, 15 Apr 2021 17:12:08 -0700
Message-Id: <20210416001208.16788-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Tao Ren <rentao.bupt@gmail.com>

Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
handler to avoid potential integer overflow when the supplied timeout is
greater than aspeed's maximum allowed timeout (4294 seconds).

Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
Reported-by: Amithash Prasad <amithash@fb.com>
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 7e00960651fa..9f77272dc906 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -145,9 +145,8 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
 	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
 	u32 actual;
 
-	wdd->timeout = timeout;
-
-	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
+	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
+	wdd->timeout = actual;
 
 	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
 	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
-- 
2.17.1

