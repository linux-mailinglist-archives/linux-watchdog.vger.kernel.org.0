Return-Path: <linux-watchdog+bounces-250-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCABB80D179
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 17:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881931F21554
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 16:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C0F4E1DF;
	Mon, 11 Dec 2023 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qiwyg4ol"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0278107
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 08:24:38 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so27315085e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311877; x=1702916677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+3kk1hpyKSLvQy+/RHtDCZsNCLc1AmSTiGug9h7IyQ=;
        b=Qiwyg4ol3NX/JxH3LZNrI9Gnp5zd5uRJRpaV7MP1/LM/P3TcC3ANGYQrMdbvFvhL4P
         bENE7XliTzyym6eeNlYNCxkv2ZfxbjL+f45Wd46cSslard055WnnIPEcin/vqW5h5lvK
         Oz9BKxRPrxi6L6gWy2WjywqKwWIMfKkIbLmuMmjYmfe1MaMN8rzqgZ9DTrcpMR6oEDDo
         aslSElGvarzqXFzdP7rhMNiyPIDLGBK6VrrXSOibe44LmyhxPI9UN+niiwDb8uAVqgAj
         D2HR966ZhkRnE0rCmAXFb30iF2HmsWvhDaPCUyubUv+JIR/DC6aJG/9Ug9hRv/np6b1Q
         cDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311877; x=1702916677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+3kk1hpyKSLvQy+/RHtDCZsNCLc1AmSTiGug9h7IyQ=;
        b=Xexybhzu48U/dSd/NmU4V4cAUEndtr3cKup1qBP7DTkLYToB5lch5nfV+e+PDOJdl7
         qt1JHFv49REvx3Q8h8OUYyItZLUYkme7e5SWmUBIQsXKe5QkPENddCxxIOc2RM8f8mXJ
         kXJCWJUr0M+u2f5IdX9jZHFtknqAaQN9FYmIapQyFPYpI0nUF1Tjo6t7+x6texwdOrXo
         rlCpvVtXgarLMdoaFylC0c/LgUAC4WaIW8EoLl9suYXqW/vN/7BvkA0vvGrKhRvHx2Qe
         IeApevUyTsgewqH3PQHbWDa41aB6PjEU7i8FSHD98EkI6MiY4spjboO6abdoZULe4HGg
         4qWA==
X-Gm-Message-State: AOJu0YxHjxIg2cio93Uc2Jyc6nyZchW9y1Oav47Ugslgx4p8yMmXftQV
	UttiVF+EXeFvxSBMV6JQQVBvbw==
X-Google-Smtp-Source: AGHT+IE9zBGzQdTgMzFpJ48GT6DXnO3j+hmTpzLGGpS5h2ldHMowGaXuhUzCoyMrbiEvOdJGmErpEg==
X-Received: by 2002:a05:600c:4981:b0:402:f55c:faee with SMTP id h1-20020a05600c498100b00402f55cfaeemr2733322wmp.26.1702311877157;
        Mon, 11 Dec 2023 08:24:37 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:36 -0800 (PST)
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
Subject: [PATCH v7 15/16] arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
Date: Mon, 11 Dec 2023 16:23:30 +0000
Message-ID: <20231211162331.435900-16-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial board support for the Pixel 6 phone code named Oriole. This
has been tested with a minimal busybox initramfs and boots to a shell.

Tested-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/Makefile           |   2 +
 arch/arm64/boot/dts/exynos/google/Makefile    |   4 +
 .../boot/dts/exynos/google/gs101-oriole.dts   | 105 ++++++++++++++++++
 3 files changed, 111 insertions(+)
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
index 000000000000..4a71f752200d
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
+ */
+
+/dts-v1/;
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
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		/* Bootloader expects bootargs specified otherwise it crashes */
+		bootargs = "";
+		stdout-path = &serial_0;
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
+&ext_24_5m {
+	clock-frequency = <24576000>;
+};
+
+&ext_200m {
+	clock-frequency = <200000000>;
+};
+
+&pinctrl_far_alive {
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa7-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa8-1";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&pinctrl_gpio_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa10-1";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&serial_0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_bus>;
+	status = "okay";
+};
+
+&usi_uart {
+	samsung,clkreq-on; /* needed for UART mode */
+	status = "okay";
+};
+
+&watchdog_cl0 {
+	timeout-sec = <30>;
+	status = "okay";
+};
-- 
2.43.0.472.g3155946c3a-goog


