Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBB444BA4F
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Nov 2021 03:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhKJC2e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 21:28:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbhKJC2d (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 21:28:33 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2963C061764;
        Tue,  9 Nov 2021 18:25:46 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id g28so833621pgg.3;
        Tue, 09 Nov 2021 18:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q5hdjzL4fx6MCYrF1luLAHmrqgFH4sajhljBKE+bpBg=;
        b=Wp+933VhmWr8dtWw/LmFTkCFPa157nh6dtoQBDi+ZbQOVf3NDHU9wcEzgG+H7BEI7K
         NLYHDVZoKBLpaQJMIEjYvlK3Bd/AHs17vskCadVZyTFRr0VdRi86b5RAMizT5UzaxWAs
         EkwfgaYc5n9QNImDflB5KLxL1KBdZC+2VEwXtYeo6zHrUxyzP7xy0NYs8GW6Iwd/ygzs
         RtdBVGVE6Ed7qcZCeUd4S6mfbS77ZXzIix9Gxlv/wp7h70D7WejVaL1L2g/x2nNxNIyO
         GnxU/Sd+s3ZebXJTQtOSNnIJTTvMvoS766KbPjeb1HLUWB4XnAc9i05bwChVHxjLIqDW
         SsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q5hdjzL4fx6MCYrF1luLAHmrqgFH4sajhljBKE+bpBg=;
        b=UV/lu9zhEl4W04gNbWPubqKN1qMC+LjCzMteE3sxPA5ruA6dNAAN6ExZpO8m7xR1lB
         f4iT5/V3Iz51ZdxckK0sWrwGt2gav6EPpkPBe3jG1dv/ZR4ttM0RucykuCwm2TZr0DI0
         tqsGLpmgi29C8YFjBWzlQU3MnZ9SiB78NzXYnzaxx9QLFEybf85G/Aq2gXq2k6LQugvM
         VqmmIvcPvWX0iEQSk8xJRO8xfomKNrIUEpzbV1iLqbXG4dJONgNM8aAaXkf6RU5ETsKp
         ePB1mMzImyB8yYwZZAxleEr5XMBkKujeSaC1GUMZryE4DbyVRd5lsdiBg4frP4wIej3Z
         FyjQ==
X-Gm-Message-State: AOAM530N1s7IMrR3zMwc1h61dedBCPWPdwvZj6KbuUN5oZsHFmb/BWhI
        DRNKB1ZWCTsBb8luHESiKAM=
X-Google-Smtp-Source: ABdhPJz1UTTIA0xBXm0xDek+ozp9l2COtEg6hY65GnBGdHEijkLASf7Z9daKMsPvfSp9vInmptn37A==
X-Received: by 2002:a63:b50d:: with SMTP id y13mr9418770pge.286.1636511146444;
        Tue, 09 Nov 2021 18:25:46 -0800 (PST)
Received: from localhost.localdomain (199.19.111.227.16clouds.com. [199.19.111.227])
        by smtp.gmail.com with ESMTPSA id ns21sm3647887pjb.37.2021.11.09.18.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 18:25:46 -0800 (PST)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Date:   Wed, 10 Nov 2021 10:25:18 +0800
Message-Id: <20211110022518.1676834-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Remove watchdog_stop_on_reboot()

The Meson platform still has some hardware drivers problems for some
configurations which can freeze devices on shutdown/reboot.

Remove watchdog_stop_on_reboot() to catch this situation and ensure that
the reboot happens anyway. Users who still want to stop the watchdog on
reboot can still do so using the watchdog.stop_on_reboot=1 module
parameter.

https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..3f86530c33b0 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -186,7 +186,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
-	watchdog_stop_on_reboot(&data->wdt_dev);
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
 
-- 
2.25.1

