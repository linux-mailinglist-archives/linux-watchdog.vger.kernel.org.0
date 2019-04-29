Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52DDEEAE2
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 21:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729167AbfD2T2w (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 15:28:52 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38143 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbfD2T2j (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 15:28:39 -0400
Received: by mail-pl1-f195.google.com with SMTP id f36so5548508plb.5;
        Mon, 29 Apr 2019 12:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=deTq7zeUED64od4fxOGcfQd1MxzcfH878U7uEsrlFg4=;
        b=WdBnsoM+xtup++LTNtJ78lv82AKUx20pvpS8dsymvIdduNB9EOBTazCYhvjgBc+imX
         Ix/uW852adQWx4pBgr5eUXQG/5XDh6hyL8Nmfo+y79Qr4TiC52r8fpGh+qX8Q0OwXAnz
         E5lxHA6bHRgWH3zSrbUKMjAvXpboT9nHm6cVzWuMGxVu737bg7/7GXzdjXBkypcv3XRm
         SqAEhkN6qrupI4aiohwuppefngKm1ZI5XgWKclBwkgyfOFT5f60CS1+QAY6gTQkda5sH
         K/z00HkooEyalU6tchEr+pKvXsAoQg3QTvUTD9dDKjsGmOecdRDLjZVARNEBjx+I59us
         qO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=deTq7zeUED64od4fxOGcfQd1MxzcfH878U7uEsrlFg4=;
        b=ZStOJOiLLP+z+kYs5dDiXYxqWbWlNNIp/Dh0Eio2ZUtex5vdAFvh1obBTGIAcSVve7
         fcXh38KLd++oPGhjdf0F2v+ls/ymHTKkIFfWpSlNuupzElvcP2s6eHnsGZFa6GyxGhHI
         vS8XJiWaMjhWjnZ8vj6xEKHx7WdibRaLq1gC7QeqSmpH1GeM1AsY7k/TOeduF0QB1Hty
         OVxoMEIlDrsZH+SJkDL5IMRPfjpfLb2Erxe7F56LMJK9MOr2fean1pJK9mWVGuqJO42Q
         kFPKns0vJcNix1t9YSrkx2PzjWn3UVyH8+9LddyMxkT6XOSJVN2/mHbl31EMMxKYG5jz
         N1/w==
X-Gm-Message-State: APjAAAXVz/KV0a0e7Lp2jSeQWh9jakd1wRTf6BBHwn64eofHzn/jvSAW
        NJ5POFw5rt3nzGtRC2nuzhQ=
X-Google-Smtp-Source: APXvYqxYdjnX4BHvCUfEq0FpCkyjCfLjM2UIXjMD0XX5xx0xujmqEEDZLCrX3BQp3GFe+cgqfM1B6A==
X-Received: by 2002:a17:902:26b:: with SMTP id 98mr34443210plc.30.1556566118261;
        Mon, 29 Apr 2019 12:28:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g6sm10302945pgi.70.2019.04.29.12.28.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 12:28:37 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/5] watchdog: Make watchdog core configurable as module
Date:   Mon, 29 Apr 2019 12:28:29 -0700
Message-Id: <1556566111-31970-3-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
References: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Under some circumstances it may be desirable to configure
the watchdog core as module. Enable it.

As part of this change, mark pretimeout governors as depending
on the watchdog core. This is necessary to prevent governors
from being built into the kernel if the watchdog core is built
as module.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index ac37a14439c7..c2d6934508ee 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -30,7 +30,7 @@ menuconfig WATCHDOG
 if WATCHDOG
 
 config WATCHDOG_CORE
-	bool "WatchDog Timer Driver Core"
+	tristate "WatchDog Timer Driver Core"
 	---help---
 	  Say Y here if you want to use the new watchdog timer driver core.
 	  This driver provides a framework for all watchdog timer drivers
@@ -75,6 +75,7 @@ if WATCHDOG_PRETIMEOUT_GOV
 
 config WATCHDOG_PRETIMEOUT_GOV_NOOP
 	tristate "Noop watchdog pretimeout governor"
+	depends on WATCHDOG_CORE
 	default WATCHDOG_CORE
 	help
 	  Noop watchdog pretimeout governor, only an informational
@@ -82,6 +83,7 @@ config WATCHDOG_PRETIMEOUT_GOV_NOOP
 
 config WATCHDOG_PRETIMEOUT_GOV_PANIC
 	tristate "Panic watchdog pretimeout governor"
+	depends on WATCHDOG_CORE
 	default WATCHDOG_CORE
 	help
 	  Panic watchdog pretimeout governor, on watchdog pretimeout
-- 
2.7.4

