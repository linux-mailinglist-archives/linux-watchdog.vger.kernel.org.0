Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 466B011BEC5
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2019 22:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfLKVCN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Dec 2019 16:02:13 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:39611 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfLKVCM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Dec 2019 16:02:12 -0500
Received: by mail-pj1-f65.google.com with SMTP id v93so65462pjb.6;
        Wed, 11 Dec 2019 13:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4x089GCW851wB44OMyqqrKLGIDjDoejo+eqllaL+RO8=;
        b=DVhZZmb1Ph8PNvtFOTR1oLnqYgtXOKOimqKsQvbZaNkfqksw9W4XLv+agXbU3UNlqZ
         T0fjMvF9d+WiK5foM9BMC5F8TDRxGQTl59GNQdVK7yAmIfhWwMeVSVjapzIFxVqp/OmA
         zVaJMoLEaFWnenDaaLBMWsB0abNfWzSEEQiAOxhyE0J93Boa4E9KTlH0FZ0pVPorZd19
         hBoe8mWPuAgJi0uR/7X2KLDx7uKyQ+DyN7Ox/0wFrVes1CB9gRl91sjKjRR2zI0zxAhq
         5MPWn9unRJBLrDGyN8zTCZMIVR1W5VOQWPWW/ynoHzAdjC7Zd9QSpEtQscuiXFNWfN7m
         lgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4x089GCW851wB44OMyqqrKLGIDjDoejo+eqllaL+RO8=;
        b=tTX7bEJOgNBCYK1bC76O3bDZdv+h/dmo2UvoEcTJ+vdL8/7ukSbXcpZsUSBwzTlJRz
         DjF0gZUH2jO3lEB4eNbqTymIt+fm/tH2ohzDnHS+MUZyTq9pwlQ7FHdCujoQIbMLZFE7
         0U+OH0HnFY7zNKmWYX9+8SmFueYgLhuqWWs57nx1eQ1wEiO51M/FxbTeS5UpIcXbH7Ra
         NpKbcVaVMQTk4f0luYiAE0HmgysmXEBeDKQbBKLy6Lkh6EE05wSU22v3MAVl2YjJEHUh
         5OvjeFIBokpChSi+LHGZX9dyEzYgj5DarZY+wCIvxFkfW0KI7v9NjBMQKwEC8jxgXxq2
         uM4g==
X-Gm-Message-State: APjAAAVBbod+B6kckPTyYtD4q8qgfbZvPq84OeKWiybKvYblPg7uPsqo
        rUyhF20Deot2kRxDcU36SbsDvwgT
X-Google-Smtp-Source: APXvYqyyY/Dbrnw0FV5dlFmqhznPeyzwP+1Mj66Anb+Yn3qsn7WOSC0uSzUmLG18uUkb4Xk/7GPAYA==
X-Received: by 2002:a17:90a:c385:: with SMTP id h5mr5729970pjt.122.1576098131406;
        Wed, 11 Dec 2019 13:02:11 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g19sm4062137pfh.134.2019.12.11.13.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 13:02:10 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org (open list),
        linux-mips@linux-mips.org, Paul Burton <paulburton@kernel.org>,
        Denis Efremov <efremov@linux.com>
Subject: [PATCH 2/2] watchdog: Relax dependencies for CONFIG_WDT_MTX1
Date:   Wed, 11 Dec 2019 13:02:04 -0800
Message-Id: <20191211210204.31579-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211210204.31579-1-f.fainelli@gmail.com>
References: <20191211210204.31579-1-f.fainelli@gmail.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Now that we have dropped the inclusion of a machine specific header, we
can allow the driver to be compile tested beyond just MIPS.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 1679e0dc869b..982897ff074e 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1651,7 +1651,7 @@ config JZ4740_WDT
 
 config WDT_MTX1
 	tristate "MTX-1 Hardware Watchdog"
-	depends on MIPS_MTX1 || (MIPS && COMPILE_TEST)
+	depends on MIPS_MTX1 || COMPILE_TEST
 	help
 	  Hardware driver for the MTX-1 boards. This is a watchdog timer that
 	  will reboot the machine after a 100 seconds timer expired.
-- 
2.17.1

