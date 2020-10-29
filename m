Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D870A29E55E
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 08:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731482AbgJ2H4l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 03:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731422AbgJ2Hxq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 03:53:46 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491D0C0613D5;
        Thu, 29 Oct 2020 00:53:46 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w21so1660198pfc.7;
        Thu, 29 Oct 2020 00:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGeI6Nxv27zFf1cpMaROkZffEIZtimpVmaFXRbyPh5g=;
        b=jpkjTuHp/ctst1xgZYhQNSh47JeAQHhVsyo8EnPyzhahwTfkT2Fb+NAYJfV2Rdu2vi
         o8JuN/eNsBnk/h5Bp1VG+kpYoXHlnKcyzoj6PjL4IgsG8w0yhOIFaRIHdkyj37t4loZm
         NB9XE98LfUzwNQvLNA7tEeyvaScTMT3vSPFT6L0UzF9ETeC9joKPc6RcDe4lRmjBp+uf
         QiZLY0q1l33KFgXJdVeNp12KiRrzOmQ1LvUy85ukxZlR5cfI/ZoNVYwfENs7frtCQumf
         NuzpeLAW3Mn75bAAduwhfPG1hDOHrpoYIVk1tlP+lRW5vpm7iSJma5jFZE4AE4WgEpJW
         19DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGeI6Nxv27zFf1cpMaROkZffEIZtimpVmaFXRbyPh5g=;
        b=rdfHVgdMXNmSJwcDullGpZW1dil+wPtgawmqRZBkoZ3LAwK+8FVbK0mGdFP71WExOE
         bEwpRtpgsMjup9aFbX4HUWaxU4ZUjIsZ3gUv6HSPETnxBPQvRrNDCkmOfLi2xwrQhSQm
         8IFdriPv8icJIcYjvz6LXSVv00xCCfGJ5Lzy7znFDzz6jmmXrg0BpviHk0tbXrwCfHB+
         t7PFboN+1YcZ2ayXVchd3vHevJuEyDBxBLFiCfDsYggnHDn00OAWLBiiin5cHjAEzhEM
         Meuj6Xp3uQk8vD3Y2ekOZLkqjzQkmWmWer5QnM3E6x1zCO64KwDH7JlN6y5gO8TBEwcF
         gftA==
X-Gm-Message-State: AOAM532qVFJxPjDKYYf/+DR640LPuoV6TLomBM70KZJkGrUv758UkWXy
        0klrlQu3oQuk6toOAxYAg38=
X-Google-Smtp-Source: ABdhPJz2IbK59ooRsRBpzJmOcejoWwaK66Nh3QtHv/cEW0cCfp9Hlvco1DL9HvRtNqhvEYfoM76LHg==
X-Received: by 2002:a17:90a:4b45:: with SMTP id o5mr2843503pjl.223.1603958025956;
        Thu, 29 Oct 2020 00:53:45 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id h184sm1890523pfe.161.2020.10.29.00.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:53:45 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] ACPI: watchdog: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:53:25 +0800
Message-Id: <20201029075327.228570-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SET_NOIRQ_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/watchdog/wdat_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index 3065dd670a18..0d912ceb2ecd 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -465,7 +465,6 @@ static int wdat_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &wdat->wdd);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int wdat_wdt_suspend_noirq(struct device *dev)
 {
 	struct wdat_wdt *wdat = dev_get_drvdata(dev);
@@ -526,7 +525,6 @@ static int wdat_wdt_resume_noirq(struct device *dev)
 
 	return wdat_wdt_start(&wdat->wdd);
 }
-#endif
 
 static const struct dev_pm_ops wdat_wdt_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(wdat_wdt_suspend_noirq,
-- 
2.28.0

