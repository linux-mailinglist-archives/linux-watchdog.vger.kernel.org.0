Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86EC74806FE
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Dec 2021 08:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbhL1Hem (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Dec 2021 02:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235308AbhL1Hem (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Dec 2021 02:34:42 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBB8C06173E
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Dec 2021 23:34:42 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id z3so12997966plg.8
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Dec 2021 23:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XZGp/Og2JLoiZTQ5Xn+2ac/mEmvxQdHSb67vZpgQZio=;
        b=o0M/DxGSAmV168C/Rgzb09FN2MZLLukkNzNod1UEouN7p4ljaHU5A/JqfX3DB0mKdf
         3dKa/YzH+I2iSbxt8wxJfMWUCTOJanwdpXny7tRITn9lAGOoeQK7Af5GpzrVW1Uz5vtx
         0oBDPAZjius+FqOyi1LLsK6BeHAtFQtiO2LLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XZGp/Og2JLoiZTQ5Xn+2ac/mEmvxQdHSb67vZpgQZio=;
        b=sUKJIN9RBQRxVLznnCM12X64//GLCsK+4Xd4IENMwQzS/IlqCIKvVDfsIud6CknFNa
         OKYvMvXOb8UJwAm0hsg53twbO3ZSgQhJU1GTfQp0XUoJotY93HnXjnPgnFELhlh2UdRL
         AIBuzWPmTA/AReAfWEj32SLuGWHTcHOfenLO3i1V4Eyt7/MRaKsTbkjdZ6ask+9SNT0T
         nCcGbFqSQ9XCXMSVfc5tCZVRGfPKXveXuocuF1s4rhpxImf2vMT/Phfz4eng36tQV+4x
         B/x7BU0Qs+wYwLRiWf3+1BzbnsnEUKkds9WCbr9Nt0tvwv9LK+/WTppK4G+ita2mnXfd
         gi5A==
X-Gm-Message-State: AOAM532EOHJ/BYEOYyN12fkHwUY88nN9bN0gfsJ7BaUyCy3Hcg8kmoDE
        46ZfyaOfoi8NshIfdROL4eh7SA==
X-Google-Smtp-Source: ABdhPJz4MxcVRMaSHMqNCp6hhFY00f3woceMBYR/uguD+RLCfRBu3O5zxtWG6tkbHglFC7Mqzd1KVg==
X-Received: by 2002:a17:902:820f:b0:149:8d21:3e42 with SMTP id x15-20020a170902820f00b001498d213e42mr3723552pln.111.1640676881774;
        Mon, 27 Dec 2021 23:34:41 -0800 (PST)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id ke3sm22363800pjb.46.2021.12.27.23.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 23:34:41 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Cc:     romain.perier@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] watchdog: msc313e: Check if the WDT was running at boot
Date:   Tue, 28 Dec 2021 16:34:27 +0900
Message-Id: <20211228073427.2443174-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Check if the WDT was running at boot and set the running
flag if it was. This prevents the system from getting
rebooted if the userland daemon doesn't take over soon enough
or there isn't a userland daemon at all.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/watchdog/msc313e_wdt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
index 0d497aa0fb7d..90171431fc59 100644
--- a/drivers/watchdog/msc313e_wdt.c
+++ b/drivers/watchdog/msc313e_wdt.c
@@ -120,6 +120,10 @@ static int msc313e_wdt_probe(struct platform_device *pdev)
 	priv->wdev.max_timeout = U32_MAX / clk_get_rate(priv->clk);
 	priv->wdev.timeout = MSC313E_WDT_DEFAULT_TIMEOUT;
 
+	/* If the period is non-zero the WDT is running */
+	if (readw(priv->base + REG_WDT_MAX_PRD_L) | (readw(priv->base + REG_WDT_MAX_PRD_H) << 16))
+		set_bit(WDOG_HW_RUNNING, &priv->wdev.status);
+
 	watchdog_set_drvdata(&priv->wdev, priv);
 
 	watchdog_init_timeout(&priv->wdev, timeout, dev);
-- 
2.34.1

