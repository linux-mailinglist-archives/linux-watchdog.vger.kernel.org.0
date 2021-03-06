Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E2A32FAB4
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Mar 2021 13:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhCFMrP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 6 Mar 2021 07:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhCFMrE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 6 Mar 2021 07:47:04 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22532C06174A;
        Sat,  6 Mar 2021 04:47:04 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q20so4022517pfu.8;
        Sat, 06 Mar 2021 04:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ub/RM878x+/yo+HYb6HeLXrrco+SRSL5u/Q5amkWLtw=;
        b=nFnFDoZIPqYWVCWUyYqoy75hA20i5+6LiO8L041tSYqZm0rRYDKjT7+gllNbZXxpuv
         rgdXmYJY+4v7rM+7QlFJdiFXGwgMax6I6DzLbrYDaNVJ2eJfII7Gyb3hrQ9CMWxoZgB+
         mul3jFfBJdeZr1z5m/vRE0jpPJ5g80Ra4QlvBXz4vMmY2iJ90YHrAnklWPrLAnGyzONj
         3hGZTgyXzki8qWot7TDjJ4Inub/9rOlqgVpZq2nNnq1Z0BM7LWeZJDbfV/Pfh6IBY/dM
         6q42FPaR4Kd03GPMLbWn+NDUKFBT1DkUIm8hl8eiPkgtWl1JaIdGP7QjxvMcgVfmGGOT
         Sjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ub/RM878x+/yo+HYb6HeLXrrco+SRSL5u/Q5amkWLtw=;
        b=ecrZEh+ygp/E25oyD9avztuQ2iSp90MkxM9cTN5wJfQN3G2b9DzcG54vMkzsFUTDqS
         WvICbRcrRPdy7JHcGecaM3J+qaf1bzWjHWyr6/codAr05tZAxo3vrJv5GKCg05zJY1H7
         5jqrrxnn4kgXvBCshb+Ijc3GV1V59f97cu0LbHDxjzSnd/yED5twv3mXad0IlG7ZGvti
         0eAGP3E33XJyaAXnVHi0UIe968kNg+JY1ud+HwsJR6eRaeSoiSTaRcwJnrYzjC0Ldq60
         K83tkeIKttCaxIS18SG4tJTbZG/Ww4mqXZw6GMUpO+1YhnkDADMb/K5E07qdIy5pnVou
         xFkA==
X-Gm-Message-State: AOAM530GtrCZW48mLmP1ajDQcvilB2thEIW6yQGKSJvGVeB0d/b2VAUS
        IbBk1H1oaPVPGPIDUFZyYJcd9vZ+rP4=
X-Google-Smtp-Source: ABdhPJxd8dwMi5hN2uiG2rZhjc0tmAsP1rk3xleUg2LRaPYN1Uosu+19jQnrUQJbLIoFkz/mpYDSXA==
X-Received: by 2002:a62:80cf:0:b029:1f3:1959:2e42 with SMTP id j198-20020a6280cf0000b02901f319592e42mr1791611pfd.39.1615034823658;
        Sat, 06 Mar 2021 04:47:03 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
        by smtp.gmail.com with ESMTPSA id s12sm5176983pgj.70.2021.03.06.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 04:47:03 -0800 (PST)
From:   menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>
Subject: [PATCH] watchdog:dw_wdt: remove duplicate include
Date:   Sat,  6 Mar 2021 04:46:57 -0800
Message-Id: <20210306124657.219873-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'linux/kernel.h' included in 'dw_wdt.c' is duplicated.
It is also included in the 17th line.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/watchdog/dw_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 32d0e1781e63..b1642e2d9175 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -19,7 +19,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interrupt.h>
-- 
2.25.1

