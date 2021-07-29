Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB27C3D9E4D
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 09:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbhG2HYL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 03:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbhG2HYL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 03:24:11 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99470C061757;
        Thu, 29 Jul 2021 00:24:08 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so14174002pja.5;
        Thu, 29 Jul 2021 00:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z06keajlTXWx+2YOib8BW2we7/nwCviWxA3eCYkFm5I=;
        b=MTEJtfylwbquVgpyBWBBlnzqO+eFwdJIE08i4R4YqJoGdOL20Pb6Mu8zTYmfGJueqS
         srMl4LFqt+VGQ4kMtIBJRzJTatAD/jHk+JRpMXSWw2OIFWGUB7ElS14Z3m65heCvOobY
         xBHaqHW9O5cEH1VCuygWEbjreoySqDhkgHxmw6iYIcwdpI1IbE8FsVNjg9JTyXd3dtZo
         Y2L32tXQtNNwe/6Y2MKqdrkAOG71pm2+Fx7SlCpOZfGb2EGMt21kfRw8AXxzuGe3Wln0
         VGPCACYDyiAi9ahQXdOKurRUvD0yseLo6Xf+Cszixg6+T1v4bDBSFqNF39G+lasidVn9
         PXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z06keajlTXWx+2YOib8BW2we7/nwCviWxA3eCYkFm5I=;
        b=Hfa2fc55vC6lj1RuHsdv26Fx6Iun1mrPiRxCNoJ98xsMcS+dsKwumsPWrZjhYsY46A
         otFJ+MQ3yrVi4v1k+sQqeqjyZvhHAdPzTJTSAX51q2Tle1h18e3NqLdNcLGmgTrmqpj9
         XSUZ3Tqf1vuSIGOHLlRh9fhK/v6Cn9IhD2zwOd3ny9tjd4JpWxXA2cK9oYimeS+EF97+
         MUeGSvwjKnlK4Rilq1J1/viRuFmN517McungmJ3uAR3xA56SAcCiBqHrdcwYGCcZNi0W
         u7QmSUmH9UXTQw0sOpB1+42zktdVq9+CiLFK7EM5Zs0ymVhrUcvXxguSLTINw2NyTK2e
         S75A==
X-Gm-Message-State: AOAM532It3FVwiugxNcmVZNm+aQJLFaM350ylpTjyHwtAbOTvP9bIta0
        DA2gbdKg4gSvD0ROJ62kn9o=
X-Google-Smtp-Source: ABdhPJzEj9HlIHcRVM4prfjqaxAOugltqmoHt4TqkkEQXb6cyb+j7JHwggoYCJY4HRAH+7lj3T75dA==
X-Received: by 2002:a05:6a00:14c4:b029:331:7474:cb4b with SMTP id w4-20020a056a0014c4b02903317474cb4bmr3776022pfu.30.1627543448231;
        Thu, 29 Jul 2021 00:24:08 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id r18sm2609648pgk.54.2021.07.29.00.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 00:24:07 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: add nowayout parameter
Date:   Thu, 29 Jul 2021 15:23:06 +0800
Message-Id: <20210729072308.1908904-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729072308.1908904-1-art@khadas.com>
References: <20210729072308.1908904-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add nowayout module parameter

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fb..5aebc3a09 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -29,6 +29,11 @@
 #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
 #define GXBB_WDT_TCNT_CNT_SHIFT			16
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -175,6 +180,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
 	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
 	/* Setup with 1ms timebase */
-- 
2.25.1

