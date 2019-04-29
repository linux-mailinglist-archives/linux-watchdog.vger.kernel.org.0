Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C2EEADD
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 21:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbfD2T2j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 15:28:39 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39187 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbfD2T2h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 15:28:37 -0400
Received: by mail-pl1-f196.google.com with SMTP id e92so5543717plb.6;
        Mon, 29 Apr 2019 12:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N16LaqSXsujrM14YSLIl8eePsGRALjhHNphPHlzavCU=;
        b=QnLEK9nPx93FypGtYt83qsBuN4twcEfhXjDmYpeJYXc5FAP6z5OHHbGoO1v7/3yEEH
         2qElset2x/BdOCz4a7q9QSa9bJG4PMH5xt/xM+U5dmul1RbeG8p0WoWmIPwTIjCEvW6l
         Pj8Hr9poK2w/zpeCbf7JdC2szhNrblS8S50r9nIHOf5pWT2gVSIHODYTsEyNnXT8HI9c
         iwUipWzG3QDub1obyT0746RnmauJ8juGLju4D3us5pBfFXewN09/Fepjltengl2HzCqD
         ndWCca9dcioLJuzd0HvBBbNNZtRdKuT0s0BEc3wzRzy4l1f91EE3MjPBApn0NfW1FiMt
         oAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=N16LaqSXsujrM14YSLIl8eePsGRALjhHNphPHlzavCU=;
        b=D/auvxGXkQMft/Eh0pGjMiFiGMC6gX5uQZILWl6YrAIxR2vNDCJJxwAOoo34gThKDa
         FQF9xxjZ4rpH/gf9jtA3tZu7oRemaDCVIU2L9l8WDL/Y3SjsWm0NWHsVODLEeLHQITCM
         F9Y8IAXUkrcm5ZXqSPLunzMHuViddYkOJyByl0g7w+4lQ4uowCGCoQj15cOKDrjFsYkv
         mNY4uq8P79neByviYCWDbLS9TBay8beXroD5gqMsRo29f/LpoQdlm1THzWYWdF9SG0Pl
         +9blRL1IJKUEZh0ibx38IZsj/dJXZngyUSocjHABti0vYoEwBiiVamtPz3yCuTDSDv8y
         09cw==
X-Gm-Message-State: APjAAAWD8gfVGZt3tux2dM0sA27p77oDpn58oYkr3clfD5zryOWFATFs
        eM/+jEVmJzmiFbzfg3WO7OA=
X-Google-Smtp-Source: APXvYqyfuGRoFhbNJ4GBIrQRUhkWfflW8mvlVE3AjOe4mbRBZzcfDkeC1KH3Y4zSsDWLzMbodl/TDQ==
X-Received: by 2002:a17:902:bf4a:: with SMTP id u10mr31756026pls.63.1556566116820;
        Mon, 29 Apr 2019 12:28:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a9sm45791477pfo.17.2019.04.29.12.28.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 12:28:36 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/5] watchdog: Move pretimeout governor configuration up
Date:   Mon, 29 Apr 2019 12:28:28 -0700
Message-Id: <1556566111-31970-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
References: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Watchdog pretimeout configuration was at the end of the Kconfig
file, after individual watchdog drivers, and thus easy to miss.
Move it right after basic watchdog option declarations.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 104 +++++++++++++++++++++++------------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index accbf75032ef..ac37a14439c7 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -63,6 +63,58 @@ config WATCHDOG_SYSFS
 	  Say Y here if you want to enable watchdog device status read through
 	  sysfs attributes.
 
+comment "Watchdog Pretimeout Governors"
+
+config WATCHDOG_PRETIMEOUT_GOV
+	bool "Enable watchdog pretimeout governors"
+	depends on WATCHDOG_CORE
+	help
+	  The option allows to select watchdog pretimeout governors.
+
+if WATCHDOG_PRETIMEOUT_GOV
+
+config WATCHDOG_PRETIMEOUT_GOV_NOOP
+	tristate "Noop watchdog pretimeout governor"
+	default WATCHDOG_CORE
+	help
+	  Noop watchdog pretimeout governor, only an informational
+	  message is added to kernel log buffer.
+
+config WATCHDOG_PRETIMEOUT_GOV_PANIC
+	tristate "Panic watchdog pretimeout governor"
+	default WATCHDOG_CORE
+	help
+	  Panic watchdog pretimeout governor, on watchdog pretimeout
+	  event put the kernel into panic.
+
+choice
+	prompt "Default Watchdog Pretimeout Governor"
+	default WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
+	help
+	  This option selects a default watchdog pretimeout governor.
+	  The governor takes its action, if a watchdog is capable
+	  to report a pretimeout event.
+
+config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP
+	bool "noop"
+	depends on WATCHDOG_PRETIMEOUT_GOV_NOOP
+	help
+	  Use noop watchdog pretimeout governor by default. If noop
+	  governor is selected by a user, write a short message to
+	  the kernel log buffer and don't do any system changes.
+
+config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
+	bool "panic"
+	depends on WATCHDOG_PRETIMEOUT_GOV_PANIC
+	help
+	  Use panic watchdog pretimeout governor by default, if
+	  a watchdog pretimeout event happens, consider that
+	  a watchdog feeder is dead and reboot is unavoidable.
+
+endchoice
+
+endif # WATCHDOG_PRETIMEOUT_GOV
+
 #
 # General Watchdog drivers
 #
@@ -2052,56 +2104,4 @@ config USBPCWATCHDOG
 
 	  Most people will say N.
 
-comment "Watchdog Pretimeout Governors"
-
-config WATCHDOG_PRETIMEOUT_GOV
-	bool "Enable watchdog pretimeout governors"
-	depends on WATCHDOG_CORE
-	help
-	  The option allows to select watchdog pretimeout governors.
-
-if WATCHDOG_PRETIMEOUT_GOV
-
-config WATCHDOG_PRETIMEOUT_GOV_NOOP
-	tristate "Noop watchdog pretimeout governor"
-	default WATCHDOG_CORE
-	help
-	  Noop watchdog pretimeout governor, only an informational
-	  message is added to kernel log buffer.
-
-config WATCHDOG_PRETIMEOUT_GOV_PANIC
-	tristate "Panic watchdog pretimeout governor"
-	default WATCHDOG_CORE
-	help
-	  Panic watchdog pretimeout governor, on watchdog pretimeout
-	  event put the kernel into panic.
-
-choice
-	prompt "Default Watchdog Pretimeout Governor"
-	default WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
-	help
-	  This option selects a default watchdog pretimeout governor.
-	  The governor takes its action, if a watchdog is capable
-	  to report a pretimeout event.
-
-config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP
-	bool "noop"
-	depends on WATCHDOG_PRETIMEOUT_GOV_NOOP
-	help
-	  Use noop watchdog pretimeout governor by default. If noop
-	  governor is selected by a user, write a short message to
-	  the kernel log buffer and don't do any system changes.
-
-config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
-	bool "panic"
-	depends on WATCHDOG_PRETIMEOUT_GOV_PANIC
-	help
-	  Use panic watchdog pretimeout governor by default, if
-	  a watchdog pretimeout event happens, consider that
-	  a watchdog feeder is dead and reboot is unavoidable.
-
-endchoice
-
-endif # WATCHDOG_PRETIMEOUT_GOV
-
 endif # WATCHDOG
-- 
2.7.4

