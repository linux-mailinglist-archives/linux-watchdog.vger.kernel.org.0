Return-Path: <linux-watchdog+bounces-3516-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25081ABAAF4
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 May 2025 18:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFD8D189ED22
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 May 2025 16:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7554D1DDA31;
	Sat, 17 May 2025 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FL/jo6C+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795D71957FF;
	Sat, 17 May 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747498183; cv=none; b=Pm6qxNMnbKf6J7lHZElxH/Hb1X9WfbnhOGo5HYLh4onR5CJWGAQnl+/vcMRsojqF1XluoUew0/k92DDtgouYDcYwLqlq0K/QcYaQGEr9KiQpLSBkQ/04YhJ9kf0RBerYrpXZs51AjEh2xYxUjQevlctPBcglb4FWoPQe4P3Chmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747498183; c=relaxed/simple;
	bh=8lCXVdTT2oTVuMz1WT40YfBYKRW/B6GWe6C03aVZWgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YyoGI9NdeLzdOM9O6WOw3hpSS+ehoq8zy7tCIwHb+RkOoKWut2rbI18m/J13E9yE+PjYGGpi4if6OVR7vk8IREDbhRA1DW/WO4xdNRres98vvvQUeyg2cFSFgMtetbQtHA5AAmmvFT57VKrWwCiUjEtY2N7BItjYgpUX9HDjr34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FL/jo6C+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30e87549254so2062783a91.2;
        Sat, 17 May 2025 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747498180; x=1748102980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l29yZTQstFNGhWwkk2ISfC5oWGUDUzVpKuP9axl/QtM=;
        b=FL/jo6C+r61xlndh6gymIa9lveziCgooidexC2bdAdEJ1XMwA2jLzKgz+CX5cVWtFn
         13dSpsCtZCibWeVcJ7Vy6uCKzxGuu7ZUNQyj5jiKYcMn2iFAKud7EB8dTfeSBkCgEE8c
         /jIhLCkzpNllrOVbE2iEO88WISjvpVXqrobnPlmNIIXx9nttqfRT7iiKCVfMHLvA2Nuq
         lQfvEM0fELCQU0oALSHzSLKhm5nIqzeSUYySyKp09ZB9XbUb3gXD0gKnO6C2PIZAMzVQ
         HoyIkUEs7cvKEhxtmBNnDte53V2Nv6GSrgDLe2t3+HKD7YlfblfpKvvmyjr0O5//fhZ4
         XM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747498180; x=1748102980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l29yZTQstFNGhWwkk2ISfC5oWGUDUzVpKuP9axl/QtM=;
        b=tTzEqK6dOVR3qqv0icd4Rr/+yo5xMEPqcwL+1MBWlaEfLEEsUiwfG7ggW/1kLhUHs7
         hy589BR5TtyvR/+bFsGcJloqlCgeojSvC7S9hdMQTJOsMcbZvZvPrWfzOd0Y03z7rNtC
         t2LiG3qzPwp8y0CL+H398+phO/PJp6WqB/3CYI9qSv31/b+AmHePwsNtKh5YgAJjxaZq
         +1hbLBovpcY0FMd4r0PWRFiJhJml6hsezYSC6/NgaBt/yloWhPBXSWbEeRxN+iVqVrbS
         2hOHdjeyKv21xmWC8xc1d4iNVNtCkCAQ1UOLdjrH2kKmbOod+VvIp+Lzt0C/DIPcduVe
         8VaA==
X-Forwarded-Encrypted: i=1; AJvYcCWk0x7w6ig7x7h52lLAesTcofJCUGRuzDEL08cffWgRkqjVASh1wIuqTuO8N1/aMqte1uXdhGOSqat7Ewg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcdviMk746lqSq9mXNVDqnrudMD5vqZIcWTtNNmdir/ZFyWKy
	G59FLWJlGVcFtRUnIidahYCGm1NU79dYspR3s0/kzvAgTpGCiqAwDGiQQ/fXdSNh
X-Gm-Gg: ASbGnctv/snGIdK6Li7QlhV3pV+MDyC9eHNDYHfW11GuEjBEXdaiv4yGBsiFShOp936
	+VhwYgjXXEBWkkXHcGvrDHiS8Z+Q5q9LM88zw7So9k2bCK+mKdGIiYYVywuyZCq9zS4ZxF6bolZ
	69UAA5eEU7tT3GS4CKQBXumkQdQwCw/FAZjsEeLw/cm48pdCLSAjCJqzR1+R/oOmYfD9JiTQVbj
	UhKbOcd0aVlT8V05zt2VzZO/d5zYmfQOAY7fozQ4mvs43r88L6Se/suPUUp3SQ4wPY1OhchIrZd
	xlCOxn3YZ++KtkaJmcDC97V7vsMyfVTUuTiQ5Sb5y4pArYIxfrSGrapQqjWt1cwm
X-Google-Smtp-Source: AGHT+IHq0uUmy8ApEs+jjbA+42Zoca9Pt0YCUG9ZORDl62tvj8FNGXaDEGqVpydCRU4gcJgGkphqrQ==
X-Received: by 2002:a17:90b:17d0:b0:2ff:53ad:a0ec with SMTP id 98e67ed59e1d1-30e7d57f38bmr9456747a91.21.1747498179543;
        Sat, 17 May 2025 09:09:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d46f4bfsm3830642a91.5.2025.05.17.09.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 09:09:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] watchdog: iTCO: Drop driver-internal locking
Date: Sat, 17 May 2025 09:09:36 -0700
Message-ID: <20250517160936.3231017-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The locking code in the iTCO watchdog driver has been carried along from
before the watchdog core existed. The watchdog core protects calls into
drivers since commit f4e9c82f64b5 ("watchdog: Add Locking support"),
making driver-internal locking unnecessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/iTCO_wdt.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 7672582fa407..30a8d72d84fa 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -58,7 +58,6 @@
 #include <linux/platform_device.h>	/* For platform_driver framework */
 #include <linux/pci.h>			/* For pci functions */
 #include <linux/ioport.h>		/* For io-port access */
