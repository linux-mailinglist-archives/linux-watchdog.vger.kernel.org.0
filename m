Return-Path: <linux-watchdog+bounces-71-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E311C800F76
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 17:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86184B215E3
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 16:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043784CDF3;
	Fri,  1 Dec 2023 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tNeMHw/D"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333761980
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Dec 2023 08:11:17 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-332c46d5988so1431543f8f.1
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Dec 2023 08:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447075; x=1702051875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6X5vVAlls/XtdCFtdQoEfrejT5TccvyQro4u4ajLPE=;
        b=tNeMHw/D05NQXQJhExp4MAeWGYPE1eaArr7GuiiVIK5QnkQTzQtXbbxuO6FCoNn6Hr
         xnHL4D4ybyV+gtadDtuBlhMD3rHiuTq7aWMxaMD6/H17PwmnBYwkPZQBJq4XqHn5Qt+J
         C+p3Z++P74qo5NSohGD10X6SaY/ihUK4PUawxXoRgflq9ox+3bao3tg7aeVMbdkp1G6B
         IMUenK2uCSxGsg+n2f4PAYYt20xQRLZ7Gn3QhH8skyG3F2FhO8vG+PUgoNqI3WM2D4ER
         eyCDbRmfcXOdpDj5dh43S0U1WxHp6l1dkqV/mZxCpF5EPrgEWS+xgJ688aDj/GxtniB9
         QdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447075; x=1702051875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6X5vVAlls/XtdCFtdQoEfrejT5TccvyQro4u4ajLPE=;
        b=X7iUdloSbD8jN3MxBPQP3Fft9GEakIhxA4RFzHGzy5yTsQ7UDLGfI5EP625yJWGdCL
         dIUo0yYFLzFWVOBpQAHVf7cEQlnQ9opU3GyDYEv+dAk7KpHbj5r+Dlaxrn85Qzw1UUkz
         nbG/XAs6jkCoI3qM+J1kp3O8uGHtfpshLYxS0W9CEkYN0jUaqEvaKfOQROtthIfOZq53
         fDNwQzdsXrmqgbyy13eqd6ZzNfLX/LXzENuHbix5BkuInEXD+fF72TNgxUjnxFcUJ+OM
         lcdtdDvJB29cY8n/yQryCz5J0fZBXsQJVIsCa3eumCBj0huBerTp8NaCJVn3mr8mQ75D
         SBUw==
X-Gm-Message-State: AOJu0Yyl+pB7M3OC8+ySo3sW0zk3Bx2rTaBhLfngmoysetJhqt4yZJeo
	JUeFU/pMTN7I7ZlM59dTH8nTjw==
X-Google-Smtp-Source: AGHT+IGDALCDuLFU1YQ+h+wr7UohRR0OcUFUK/djXShHghoJYpXFb8S89wEYypH79BAexl0QUCJeDw==
X-Received: by 2002:adf:cf06:0:b0:333:2fd2:5d16 with SMTP id o6-20020adfcf06000000b003332fd25d16mr892081wrj.72.1701447075706;
        Fri, 01 Dec 2023 08:11:15 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:15 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 17/20] tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data
Date: Fri,  1 Dec 2023 16:09:22 +0000
Message-ID: <20231201160925.3136868-18-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add serial driver data for Google Tensor gs101 SoC and a common
fifoszdt_serial_drv_data that can be used by platforms that specify the
samsung,uart-fifosize DT property.

A corresponding dt-bindings patch updates the yaml to ensure
samsung,uart-fifosize is a required property.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 1b0c2b467a30..f8d98f1006de 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
 	.fifosize = { 256, 64, 64, 64 },
 };
 
+/*
+ * Common drv_data struct for platforms that specify uart,fifosize in
+ * device tree.
+ */
+static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_data = {
+	EXYNOS_COMMON_SERIAL_DRV_DATA(),
+	.fifosize = { 0 },
+};
+
 #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
 #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
 #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
+#define EXYNOS_FIFOSZDT_DRV_DATA (&exynos_fifoszdt_serial_drv_data)
 
 #else
 #define EXYNOS4210_SERIAL_DRV_DATA NULL
 #define EXYNOS5433_SERIAL_DRV_DATA NULL
 #define EXYNOS850_SERIAL_DRV_DATA NULL
+#define EXYNOS_FIFOSZDT_DRV_DATA NULL
 #endif
 
 #ifdef CONFIG_ARCH_APPLE
@@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
 	}, {
 		.name		= "artpec8-uart",
 		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
+	}, {
+		.name		= "gs101-uart",
+		.driver_data	= (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_DATA,
 	},
 	{ },
 };
@@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
 		.data = EXYNOS850_SERIAL_DRV_DATA },
 	{ .compatible = "axis,artpec8-uart",
 		.data = ARTPEC8_SERIAL_DRV_DATA },
+	{ .compatible = "google,gs101-uart",
+		.data = EXYNOS_FIFOSZDT_DRV_DATA },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
-- 
2.43.0.rc2.451.g8631bc7472-goog


