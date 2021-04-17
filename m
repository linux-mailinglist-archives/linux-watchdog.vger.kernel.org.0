Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1EB362D5A
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 Apr 2021 05:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235589AbhDQDnX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 16 Apr 2021 23:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbhDQDnX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 16 Apr 2021 23:43:23 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A314AC061574;
        Fri, 16 Apr 2021 20:42:57 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id y32so20448488pga.11;
        Fri, 16 Apr 2021 20:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KEgAGlMIMGSD4Y3PLpFSkmFQK4X2O5FS+oaEvb1q+lY=;
        b=K0b5nLAizD7TGQDjgaOycW3pVacY3L7Ep+L1M4RObdMN2U6homi3AL+6ANBGRcLLyP
         wk2KHAqRuihRNK6M8acRbWXEB0Yl5BTqeVmylR0C3oBJkWqwK/TMaIKX9RziEPXg30as
         njFyJGypqwQaTqgu51A9+FAsuVyKn9MV7JecT/nWsdZrWboOJ9fWObm2t0QhjdsHZUaJ
         nNQceK0PgPxSCKW8hCWNwXpGqh0yWzx/fhIG7ta341FjY68/Gbaz4qLCPTvlRk4JyIwX
         R9r/KuAf3Fa3rKTMMiOOp7VTE/aytP8eME68cR+Kq4UukzCmlj+h07YXZOeBOhnirMgu
         WcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KEgAGlMIMGSD4Y3PLpFSkmFQK4X2O5FS+oaEvb1q+lY=;
        b=bj6tPsx2uB8SDwuEDf34IX/oDr2wxO+STpeaDky3im2I7IqkDx88V6K7mFX2uNoDEL
         UJiG9mo9bV0dW3SUNtbJKU7gzPe5C24AnEENTch3LeBtkFU5SrOOsKTZqKUqzVx/9DKl
         tOOzWG20ogFEMftCApk8Cwq4fBG4Qns8/vB9lmQMLchbu6Y2SicpwjEY6EZfVgjK2MRu
         iTpHnmhbDxcMHHwa5fUHPAZG72ssnPhzoaSTqLsSq6zPVRNLv3wQF6oSu/R+N2633fcL
         kPQ2R5aHsE3L+YNgKlD2DX6JBE8wWb6U4kK1JTxa5+TPsHdJcphlRNg1nmQ7d4flmiLk
         w+Pg==
X-Gm-Message-State: AOAM531fae2M2zv/xuzdRsJHElNIDioiNkdsWg/m8hj2XNo+Iem+azeE
        vGrNOU5JbHiSMSLXhcrWPpAeVRUd7hynNagNqnQ=
X-Google-Smtp-Source: ABdhPJz8p4ON3M1hNgneJYgt8P2lIK0ojWFajm7V/CS2x1h65e9dsl/vMa9ItbnRupxHrr2DLFfO/g==
X-Received: by 2002:a63:c14c:: with SMTP id p12mr1872172pgi.417.1618630977196;
        Fri, 16 Apr 2021 20:42:57 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id f18sm4434821pfk.144.2021.04.16.20.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 20:42:56 -0700 (PDT)
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
Subject: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Date:   Fri, 16 Apr 2021 20:42:49 -0700
Message-Id: <20210417034249.5978-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Tao Ren <rentao.bupt@gmail.com>

Fix hardware timeout calculation in aspeed_wdt_set_timeout function to
ensure the reload value does not exceed the hardware limit.

Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
Reported-by: Amithash Prasad <amithash@fb.com>
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 7e00960651fa..507fd815d767 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -147,7 +147,7 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
 
 	wdd->timeout = timeout;
 
-	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
+	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
 
 	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
 	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
-- 
2.17.1

