Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBF1236176F
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Apr 2021 04:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235058AbhDPCOK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Apr 2021 22:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235057AbhDPCOJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Apr 2021 22:14:09 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2104DC061574;
        Thu, 15 Apr 2021 19:13:46 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id g35so18171932pgg.9;
        Thu, 15 Apr 2021 19:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4aOl9WYg3lZW03MpbHK6GQG1irPulDKlcMdmsoDYUyM=;
        b=bnL7FccJsG4zTTkJBYehFLpBUVXBexu/pyNJ80IOWqbViQDw7z3C/kvtTNDfM2bzZr
         oDNQDWg5jLTENvwM1CT4YhJio8vD5aMBLl1R17FzJpALCLadHm3CPdbJNNsPdA4cY/4I
         XbiHdLJX5Z3/2oXc5ZJGRTW7KMarBWQ6jnnzR5pnWpR5ob80IGmBVNoooi8HZ3+s/t/P
         EdkhKKY8c44MGFBz+txDcSrUHJFH8PVVc7FtqOqkjlDzwvNJ2XcBZy9xd/y2O7O2pVrq
         Uw+v1zNmT4WN3vB5rdK6ZbtLM8DND5b+tGYU7RzCkT6Heg12fTBO/96323NN1bBsAsdI
         qqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4aOl9WYg3lZW03MpbHK6GQG1irPulDKlcMdmsoDYUyM=;
        b=WH+/Ww9ZuG90vJo7kORCh4F6pJj9FnbX/aq5ZDDYgxPZmt3nBWlgBPY6dqPlfeFg/c
         MyqLFOk5ownyx/k6bgkf/Y9gCx+MUKnKdvKAxpnIKH75gRIKwmTYt5Vf6oLjs5I0bIRM
         UkSeawi7q9rz5lGnNSsPjqcgUvidEh6WstWzlQZiYGn7hymF2vqjmS7sTLwPvMuX6eMg
         uIJWvrlBYLjqRbkpj1dz6f69Pg2LGzqA+LiYh+HfJSz5OAjj0fa1VIIeecJzH1pFbn6/
         hWqcjo+5/dXoQnfsKHJtg5znj5L18dY/PYLZOg/ySRrn36MCZ6gVPpA0RGfNozG5rXjp
         FX4Q==
X-Gm-Message-State: AOAM5306tIaWx7sxxanV0YHXp6liSo7fWisDn2IgLZ6gADy19S2XRNNk
        2gTUYS91ejDyeoB+wLxpoCs=
X-Google-Smtp-Source: ABdhPJzT1yDrVtxLd5Qh4dvbNL5uVKACMlcjXTmzw+HDicnrP+3i8/R73Qp6cm6BaCw/Uj8qOK/3Fw==
X-Received: by 2002:a05:6a00:2247:b029:25a:978:40b8 with SMTP id i7-20020a056a002247b029025a097840b8mr606588pfu.54.1618539225453;
        Thu, 15 Apr 2021 19:13:45 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id u25sm3407079pgk.34.2021.04.15.19.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 19:13:45 -0700 (PDT)
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
Subject: [PATCH v2] watchdog: aspeed: fix integer overflow in set_timeout handler
Date:   Thu, 15 Apr 2021 19:13:37 -0700
Message-Id: <20210416021337.18715-1-rentao.bupt@gmail.com>
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
 Changes in v2:
   - do not touch "wdd->timeout": only "max_hw_heartbeat_ms * 1000" is
     updated to "max_hw_heartbeat_ms / 1000".

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

