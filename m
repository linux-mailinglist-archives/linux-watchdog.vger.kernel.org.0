Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2ECEAE0
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 21:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbfD2T2m (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 15:28:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45666 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbfD2T2m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 15:28:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id e24so5807151pfi.12;
        Mon, 29 Apr 2019 12:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o/V5fcdJjHEEGhSr+L86I9P3xGJAwwcDCT1sez3UiKw=;
        b=nPu/PKPFoX/38S1YWGpLVmvQoEwJC1O4gPJeWphYcE7+DFCKUfTYc/NBkutehamSYl
         mRwpDB4MoyGKDNREQURyD+bx/dibN/Yex6UmJlp6Gtbyki2fWshJq6kM6nyB47K8FJ7X
         fcda8RDnbnLVMI7EPUCMGljbyU4jXfLSGObTDIS9QpRlEQwL2FXckAGnnbseXnsEBCJD
         oCxGeU12npDMpfgMJP6nWzusABFo9Mlmm5ec284I/94dgkq34/VoXU7nSP/1iTId3RM+
         KFoIgsa3W0QMBLdLveyrRADeuOe/YdrYPP7s0QH5O+GqhjsvFWwUVHlVwndTG7Sa5g1U
         bpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=o/V5fcdJjHEEGhSr+L86I9P3xGJAwwcDCT1sez3UiKw=;
        b=UVkB40GNaxOusMQvUBx+gN7nJjZeMrXd3v1ao+i1Xer6BldZ8402tb676BfzpTizkE
         yJAXAQ42ge5cTxJMz9DUXCearI2QLDBOI+Kj08Cxz+bkI8NyW1dsJT7rI1egdnx00Oea
         rV3u92+aOAeEX4AFoE/Z2RwBy7JmZyNvLC8bv7vFkRI5j3q+ut9UoFuhy8yHs1sedPIU
         L1yxkF4ikhgaxNpLGRPm81WnGu1I29R+nv6KwLG3OF/3FnLvvESJJDsBC7VeMWtQ0QLd
         UVcY1HEhPJVy23fUpD1OV2Q4YPZXoS3VkPWzmZjLICKCuCgZn0ZoEFZw3RdExH3g6eSk
         jIEQ==
X-Gm-Message-State: APjAAAWcbZlszINMbpidn+prsG4dDu9w9Yoq67FBroPh+05gm3BiZcsI
        7+0UXCKiELhykpoc+I9dxmM=
X-Google-Smtp-Source: APXvYqyDtDtNh2iUnupV7AxXjhggYBZjnzLIl3wltJ3lU9zLmxLNJ2BNEW2EYpwoyIgQzhPW3oIBrA==
X-Received: by 2002:a65:5687:: with SMTP id v7mr19072678pgs.299.1556566121015;
        Mon, 29 Apr 2019 12:28:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j20sm48495489pfn.84.2019.04.29.12.28.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 12:28:40 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/5] watchdog: Improve Kconfig entry ordering and dependencies
Date:   Mon, 29 Apr 2019 12:28:31 -0700
Message-Id: <1556566111-31970-5-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
References: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

HPWDT_NMI_DECODING depends on HP_WATCHDOG and should be next to it.
This helps menuconfig identify HPWDT_NMI_DECODING as depending on
HP_WATCHDOG.

BCM_KONA_WDT_DEBUG depends on BCM_KONA_WDT which depends on COMPILE_TEST.
Enabling BCM_KONA_WDT_DEBUG without BCM_KONA_WDT does not make sense,
so drop the COMPILE_TEST dependency from it. This also improves
menuconfig, which now properly associates BCM_KONA_WDT_DEBUG with
BCM_KONA_WDT.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index e5b30c4947d7..f457992487ea 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1261,6 +1261,15 @@ config HP_WATCHDOG
 	  To compile this driver as a module, choose M here: the module will be
 	  called hpwdt.
 
+config HPWDT_NMI_DECODING
+	bool "NMI support for the HP ProLiant iLO2+ Hardware Watchdog Timer"
+	depends on HP_WATCHDOG
+	default y
+	help
+	  Enables the NMI handler for the watchdog pretimeout NMI and the iLO
+	  "Generate NMI to System" virtual button.  When an NMI is claimed
+	  by the driver, panic is called.
+
 config KEMPLD_WDT
 	tristate "Kontron COM Watchdog Timer"
 	depends on MFD_KEMPLD
@@ -1272,15 +1281,6 @@ config KEMPLD_WDT
 	  This driver can also be built as a module. If so, the module will be
 	  called kempld_wdt.
 
-config HPWDT_NMI_DECODING
-	bool "NMI support for the HP ProLiant iLO2+ Hardware Watchdog Timer"
-	depends on HP_WATCHDOG
-	default y
-	help
-	  Enables the NMI handler for the watchdog pretimeout NMI and the iLO
-	  "Generate NMI to System" virtual button.  When an NMI is claimed
-	  by the driver, panic is called.
-
 config SC1200_WDT
 	tristate "National Semiconductor PC87307/PC97307 (ala SC1200) Watchdog"
 	depends on X86
@@ -1729,7 +1729,7 @@ config BCM_KONA_WDT
 
 config BCM_KONA_WDT_DEBUG
 	bool "DEBUGFS support for BCM Kona Watchdog"
-	depends on BCM_KONA_WDT || COMPILE_TEST
+	depends on BCM_KONA_WDT
 	help
 	  If enabled, adds /sys/kernel/debug/bcm_kona_wdt/info which provides
 	  access to the driver's internal data structures as well as watchdog
-- 
2.7.4

