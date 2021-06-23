Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889913B11E9
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 04:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhFWCrX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 22:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbhFWCrX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 22:47:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0711C061574;
        Tue, 22 Jun 2021 19:45:06 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so468470pjo.3;
        Tue, 22 Jun 2021 19:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nG+pOWS0M1Gfo+8ACN/8exbFFB4o94YMeK4YKBZapj4=;
        b=cpNOD0m8KCln4XWBzXCOomTryHpX4+7fjUmu0naJBD3pDivMn28fjGbIoG1Mn0HDgw
         pkNRXwmd1ybS9wi50MtXc/hkARPDVFEDPYwGd9R4t/XL3vgAYxuN/rNlK5blPGCYGcrv
         c5BCCL71L/3wEu+IG4/DP8T7ssl1eYgMmqcYnCZ2tjj1DoxFKckRpcN2DV8A6Iu00wBJ
         88BJQPkjQUUg8gp48SB0rv8i7EttqSqJACftm8rpCbpkZS5RbL8TaLzcS05aAFgwMrqA
         ZC07hHSJZ3LYRi2KUXpWBYtjcoi7hZ29Javr2hCakL6Pi0exeew9ok2WUjte9b97tsbr
         ccjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nG+pOWS0M1Gfo+8ACN/8exbFFB4o94YMeK4YKBZapj4=;
        b=Zjx5EMRWZjYnOPSatYNgAeJy56JhN9ttcjQbBnHo9+sTAcIfMI004ZJy0eZ9sD2ZFm
         O4nehIpTaUf3lDMkPdnTJuXTc7Nqq+wD33X4XmCiC/LQg7iEEMeKz6WAoXSRYSLnr7Tn
         2mlO9PLLIAvHBYOZq54qIRlxjQ6Ox2IBskZ6pisW3sqpv2SgWkUgaFUvt6FfFXbG6FJK
         Wbz7tokq8rWsZK0Qsord+CEdpW8WxcBcxU8z/SQf3F+86sZPrmdpDBtIoTkW1OewiHir
         0HoRp+r7E1A8XIDGG4WzcbCL7Paxljeq4vDB2aQyUH2ACDeeUMQNFRB2qDcqF0r8/Lr7
         skOg==
X-Gm-Message-State: AOAM533PziM1fcdUH/11kumwccZxjz4mCNKzvic3iMIB7kF3sR+KkucT
        PYGUlg1yeDwtl+OkN65vOIU=
X-Google-Smtp-Source: ABdhPJwsLQJvoBHZ3TUXW9rr+r5o9aPuwYapZ4TRZKG3aXcbL73IaxtwdfygcLWNOILymoz7XNoxeA==
X-Received: by 2002:a17:903:31d3:b029:ee:bccd:e686 with SMTP id v19-20020a17090331d3b02900eebccde686mr25856408ple.1.1624416306583;
        Tue, 22 Jun 2021 19:45:06 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 19:45:06 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 2/5] watchdog: meson_gxbb_wdt: add timeout module param
Date:   Wed, 23 Jun 2021 10:44:26 +0800
Message-Id: <20210623024429.1346349-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Added timeout module param same as in other modules

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 3f86530c33b0..ecd1fc6f48ba 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -29,6 +29,11 @@
 #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
 #define GXBB_WDT_TCNT_CNT_SHIFT			16
 
+static unsigned int timeout = DEFAULT_TIMEOUT;
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
+		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -174,7 +179,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.ops = &meson_gxbb_wdt_ops;
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
-	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	data->wdt_dev.timeout = timeout;
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
 	/* Setup with 1ms timebase */
-- 
2.25.1

