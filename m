Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928C4F4522
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2019 11:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfKHK6S (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Nov 2019 05:58:18 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45527 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKHK6S (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Nov 2019 05:58:18 -0500
Received: by mail-pg1-f194.google.com with SMTP id w11so3690900pga.12
        for <linux-watchdog@vger.kernel.org>; Fri, 08 Nov 2019 02:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=wISJS0OWPo2/E4IjX1pDBrYSwoR446f1IRAE3ZXUfNg=;
        b=lrokpjAz8qWZkc7OmPIgihn1TOvIx7tamO/UFjIQ7Hi9QRgTzND01Ew+Njm0A2ElvG
         A4/NwlYQ3eG1TrsgaVhIPxljDuBueDMoTmzyH9Q6sXTK3Ft1p3/sSDHZU8GeAo2O2wEZ
         2db2DoY07TwQ5JoatF1Cm2LQYXW+VniirkzYU1pqlFP4LlH+LyqLvLADu7B6hykhjOWt
         Zf7HjWjAPCac5zDv3skmiVawov0sh77DYhsRY96rh5ExzaHUb4tCiW3Dfti7YfYM1/YR
         e/EmGauYZQwDZvcDBvBw/1CrbShTJyCcBiYjzb30pQxYGrhNdfvpG48yNSbIBDBGPnV2
         /0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wISJS0OWPo2/E4IjX1pDBrYSwoR446f1IRAE3ZXUfNg=;
        b=su3aemC4HO/uWcxRAXpkEjlIsRiU38T2u3P8bgr2BvKgaUF8JAodH/7KyY31gLpzQR
         Txa0r5m5rW2d6to3F+z/4b1/KyWUM2X4hf5tSYYdiwp44wDVAS6S21ikitzpjBzs4YoX
         VQbfKBjT9r2GiBe8hzycz2a2bX67ZoQs56NNvVVXJPCESl5oEi0Pyhg/Yweq4mn+frKZ
         3HlA/8YFAA5ML3CIV9uhSsCNSpzdaRBZasOIrbmQ0+XfLAwikG4G6DzzbsM6v/u4xcfq
         RU0gBY9ji/NZs18la3dGl9TboMCNzBE1jNJ2PfefE+dvc7Q+rF+FjrCtYIF7zNz3yP06
         uMGQ==
X-Gm-Message-State: APjAAAV/bU6zdzrgN5MmDqZuE7KxjpQNmVn/S38ASrG92cXXx8QaEYq0
        cXtYT8rEKyJZV8Kj/Fd09+7qvg==
X-Google-Smtp-Source: APXvYqw6zZqtJoMSVOyHzvFRbaQhcvNKVMam7pzqcTmDeakyOOULh6MNYGf+Nuovm/I4m812tZrLgg==
X-Received: by 2002:a17:90a:b78d:: with SMTP id m13mr12970166pjr.70.1573210697207;
        Fri, 08 Nov 2019 02:58:17 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id x12sm5111180pfm.130.2019.11.08.02.58.14
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Nov 2019 02:58:16 -0800 (PST)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org,
        baolin.wang7@gmail.com, dongwei.wang@unisoc.com,
        shuiqing.li@unisoc.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: sprd: Fix the incorrect pointer getting from driver data
Date:   Fri,  8 Nov 2019 18:57:12 +0800
Message-Id: <76d4687189ec940baa90cb8d679a8d4c8f02ee80.1573210405.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shuiqing Li <shuiqing.li@unisoc.com>

The device driver data saved the 'struct sprd_wdt' object, it is
incorrect to get 'struct watchdog_device' object from the driver
data, thus fix it.

Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
Reported-by: Dongwei Wang <dongwei.wang@unisoc.com>
Signed-off-by: Shuiqing Li <shuiqing.li@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/watchdog/sprd_wdt.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index 0bb17b0..65cb55f 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -327,10 +327,9 @@ static int sprd_wdt_probe(struct platform_device *pdev)
 
 static int __maybe_unused sprd_wdt_pm_suspend(struct device *dev)
 {
-	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	struct sprd_wdt *wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(wdd))
+	if (watchdog_active(&wdt->wdd))
 		sprd_wdt_stop(&wdt->wdd);
 	sprd_wdt_disable(wdt);
 
@@ -339,7 +338,6 @@ static int __maybe_unused sprd_wdt_pm_suspend(struct device *dev)
 
 static int __maybe_unused sprd_wdt_pm_resume(struct device *dev)
 {
-	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	struct sprd_wdt *wdt = dev_get_drvdata(dev);
 	int ret;
 
@@ -347,7 +345,7 @@ static int __maybe_unused sprd_wdt_pm_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (watchdog_active(wdd)) {
+	if (watchdog_active(&wdt->wdd)) {
 		ret = sprd_wdt_start(&wdt->wdd);
 		if (ret) {
 			sprd_wdt_disable(wdt);
-- 
1.7.9.5

