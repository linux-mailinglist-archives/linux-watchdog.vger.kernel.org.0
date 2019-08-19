Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 948B794F26
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfHSUhT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34235 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfHSUhT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id c7so2951136otp.1
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=PQ0zaDzdDJ6UtQk6w4zWTK2JD2j0cuDEtJE7gO5QF1Y=;
        b=POpI2NEzf1RtprsdvzsDV277pRkBkgLc/LRw6WaVUAxhvieEjPKAGKjjFahGJtEh1N
         EOxqHV23EHvZ+fP5yPh6dTr8nUyvn9XszVEoetL8AEz3bdO5J3Qxm1g3fMbav9WhRTjl
         sx6qg8F6tx5pQC6fqEgsnBp/tg0x0100d4IUvbrF0MQEGicXyBoEjtzcAM19wviVmlaP
         m/KjkpUdO4TbaBwH1vlxiz01y/2HtY1/PE4DeRzigfgi1oGXYmERvaR0LCnyP3JCiFsW
         9Suv5kPaaUSXA+EAoxlPIGzl1cnughcl0Dt9SQ0o1OHDFmWEQ/tfoYywSkyDg8N+3J75
         /fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=PQ0zaDzdDJ6UtQk6w4zWTK2JD2j0cuDEtJE7gO5QF1Y=;
        b=BjYSEqS2sTDRhPOq9pQESaNksixaxgszd47Fa8ZSwiCYMCy7qq21y/tFzUo4FEbJQR
         7oEfIxvOWW/SI1DFgQhA6dkWa0hdCh3pM/N1O0IVqrH7md654C/gHvp9Q2ASxcxyvqnu
         81vw2ieCrPdqqPFUw/RxanVYYJU6GckLYR2EbLTNayjKWzqzQWSaC0hL4vdDVkQFMUdo
         lko+KeWa/KhbnHvyOGfpsNrGOmYa8yrsyNBdVR7EQf4BxSb56FEKrMA1Ja+brp9qy+gf
         /7HuPp/GczfyYHRwrtPDlawhKvkgbz+WaCxNfFO9XxnGgvDU2FIO3MqJYoNzoej7fv22
         5vfg==
X-Gm-Message-State: APjAAAVXZtAl1KfVitarK14DZEYvwg1LJdELx7TBC1uGZ44JF3enjuN7
        A4FpB1trGLouUnNG4O2seQ==
X-Google-Smtp-Source: APXvYqwfTfS8nS/MByI7yIDw/ahDVTgpMIt7G9RLA+Xm1R53K31xs47gvC19CoZEe075AHPNb0Njwg==
X-Received: by 2002:a9d:5911:: with SMTP id t17mr18700345oth.159.1566247037838;
        Mon, 19 Aug 2019 13:37:17 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id d62sm4620771oia.28.2019.08.19.13.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id 446321805AA;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id 2C729301176; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 05/12] watchdog:ipmi: Move the IPMI watchdog to drivers/watchdog
Date:   Mon, 19 Aug 2019 15:37:04 -0500
Message-Id: <20190819203711.32599-6-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819203711.32599-1-minyard@acm.org>
References: <20190819203711.32599-1-minyard@acm.org>
Reply-To: "[PATCH 00/12]"@minyard.net, Convert@minyard.net,
          the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
          to@minyard.net, the@minyard.net, standard@minyard.net,
          interface@minyard.net
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

It probably belongs there, and it will need access to the
watchdog_pretimeout.h file when converted over to the standard
watchdog interface.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 MAINTAINERS                                     | 1 +
 drivers/char/ipmi/Kconfig                       | 5 -----
 drivers/char/ipmi/Makefile                      | 1 -
 drivers/watchdog/Kconfig                        | 6 ++++++
 drivers/watchdog/Makefile                       | 1 +
 drivers/{char/ipmi => watchdog}/ipmi_watchdog.c | 0
 6 files changed, 8 insertions(+), 6 deletions(-)
 rename drivers/{char/ipmi => watchdog}/ipmi_watchdog.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6426db5198f0..760bcf92fde1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8456,6 +8456,7 @@ F:	Documentation/IPMI.txt
 F:	drivers/char/ipmi/
 F:	include/linux/ipmi*
 F:	include/uapi/linux/ipmi*
+F:	drivers/watchdog/ipmi_watchdog.c
 
 IPS SCSI RAID DRIVER
 M:	Adaptec OEM Raid Solutions <aacraid@microsemi.com>
diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 4bad0614109b..5f310ff0bd89 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -81,11 +81,6 @@ config IPMI_POWERNV
        help
          Provides a driver for OPAL firmware-based IPMI interfaces.
 
-config IPMI_WATCHDOG
-       tristate 'IPMI Watchdog Timer'
-       help
-         This enables the IPMI watchdog timer.
-
 config IPMI_POWEROFF
        tristate 'IPMI Poweroff'
        help
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 0822adc2ec41..a9edcd473615 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_IPMI_DMI_DECODE) += ipmi_dmi.o
 obj-$(CONFIG_IPMI_PLAT_DATA) += ipmi_plat_data.o
 obj-$(CONFIG_IPMI_SSIF) += ipmi_ssif.o
 obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
-obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
 obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
 obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 3578b7bc863c..de462f995329 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -960,6 +960,12 @@ config STPMIC1_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called spmic1_wdt.
 
+config IPMI_WATCHDOG
+       tristate 'IPMI Watchdog Timer'
+       depends on IPMI_HANDLER
+       help
+         This enables the IPMI watchdog timer.
+
 config UNIPHIER_WATCHDOG
 	tristate "UniPhier watchdog support"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 9cfe4ad32dc4..5840773bf2b4 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -225,3 +225,4 @@ obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
 obj-$(CONFIG_MENZ069_WATCHDOG) += menz69_wdt.o
 obj-$(CONFIG_RAVE_SP_WATCHDOG) += rave-sp-wdt.o
 obj-$(CONFIG_STPMIC1_WATCHDOG) += stpmic1_wdt.o
+obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/watchdog/ipmi_watchdog.c
similarity index 100%
rename from drivers/char/ipmi/ipmi_watchdog.c
rename to drivers/watchdog/ipmi_watchdog.c
-- 
2.17.1

