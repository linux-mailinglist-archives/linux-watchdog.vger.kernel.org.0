Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25662987FB
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Oct 2020 09:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771223AbgJZIJu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Oct 2020 04:09:50 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:45390 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1771221AbgJZIJu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Oct 2020 04:09:50 -0400
Received: by mail-pf1-f169.google.com with SMTP id e7so5747729pfn.12;
        Mon, 26 Oct 2020 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PyCGWsOQRaRBz3bX2fA1LoPk8Xi0fdZXGJLF+2HpK0Q=;
        b=o/S0pKmc5aE/Z6ROq/vvk5oQat8R9FKogg7pijW9KwyM17j85pEcgg4NhV4yPjfC1h
         F8M23asWC52BxJt5ZYgVPmua8mBtFq2ImfdpbpCNH2Q5mWyti8OyuAyRY+DeTJcgXErx
         RpCsKNNvBx+V/Jb8V7XhFQ9OvwGjgzzAHtx+xbb1bYffJ794RepW0JYNFBHuNyEM/erH
         fH4AGcMQW3N6DEsRdQQwBfB6zZjF/agTAT5rNMg15YxM9B5NqKQ2RaaYgSaqEe4qazuv
         HAlwEYY4aCN9RrA3hgr7ApUpWWYvEVI5R2cr4Dn2+rEznyoS4OWbM5+00l75M7wIA2O3
         O8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PyCGWsOQRaRBz3bX2fA1LoPk8Xi0fdZXGJLF+2HpK0Q=;
        b=Z30cwunLFr8S3QGR82uT60U3MiR+HP4AbC4RBagUU0C6cMPXdnBv32fh4A2SXceHUh
         qCJtQmz/fdx1+8HxfkqmzNQVnI6283jRc/je/bWDGU+KNOMGwcwfbfOUjbILscZ4alpI
         AXgDhGrIAI5Fs6UzQv3iu0HTd15MHM7ub7d0zZ9cdQLNayzQAN93l8jtRkkg2nENeGro
         qALx68P0v1sOMLNajXGYyouryetdGv8Avjsje+d4qemoj5i0YZzNQuuknBUm2sgOhRXQ
         W5tmF/LOMBkbL5lXJDp2yBFllY3bD21T5zs4pHW4fIhsajYUXsS/HmuDAOhs69ePyHXp
         NXoQ==
X-Gm-Message-State: AOAM533H7YpXoEipTVgnTHFyoJth8oNNnJIZjOwGIzxZexQXWSKXQLRp
        MdzwuzheBviXrIa4ZTEqGbhUJMzzoTo=
X-Google-Smtp-Source: ABdhPJyfaU8JVwHNQPjVpv/HCZHqRuDrcijxAXpih76vx/00Q8i2TFcQ8iGZd7p9YWmDG+1kRsW+Kw==
X-Received: by 2002:a05:6a00:23c6:b029:158:1257:de73 with SMTP id g6-20020a056a0023c6b02901581257de73mr12496047pfc.10.1603699789347;
        Mon, 26 Oct 2020 01:09:49 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id j2sm542825pgi.48.2020.10.26.01.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 01:09:48 -0700 (PDT)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH 2/3] watchdog: sprd: change timeout value from 1000 to 2000
Date:   Mon, 26 Oct 2020 16:09:18 +0800
Message-Id: <20201026080919.28413-3-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201026080919.28413-1-zhang.lyra@gmail.com>
References: <20201026080919.28413-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Lingling Xu <ling_ling.xu@unisoc.com>

Because cpu_relax() takes different time on different SoCs, for some rare
cases, it would take more than 1000 cycles for waitting load operation
finished. The result of many times testing verified that changing the
timeout value to 2000 can solve the issue.

Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/watchdog/sprd_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index f3c90b4afead..4f2a8c6d6485 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -53,7 +53,7 @@
 
 #define SPRD_WDT_CNT_HIGH_SHIFT		16
 #define SPRD_WDT_LOW_VALUE_MASK		GENMASK(15, 0)
-#define SPRD_WDT_LOAD_TIMEOUT		1000
+#define SPRD_WDT_LOAD_TIMEOUT		2000
 
 struct sprd_wdt {
 	void __iomem *base;
-- 
2.20.1

