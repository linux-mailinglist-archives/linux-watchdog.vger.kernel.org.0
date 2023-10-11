Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33D37C5BF9
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 20:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347023AbjJKStx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 14:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235183AbjJKStm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:42 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67904120
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:49:33 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40675f06f1fso8503755e9.1
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 11:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050172; x=1697654972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48Lsu/YhTAfzhnuGV+p27dJ8jE7JS8+Zoo6izTIw4u8=;
        b=wRHS+Fvv7lRDMdbeBuYdw3nmXWAih2I7CpK+H5ymTNbq2DTd0VTAqgQSjQFLgTaHTu
         OlLf/kp/OIPHsvrAiH0pj2Ln2lUcSD7tkh5WZIUVoc1ty1GqeyoAPxPGxnSSzG6VU8ic
         HbGE3vT2RnxznXOGuWAqxjed9+/WIixAxa43aqCxPHBHHBgmUyldEwkb4QeveAcao87S
         o33b1IlDi3769GSBc8TC0/lqa1uFDXGU2rHIPBpHV6YCI5wzUOkZ+8tyq3t/T5TlI2JR
         YJUiKPso2e85Hgy8MpBaDIDf9mjTd8pAJ+Lppli8zg6kF/FAjoZRGZ9rhCwzc757UUFi
         h7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050172; x=1697654972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48Lsu/YhTAfzhnuGV+p27dJ8jE7JS8+Zoo6izTIw4u8=;
        b=libpIAYcdV5j+VmawY4zejbyzYDJ/EMie3jl2bVmdBtS4IP7ebHZqZbHjb6pCYmsja
         hnA3377bYA1gKVHMfkz2vge75QR//+dFpAKq7GWBQULiU2c+iSDmRKAEoZVMtSyfQRGY
         g1yh7N95rjZTvXdzraQlO8N2mAQ9PcZiZ84D/k/Zl411M+2gnZjlil2dyzhDpdhc62Cv
         aoV8BJHYbYF4GHfI1tQSOD1Tn8peatzbSt90kGi278LZM0vRSVI3aqDzc+nIMMHhx2Z/
         QOgmT5MvPB//nx9ZAOmnjjVmSkjAMYTwUKgGShYNNNtnjBodKVwQP52cGOm7vSwRE80i
         ayeQ==
X-Gm-Message-State: AOJu0YwKAWIRQ9NJ89eKpUvkvxVlEFFMqQ87hAWP4g+3jZbAxCY9BYty
        sPT3WVeUZIY8GRTO2AmbXezZEA==
