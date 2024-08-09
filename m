Return-Path: <linux-watchdog+bounces-1470-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9F94C861
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2024 04:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 690C1B226E9
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2024 02:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DF1125D6;
	Fri,  9 Aug 2024 02:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfGfIZpQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAE8125BA
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Aug 2024 02:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723169326; cv=none; b=rJWCgy+rDKmcT+X8T644SO9Tygx2tVz0OE6vdYzPVe1WlD8wOyK8h0Jia7yQCiKEbRFeONZn3oG8suwCgdjQy8DSF69G4IUk/MEnPCk167dI90SLoHl9yCSUcNFSpJfuKVb+riokjQGZvIHfB+AA5zpCb5RCcwg6T1D/7QdYWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723169326; c=relaxed/simple;
	bh=zO3fAi1hjoW5w7JNyHYT3tZ5xwpqpP5OILiG1e5qWQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kzyQuWoxs5xfxc+YYwNVLtEbwEtLcWNNRJuLV/DBkpOI2juY1Rz13KVhFRwDz+XFc44EFGhPKJ+Tem5ylyLB7OEAINolcL+kPEZMjAPNkw5ZAds9GYs4si3F6qBW90jIsIafbFPSdf6Yxgt45b+UGEUqQFa2VLEzYVk6ngpU+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfGfIZpQ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d2a6e31f1so112840b3a.3
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Aug 2024 19:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723169325; x=1723774125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY6yxQSTwpDbwfBUbS/myD88LQg8gDkJm+T9qgpwOFY=;
        b=DfGfIZpQvycbTqt7tfpx+gM1+TFvU63x/ALggZPWj2lIVYEZvVfVJ3CcP2uSxAMOS8
         kaO+NHbckNHPjYZbQXOfYUGVlaDQH36L0HWyUBNYK647myDqah6kGTNcQ/ZmfIsu1sEt
         54gJndmhu++xAUulwFTzRSew7OzWvci2Ja5HGsB/+PvrthVVcLWUH1Hkyfqp1bIT+rud
         O4XtCFDae3lVUepL1S8UAk/pVrzqhH0fv7PcJGd1btj/qLAOFa0euC8Z1i/ER/kgUAuz
         N7mYH9/gbZ23aOuNYIBIOYqRgFJtYxXqN2TodhUxJMFLnNt1lYx38D12lY75HElM4t8W
         jNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723169325; x=1723774125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY6yxQSTwpDbwfBUbS/myD88LQg8gDkJm+T9qgpwOFY=;
        b=UcU4mXNFioWvywx/03+HS0dYmthqMBxp9nwgnYWfCXgrr9K52n3Ae2okH7cPo7k4lJ
         f/wKSMRoeyfp9zM7yeBGQgHLZd9e21J4yBR0pqYO2JBIRknThxqyHTa0mewJfoAuEiO/
         uVsj6l7nR/wPSgbL93v/J3dUaHnEcqCSSvuMkp2xVEqNcPIGkyGpDENcPchdMb5G0nj1
         fi/RGWPNKarGBlaiIe0Q/h1VovJmD0uN91VzLVHH/fzMRhuPyquK3vvLwreUQBqww2dV
         qXyfpuOg3rha3IrFyL4Zu09w4wrs9PIM3p6zFSKnD+NmyFdv3LWAZFHvE+N5F+dYNV3r
         c4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX4NTXzCzTqcoxy3Ty1H5Ua0FweM38hio1GOm3mpznlTXDCohvkyynN+p3qMkG/FQjMTbVVks9F4yH2Xzq9TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaGdM6bAL+k3Jt/ppy+RP59PI8bhFmEg+9a8J1seE+m5SkQkwr
	8azIGcBLfpOVzp1suOyWGL6MozcXOC6FT4ly4gSKHt1U0436ZZTIzS+xww==
X-Google-Smtp-Source: AGHT+IGfQLuUhEkODFGpwkgdzsa3YtU3jZ0izEcufFu2yFX+2fZEfDLTAg4IBy+sukq5Al/Ii6TRvQ==
X-Received: by 2002:a05:6a00:2d29:b0:70d:18e1:441c with SMTP id d2e1a72fcca58-710dc6cd1dcmr29151b3a.2.1723169324710;
        Thu, 08 Aug 2024 19:08:44 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b763562924sm10407746a12.33.2024.08.08.19.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 19:08:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] watchdog: imx_sc_wdt: Remove __maybe_unused notations
Date: Thu,  8 Aug 2024 23:08:22 -0300
Message-Id: <20240809020822.335682-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809020822.335682-1-festevam@gmail.com>
References: <20240809020822.335682-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
handle the .suspend/.resume callbacks.
    
These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use __maybe_unused notation.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/watchdog/imx_sc_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index e51fe1b78518..efd492b122f4 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -216,7 +216,7 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, wdog);
 }
 
-static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
+static int imx_sc_wdt_suspend(struct device *dev)
 {
 	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
 
@@ -226,7 +226,7 @@ static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused imx_sc_wdt_resume(struct device *dev)
+static int imx_sc_wdt_resume(struct device *dev)
 {
 	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
 
@@ -236,8 +236,8 @@ static int __maybe_unused imx_sc_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(imx_sc_wdt_pm_ops,
-			 imx_sc_wdt_suspend, imx_sc_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(imx_sc_wdt_pm_ops, imx_sc_wdt_suspend,
+				imx_sc_wdt_resume);
 
 static const struct of_device_id imx_sc_wdt_dt_ids[] = {
 	{ .compatible = "fsl,imx-sc-wdt", },
@@ -250,7 +250,7 @@ static struct platform_driver imx_sc_wdt_driver = {
 	.driver		= {
 		.name	= "imx-sc-wdt",
 		.of_match_table = imx_sc_wdt_dt_ids,
-		.pm	= &imx_sc_wdt_pm_ops,
+		.pm	= pm_sleep_ptr(&imx_sc_wdt_pm_ops),
 	},
 };
 module_platform_driver(imx_sc_wdt_driver);
-- 
2.34.1


