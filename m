Return-Path: <linux-watchdog+bounces-2839-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF58A2A4CA
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2025 10:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67C91889106
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2025 09:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03516226183;
	Thu,  6 Feb 2025 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvURO0vi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA560225779;
	Thu,  6 Feb 2025 09:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834801; cv=none; b=S/sCYkfQAoapHOxJ51YZuZ/NmIUQEl0eZ43fW7ZOGENrGQxkHuTdb1Zwrdq4XSV53mna8o7JeY11/DsnEL1MpJVAxY0dDva1cWIZ1LUdd0jHMjd0FNmCiA9k97y0zz2WM/ANNEjazN3OcYQmwif+w4UfQ8dVnIjsY99nHVf7ujA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834801; c=relaxed/simple;
	bh=GlSiss/9xRV3Z/DGuoJIFrhcCv2WUb2A+bRioeMM7y8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BSTn0SzZ6xQc56M2LthUaZH8GC/M+pYusqqZrp9sqmqOPVn/N//4yYPwc4NRfa3QxriH1rVVycBxLskp7wiaxo/R4aHTA3fJf+mq43VnXWlerRQmQWVcPaAeJaM1axLhj4njh7+eUM/VjRDFsi1DN6uEsn3gHxOm5ogeYRmjkPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvURO0vi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso6632705e9.0;
        Thu, 06 Feb 2025 01:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738834798; x=1739439598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/jkdfrZ08jX6WcmWMCx0fLw09dF088mHQgwhu4b5Bw=;
        b=AvURO0viYRK2CHayCFwc1ABkHV6yrpmIiAAGjMWf26MWzjRrZPVleV0kY+YPaSEuoE
         hVEa9VUgw+baGlwXS0qGVxSzZ1N9IjgC+dvDxbQSH1G6QTqeRUewq1JCgFuIvgUUWT/v
         Ta6rHXGVtDpuQ2+jYcVzMeoFjCkajx34HopNXUbtfD7decCGZkr0IXzBkWHVsz3kF6Ys
         QeuYM76ya7ZuqonDKgOL0MlNC8GoeWL77bDBvCpI4t1Ijk7Khc0htB5IoY4ReLcg42UT
         /I30cElqiJf60qI7TB+uXTus1v9VQOo0yFLcXykseYCtYCH2BJ6GOS4gN62B8h33r7JL
         +UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834798; x=1739439598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/jkdfrZ08jX6WcmWMCx0fLw09dF088mHQgwhu4b5Bw=;
        b=p7S+MHL5MVfeTF7GUfc2lfNV1zkvzxnAwD+XiPVoSpx69XZoiPyb8jq7F3NNoSvCV1
         cxgQc6QRrt3rFkBFR1w9hp4MJN534tcg8tnbFcqxBFOPV9J5ecjX/SEQ8YxoVtmwQ5ed
         iM2snxWqwrDDa8qSe038KFElDmlrB/NQaWAR7JcJl72un1yUyhD8AvAwJoqwCdfJUrz3
         eokJChLujDNF3DBpzBcuRtKDTBYbH0uJa1wXXPqh6YVrpUV6HQlJAe+yc5kynh2magE+
         WyOy+qISyOSHrCzQqCAYsSFOgjNZn8bfECNWdo44SAD/vlziEnvdBqT29oTgLnwyMFEJ
         2M8A==
X-Forwarded-Encrypted: i=1; AJvYcCWRTyrhF9AmB2l1OhGuyk8rJm+dym9k1Ajtrizcd711DOz+ZwRDq3CHgx9uPjs7EGVxXhyrSESeBWu6vHmpy80=@vger.kernel.org, AJvYcCXHMTwdEqeLxqc3Iif0Y8ynmmNcLF/lndPJ0zbwYX4sMb9YAJxkylw+KEhPz0K9D777wzEdsPOpFGVDM78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxENl0Nise/O3j351SWTEx6afK574zZEuXiXaMbc5zYrynnHG/d
	8wouxjbV1hnoDu2/+jQHmPWiiIgQLQcfOTxPhYte2Bd9mu5fbbkGGMdpnnYH
X-Gm-Gg: ASbGncvwbWu1I+r7wYMupSFQddkb2f8elhjQfxdNyoyK/xl8e5+jR/IPf9i6XanjW75
	rHtMju9ErdD5VoXcD86u78/yIDX1Ovf0MGZhcRcoxasP+/CK38Bt8C0h5nXxwoHMZ+00X5FKd55
	aMGZYS8nc/0Kt23ogApy/J/Hk2jA8tUQ8qCELjHVaRuGb3Stgkeeor1dTi6CH4KKs5T8qNQpFz6
	WIA9lqnEpWLBN4CtnSzQ6zTYPRyXpwJyblpUhbUGr3VcSWL4U0yFjlSbybAueU2iNrn/l7BZ9Ki
	7d2+ZaK5+z9bZzvZlqaEEAagcnFP/YoB2kQGT0//zjuB86Ro/1QL
X-Google-Smtp-Source: AGHT+IGBzVXmnW+V09JM5cj0lj1ejZ6PtsqYBnWfyMAP4lVzXR/2TmoEhoDdYt7Jw/te+/+0sWsibw==
X-Received: by 2002:a05:600c:4754:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-4390d43da3fmr53984655e9.15.1738834797789;
        Thu, 06 Feb 2025 01:39:57 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b17sm48170475e9.34.2025.02.06.01.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:39:57 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH]: watchdog: Allow watchdog to remain enabled after probe
Date: Thu,  6 Feb 2025 10:39:56 +0100
Message-Id: <20250206093956.46593-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
The sunxi_wdt watchdog unconditionally stops the watchdog during probe (on my Allwinner H616).

What I want to achieve with this patch is to start the watchdog in the bootloader (either manually or automatically), then boot Linux.
The watchdog is about 16sec timeout maximum, while the full boot to userland lasts about 90sec, and I want the board to reset if, eg.
the rootfs cannot be mounted. So I need the watchdog to be handled by the kernel during boot (which it can do pretty well).

The thing is, the current driver stops the watchdog during probe, so it does not run during boot, and it also does not manages the "status"
field, so the kernel would know that it must handle the HW watchdog.
This avoids automatic reboot in case a problem occurs during boot (and for example handling in the bootloader).

The driver should detect if the HW watchdog is already running during probe and set its appropriate status bit to allow the kernel to handle the watchdog pings itself.
The call to sunxi_wdt_start/stop allows for proper driver and device configuration.
By default, the kernel will then ping the HW watchdog at apropriate frequency, but the user can have it stop after a time with open_timeout parameter.

 drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index b85354a99582..20fe7da445ea 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
+{
+	u32 reg;
+	void __iomem *wdt_base = wdt->wdt_base;
+	const struct sunxi_wdt_reg *regs = wdt->wdt_regs;
+
+	reg = readl(wdt_base + regs->wdt_mode);
+	return (reg & WDT_MODE_EN);
+}
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 	sunxi_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
 	sunxi_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
 	sunxi_wdt->wdt_dev.parent = dev;
+	if (sunxi_wdt_enabled(sunxi_wdt)) {
+		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	} else {
+		clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
+	}
 
 	watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
 	watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
@@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
 
-	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+	if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
+		sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+	else
+		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
-- 
2.25.1


