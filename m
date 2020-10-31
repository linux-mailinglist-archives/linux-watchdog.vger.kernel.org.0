Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A932A1720
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Oct 2020 12:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgJaLw1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 31 Oct 2020 07:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgJaLwZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 31 Oct 2020 07:52:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17ADC0613D8
        for <linux-watchdog@vger.kernel.org>; Sat, 31 Oct 2020 04:52:23 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i16so3803000wrv.1
        for <linux-watchdog@vger.kernel.org>; Sat, 31 Oct 2020 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZI+7zrxUit9O0OB+cBOuMZaBCXyEeMzsbomcOevAsU=;
        b=PXwnzLKrmPa724apY5KdTLJ1lHk1YpkaszXOfU/DkGXWrvIsTtBmZ500okhl0tu8Sc
         xRQ2C1o5jgjD0gBHNNhzcMGL2nYICMI8RMuEGYzpzLUtfIZ8SYnojUy+/iZ7lDj7lHmK
         qNc0ULMswjCZ5JTuyLtoQdCbe8YajKNyivt/OwBVickW+xr4zhJZPleXg4asfTM8BTiU
         Of71gB7Ov6lWX/f0ZVo9DVHFgnPHZelkrG1L91zdmZ5kjMPXBh2zJ6cYYBYoL85+zHNB
         2Di8d3uuTTs1f4ORyipB9sQkKtfl44qNOmZA3GQRIe6bPXrn4UQOyReRme3k5kgHE4dS
         QOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZI+7zrxUit9O0OB+cBOuMZaBCXyEeMzsbomcOevAsU=;
        b=eis2zrPVgAiOgKsRi4QxdnbU/lJdHEbl1jHgG2eizFoKqq9Tb3aDY9cTu5/zKrc2v4
         8D3+WoMKnwPWeBrgetMUAT/Fgp7+UtHH9ShGX9/eqFpG1wGZ0T/W++YQUCPlYLnB/HeK
         itY1I+2MDmeez+foUG7Vxb9rdR1/c7CEOO73XHXLEahe1KKHhqw7SgHb4Mx3lM4RSSWR
         nVzT+wwPtbWFrP10VXNcOWgzqJ7xzBoFkZe6oHq8iFjl+0QrbVa5XrHcPUO9fpInP3Ik
         9KvKeF4X8k4BXOop4sM1hoGNTc0d1NgW/bVfg+3DSI44BQ+l3XcPzMwBk2imQJ4N7tvG
         IOhw==
X-Gm-Message-State: AOAM533EF3wcJycW/SKVk+0MSVczFMKdbCM5APSYj/29lRABZtzGugnf
        +0E5Xyf+q1EuG6uR4JJszMgoPA==
X-Google-Smtp-Source: ABdhPJzWvqvCScz0A6d9wkUBJ3XLp0zLPLJThcngoOT6+IyCWmGSa1rl2nZHbswOJjjLaYS2/skqwQ==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr9272925wru.92.1604145142232;
        Sat, 31 Oct 2020 04:52:22 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-136.xnet.hr. [88.207.97.136])
        by smtp.googlemail.com with ESMTPSA id g186sm17829847wma.1.2020.10.31.04.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 04:52:21 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v3] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when appropriate
Date:   Sat, 31 Oct 2020 12:52:14 +0100
Message-Id: <20201031115214.355531-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the watchdog hardware is enabled/running during boot, e.g.
due to a boot loader configuring it, we must tell the
watchdog framework about this fact so that it can ping the
watchdog until userspace opens the device and takes over
control.

Do so using the WDOG_HW_RUNNING flag that exists for exactly
that use-case.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes in v3:
* Drop call to stop as start already does it
* Update commit message

Changes in v2:
* Correct authorship

 drivers/watchdog/qcom-wdt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index ab7465d186fd..64f44a4b7eb8 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -152,6 +152,13 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 	return 0;
 }
 
+static int qcom_wdt_is_running(struct watchdog_device *wdd)
+{
+	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
+
+	return (readl(wdt_addr(wdt, WDT_EN)) & 1);
+}
+
 static const struct watchdog_ops qcom_wdt_ops = {
 	.start		= qcom_wdt_start,
 	.stop		= qcom_wdt_stop,
@@ -294,6 +301,17 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.timeout = min(wdt->wdd.max_timeout, 30U);
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
 
+	/*
+	 * If WDT is already running, call WDT start which
+	 * will stop the WDT, set timeouts as bootloader
+	 * might use different ones and set running bit
+	 * to inform the WDT subsystem to ping the WDT
+	 */
+	if (qcom_wdt_is_running(&wdt->wdd)) {
+		qcom_wdt_start(&wdt->wdd);
+		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+	}
+
 	ret = devm_watchdog_register_device(dev, &wdt->wdd);
 	if (ret)
 		return ret;
-- 
2.28.0