X-Google-Smtp-Source: AGHT+IFc0GfXC4jLmJQ+jJUchSDwFS+ni6iLZ3x8VYxgGkwDeKncha4F04KuZpPVbE04g/eDP5zVSw==
X-Received: by 2002:adf:f692:0:b0:32d:8a7c:6efc with SMTP id v18-20020adff692000000b0032d8a7c6efcmr1203616wrp.9.1697050171666;
        Wed, 11 Oct 2023 11:49:31 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:31 -0700 (PDT)
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
Subject: [PATCH v3 14/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
Date:   Wed, 11 Oct 2023 19:48:17 +0100
Message-ID: <20231011184823.443959-15-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
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
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 163 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 202 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index cb965cf93705..db47001d1b35 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -796,3 +796,166 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
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
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x0, "gpa0", 0x00, 0x00, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 7, 0x20, "gpa1", 0x04, 0x08, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 5, 0x40, "gpa2", 0x08, 0x10, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x60, "gpa3", 0x0c, 0x18, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x80, "gpa4", 0x10, 0x1c, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 7, 0xa0, "gpa5", 0x14, 0x20, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0xc0, "gpa9", 0x18, 0x28, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 2, 0xe0, "gpa10", 0x1c, 0x30, FLT_SELECTABLE),
+};
+
+/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x0, "gpa6", 0x00, 0x00, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x20, "gpa7", 0x04, 0x08, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x40, "gpa8", 0x08, 0x0c, FLT_SELECTABLE),
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 2, 0x60, "gpa11", 0x0c, 0x14, FLT_SELECTABLE),
+};
+
+/* pin banks of gs101 pin-controller (GSACORE) */
+static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x0, "gps0", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x20, "gps1", 0x04, 0x04, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 3, 0x40, "gps2", 0x08, 0x0c, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (GSACTRL) */
+static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
+	EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 6, 0x0, "gps3", 0x00, 0x00, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (PERIC0) */
+static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 5, 0x0, "gpp0", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x20, "gpp1", 0x04, 0x08, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x40, "gpp2", 0x08, 0x0c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x60, "gpp3", 0x0c, 0x10, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x80, "gpp4", 0x10, 0x14, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0xa0, "gpp5", 0x14, 0x18, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xc0, "gpp6", 0x18, 0x1c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0xe0, "gpp7", 0x1c, 0x20, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x100, "gpp8", 0x20, 0x24, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x120, "gpp9", 0x24, 0x28, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x140, "gpp10", 0x28, 0x2c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x160, "gpp11", 0x2c, 0x30, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x180, "gpp12", 0x30, 0x34, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x1a0, "gpp13", 0x34, 0x38, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x1c0, "gpp14", 0x38, 0x3c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x1e0, "gpp15", 0x3c, 0x40, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x200, "gpp16", 0x40, 0x44, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x220, "gpp17", 0x44, 0x48, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x240, "gpp18", 0x48, 0x4c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x260, "gpp19", 0x4c, 0x50, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (PERIC1) */
+static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x0, "gpp20", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x20, "gpp21", 0x04, 0x08, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x40, "gpp22", 0x08, 0x0c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x60, "gpp23", 0x0c, 0x10, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x80, "gpp24", 0x10, 0x18, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xa0, "gpp25", 0x14, 0x1c, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 5, 0xc0, "gpp26", 0x18, 0x20, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xe0, "gpp27", 0x1c, 0x28, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (HSI1) */
+static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x0, "gph0", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 7, 0x20, "gph1", 0x04, 0x08, FLT_DEFAULT),
+};
+
+/* pin banks of gs101 pin-controller (HSI2) */
+static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x0, "gph2", 0x00, 0x00, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x20, "gph3", 0x04, 0x08, FLT_DEFAULT),
+	EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x40, "gph4", 0x08, 0x0c, FLT_DEFAULT),
+};
+
+static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
+	{
+		/* pin banks of gs101 pin-controller (ALIVE) */
+		.pin_banks	= gs101_pin_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_alive),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
+		.pin_banks	= gs101_pin_far_alive,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_far_alive),
+		.eint_gpio_init = exynos_eint_gpio_init,
+		.eint_wkup_init = exynos_eint_wkup_init,
+		.suspend	= exynos_pinctrl_suspend,
+		.resume		= exynos_pinctrl_resume,
+	}, {
+		/* pin banks of gs101 pin-controller (GSACORE) */
+		.pin_banks	= gs101_pin_gsacore,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsacore),
+		.eint_gpio_init = exynos_eint_gpio_init,
+	}, {
+		/* pin banks of gs101 pin-controller (GSACTRL) */
+		.pin_banks	= gs101_pin_gsactrl,
+		.nr_banks	= ARRAY_SIZE(gs101_pin_gsactrl),
+		.eint_gpio_init = exynos_eint_gpio_init,
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
index 800831aa8357..014f0c37f97f 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -533,6 +533,8 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
 			.data = &exynos7_wkup_irq_chip },
 	{ .compatible = "samsung,exynosautov9-wakeup-eint",
 			.data = &exynos7_wkup_irq_chip },
+	{ .compatible = "google,gs101-wakeup-eint",
+			.data = &exynos7_wkup_irq_chip },
 	{ }
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 63b2426ad5d6..0dd013654bd2 100644
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
+#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs, fltcon_offs, fltcontype) \
+	{						\
+		.type		= &types,		\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_GPIO,	\
+		.eint_offset	= offs,			\
+		.fltcon_type    = fltcontype,		\
+		.fltcon_offset	= fltcon_offs,		\
+		.name		= id			\
+	}
+
+#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs, fltcon_offs, fltcontype) \
+	{						\
+		.type		= &types,		\
+		.pctl_offset	= reg,			\
+		.nr_pins	= pins,			\
+		.eint_type	= EINT_TYPE_WKUP,	\
+		.eint_offset	= offs,			\
+		.fltcon_type    = fltcontype,		\
+		.fltcon_offset	= fltcon_offs,		\
+		.name		= id			\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 449f8109d8b5..12176f98440d 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = &exynosautov9_of_data },
 	{ .compatible = "tesla,fsd-pinctrl",
 		.data = &fsd_of_data },
+	{ .compatible = "google,gs101-pinctrl",
+		.data = &gs101_of_data },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index de2ca8e8b378..e62e909fb10d 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -374,6 +374,7 @@ extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
+extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-- 
2.42.0.655.g421f12c284-goog