-#include <linux/spinlock.h>		/* For spin_lock/spin_unlock/... */
 #include <linux/uaccess.h>		/* For copy_to_user/put_user/... */
 #include <linux/io.h>			/* For inb/outb/... */
 #include <linux/platform_data/itco_wdt.h>
@@ -102,8 +101,6 @@ struct iTCO_wdt_private {
 	 * or memory-mapped PMC register bit 4 (TCO version 3).
 	 */
 	unsigned long __iomem *gcs_pmc;
-	/* the lock for io operations */
-	spinlock_t io_lock;
 	/* the PCI-device */
 	struct pci_dev *pci_dev;
 	/* whether or not the watchdog has been suspended */
@@ -286,13 +283,10 @@ static int iTCO_wdt_start(struct watchdog_device *wd_dev)
 	struct iTCO_wdt_private *p = watchdog_get_drvdata(wd_dev);
 	unsigned int val;
 
-	spin_lock(&p->io_lock);
-
 	iTCO_vendor_pre_start(p->smi_res, wd_dev->timeout);
 
 	/* disable chipset's NO_REBOOT bit */
 	if (p->update_no_reboot_bit(p->no_reboot_priv, false)) {
-		spin_unlock(&p->io_lock);
 		dev_err(wd_dev->parent, "failed to reset NO_REBOOT flag, reboot disabled by hardware/BIOS\n");
 		return -EIO;
 	}
@@ -309,7 +303,6 @@ static int iTCO_wdt_start(struct watchdog_device *wd_dev)
 	val &= 0xf7ff;
 	outw(val, TCO1_CNT(p));
 	val = inw(TCO1_CNT(p));
-	spin_unlock(&p->io_lock);
 
 	if (val & 0x0800)
 		return -1;
@@ -321,8 +314,6 @@ static int iTCO_wdt_stop(struct watchdog_device *wd_dev)
 	struct iTCO_wdt_private *p = watchdog_get_drvdata(wd_dev);
 	unsigned int val;
 
-	spin_lock(&p->io_lock);
-
 	iTCO_vendor_pre_stop(p->smi_res);
 
 	/* Bit 11: TCO Timer Halt -> 1 = The TCO timer is disabled */
@@ -334,8 +325,6 @@ static int iTCO_wdt_stop(struct watchdog_device *wd_dev)
 	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
 	p->update_no_reboot_bit(p->no_reboot_priv, true);
 
-	spin_unlock(&p->io_lock);
-
 	if ((val & 0x0800) == 0)
 		return -1;
 	return 0;
@@ -345,8 +334,6 @@ static int iTCO_wdt_ping(struct watchdog_device *wd_dev)
 {
 	struct iTCO_wdt_private *p = watchdog_get_drvdata(wd_dev);
 
-	spin_lock(&p->io_lock);
-
 	/* Reload the timer by writing to the TCO Timer Counter register */
 	if (p->iTCO_version >= 2) {
 		outw(0x01, TCO_RLD(p));
@@ -358,7 +345,6 @@ static int iTCO_wdt_ping(struct watchdog_device *wd_dev)
 		outb(0x01, TCO_RLD(p));
 	}
 
-	spin_unlock(&p->io_lock);
 	return 0;
 }
 
@@ -385,24 +371,20 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
 
 	/* Write new heartbeat to watchdog */
 	if (p->iTCO_version >= 2) {
-		spin_lock(&p->io_lock);
 		val16 = inw(TCOv2_TMR(p));
 		val16 &= 0xfc00;
 		val16 |= tmrval;
 		outw(val16, TCOv2_TMR(p));
 		val16 = inw(TCOv2_TMR(p));
-		spin_unlock(&p->io_lock);
 
 		if ((val16 & 0x3ff) != tmrval)
 			return -EINVAL;
 	} else if (p->iTCO_version == 1) {
-		spin_lock(&p->io_lock);
 		val8 = inb(TCOv1_TMR(p));
 		val8 &= 0xc0;
 		val8 |= (tmrval & 0xff);
 		outb(val8, TCOv1_TMR(p));
 		val8 = inb(TCOv1_TMR(p));
-		spin_unlock(&p->io_lock);
 
 		if ((val8 & 0x3f) != tmrval)
 			return -EINVAL;
@@ -421,19 +403,15 @@ static unsigned int iTCO_wdt_get_timeleft(struct watchdog_device *wd_dev)
 
 	/* read the TCO Timer */
 	if (p->iTCO_version >= 2) {
-		spin_lock(&p->io_lock);
 		val16 = inw(TCO_RLD(p));
 		val16 &= 0x3ff;
-		spin_unlock(&p->io_lock);
 
 		time_left = ticks_to_seconds(p, val16);
 	} else if (p->iTCO_version == 1) {
-		spin_lock(&p->io_lock);
 		val8 = inb(TCO_RLD(p));
 		val8 &= 0x3f;
 		if (!(inw(TCO1_STS(p)) & 0x0008))
 			val8 += (inb(TCOv1_TMR(p)) & 0x3f);
-		spin_unlock(&p->io_lock);
 
 		time_left = ticks_to_seconds(p, val8);
 	}
@@ -493,8 +471,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	if (!p)
 		return -ENOMEM;
 
-	spin_lock_init(&p->io_lock);
-
 	p->tco_res = platform_get_resource(pdev, IORESOURCE_IO, ICH_RES_IO_TCO);
 	if (!p->tco_res)
 		return -ENODEV;
-- 
2.45.2


