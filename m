Return-Path: <linux-watchdog+bounces-3847-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 329BCAFF175
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Jul 2025 21:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2157C487F7B
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Jul 2025 19:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DC023C4FA;
	Wed,  9 Jul 2025 19:08:09 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C38923B63F;
	Wed,  9 Jul 2025 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088089; cv=none; b=XcXSAR1BIr83jniDLX8j+X6AU/er/DVp1RbglqoSNkzVmtjXzIftF9GwDw7vyrGnG2HbfZrLTQVVAE4wgmX5wTJjWXMC2tlnL/ibaAtjgCrf7WibM17JDa865TCWgm1yhwg6eVuTYc3QLFX2zEallBaR5ra0IoeDuME95tNe2Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088089; c=relaxed/simple;
	bh=Mn7bkK/nno6f3EjcneavdhgU9dI62oWTTOfTg9UZD8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHvkY64zdLQRfucN1oz6OsMAwRRxI8GJ+dxUcKhv4cBB3UoaBvyhj2IqMb2KOk9h+Mxej3J6Z9vvJSykhetyprV6CDpwXPJNCavlQgOF47sbhtzPkWJdGztmpaP2p0vaCy2H+dcz25NUXpOLuvuqN1PKw0BgYTMFhISSHeLH+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B558C4CEEF;
	Wed,  9 Jul 2025 19:08:07 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] watchdog: renesas_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 21:08:05 +0200
Message-ID: <3d6d46ff56c908880a167ffb2a74c713060a1a57.1752088043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas WDT watchdog driver from SIMPLE_DEV_PM_OPS() to
DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
__maybe_unused annotations from its suspend and resume callbacks, and
reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/watchdog/renesas_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index c0b2a9c5250dd721..97bcd32bade52131 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -300,7 +300,7 @@ static void rwdt_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused rwdt_suspend(struct device *dev)
+static int rwdt_suspend(struct device *dev)
 {
 	struct rwdt_priv *priv = dev_get_drvdata(dev);
 
@@ -310,7 +310,7 @@ static int __maybe_unused rwdt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rwdt_resume(struct device *dev)
+static int rwdt_resume(struct device *dev)
 {
 	struct rwdt_priv *priv = dev_get_drvdata(dev);
 
@@ -320,7 +320,7 @@ static int __maybe_unused rwdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rwdt_pm_ops, rwdt_suspend, rwdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rwdt_pm_ops, rwdt_suspend, rwdt_resume);
 
 static const struct of_device_id rwdt_ids[] = {
 	{ .compatible = "renesas,rcar-gen2-wdt", },
@@ -334,7 +334,7 @@ static struct platform_driver rwdt_driver = {
 	.driver = {
 		.name = "renesas_wdt",
 		.of_match_table = rwdt_ids,
-		.pm = &rwdt_pm_ops,
+		.pm = pm_sleep_ptr(&rwdt_pm_ops),
 	},
 	.probe = rwdt_probe,
 	.remove = rwdt_remove,
-- 
2.43.0


