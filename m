Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F073A33E8E0
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Mar 2021 06:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhCQFSV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Mar 2021 01:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhCQFSG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Mar 2021 01:18:06 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AFCC06174A;
        Tue, 16 Mar 2021 22:17:55 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id n79so37760588qke.3;
        Tue, 16 Mar 2021 22:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v07pVEuhchhVaClqZdD0F36yggYeNuNt5/OwGOdNFhQ=;
        b=MuJ2vxbwbm/u/KzX/OGGGMdH8CSEMTCcTuRl9TYuJijrVNapUUDnuMa7zkoRR9TdXn
         fQ60G2am4zpKvbdmlYFpNIfY6X/rSGZubWy0f+cS2K/ByMzXE8Xr27Zcykf2gSnbY5T+
         wWIyrtMTRAV+xXq/u0UPGgCjT0SeDcSOn9upDFI+ZkHN7xTXINCbsb3Du9eGUvJv5gj1
         XVbCfJsFHjNr11MYHbsehobsKByQBvRznd33FsZU8dv03oqJPxsoAynm92isUfjy9KPg
         Hgs8iU0yHglLgBvRaJnNWESmPpvKTN2sNeVx7iqIIM06+KuGuC72pfBRljb2PCLtcQ2w
         NDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v07pVEuhchhVaClqZdD0F36yggYeNuNt5/OwGOdNFhQ=;
        b=UceA/+JSsiHa8bv9rC9wjW9X4Rk1Rf2PyMciT1T8jnUqmo1Xws5A5t8O4FpcEKsceB
         9D7OWUf6jGpF09UShOMXbVOToKbPBPHCg3EjtMXnN5v0fvIc3WChyQxxZYYLqdEnvrUa
         qMvCkgZhU+FEs7V7IY67Cjyen8gdMqFNGfGKlnvISi5KisxcGuHQafEwORP445/5AhIj
         Dsjw7H3SCnjkV10+jj+2sudLle9VE6WjR0PZ9B4uokIM6IhJGPf5apoWW1G2zg1WceiY
         98oXPIC1/YbdueQFGU+eUuwprXghxJKugZLvk2o9U2EXImd2pIhqtOnPTiZiK3dqVmiX
         fdAw==
X-Gm-Message-State: AOAM53267YeAH0UVZCFW3sP44avIOFfI3ohsWHXQMWcE03+KBnPG9yMT
        dL+Rrw+DYCj+y4SCNzzMDoA=
X-Google-Smtp-Source: ABdhPJxP8NXwAi4p8Z+v7Xpg4Lb+qgkDSyQ7heJzZT1/AMBR+dNlWEfbWA/82k59S3VpQhhqKcuhYw==
X-Received: by 2002:a05:620a:248e:: with SMTP id i14mr2852935qkn.245.1615958272724;
        Tue, 16 Mar 2021 22:17:52 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.5])
        by smtp.gmail.com with ESMTPSA id w5sm17111868qkc.85.2021.03.16.22.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 22:17:52 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] watchdog: Fix a typo in the file orion_wdt.c
Date:   Wed, 17 Mar 2021 10:47:34 +0530
Message-Id: <20210317051734.97314-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


s/freqency/frequency/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/watchdog/orion_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 4ddb4ea2e4a3..127eefc9161d 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -174,7 +174,7 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
 		return ret;
 	}

-	/* Fix the wdt and timer1 clock freqency to 25MHz */
+	/* Fix the wdt and timer1 clock frequency to 25MHz */
 	val = WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
 	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);

--
2.30.2

