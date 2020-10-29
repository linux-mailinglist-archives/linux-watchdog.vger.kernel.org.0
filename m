Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE1F29E559
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 08:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732450AbgJ2H4d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 03:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgJ2Hxz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 03:53:55 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DC5C0613D5;
        Thu, 29 Oct 2020 00:53:55 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so1678007pfd.3;
        Thu, 29 Oct 2020 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jTgCofqTZH3uvNft4bI3w2FkkPwa29NU3EvFYtPNW3M=;
        b=RAjVn4o2DSdCAF6XKMpACtzgiJuWB9ajdxrH0gTfgyV3XmwLMN7nXXL8BNCJhpJn2z
         9cwiVICKeC1C+VwjORfdlFyjdMjfBwMWiQKqTQ1wxXKe5Y5zeE6vQTSaNL06f8Y6HALg
         qb8Bq/JnxLomcs9763x+GQ7AV3Y5huHDCk2xqSjo0lTTAM2qXGVsLv4HT/uGzFVzglvv
         bAzYgHWwgFfzWM24j4zl1mYIVquGfYZMkUO+tPew+WsYw/3kbNtfSStPy7vb1/57rIqa
         4h7SvcZFvgBvpl601NK3zlrSUJIce23yt3GPTNmbLDnUEuamujRizFdV1aJkZ2kCbem+
         RSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jTgCofqTZH3uvNft4bI3w2FkkPwa29NU3EvFYtPNW3M=;
        b=TEySfSYI1Yi0/knemkF5djxR6twFjM9E3hVxlWyuQC7WsCmanj2h/7fmvAXdbzGX5G
         q8+r5jNK8bgt9fq4OHHhnNZ3D7njazIOFGI+Hjd936Z/NDpy2Wm6ves1IGtz1M/jclnv
         NuwltbagyD8iokYaa3XVB6G/o9FpidBtL3A3KjDyyNq8fZ+wunPDhLM62+zl6chzTQ7G
         QohuW4ZmWMt8IB3lgcSMhTtdz8VKZ+x7PIGMUnN2o7s8juSHGRF+7AxvlWRz15gsw22M
         uq1xFrbaPwYd2maZzkSUkzlTU2TNHtlEX4xTe+AsVZfhFjhhTRhoFuWAQPJGl5qPBJoq
         GXqQ==
X-Gm-Message-State: AOAM533au953UUHjaILEKc9FN8ayBkdL4S8YVxLaKEJEDdhj5CYP3/uc
        XFH/l5A1oRLNyUXSlTPHq/M22AQI8ZwVHyhb
X-Google-Smtp-Source: ABdhPJy2ehajgbrB/4gdRfKNx0c/XTtErSwv2PVyts3tF8Q5u1Z99yQHorUE2vqfLu4KuzDQtz0j+g==
X-Received: by 2002:aa7:83c2:0:b029:156:5ece:98b6 with SMTP id j2-20020aa783c20000b02901565ece98b6mr3001488pfn.4.1603958035020;
        Thu, 29 Oct 2020 00:53:55 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id 20sm1900352pfh.219.2020.10.29.00.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:53:54 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Patrice Chotard <patrice.chotard@st.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI
        ARCHITECTURE),
        linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] watchdog: st_lpc_wdt: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:53:26 +0800
Message-Id: <20201029075327.228570-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029075327.228570-1-coiby.xu@gmail.com>
References: <20201029075327.228570-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/watchdog/st_lpc_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
index 14ab6559c748..c1428d63dc9e 100644
--- a/drivers/watchdog/st_lpc_wdt.c
+++ b/drivers/watchdog/st_lpc_wdt.c
@@ -248,7 +248,6 @@ static int st_wdog_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_wdog_suspend(struct device *dev)
 {
 	struct st_wdog *st_wdog = watchdog_get_drvdata(&st_wdog_dev);
@@ -285,7 +284,6 @@ static int st_wdog_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(st_wdog_pm_ops,
 			 st_wdog_suspend,
-- 
2.28.0

