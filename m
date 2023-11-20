Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2787F1EE3
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Nov 2023 22:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232535AbjKTVVh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Nov 2023 16:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbjKTVVf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:35 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3059A185
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:28 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40859c466efso20217405e9.3
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515286; x=1701120086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCZhGH9ke1QhI+Fq9Lpv7n3UqQ34S8EZi9JKWsgg4XU=;
        b=p/TJdGPC6Pf63kUuWvoV1/GuZDRhp0KkOysfZCgVjR7BYylyo9qlLqP3V1hO71dNtw
         MR6MAPM++I9qwoDzzAVfHWtkKBiwQqn1KwRYVJRmjYRr+8zzIbLCLo4UOPdDUgVs+iJh
         5DZahfy4qDnoqecbSEXznp5Nph+L1pz2uyiK6+QleVnA6Dla+JdssdeiYV0Jm9aBNhgO
         boFnOVw0DKvKj0FvO5OHpYuvoUWcUdGDwxOCtHDaCFXpMPbkT4cA49EaFA23Cl0AYEef
         qKPG+ufugmQgRSDGCGtQKufzTNkaIQ6fdRNY157AuiUfIiToLCL23+XQzZBcRvPsCtMF
         uudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515286; x=1701120086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCZhGH9ke1QhI+Fq9Lpv7n3UqQ34S8EZi9JKWsgg4XU=;
        b=abFwmecZlU94pm8I2jPJ23issR0/t5EDgWR5dpGKWehTU4fCLWtwKOdFHL0otCFMaU
         eBcA/kOqwDN4KW+uc0vYx8VOjRy1jd+s8WrQItqlbLDw7T9w5gh5mTBeAwMT5kf7tU57
         b4qFrTAlzlVWWDqd88vbC+XRiIpe4BuIsAKrRrYzmu3J6uMv4fuNy46uHnzErMel/flc
         S9KWHjWe9veefY8b9hpMNfVyj9VuR6QqNJD9r5rf2a0sBl/dP6Khue+3PENSwtrMLCiB
         ilf7/KHDmC2Iwh75PJ2fwdW09JJhHrJFZwn3GefXcddIvdhAyMbf7UtSb2wKLVlcYhmF
         kJeQ==
X-Gm-Message-State: AOJu0Ywx5rj4RvBpFqBX99Yd+OoCMpGU+sgu9ibiR8mejWVdOCJqxhoM
        AVO8VJ11wrNvu0t+c/RdZtC/DQ==
X-Google-Smtp-Source: AGHT+IH6lrvloecvBiCYT8qVpxKxUQfxO7x1xXA17ffxvS3j+7GDtgBdlonkbxXLGXHXz7fV3QRCVA==
X-Received: by 2002:a05:600c:314f:b0:409:637b:890d with SMTP id h15-20020a05600c314f00b00409637b890dmr7422992wmo.2.1700515286631;
        Mon, 20 Nov 2023 13:21:26 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:26 -0800 (PST)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, cw00.choi@samsung.com,
        alim.akhtar@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v4 13/19] pinctrl: samsung: Add gs101 SoC pinctrl configuration
Date:   Mon, 20 Nov 2023 21:20:31 +0000
Message-ID: <20231120212037.911774-14-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add support for the pin-controller found on the gs101 SoC used in
Pixel 6 phones.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 159 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 198 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index cb965cf93705..e1a0668ecb16 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -796,3 +796,162 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 	.ctrl		= fsd_pin_ctrl,
 	.num_ctrl	= ARRAY_SIZE(fsd_pin_ctrl),
 };
