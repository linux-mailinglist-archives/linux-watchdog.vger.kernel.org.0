Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7788F7C5C0D
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 20:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbjJKSuS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 14:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbjJKStn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:43 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27679132
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:49:36 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40651a726acso2218105e9.1
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050174; x=1697654974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn/hubDRHoceh4+bRLROPNwFC8WSZYf0eD2X8sEh5eo=;
        b=ij9uuM6HheS3S768HsL9Cb8h3Cf0YNWHnXwb1ZlRmWZt+5PU3E3eOku95wGqtsoKd7
         lXxA2Epfs07o9wc4m9wsAW4nagsiaHcw1NB+7wpHD0Egy4vzsSSk0v9eCHSz+PMYkn98
         kaq3oeQi9F6VduurnUjrDoQi5ffsZc0F2GudciwLA5T2DMtAUxa8IdeXvctrGna/geeT
         p4w/eczQEgNDnnh3Hjeh4ZITGYQU1KlF5SgOA4nYlE3wOzxD+hRT+VVyjW4OF5KStnho
         KCrRrVHERjnb0ZsHXBM8KZvkitC78AZKF48qBfXt7D5Um5abA2u2vWrq2qOrATdAkjIi
         WHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050174; x=1697654974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn/hubDRHoceh4+bRLROPNwFC8WSZYf0eD2X8sEh5eo=;
        b=BQ4kqWM8Fjeir6K0AFsu1b4JecPcknyIUEUDvRNvkJQbcmP6m2YhS3E8ZR7DhjhZsO
         EzndqsBVSyuvFxp28EOkmsmYbpW1x+pWu8kxq91c2xwcd/zCKP/AF7x7L1PSTTSkoaIc
         ebbQOi5RvjFE3vR78F8QL1gCn9Kzmdu/l9HBDf139XevZLs6+/Edm2Y99YMBxTimu4uU
         LFM5YBu5xw5A1ijsT/fMOa3PP9QpxJy25dP1v47dYzJ5bL2V1TqNk+HjzguZDhOT/vjn
         dkXtFzPdPM6kWBRjyPQwD5+H5dP0jB39TzzSS1hT0aStyfESFZ9etxzB5W0ngLUTYXtz
         WzWw==
X-Gm-Message-State: AOJu0YyfB7D2U1so0W2xRyrbnuEYQOlVd5qAdwC+oVFxeGm4b+BJx72x
        kcT+9Mn0jVEvRtuRPott6k/GQw==
X-Google-Smtp-Source: AGHT+IHW9386VXpmqzDlaPxSkIQn53/ePvUVUCDgQrjJjB/fufpo5Qz6HfgBBh0a6HufjVjZL3AVIw==
X-Received: by 2002:a5d:44cd:0:b0:32d:885f:3f8d with SMTP id z13-20020a5d44cd000000b0032d885f3f8dmr1809992wrr.52.1697050174611;
        Wed, 11 Oct 2023 11:49:34 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:34 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and SoC data
Date:   Wed, 11 Oct 2023 19:48:19 +0100
Message-ID: <20231011184823.443959-17-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add serial driver data for Google Tensor gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 07fb8a9dac63..26bc52e681a4 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 	.fifosize = { 256, 64, 64, 64 },
 };
 
+static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+	/* rely on samsung,uart-fifosize DT property for fifosize */
+	.fifosize = { 0 },
+};
+
 #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
 #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
+#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
 
 #else
 #define EXYNOS4210_SERIAL_DRV_DATA NULL
 #define EXYNOS5433_SERIAL_DRV_DATA NULL
 #define EXYNOS850_SERIAL_DRV_DATA NULL
+#define GS101_SERIAL_DRV_DATA NULL
 #endif
 
 #ifdef CONFIG_ARCH_APPLE
@@ -2688,6 +2696,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "artpec8-uart",
 		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
+	}, {
+		.name		= "gs101-uart",
+		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
 	},
 	{ },
 };
@@ -2709,6 +2720,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = EXYNOS850_SERIAL_DRV_DATA },
 	{ .compatible = "axis,artpec8-uart",
 		.data = ARTPEC8_SERIAL_DRV_DATA },
+	{ .compatible = "google,gs101-uart",
+		.data =  GS101_SERIAL_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
-- 
2.42.0.655.g421f12c284-goog

