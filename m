Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72ABB2AAC2E
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Nov 2020 17:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgKHQZy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 11:25:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgKHQZx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 11:25:53 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD64C0613CF;
        Sun,  8 Nov 2020 08:25:53 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id j7so7388018oie.12;
        Sun, 08 Nov 2020 08:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=y7H39mVcek5Gfl56DHtreNxTggw3nG3wMjBDYefwKcM=;
        b=Hkqc6KqANTQA9J7hn0qNGLRUAlI789x2UIJoG5SaxN+GcRD9H4JuunadDC/f25iian
         UKfA3zzoidXobrURZ95TdiBLmAObXjFkE5urNHNz1C+R5ZvlPFu9pJidxArPWoBWR2yG
         g/wXN475xGRXQTp+I+iZIGaagirPaRbHUkxhCJkPnhkvSMw70gsQA1Z+k71AYwRlF0f8
         HxTP5Tn+s+vwzYPgPuiKqLm9d3RNBX9OKWYnOvzDNgOr/R/qmKW5pLfijEMjUJPazela
         vtBfE7TTJpp7HsKGRGmP8l2OOPTesgwKNzlQ9hEsXxiWtpg+fPBQ7s+xJA2DUTX89hfG
         I/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=y7H39mVcek5Gfl56DHtreNxTggw3nG3wMjBDYefwKcM=;
        b=C2jXRgiJqY+QatZksEZFbqWx0HScagKBhc3a6t4cNm/simvANtmUUQ4KIg9rzJofC0
         SjE0MiKjnBZ1r0YTOLOyILvWQdzpPgb8ab56OxdftKdVbXvXxXOVw60K2fQ81YBYunjV
         /MuteQr0uoSqM24VwVT5HHkCkY1wuXk56eexcCHOg9IuRqDvjEv9jNtlr1iOjAsYb3hv
         OVuoUInUx6J3dcryL7VW7TBX+gofnpTLCO5OU8etf89KMoMo37SiBoe9MQmA7BKxhZjt
         oLndphgM4LGXh5WgVQ6UB0lD3ZvS2tWKZIHWP+5NwH3D8NYAMAwEbJuovyP00LtA8Wj0
         I2TA==
X-Gm-Message-State: AOAM5315DbzovSnYx0glOvsNLkQs6MxZ98FFxSD7K1GPhm+nhWNKxC2u
        fGQVM7ayb+x+UHFXQs1WHM8=
X-Google-Smtp-Source: ABdhPJxnrrMiXp39hxTKAWz6CjXselwNzDcNG3ayrWRQORvL9ZhRgigY1R9QPVpjInU+cePYhVEkDw==
X-Received: by 2002:aca:ed06:: with SMTP id l6mr6629612oih.2.1604852752994;
        Sun, 08 Nov 2020 08:25:52 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w18sm1875348otl.38.2020.11.08.08.25.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 08:25:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] watchdog: armada_37xx: Add missing dependency on HAS_IOMEM
Date:   Sun,  8 Nov 2020 08:25:49 -0800
Message-Id: <20201108162550.27660-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The following kbuild warning is seen on a system without HAS_IOMEM.

WARNING: unmet direct dependencies detected for MFD_SYSCON
  Depends on [n]: HAS_IOMEM [=n]
  Selected by [y]:
  - ARMADA_37XX_WATCHDOG [=y] && WATCHDOG [=y] && (ARCH_MVEBU || COMPILE_TEST

This results in a subsequent compile error.

drivers/watchdog/armada_37xx_wdt.o: in function `armada_37xx_wdt_probe':
armada_37xx_wdt.c:(.text+0xdc): undefined reference to `devm_ioremap'

Add the missing dependency.

Reported-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Fixes: 54e3d9b518c8 ("watchdog: Add support for Armada 37xx CPU watchdog")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index fd7968635e6d..b3e8bdaa2a11 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -386,6 +386,7 @@ config ARM_SBSA_WATCHDOG
 config ARMADA_37XX_WATCHDOG
 	tristate "Armada 37xx watchdog"
 	depends on ARCH_MVEBU || COMPILE_TEST
+	depends on HAS_IOMEM
 	select MFD_SYSCON
 	select WATCHDOG_CORE
 	help
-- 
2.17.1