+
+/*
+ * bank type for non-alive type
+ * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
+ * (CONPDN bit field: 2, PUDPDN bit field: 4)
+ */
+static struct samsung_pin_bank_type gs101_bank_type_off  = {
+	.fld_width = { 4, 1, 4, 4, 2, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
+};
+
+/*
+ * bank type for alive type
+ * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
+ */
+static const struct samsung_pin_bank_type gs101_bank_type_alive = {
+	.fld_width = { 4, 1, 4, 4, },
+	.reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
+};
+
+/* pin banks of gs101 pin-controller (ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_alive[] = {
+	EXYNOS9_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
+	EXYNOS9_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
+	EXYNOS9_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
+	EXYNOS9_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
+	EXYNOS9_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
+	EXYNOS9_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
+};
+
+/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
+	EXYNOS9_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
+};
+
+/* pin banks of gs101 pin-controller (GSACORE) */
+static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
+	EXYNOS9_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
+	EXYNOS9_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
+};
+
+/* pin banks of gs101 pin-controller (GSACTRL) */
+static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
+	EXYNOS9_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
+};
+
+/* pin banks of gs101 pin-controller (PERIC0) */
+static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
+	EXYNOS9_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
+	EXYNOS9_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
+};
+
+/* pin banks of gs101 pin-controller (PERIC1) */
+static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
+	EXYNOS9_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
+	EXYNOS9_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
+	EXYNOS9_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
+	EXYNOS9_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
+	EXYNOS9_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
+};
+
+/* pin banks of gs101 pin-controller (HSI1) */
+static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
+	EXYNOS9_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
+};
+
+/* pin banks of gs101 pin-controller (HSI2) */
+static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
+	EXYNOS9_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
+	EXYNOS9_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
+	EXYNOS9_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
+};
+
+static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
+	{
+		/* pin banks of gs101 pin-controller (ALIVE) */
+		.pin_banks	= gs101_pin_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+		.pin_banks	= gs101_pin_far_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (GSACORE) */
+		.pin_banks	= gs101_pin_gsacore,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsacore),
+	}, {
+		/* pin banks of gs101 pin-controller (GSACTRL) */
+		.pin_banks	= gs101_pin_gsactrl,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsactrl),
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC0) */
+		.pin_banks	= gs101_pin_peric0,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric0),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (PERIC1) */
+		.pin_banks	= gs101_pin_peric1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_peric1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume	= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI1) */
+		.pin_banks	= gs101_pin_hsi1,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi1),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (HSI2) */
+		.pin_banks	= gs101_pin_hsi2,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_hsi2),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	},
+};
+
+const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
+	.ctrl		= gs101_pin_ctrl,
+	.num_ctrl	= ARRAY_SIZE(gs101_pin_ctrl),
+};
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 56fc11a1fe2f..75b9cf72ce73 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -537,6 +537,8 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
 			.data = &exynos7_wkup_irq_chip },
 	{ .compatible = "samsung,exynosautov9-wakeup-eint",
 			.data = &exynos7_wkup_irq_chip },
+	{ .compatible = "google,gs101-wakeup-eint",
+			.data = &exynos7_wkup_irq_chip },
 	{ }
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index e2799ff1b5e9..1ffc90db079d 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -147,6 +147,40 @@
 		.name		= id				\
 	}
 
+#define EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)	\
+	{						\
+		.type		= &types,		\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_NONE,	\
+		.fltcon_type	= FLT_DEFAULT		\
+		.name		= id			\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
+	{						\
+		.type		= &gs101_bank_type_off,	\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_GPIO,	\
+		.eint_offset	= offs,			\
+		.fltcon_type    = FLT_DEFAULT,		\
+		.fltcon_offset	= fltcon_offs,		\
+		.name		= id			\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
+	{							\
+		.type		= &gs101_bank_type_alive,	\
+		.pctl_offset	= reg,				\
+		.nr_pins	= pins,				\
+		.eint_type	= EINT_TYPE_WKUP,		\
+		.eint_offset	= offs,				\
+		.fltcon_type    = FLT_SELECTABLE,		\
+		.fltcon_offset	= fltcon_offs,			\
+		.name		= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 50c360b4753a..982a5702714c 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1323,6 +1323,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynosautov9_of_data },
 	{ .compatible = "tesla,fsd-pinctrl",
 		.data = &fsd_of_data },
+	{ .compatible = "google,gs101-pinctrl",
+		.data = &gs101_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 5fab3885a7d7..f6856290608c 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -373,6 +373,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
+extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-- 
2.43.0.rc1.413.gea7ed67945-goog

