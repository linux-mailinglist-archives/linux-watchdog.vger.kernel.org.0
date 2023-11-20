Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464127F1F12
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Nov 2023 22:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbjKTVWD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Nov 2023 16:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjKTVVl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:41 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DACDCD
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:36 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32ddfb38c02so3224107f8f.3
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515295; x=1701120095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xzH1qVWZagQwtrex4D7hKZbomAwnZl4FRr3XQibftE=;
        b=Ukdr7kkkh95+A5urbtu9H7x4WOjqGMwjBuMcsWAqoh1HeGyj5HWolk0vhmVvuO6evM
         kBFylddvyZZOXWvIhLJ2IWFC5qMYU1rdCWTuZ5H5C6P0A1BlW7V7+PZcfEtIRqVdVeWj
         fwnjvqHbn2cZukU92NJVTcSdeR1hDXueHOX2vav4CewhPEfVUib4saeXJFeNpBgdd03Q
         tQjC6BGAL8/TGTW9BsgS8G4KiIRBBAGbaEgll/C0AT7/PJkgCrwexUxQGeFPCTHku0a3
         yoKgMH1d8E7055J6XM89Kr2NKAKYrB8N7LHsh5G/TiAZZQKp138RB0feX9+CLgCsw9s3
         vMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515295; x=1701120095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xzH1qVWZagQwtrex4D7hKZbomAwnZl4FRr3XQibftE=;
        b=dBB3QurBXRDRCuQa2U3SVhf/41vHaMRiZJv0n4ffcZRPy9MBxPh0XJKzhaW1vfqU5H
         R5jzFHTXz7tyy6wNUIOxbDP+kai5JWrYqot3DB5wLz+CIG/SauXwWx0orXdNUDVSR2Gj
         3cSUynRIE/+cWEawFw6neMSig2beGLBIX8MsFSnVdNEyKqk2SlSdqDmsMioCQt1LTrNM
         GZs2N/z3XnLsz6VMDJNsnNKZIcURoxr9B1ajsdyqyDU6ywnHaQYtuvPyoztCz/4JQWhT
         2+JCcMU2jjbEb9cM3iu7GM1KnDTBGF01pp3jcZSyn2r6wnqLleTmCK5EokOLiWC+odzt
         9ZEw==
X-Gm-Message-State: AOJu0YyVr4EYTBLaWvldEGvwQBdr1Sf5uQ7i+v3lmSVhnrCU+cyCWGKy
        7EBnqv/2LIvzmDzYjVTKl1PFSg==
X-Google-Smtp-Source: AGHT+IHlI8CbGgLGdDp2LcFN/quv8DGZ8mmUQYQ6BZCv79rxA1KKalAof733Ct4yCGTEyNtq9o2Lfw==
X-Received: by 2002:a5d:4ecc:0:b0:331:3c1f:b94b with SMTP id s12-20020a5d4ecc000000b003313c1fb94bmr5666176wrv.6.1700515294943;
        Mon, 20 Nov 2023 13:21:34 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:34 -0800 (PST)
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
Subject: [PATCH v4 18/19] arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
Date:   Mon, 20 Nov 2023 21:20:36 +0000
Message-ID: <20231120212037.911774-19-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add initial board support for the Pixel 6 phone code named Oriole. This
has been tested with a minimal busybox initramfs and boots to a shell.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |  2 +
 arch/arm64/boot/dts/exynos/google/Makefile    |  4 +
 .../boot/dts/exynos/google/gs101-oriole.dts   | 79 +++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 6e4ba69268e5..44c24a8ad9e1 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+subdir-y += google
+
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
new file mode 100644
index 000000000000..0a6d5e1fe4ee
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_EXYNOS) += \
+	gs101-oriole.dtb \
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
new file mode 100644
index 000000000000..111665490840
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole Device Tree
+ *
+ * Copyright 2021-2023 Google,LLC
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "gs101-pinctrl.h"
+#include "gs101.dtsi"
+
+/ {
+	model = "Oriole";
+	compatible = "google,gs101-oriole", "google,gs101";
+
+	chosen {
+		bootargs = "earlycon=exynos4210,mmio32,0x10A00000 console=ttySAC0";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
+
+		button-vol-down {
+			label = "KEY_VOLUMEDOWN";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-vol-up {
+			label = "KEY_VOLUMEUP";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "KEY_POWER";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+};
+
+&pinctrl_1 {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa7-3";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa8-1";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_0 {
+	key_power: key-power-pins {
+		samsung,pins = "gpa10-1";
+		samsung,pin-function = <0xf>;
+		samsung,pin-pud = <0>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&watchdog_cl0 {
+	timeout-sec = <30>;
+};
-- 
2.43.0.rc1.413.gea7ed67945-goog

