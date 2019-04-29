Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEBD6EAD9
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 21:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbfD2T2g (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 15:28:36 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42115 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbfD2T2g (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 15:28:36 -0400
Received: by mail-pf1-f193.google.com with SMTP id w25so5807490pfi.9;
        Mon, 29 Apr 2019 12:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=H3PC/K/0ZqnTv3eSdr7uwHLRMhRxA2po4zeZwBa0UC4=;
        b=TwcT4QvqRGp1uG/FKCJtxf3DZL4NQG3jTbez+WjIbEICTnsZJmQYLihck1du341mg2
         vQTcbUkK7dV/ZEEwctyNaD1+TtAiJcKTBXcwZ9rLEV5QphcRn2mzCkiZe6AKH4dcraDb
         slMQVVcbd3U6arhgfA+D1uNRmFp6HHXEAvMxUneBjs4OPgcaHZ1P+lb3bV1sryGH/aHT
         OabBR26UgAPBD7R1EOtYuATG1kr0q0OgEVNBAc5/q6nYwhEuh5j8aYMIK7wXZMctKS4b
         bNThq0SCCQcqLNvjiu6eUXEwPWRXwkhqt38vsp4eW3/5jvZS9+E4yM+EQ58GbA4Thw5O
         cgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=H3PC/K/0ZqnTv3eSdr7uwHLRMhRxA2po4zeZwBa0UC4=;
        b=KH99hO2rPPHzOqgXpFlos7XAwrwyuqEKzEx3m8UJL5Bg40hgMgp+89AuF7WwDGWKJn
         ONl8bHAZRV/Pj5Lp+Az+52YYzwtiOT00w7DTKYhKKydzKlDR8vX3jkxN7QQ++ktnnGrk
         mMx8S5eglXYQ+ut/R5IZ1k6OMe6XhE5BKD7utdke6t4OCdao+id7tGHgHH95VgnFnWfQ
         h+ALuWB+IT2bq5zIrM6TovPDQwT4EJKzgJ/wOVIO+ERI6Ykq46vZYzLG9XhHj9Wg2dI4
         kdp9D05yjQrIRtQC3wRsTViA0CPkoTVh7iIebIjk1SlCQs0XnHivIj4gnuxMVzlqnDPa
         bQqQ==
X-Gm-Message-State: APjAAAXieRjDZjCgcn9XXYW/J/lAwsrWIFbuKdBrhGpz+Cf4ssYzyJPO
        zFUVlxa5TGYMjz59qz9L52s=
X-Google-Smtp-Source: APXvYqwFy0ULEpsCLz4AaUm4VSDQbG86sGUaLA0oHgtneY4zjk8RmxpDxMHYCUCsO5tK1sVozPbuMg==
X-Received: by 2002:aa7:918b:: with SMTP id x11mr31520922pfa.181.1556566115361;
        Mon, 29 Apr 2019 12:28:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y3sm10598535pfe.9.2019.04.29.12.28.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 12:28:34 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/5] watchdog: Use depends instead of select for pretimeout governors
Date:   Mon, 29 Apr 2019 12:28:27 -0700
Message-Id: <1556566111-31970-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Watchdog pretimeout governors were enabled from the default governor
selection using "select". As a result, the default governor was always
built into the kernel, even if no watchdog driver was loaded. By using
"depends on" instead of "select", we are in better control, and the
governors can all be built as modules. At the same time, set the default
configuration option for pretimeout governors to match WATCHDOG_CORE
(meaning all pretimeout governors are by default enabled if pretimeout
support is enabled).

The practical impact of this change is minimal. Previously, selecting
a default governor automatically enabled that governor. Now, a default
governor can only be selected if that governor has been enabled.
Consequently, the order of governor selection is now reversed: The
governor selection is now first, followed by default governor selection.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/Kconfig | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 16c30e6aa1ee..accbf75032ef 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2062,6 +2062,20 @@ config WATCHDOG_PRETIMEOUT_GOV
 
 if WATCHDOG_PRETIMEOUT_GOV
 
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
 choice
 	prompt "Default Watchdog Pretimeout Governor"
 	default WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
@@ -2072,7 +2086,7 @@ choice
 
 config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP
 	bool "noop"
-	select WATCHDOG_PRETIMEOUT_GOV_NOOP
+	depends on WATCHDOG_PRETIMEOUT_GOV_NOOP
 	help
 	  Use noop watchdog pretimeout governor by default. If noop
 	  governor is selected by a user, write a short message to
@@ -2080,7 +2094,7 @@ config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP
 
 config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
 	bool "panic"
-	select WATCHDOG_PRETIMEOUT_GOV_PANIC
+	depends on WATCHDOG_PRETIMEOUT_GOV_PANIC
 	help
 	  Use panic watchdog pretimeout governor by default, if
 	  a watchdog pretimeout event happens, consider that
@@ -2088,18 +2102,6 @@ config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
 
 endchoice
 
-config WATCHDOG_PRETIMEOUT_GOV_NOOP
-	tristate "Noop watchdog pretimeout governor"
-	help
-	  Noop watchdog pretimeout governor, only an informational
-	  message is added to kernel log buffer.
-
-config WATCHDOG_PRETIMEOUT_GOV_PANIC
-	tristate "Panic watchdog pretimeout governor"
-	help
-	  Panic watchdog pretimeout governor, on watchdog pretimeout
-	  event put the kernel into panic.
-
 endif # WATCHDOG_PRETIMEOUT_GOV
 
 endif # WATCHDOG
-- 
2.7.4

