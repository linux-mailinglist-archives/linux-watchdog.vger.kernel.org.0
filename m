Return-Path: <linux-watchdog+bounces-73-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5746800F85
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 17:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E13C2B21926
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 16:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDED4C616;
	Fri,  1 Dec 2023 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSsPLmYJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F8510F4
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Dec 2023 08:11:08 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3316a4bc37dso2000241f8f.2
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Dec 2023 08:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447067; x=1702051867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WssMsoubz+/lHxk8HIeoSFFSUIM6tIkDHX9SIMnklmQ=;
        b=hSsPLmYJYdWPZ5Lc/btPocDeMYPBvm+wlYQABf5Pvg6s6O/j409VZiYdTUhbSvcwo3
         FC20tRPgeA5foGgD8QEZZlahBhw/v8slxPBYyyxAJcTLUdABZkKqIjUoKT96PBp2bCgZ
         9JxTAkljim8/JefCByFIs3XdYeBImmZyI8HRHbp5YO9U2k+I+ao2B9LmR+J24HVGVGYB
         E1TLpLu8HraVqEn8X1uRBqTUIBUF9WHKPvLVre67zm/PseKoVqOAaPx3vTQ/duQXlfKf
         CDhqbLGSDFjc43A2fQHwRirXm0ckG+uI9Owqm1wayL+i1UjnP8UZ8ADq/vhKbFX6rcZv
         kPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447067; x=1702051867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WssMsoubz+/lHxk8HIeoSFFSUIM6tIkDHX9SIMnklmQ=;
        b=RueXx6vEU7aeLK0JT4qIs+e20qEomeyI1n5C35nKQU1nLIFONn6lrMY4ga2QEmgIKu
         5Zh3xYUQ5/nTB90iFkg+m6m3tdrS7+mOa4sWfZD7wXeTXgeyj4a/cWBHkgNIQW4RMtRX
         vG8Av8o2RJp7bcb3SArBoGbKs06p0JyPfR2pDEfV8MXhGDxLYWOZTMHK83n4MQ929zRY
         E2HZA0ngcptm6UEbglAxCvxeDjJQhGCNQaRd2ehX3G81IvTbQRMdIwW2+KTQKQekv/WS
         opRPRZPzkDTLjHvj3pvEr1ELwtJ7lizlb1AQNKjrLOBGaUpoAeEMlLyo8KXJxbgqkWm/
         a7ZQ==
X-Gm-Message-State: AOJu0YztOqMUEnrVX7JDaQXRJAxJvoC9cpGJDG1RyzOcamkI6GvBYhhz
	5/1zCmQaoN4MCUatzSo99vuwXg==
X-Google-Smtp-Source: AGHT+IFfI4lI4z20MRRAblsmVnCK0n2tuQaj3Eoho8pSzORE4yPu9B6+z5TrN4eUZimStxf+XOgMMg==
X-Received: by 2002:adf:f706:0:b0:333:18ea:bf12 with SMTP id r6-20020adff706000000b0033318eabf12mr1026364wrp.71.1701447067044;
        Fri, 01 Dec 2023 08:11:07 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:06 -0800 (PST)
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
Subject: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
Date: Fri,  1 Dec 2023 16:09:17 +0000
Message-ID: <20231201160925.3136868-13-peter.griffin@linaro.org>
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

cmu_top is the top level clock management unit which contains PLLs, muxes,
dividers and gates that feed the other clock management units.

cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
APM module.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/Makefile    |    1 +
 drivers/clk/samsung/clk-gs101.c | 2495 +++++++++++++++++++++++++++++++
 2 files changed, 2496 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-gs101.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index ebbeacabe88f..3056944a5a54 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
 obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
 obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
new file mode 100644
index 000000000000..6bd233a7ab63
--- /dev/null
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -0,0 +1,2495 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ * Author: Peter Griffin <peter.griffin@linaro.org>
+ *
+ * Common Clock Framework support for GS101.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/google,gs101.h>
+
+#include "clk.h"
+#include "clk-exynos-arm64.h"
+
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define TOP_NR_CLK	(CLK_GOUT_TPU_UART + 1)
+#define APM_NR_CLK	(CLK_APM_PLL_DIV16_APM + 1)
+#define MISC_NR_CLK	(CLK_GOUT_MISC_XIU_D_MISC_IPCLKPORT_ACLK + 1)
+
+/* ---- CMU_TOP ------------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_TOP (0x1e080000) */
+
+#define PLL_LOCKTIME_PLL_SHARED0			0x0000
+#define PLL_LOCKTIME_PLL_SHARED1			0x0004
+#define PLL_LOCKTIME_PLL_SHARED2			0x0008
+#define PLL_LOCKTIME_PLL_SHARED3			0x000c
+#define PLL_LOCKTIME_PLL_SPARE				0x0010
+#define PLL_CON0_PLL_SHARED0				0x0100
+#define PLL_CON1_PLL_SHARED0				0x0104
+#define PLL_CON2_PLL_SHARED0				0x0108
+#define PLL_CON3_PLL_SHARED0				0x010c
+#define PLL_CON4_PLL_SHARED0				0x0110
+#define PLL_CON0_PLL_SHARED1				0x0140
+#define PLL_CON1_PLL_SHARED1				0x0144
+#define PLL_CON2_PLL_SHARED1				0x0148
+#define PLL_CON3_PLL_SHARED1				0x014c
+#define PLL_CON4_PLL_SHARED1				0x0150
+#define PLL_CON0_PLL_SHARED2				0x0180
+#define PLL_CON1_PLL_SHARED2				0x0184
+#define PLL_CON2_PLL_SHARED2				0x0188
+#define PLL_CON3_PLL_SHARED2				0x018c
+#define PLL_CON4_PLL_SHARED2				0x0190
+#define PLL_CON0_PLL_SHARED3				0x01c0
+#define PLL_CON1_PLL_SHARED3				0x01c4
+#define PLL_CON2_PLL_SHARED3				0x01c8
+#define PLL_CON3_PLL_SHARED3				0x01cc
+#define PLL_CON4_PLL_SHARED3				0x01d0
+#define PLL_CON0_PLL_SPARE				0x0200
+#define PLL_CON1_PLL_SPARE				0x0204
+#define PLL_CON2_PLL_SPARE				0x0208
+#define PLL_CON3_PLL_SPARE				0x020c
+#define PLL_CON4_PLL_SPARE				0x0210
+#define CMU_CMU_TOP_CONTROLLER_OPTION			0x0800
+#define CLKOUT_CON_BLK_CMU_CMU_TOP_CLKOUT0		0x0810
+#define CMU_HCHGEN_CLKMUX_CMU_BOOST			0x0840
+#define CMU_HCHGEN_CLKMUX_TOP_BOOST			0x0844
+#define CMU_HCHGEN_CLKMUX				0x0850
+#define POWER_FAIL_DETECT_PLL				0x0864
+#define EARLY_WAKEUP_FORCED_0_ENABLE			0x0870
+#define EARLY_WAKEUP_FORCED_1_ENABLE			0x0874
+#define EARLY_WAKEUP_APM_CTRL				0x0878
+#define EARLY_WAKEUP_CLUSTER0_CTRL			0x087c
+#define EARLY_WAKEUP_DPU_CTRL				0x0880
+#define EARLY_WAKEUP_CSIS_CTRL				0x0884
+#define EARLY_WAKEUP_APM_DEST				0x0890
+#define EARLY_WAKEUP_CLUSTER0_DEST			0x0894
+#define EARLY_WAKEUP_DPU_DEST				0x0898
+#define EARLY_WAKEUP_CSIS_DEST				0x089c
+#define EARLY_WAKEUP_SW_TRIG_APM			0x08c0
+#define EARLY_WAKEUP_SW_TRIG_APM_SET			0x08c4
+#define EARLY_WAKEUP_SW_TRIG_APM_CLEAR			0x08c8
+#define EARLY_WAKEUP_SW_TRIG_CLUSTER0			0x08d0
+#define EARLY_WAKEUP_SW_TRIG_CLUSTER0_SET		0x08d4
+#define EARLY_WAKEUP_SW_TRIG_CLUSTER0_CLEAR		0x08d8
+#define EARLY_WAKEUP_SW_TRIG_DPU			0x08e0
+#define EARLY_WAKEUP_SW_TRIG_DPU_SET			0x08e4
+#define EARLY_WAKEUP_SW_TRIG_DPU_CLEAR			0x08e8
+#define EARLY_WAKEUP_SW_TRIG_CSIS			0x08f0
+#define EARLY_WAKEUP_SW_TRIG_CSIS_SET			0x08f4
+#define EARLY_WAKEUP_SW_TRIG_CSIS_CLEAR			0x08f8
+
+#define CLK_CON_MUX_MUX_CLKCMU_BO_BUS			0x1000
+#define CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS			0x1004
+#define CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS			0x1008
+#define CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS			0x100c
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0			0x1010
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1			0x1014
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2			0x1018
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3			0x101c
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK4			0x1020
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK5			0x1024
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK6			0x1028
+#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK7			0x102c
+#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST		0x1030
+#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST_OPTION1	0x1034
+#define CLK_CON_MUX_MUX_CLKCMU_CORE_BUS			0x1038
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG		0x103c
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH		0x1040
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH		0x1044
+#define CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH		0x1048
+#define CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS			0x104c
+#define CLK_CON_MUX_MUX_CLKCMU_DISP_BUS			0x1050
+#define CLK_CON_MUX_MUX_CLKCMU_DNS_BUS			0x1054
+#define CLK_CON_MUX_MUX_CLKCMU_DPU_BUS			0x1058
+#define CLK_CON_MUX_MUX_CLKCMU_EH_BUS			0x105c
+#define CLK_CON_MUX_MUX_CLKCMU_G2D_G2D			0x1060
+#define CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL			0x1064
+#define CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA		0x1068
+#define CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD			0x106c
+#define CLK_CON_MUX_MUX_CLKCMU_G3D_GLB			0x1070
+#define CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH		0x1074
+#define CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0			0x1078
+#define CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1			0x107c
+#define CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC			0x1080
+#define CLK_CON_MUX_MUX_CLKCMU_HPM			0x1084
+#define CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS			0x1088
+#define CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC		0x108c
+#define CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD		0x1090
+#define CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG		0x1094
+#define CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS			0x1098
+#define CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE		0x109c
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS			0x10a0
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD		0x10a4
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE		0x10a8
+#define CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD		0x10ac
+#define CLK_CON_MUX_MUX_CLKCMU_IPP_BUS			0x10b0
+#define CLK_CON_MUX_MUX_CLKCMU_ITP_BUS			0x10b4
+#define CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC		0x10b8
+#define CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC		0x10bc
+#define CLK_CON_MUX_MUX_CLKCMU_MFC_MFC			0x10c0
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP			0x10c4
+#define CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH		0x10c8
+#define CLK_CON_MUX_MUX_CLKCMU_MISC_BUS			0x10cc
+#define CLK_CON_MUX_MUX_CLKCMU_MISC_SSS			0x10d0
+#define CLK_CON_MUX_MUX_CLKCMU_PDP_BUS			0x10d4
+#define CLK_CON_MUX_MUX_CLKCMU_PDP_VRA			0x10d8
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS		0x10dc
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP		0x10e0
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS		0x10e4
+#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP		0x10e8
+#define CLK_CON_MUX_MUX_CLKCMU_TNR_BUS			0x10ec
+#define CLK_CON_MUX_MUX_CLKCMU_TOP_BOOST_OPTION1	0x10f0
+#define CLK_CON_MUX_MUX_CLKCMU_TOP_CMUREF		0x10f4
+#define CLK_CON_MUX_MUX_CLKCMU_TPU_BUS			0x10f8
+#define CLK_CON_MUX_MUX_CLKCMU_TPU_TPU			0x10fc
+#define CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL		0x1100
+#define CLK_CON_MUX_MUX_CLKCMU_TPU_UART			0x1104
+#define CLK_CON_MUX_MUX_CMU_CMUREF			0x1108
+
+#define CLK_CON_DIV_CLKCMU_BO_BUS			0x1800
+#define CLK_CON_DIV_CLKCMU_BUS0_BUS			0x1804
+#define CLK_CON_DIV_CLKCMU_BUS1_BUS			0x1808
+#define CLK_CON_DIV_CLKCMU_BUS2_BUS			0x180c
+#define CLK_CON_DIV_CLKCMU_CIS_CLK0			0x1810
+#define CLK_CON_DIV_CLKCMU_CIS_CLK1			0x1814
+#define CLK_CON_DIV_CLKCMU_CIS_CLK2			0x1818
+#define CLK_CON_DIV_CLKCMU_CIS_CLK3			0x181c
+#define CLK_CON_DIV_CLKCMU_CIS_CLK4			0x1820
+#define CLK_CON_DIV_CLKCMU_CIS_CLK5			0x1824
+#define CLK_CON_DIV_CLKCMU_CIS_CLK6			0x1828
+#define CLK_CON_DIV_CLKCMU_CIS_CLK7			0x182c
+#define CLK_CON_DIV_CLKCMU_CORE_BUS			0x1830
+#define CLK_CON_DIV_CLKCMU_CPUCL0_DBG			0x1834
+#define CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH		0x1838
+#define CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH		0x183c
+#define CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH		0x1840
+#define CLK_CON_DIV_CLKCMU_CSIS_BUS			0x1844
+#define CLK_CON_DIV_CLKCMU_DISP_BUS			0x1848
+#define CLK_CON_DIV_CLKCMU_DNS_BUS			0x184c
+#define CLK_CON_DIV_CLKCMU_DPU_BUS			0x1850
+#define CLK_CON_DIV_CLKCMU_EH_BUS			0x1854
+#define CLK_CON_DIV_CLKCMU_G2D_G2D			0x1858
+#define CLK_CON_DIV_CLKCMU_G2D_MSCL			0x185c
+#define CLK_CON_DIV_CLKCMU_G3AA_G3AA			0x1860
+#define CLK_CON_DIV_CLKCMU_G3D_BUSD			0x1864
+#define CLK_CON_DIV_CLKCMU_G3D_GLB			0x1868
+#define CLK_CON_DIV_CLKCMU_G3D_SWITCH			0x186c
+#define CLK_CON_DIV_CLKCMU_GDC_GDC0			0x1870
+#define CLK_CON_DIV_CLKCMU_GDC_GDC1			0x1874
+#define CLK_CON_DIV_CLKCMU_GDC_SCSC			0x1878
+#define CLK_CON_DIV_CLKCMU_HPM				0x187c
+#define CLK_CON_DIV_CLKCMU_HSI0_BUS			0x1880
+#define CLK_CON_DIV_CLKCMU_HSI0_DPGTC			0x1884
+#define CLK_CON_DIV_CLKCMU_HSI0_USB31DRD		0x1888
+#define CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG		0x188c
+#define CLK_CON_DIV_CLKCMU_HSI1_BUS			0x1890
+#define CLK_CON_DIV_CLKCMU_HSI1_PCIE			0x1894
+#define CLK_CON_DIV_CLKCMU_HSI2_BUS			0x1898
+#define CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD		0x189c
+#define CLK_CON_DIV_CLKCMU_HSI2_PCIE			0x18a0
+#define CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD		0x18a4
+#define CLK_CON_DIV_CLKCMU_IPP_BUS			0x18a8
+#define CLK_CON_DIV_CLKCMU_ITP_BUS			0x18ac
+#define CLK_CON_DIV_CLKCMU_MCSC_ITSC			0x18b0
+#define CLK_CON_DIV_CLKCMU_MCSC_MCSC			0x18b4
+#define CLK_CON_DIV_CLKCMU_MFC_MFC			0x18b8
+#define CLK_CON_DIV_CLKCMU_MIF_BUSP			0x18bc
+#define CLK_CON_DIV_CLKCMU_MISC_BUS			0x18c0
+#define CLK_CON_DIV_CLKCMU_MISC_SSS			0x18c4
+#define CLK_CON_DIV_CLKCMU_OTP				0x18c8
+#define CLK_CON_DIV_CLKCMU_PDP_BUS			0x18cc
+#define CLK_CON_DIV_CLKCMU_PDP_VRA			0x18d0
+#define CLK_CON_DIV_CLKCMU_PERIC0_BUS			0x18d4
+#define CLK_CON_DIV_CLKCMU_PERIC0_IP			0x18d8
+#define CLK_CON_DIV_CLKCMU_PERIC1_BUS			0x18dc
+#define CLK_CON_DIV_CLKCMU_PERIC1_IP			0x18e0
+#define CLK_CON_DIV_CLKCMU_TNR_BUS			0x18e4
+#define CLK_CON_DIV_CLKCMU_TPU_BUS			0x18e8
+#define CLK_CON_DIV_CLKCMU_TPU_TPU			0x18ec
+#define CLK_CON_DIV_CLKCMU_TPU_TPUCTL			0x18f0
+#define CLK_CON_DIV_CLKCMU_TPU_UART			0x18f4
+#define CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST		0x18f8
+#define CLK_CON_DIV_DIV_CLK_CMU_CMUREF			0x18fc
+#define CLK_CON_DIV_PLL_SHARED0_DIV2			0x1900
+#define CLK_CON_DIV_PLL_SHARED0_DIV3			0x1904
+#define CLK_CON_DIV_PLL_SHARED0_DIV4			0x1908
+#define CLK_CON_DIV_PLL_SHARED0_DIV5			0x190c
+#define CLK_CON_DIV_PLL_SHARED1_DIV2			0x1910
+#define CLK_CON_DIV_PLL_SHARED1_DIV3			0x1914
+#define CLK_CON_DIV_PLL_SHARED1_DIV4			0x1918
+#define CLK_CON_DIV_PLL_SHARED2_DIV2			0x191c
+#define CLK_CON_DIV_PLL_SHARED3_DIV2			0x1920
+
+/* CLK_CON_GAT_UPDATES */
+#define CLK_CON_GAT_CLKCMU_BUS0_BOOST			0x2000
+#define CLK_CON_GAT_CLKCMU_BUS1_BOOST			0x2004
+#define CLK_CON_GAT_CLKCMU_BUS2_BOOST			0x2008
+#define CLK_CON_GAT_CLKCMU_CORE_BOOST			0x200c
+#define CLK_CON_GAT_CLKCMU_CPUCL0_BOOST			0x2010
+#define CLK_CON_GAT_CLKCMU_CPUCL1_BOOST			0x2014
+#define CLK_CON_GAT_CLKCMU_CPUCL2_BOOST			0x2018
+#define CLK_CON_GAT_CLKCMU_MIF_BOOST			0x201c
+#define CLK_CON_GAT_CLKCMU_MIF_SWITCH			0x2020
+#define CLK_CON_GAT_GATE_CLKCMU_BO_BUS			0x2024
+#define CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS		0x2028
+#define CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS		0x202c
+#define CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS		0x2030
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0		0x2034
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1		0x2038
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2		0x203c
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3		0x2040
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4		0x2044
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5		0x2048
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK6		0x204c
+#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK7		0x2050
+#define CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST		0x2054
+#define CLK_CON_GAT_GATE_CLKCMU_CORE_BUS		0x2058
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS		0x205c
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH		0x2060
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH		0x2064
+#define CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH		0x2068
+#define CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS		0x206c
+#define CLK_CON_GAT_GATE_CLKCMU_DISP_BUS		0x2070
+#define CLK_CON_GAT_GATE_CLKCMU_DNS_BUS			0x2074
+#define CLK_CON_GAT_GATE_CLKCMU_DPU_BUS			0x2078
+#define CLK_CON_GAT_GATE_CLKCMU_EH_BUS			0x207c
+#define CLK_CON_GAT_GATE_CLKCMU_G2D_G2D			0x2080
+#define CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL		0x2084
+#define CLK_CON_GAT_GATE_CLKCMU_G3AA_G3AA		0x2088
+#define CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD		0x208c
+#define CLK_CON_GAT_GATE_CLKCMU_G3D_GLB			0x2090
+#define CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH		0x2094
+#define CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0		0x2098
+#define CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1		0x209c
+#define CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC		0x20a0
+#define CLK_CON_GAT_GATE_CLKCMU_HPM			0x20a4
+#define CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS		0x20a8
+#define CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC		0x20ac
+#define CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD		0x20b0
+#define CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG		0x20b4
+#define CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS		0x20b8
+#define CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE		0x20bc
+#define CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS		0x20c0
+#define CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD		0x20c4
+#define CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE		0x20c8
+#define CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD		0x20cc
+#define CLK_CON_GAT_GATE_CLKCMU_IPP_BUS			0x20d0
+#define CLK_CON_GAT_GATE_CLKCMU_ITP_BUS			0x20d4
+#define CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC		0x20d8
+#define CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC		0x20dc
+#define CLK_CON_GAT_GATE_CLKCMU_MFC_MFC			0x20e0
+#define CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP		0x20e4
+#define CLK_CON_GAT_GATE_CLKCMU_MISC_BUS		0x20e8
+#define CLK_CON_GAT_GATE_CLKCMU_MISC_SSS		0x20ec
+#define CLK_CON_GAT_GATE_CLKCMU_PDP_BUS			0x20f0
+#define CLK_CON_GAT_GATE_CLKCMU_PDP_VRA			0x20f4
+#define CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS		0x20f8
+#define CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP		0x20fc
+#define CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS		0x2100
+#define CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP		0x2104
+#define CLK_CON_GAT_GATE_CLKCMU_TNR_BUS			0x2108
+#define CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF		0x210c
+#define CLK_CON_GAT_GATE_CLKCMU_TPU_BUS			0x2110
+#define CLK_CON_GAT_GATE_CLKCMU_TPU_TPU			0x2114
+#define CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL		0x2118
+#define CLK_CON_GAT_GATE_CLKCMU_TPU_UART		0x211c
+
+#define DMYQCH_CON_CMU_TOP_CMUREF_QCH			0x3000
+#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK0		0x3004
+#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK1		0x3008
+#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK2		0x300c
+#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK3		0x3010
+#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK4		0x3014
+#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK5		0x3018
+#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK6		0x301c
+#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK7		0x3020
+#define DMYQCH_CON_OTP_QCH				0x3024
+#define QUEUE_CTRL_REG_BLK_CMU_CMU_TOP			0x3c00
+#define QUEUE_ENTRY0_BLK_CMU_CMU_TOP			0x3c10
+#define QUEUE_ENTRY1_BLK_CMU_CMU_TOP			0x3c14
+#define QUEUE_ENTRY2_BLK_CMU_CMU_TOP			0x3c18
+#define QUEUE_ENTRY3_BLK_CMU_CMU_TOP			0x3c1c
+#define QUEUE_ENTRY4_BLK_CMU_CMU_TOP			0x3c20
+#define QUEUE_ENTRY5_BLK_CMU_CMU_TOP			0x3c24
+#define QUEUE_ENTRY6_BLK_CMU_CMU_TOP			0x3c28
+#define QUEUE_ENTRY7_BLK_CMU_CMU_TOP			0x3c2c
+#define MIFMIRROR_QUEUE_CTRL_REG			0x3e00
+#define MIFMIRROR_QUEUE_ENTRY0				0x3e10
+#define MIFMIRROR_QUEUE_ENTRY1				0x3e14
+#define MIFMIRROR_QUEUE_ENTRY2				0x3e18
+#define MIFMIRROR_QUEUE_ENTRY3				0x3e1c
+#define MIFMIRROR_QUEUE_ENTRY4				0x3e20
+#define MIFMIRROR_QUEUE_ENTRY5				0x3e24
+#define MIFMIRROR_QUEUE_ENTRY6				0x3e28
+#define MIFMIRROR_QUEUE_ENTRY7				0x3e2c
+#define MIFMIRROR_QUEUE_BUSY				0x3e30
+#define GENERALIO_ACD_CHANNEL_0				0x3f00
+#define GENERALIO_ACD_CHANNEL_1				0x3f04
+#define GENERALIO_ACD_CHANNEL_2				0x3f08
+#define GENERALIO_ACD_CHANNEL_3				0x3f0c
+#define GENERALIO_ACD_MASK				0x3f14
+
+static const unsigned long cmu_top_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_SHARED0,
+	PLL_LOCKTIME_PLL_SHARED1,
+	PLL_LOCKTIME_PLL_SHARED2,
+	PLL_LOCKTIME_PLL_SHARED3,
+	PLL_LOCKTIME_PLL_SPARE,
+	PLL_CON0_PLL_SHARED0,
+	PLL_CON1_PLL_SHARED0,
+	PLL_CON2_PLL_SHARED0,
+	PLL_CON3_PLL_SHARED0,
+	PLL_CON4_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
+	PLL_CON1_PLL_SHARED1,
+	PLL_CON2_PLL_SHARED1,
+	PLL_CON3_PLL_SHARED1,
+	PLL_CON4_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
+	PLL_CON1_PLL_SHARED2,
+	PLL_CON2_PLL_SHARED2,
+	PLL_CON3_PLL_SHARED2,
+	PLL_CON4_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
+	PLL_CON1_PLL_SHARED3,
+	PLL_CON2_PLL_SHARED3,
+	PLL_CON3_PLL_SHARED3,
+	PLL_CON4_PLL_SHARED3,
+	PLL_CON0_PLL_SPARE,
+	PLL_CON1_PLL_SPARE,
+	PLL_CON2_PLL_SPARE,
+	PLL_CON3_PLL_SPARE,
+	PLL_CON4_PLL_SPARE,
+	CMU_CMU_TOP_CONTROLLER_OPTION,
+	CLKOUT_CON_BLK_CMU_CMU_TOP_CLKOUT0,
+	CMU_HCHGEN_CLKMUX_CMU_BOOST,
+	CMU_HCHGEN_CLKMUX_TOP_BOOST,
+	CMU_HCHGEN_CLKMUX,
+	POWER_FAIL_DETECT_PLL,
+	EARLY_WAKEUP_FORCED_0_ENABLE,
+	EARLY_WAKEUP_FORCED_1_ENABLE,
+	EARLY_WAKEUP_APM_CTRL,
+	EARLY_WAKEUP_CLUSTER0_CTRL,
+	EARLY_WAKEUP_DPU_CTRL,
+	EARLY_WAKEUP_CSIS_CTRL,
+	EARLY_WAKEUP_APM_DEST,
+	EARLY_WAKEUP_CLUSTER0_DEST,
+	EARLY_WAKEUP_DPU_DEST,
+	EARLY_WAKEUP_CSIS_DEST,
+	EARLY_WAKEUP_SW_TRIG_APM,
+	EARLY_WAKEUP_SW_TRIG_APM_SET,
+	EARLY_WAKEUP_SW_TRIG_APM_CLEAR,
+	EARLY_WAKEUP_SW_TRIG_CLUSTER0,
+	EARLY_WAKEUP_SW_TRIG_CLUSTER0_SET,
+	EARLY_WAKEUP_SW_TRIG_CLUSTER0_CLEAR,
+	EARLY_WAKEUP_SW_TRIG_DPU,
+	EARLY_WAKEUP_SW_TRIG_DPU_SET,
+	EARLY_WAKEUP_SW_TRIG_DPU_CLEAR,
+	EARLY_WAKEUP_SW_TRIG_CSIS,
+	EARLY_WAKEUP_SW_TRIG_CSIS_SET,
+	EARLY_WAKEUP_SW_TRIG_CSIS_CLEAR,
+	CLK_CON_MUX_MUX_CLKCMU_BO_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK4,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK5,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK6,
+	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK7,
+	CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST,
+	CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST_OPTION1,
+	CLK_CON_MUX_MUX_CLKCMU_CORE_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_DISP_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_DNS_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_DPU_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_EH_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_G2D_G2D,
+	CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL,
+	CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA,
+	CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD,
+	CLK_CON_MUX_MUX_CLKCMU_G3D_GLB,
+	CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0,
+	CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1,
+	CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC,
+	CLK_CON_MUX_MUX_CLKCMU_HPM,
+	CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC,
+	CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD,
+	CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG,
+	CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE,
+	CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD,
+	CLK_CON_MUX_MUX_CLKCMU_IPP_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_ITP_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC,
+	CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC,
+	CLK_CON_MUX_MUX_CLKCMU_MFC_MFC,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP,
+	CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH,
+	CLK_CON_MUX_MUX_CLKCMU_MISC_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_MISC_SSS,
+	CLK_CON_MUX_MUX_CLKCMU_PDP_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_PDP_VRA,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP,
+	CLK_CON_MUX_MUX_CLKCMU_TNR_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_TOP_BOOST_OPTION1,
+	CLK_CON_MUX_MUX_CLKCMU_TOP_CMUREF,
+	CLK_CON_MUX_MUX_CLKCMU_TPU_BUS,
+	CLK_CON_MUX_MUX_CLKCMU_TPU_TPU,
+	CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL,
+	CLK_CON_MUX_MUX_CLKCMU_TPU_UART,
+	CLK_CON_MUX_MUX_CMU_CMUREF,
+	CLK_CON_DIV_CLKCMU_BO_BUS,
+	CLK_CON_DIV_CLKCMU_BUS0_BUS,
+	CLK_CON_DIV_CLKCMU_BUS1_BUS,
+	CLK_CON_DIV_CLKCMU_BUS2_BUS,
+	CLK_CON_DIV_CLKCMU_CIS_CLK0,
+	CLK_CON_DIV_CLKCMU_CIS_CLK1,
+	CLK_CON_DIV_CLKCMU_CIS_CLK2,
+	CLK_CON_DIV_CLKCMU_CIS_CLK3,
+	CLK_CON_DIV_CLKCMU_CIS_CLK4,
+	CLK_CON_DIV_CLKCMU_CIS_CLK5,
+	CLK_CON_DIV_CLKCMU_CIS_CLK6,
+	CLK_CON_DIV_CLKCMU_CIS_CLK7,
+	CLK_CON_DIV_CLKCMU_CORE_BUS,
+	CLK_CON_DIV_CLKCMU_CPUCL0_DBG,
+	CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH,
+	CLK_CON_DIV_CLKCMU_CSIS_BUS,
+	CLK_CON_DIV_CLKCMU_DISP_BUS,
+	CLK_CON_DIV_CLKCMU_DNS_BUS,
+	CLK_CON_DIV_CLKCMU_DPU_BUS,
+	CLK_CON_DIV_CLKCMU_EH_BUS,
+	CLK_CON_DIV_CLKCMU_G2D_G2D,
+	CLK_CON_DIV_CLKCMU_G2D_MSCL,
+	CLK_CON_DIV_CLKCMU_G3AA_G3AA,
+	CLK_CON_DIV_CLKCMU_G3D_BUSD,
+	CLK_CON_DIV_CLKCMU_G3D_GLB,
+	CLK_CON_DIV_CLKCMU_G3D_SWITCH,
+	CLK_CON_DIV_CLKCMU_GDC_GDC0,
+	CLK_CON_DIV_CLKCMU_GDC_GDC1,
+	CLK_CON_DIV_CLKCMU_GDC_SCSC,
+	CLK_CON_DIV_CLKCMU_HPM,
+	CLK_CON_DIV_CLKCMU_HSI0_BUS,
+	CLK_CON_DIV_CLKCMU_HSI0_DPGTC,
+	CLK_CON_DIV_CLKCMU_HSI0_USB31DRD,
+	CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG,
+	CLK_CON_DIV_CLKCMU_HSI1_BUS,
+	CLK_CON_DIV_CLKCMU_HSI1_PCIE,
+	CLK_CON_DIV_CLKCMU_HSI2_BUS,
+	CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD,
+	CLK_CON_DIV_CLKCMU_HSI2_PCIE,
+	CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD,
+	CLK_CON_DIV_CLKCMU_IPP_BUS,
+	CLK_CON_DIV_CLKCMU_ITP_BUS,
+	CLK_CON_DIV_CLKCMU_MCSC_ITSC,
+	CLK_CON_DIV_CLKCMU_MCSC_MCSC,
+	CLK_CON_DIV_CLKCMU_MFC_MFC,
+	CLK_CON_DIV_CLKCMU_MIF_BUSP,
+	CLK_CON_DIV_CLKCMU_MISC_BUS,
+	CLK_CON_DIV_CLKCMU_MISC_SSS,
+	CLK_CON_DIV_CLKCMU_OTP,
+	CLK_CON_DIV_CLKCMU_PDP_BUS,
+	CLK_CON_DIV_CLKCMU_PDP_VRA,
+	CLK_CON_DIV_CLKCMU_PERIC0_BUS,
+	CLK_CON_DIV_CLKCMU_PERIC0_IP,
+	CLK_CON_DIV_CLKCMU_PERIC1_BUS,
+	CLK_CON_DIV_CLKCMU_PERIC1_IP,
+	CLK_CON_DIV_CLKCMU_TNR_BUS,
+	CLK_CON_DIV_CLKCMU_TPU_BUS,
+	CLK_CON_DIV_CLKCMU_TPU_TPU,
+	CLK_CON_DIV_CLKCMU_TPU_TPUCTL,
+	CLK_CON_DIV_CLKCMU_TPU_UART,
+	CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST,
+	CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
+	CLK_CON_DIV_PLL_SHARED0_DIV2,
+	CLK_CON_DIV_PLL_SHARED0_DIV3,
+	CLK_CON_DIV_PLL_SHARED0_DIV4,
+	CLK_CON_DIV_PLL_SHARED0_DIV5,
+	CLK_CON_DIV_PLL_SHARED1_DIV2,
+	CLK_CON_DIV_PLL_SHARED1_DIV3,
+	CLK_CON_DIV_PLL_SHARED1_DIV4,
+	CLK_CON_DIV_PLL_SHARED2_DIV2,
+	CLK_CON_DIV_PLL_SHARED3_DIV2,
+	CLK_CON_GAT_CLKCMU_BUS0_BOOST,
+	CLK_CON_GAT_CLKCMU_BUS1_BOOST,
+	CLK_CON_GAT_CLKCMU_BUS2_BOOST,
+	CLK_CON_GAT_CLKCMU_CORE_BOOST,
+	CLK_CON_GAT_CLKCMU_CPUCL0_BOOST,
+	CLK_CON_GAT_CLKCMU_CPUCL1_BOOST,
+	CLK_CON_GAT_CLKCMU_CPUCL2_BOOST,
+	CLK_CON_GAT_CLKCMU_MIF_BOOST,
+	CLK_CON_GAT_CLKCMU_MIF_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_BO_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0,
+	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1,
+	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2,
+	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3,
+	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4,
+	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5,
+	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK6,
+	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK7,
+	CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST,
+	CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_DISP_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_DNS_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_DPU_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_EH_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_G2D_G2D,
+	CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL,
+	CLK_CON_GAT_GATE_CLKCMU_G3AA_G3AA,
+	CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD,
+	CLK_CON_GAT_GATE_CLKCMU_G3D_GLB,
+	CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH,
+	CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0,
+	CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1,
+	CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC,
+	CLK_CON_GAT_GATE_CLKCMU_HPM,
+	CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC,
+	CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD,
+	CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG,
+	CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE,
+	CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD,
+	CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE,
+	CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD,
+	CLK_CON_GAT_GATE_CLKCMU_IPP_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_ITP_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC,
+	CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC,
+	CLK_CON_GAT_GATE_CLKCMU_MFC_MFC,
+	CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP,
+	CLK_CON_GAT_GATE_CLKCMU_MISC_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_MISC_SSS,
+	CLK_CON_GAT_GATE_CLKCMU_PDP_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_PDP_VRA,
+	CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP,
+	CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP,
+	CLK_CON_GAT_GATE_CLKCMU_TNR_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF,
+	CLK_CON_GAT_GATE_CLKCMU_TPU_BUS,
+	CLK_CON_GAT_GATE_CLKCMU_TPU_TPU,
+	CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL,
+	CLK_CON_GAT_GATE_CLKCMU_TPU_UART,
+	DMYQCH_CON_CMU_TOP_CMUREF_QCH,
+	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK0,
+	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK1,
+	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK2,
+	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK3,
+	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK4,
+	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK5,
+	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK6,
+	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK7,
+	DMYQCH_CON_OTP_QCH,
+	QUEUE_CTRL_REG_BLK_CMU_CMU_TOP,
+	QUEUE_ENTRY0_BLK_CMU_CMU_TOP,
+	QUEUE_ENTRY1_BLK_CMU_CMU_TOP,
+	QUEUE_ENTRY2_BLK_CMU_CMU_TOP,
+	QUEUE_ENTRY3_BLK_CMU_CMU_TOP,
+	QUEUE_ENTRY4_BLK_CMU_CMU_TOP,
+	QUEUE_ENTRY5_BLK_CMU_CMU_TOP,
+	QUEUE_ENTRY6_BLK_CMU_CMU_TOP,
+	QUEUE_ENTRY7_BLK_CMU_CMU_TOP,
+	MIFMIRROR_QUEUE_CTRL_REG,
+	MIFMIRROR_QUEUE_ENTRY0,
+	MIFMIRROR_QUEUE_ENTRY1,
+	MIFMIRROR_QUEUE_ENTRY2,
+	MIFMIRROR_QUEUE_ENTRY3,
+	MIFMIRROR_QUEUE_ENTRY4,
+	MIFMIRROR_QUEUE_ENTRY5,
+	MIFMIRROR_QUEUE_ENTRY6,
+	MIFMIRROR_QUEUE_ENTRY7,
+	MIFMIRROR_QUEUE_BUSY,
+	GENERALIO_ACD_CHANNEL_0,
+	GENERALIO_ACD_CHANNEL_1,
+	GENERALIO_ACD_CHANNEL_2,
+	GENERALIO_ACD_CHANNEL_3,
+	GENERALIO_ACD_MASK,
+};
+
+static const struct samsung_pll_clock cmu_top_pll_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
+	    NULL),
+	PLL(pll_0517x, CLK_FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1,
+	    NULL),
+	PLL(pll_0518x, CLK_FOUT_SHARED2_PLL, "fout_shared2_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2,
+	    NULL),
+	PLL(pll_0518x, CLK_FOUT_SHARED3_PLL, "fout_shared3_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3,
+	    NULL),
+	PLL(pll_0518x, CLK_FOUT_SPARE_PLL, "fout_spare_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SPARE, PLL_CON3_PLL_SPARE,
+	    NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_TOP */
+PNAME(mout_shared0_pll_p)	= { "oscclk", "fout_shared0_pll" };
+PNAME(mout_shared1_pll_p)	= { "oscclk", "fout_shared1_pll" };
+PNAME(mout_shared2_pll_p)	= { "oscclk", "fout_shared2_pll" };
+PNAME(mout_shared3_pll_p)	= { "oscclk", "fout_shared3_pll" };
+PNAME(mout_spare_pll_p)		= { "oscclk", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_BO */
+PNAME(mout_cmu_bo_bus_p)	= { "fout_shared2_pll", "dout_shared0_div3",
+				    "fout_shared3_pll", "dout_shared1_div3",
+				    "dout_shared0_div4", "dout_shared1_div4",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS0 */
+PNAME(mout_cmu_bus0_bus_p)	= { "dout_shared0_div4", "dout_shared1_div4",
+				    "dout_shared2_div2", "dout_shared3_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS1 */
+PNAME(mout_cmu_bus1_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS2 */
+PNAME(mout_cmu_bus2_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div3", "dout_shared1_div3",
+				    "dout_shared0_div5", "fout_spare_pll" };
+
+PNAME(mout_cmu_cis_clk0_7_p)	= { "oscclk", "dout_shared0_div3",
+				    "dout_shared1_div3", "dout_shared2_div2",
+				    "dout_shared3_div2", "fout_spare_pll" };
+
+PNAME(mout_cmu_cmu_boost_p)	= { "dout_shared0_div4", "dout_shared1_div4",
+				    "dout_shared2_div2", "dout_shared3_div2" };
+
+/* TRM lists CLK_CMU_BOOST_OPTION1 but cmu_diagram links to pll_alv_div4_apm */
+PNAME(mout_cmu_cmu_boost_option1_p) = { "dout_cmu_boost", "pll_alv_div4_apm" };
+
+PNAME(mout_cmu_top_boost_option1_p) = { "dout_cmu_boost", "pll_alv_div4_apm" };
+
+PNAME(mout_cmu_top_cmuref_p) = { "dout_shared0_div4", "dout_shared1_div4",
+				 "dout_shared2_div2", "dout_shared3_div2" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_CORE */
+PNAME(mout_cmu_core_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div3", "dout_shared1_div3",
+				    "dout_shared0_div5", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_EH */
+PNAME(mout_cmu_eh_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div3", "dout_shared1_div3",
+				    "dout_shared0_div5", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL2 */
+PNAME(mout_cmu_cpucl2_switch_p)	= { "fout_shared1_pll", "dout_shared0_div2",
+				    "dout_shared1_div2", "fout_shared2_pll",
+				    "fout_shared3_pll", "dout_shared0_div3",
+				    "dout_shared1_div3", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL1 */
+PNAME(mout_cmu_cpucl1_switch_p)	= { "fout_shared1_pll", "dout_shared0_div2",
+				    "dout_shared1_div2", "fout_shared2_pll",
+				    "fout_shared3_pll", "dout_shared0_div3",
+				    "dout_shared1_div3", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL0 */
+PNAME(mout_cmu_cpucl0_switch_p)	= { "fout_shared1_pll", "dout_shared0_div2",
+				    "dout_shared1_div2", "fout_shared2_pll",
+				    "fout_shared3_pll", "dout_shared0_div3",
+				    "dout_shared1_div3", "fout_spare_pll" };
+
+PNAME(mout_cmu_cpucl0_dbg_p)	= { "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div4", "dout_shared1_div4",
+				    "dout_shared2_div2", "fout_spare_pll" };
+
+PNAME(mout_cmu_hpm_p)		= { "oscclk", "dout_shared1_div3",
+				    "dout_shared0_div4", "dout_shared2_div2" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_G3D */
+PNAME(mout_cmu_g3d_switch_p)	= { "fout_shared2_pll", "dout_shared0_div3",
+				    "fout_shared3_pll", "dout_shared1_div3",
+				    "dout_shared0_div4", "dout_shared1_div4",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_g3d_busd_p)	= { "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div3", "dout_shared1_div3",
+				    "dout_shared0_div4", "fout_spare_pll" };
+
+PNAME(mout_cmu_g3d_glb_p)	= { "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div3", "dout_shared1_div3",
+				    "dout_shared0_div4", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_DPU */
+PNAME(mout_cmu_dpu_p)		= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_DISP */
+PNAME(mout_cmu_disp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_G2D */
+PNAME(mout_cmu_g2d_g2d_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_g2d_mscl_p)	= { "dout_shared0_div4", "dout_shared1_div4",
+				    "dout_shared2_div2", "dout_shared3_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI0 */
+PNAME(mout_cmu_hsi0_usb31drd_p)	= { "oscclk", "dout_shared2_div2" };
+
+PNAME(mout_cmu_hsi0_bus_p)	= { "dout_shared0_div4", "dout_shared1_div4",
+				    "dout_shared2_div2", "dout_shared3_div2",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_hsi0_dpgtc_p)	= { "oscclk", "dout_shared0_div4",
+				    "dout_shared2_div2", "fout_spare_pll" };
+
+PNAME(mout_cmu_hsi0_usbdpdbg_p)	= { "oscclk", "dout_shared2_div2" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI1 */
+PNAME(mout_cmu_hsi1_bus_p)	= { "dout_shared0_div4", "dout_shared1_div4",
+				    "dout_shared2_div2", "dout_shared3_div2",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_hsi1_pcie_p)	= { "oscclk", "dout_shared2_div2" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI2 */
+PNAME(mout_cmu_hsi2_bus_p)	= { "dout_shared0_div4", "dout_shared1_div4",
+				    "dout_shared2_div2", "dout_shared3_div2",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_hsi2_pcie0_p)	= { "oscclk", "dout_shared2_div2" };
+
+PNAME(mout_cmu_hsi2_ufs_embd_p)	= { "oscclk", "dout_shared0_div4",
+				    "dout_shared2_div2", "fout_spare_pll" };
+
+PNAME(mout_cmu_hsi2_mmc_card_p)	= { "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div4", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_CSIS */
+PNAME(mout_cmu_csis_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_PDP */
+PNAME(mout_cmu_pdp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_pdp_vra_p)	= { "fout_shared2_pll", "dout_shared0_div3",
+				    "fout_shared3_pll", "dout_shared1_div3",
+				    "dout_shared0_div4", "dout_shared1_div4",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_IPP */
+PNAME(mout_cmu_ipp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_G3AA */
+PNAME(mout_cmu_g3aa_g3aa_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_ITP */
+PNAME(mout_cmu_itp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_DNS */
+PNAME(mout_cmu_dns_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_TNR */
+PNAME(mout_cmu_tnr_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_MCSC */
+PNAME(mout_cmu_mcsc_itsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_mcsc_mcsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_GDC */
+PNAME(mout_cmu_gdc_scsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_gdc_gdc0_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+PNAME(mout_cmu_gdc_gdc1_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_MFC */
+PNAME(mout_cmu_mfc_mfc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
+				    "dout_shared1_div3", "dout_shared0_div4",
+				    "dout_shared1_div4", "dout_shared2_div2",
+				    "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for DDRPHY0/1/2/3 */
+
+PNAME(mout_cmu_mif_switch_p)	= { "fout_shared0_pll", "fout_shared1_pll",
+				    "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "dout_shared0_div3",
+				    "fout_shared3_pll", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_MIF0/1/2/3 */
+PNAME(mout_cmu_mif_busp_p)	= { "dout_shared0_div4", "dout_shared1_div4",
+				    "dout_shared0_div5", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_MISC */
+PNAME(mout_cmu_misc_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
+				    "dout_shared3_div2", "fout_spare_pll" };
+PNAME(mout_cmu_misc_sss_p)	= { "dout_shared0_div4", "dout_shared2_div2",
+				    "dout_shared3_div2", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_PERIC0 */
+PNAME(mout_cmu_peric0_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
+				    "dout_shared3_div2", "fout_spare_pll" };
+PNAME(mout_cmu_peric0_ip_p)	= { "dout_shared0_div4", "dout_shared2_div2",
+				    "dout_shared3_div2", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_PERIC1 */
+PNAME(mout_cmu_peric1_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
+				    "dout_shared3_div2", "fout_spare_pll" };
+PNAME(mout_cmu_peric1_ip_p)	= { "dout_shared0_div4", "dout_shared2_div2",
+				    "dout_shared3_div2", "fout_spare_pll" };
+
+/* List of parent clocks for Muxes in CMU_TOP: for CMU_TPU */
+PNAME(mout_cmu_tpu_tpu_p)	= { "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div3", "dout_shared1_div3",
+				    "dout_shared0_div4", "fout_spare_pll" };
+
+PNAME(mout_cmu_tpu_tpuctl_p)	= { "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div3", "dout_shared1_div3",
+				    "dout_shared0_div4", "fout_spare_pll" };
+
+PNAME(mout_cmu_tpu_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
+				    "fout_shared2_pll", "fout_shared3_pll",
+				    "dout_shared0_div3", "dout_shared1_div3",
+				    "dout_shared0_div4", "fout_spare_pll" };
+
+PNAME(mout_cmu_tpu_uart_p)	= { "dout_shared0_div4", "dout_shared2_div2",
+				    "dout_shared3_div2", "fout_spare_pll" };
+
+PNAME(mout_cmu_cmuref_p)	= { "mout_cmu_top_boost_option1",
+				    "dout_cmu_cmuref" };
+
+static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst = {
+	/* CMU_TOP_PURECLKCOMP */
+	MUX(CLK_MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
+	    PLL_CON0_PLL_SHARED0, 4, 1),
+	MUX(CLK_MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
+	    PLL_CON0_PLL_SHARED1, 4, 1),
+	MUX(CLK_MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_p,
+	    PLL_CON0_PLL_SHARED2, 4, 1),
+	MUX(CLK_MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_p,
+	    PLL_CON0_PLL_SHARED3, 4, 1),
+	MUX(CLK_MOUT_SPARE_PLL, "mout_spare_pll", mout_spare_pll_p,
+	    PLL_CON0_PLL_SPARE, 4, 1),
+	MUX(CLK_MOUT_BO_BUS, "mout_cmu_bo_bus", mout_cmu_bo_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_BO_BUS, 0, 3),
+	MUX(CLK_MOUT_BUS0_BUS, "mout_cmu_bus0_bus", mout_cmu_bus0_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS, 0, 3),
+	MUX(CLK_MOUT_BUS1_BUS, "mout_cmu_bus1_bus", mout_cmu_bus1_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS, 0, 3),
+	MUX(CLK_MOUT_BUS2_BUS, "mout_cmu_bus2_bus", mout_cmu_bus2_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS, 0, 3),
+	MUX(CLK_MOUT_CIS_CLK0, "mout_cmu_cis_clk0", mout_cmu_cis_clk0_7_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0, 0, 3),
+	MUX(CLK_MOUT_CIS_CLK1, "mout_cmu_cis_clk1", mout_cmu_cis_clk0_7_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1, 0, 3),
+	MUX(CLK_MOUT_CIS_CLK2, "mout_cmu_cis_clk2", mout_cmu_cis_clk0_7_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2, 0, 3),
+	MUX(CLK_MOUT_CIS_CLK3, "mout_cmu_cis_clk3", mout_cmu_cis_clk0_7_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3, 0, 3),
+	MUX(CLK_MOUT_CIS_CLK4, "mout_cmu_cis_clk4", mout_cmu_cis_clk0_7_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK4, 0, 3),
+	MUX(CLK_MOUT_CIS_CLK5, "mout_cmu_cis_clk5", mout_cmu_cis_clk0_7_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK5, 0, 3),
+	MUX(CLK_MOUT_CIS_CLK6, "mout_cmu_cis_clk6", mout_cmu_cis_clk0_7_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK6, 0, 3),
+	MUX(CLK_MOUT_CIS_CLK7, "mout_cmu_cis_clk7", mout_cmu_cis_clk0_7_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CIS_CLK7, 0, 3),
+	MUX(CLK_MOUT_CMU_BOOST, "mout_cmu_cmu_boost", mout_cmu_cmu_boost_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST, 0, 2),
+	MUX(CLK_MOUT_BOOST_OPTION1, "mout_cmu_boost_option1",
+	    mout_cmu_cmu_boost_option1_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST_OPTION1, 0, 1),
+	MUX(CLK_MOUT_CORE_BUS, "mout_cmu_core_bus", mout_cmu_core_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 3),
+	MUX(CLK_MOUT_CPUCL0_DBG, "mout_cmu_cpucl0_dbg", mout_cmu_cpucl0_dbg_p,
+	    CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 3),
+	MUX(CLK_MOUT_CPUCL0_SWITCH, "mout_cmu_cpucl0_switch",
+	    mout_cmu_cpucl0_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
+	    0, 3),
+	MUX(CLK_MOUT_CPUCL1_SWITCH, "mout_cmu_cpucl1_switch",
+	    mout_cmu_cpucl1_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
+	    0, 3),
+	MUX(CLK_MOUT_CPUCL2_SWITCH, "mout_cmu_cpucl2_switch",
+	    mout_cmu_cpucl2_switch_p, CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH,
+	    0, 3),
+	MUX(CLK_MOUT_CSIS_BUS, "mout_cmu_csis_bus", mout_cmu_csis_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS, 0, 3),
+	MUX(CLK_MOUT_DISP_BUS, "mout_cmu_disp_bus", mout_cmu_disp_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_DISP_BUS, 0, 3),
+	MUX(CLK_MOUT_DNS_BUS, "mout_cmu_dns_bus", mout_cmu_dns_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_DNS_BUS, 0, 3),
+	MUX(CLK_MOUT_DPU_BUS, "mout_cmu_dpu_bus", mout_cmu_dpu_p,
+	    CLK_CON_MUX_MUX_CLKCMU_DPU_BUS, 0, 3),
+	MUX(CLK_MOUT_EH_BUS, "mout_cmu_eh_bus", mout_cmu_eh_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_EH_BUS, 0, 3),
+	MUX(CLK_MOUT_G2D_G2D, "mout_cmu_g2d_g2d", mout_cmu_g2d_g2d_p,
+	    CLK_CON_MUX_MUX_CLKCMU_G2D_G2D, 0, 3),
+	MUX(CLK_MOUT_G2D_MSCL, "mout_cmu_g2d_mscl", mout_cmu_g2d_mscl_p,
+	    CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 3),
+	MUX(CLK_MOUT_G3AA_G3AA, "mout_cmu_g3aa_g3aa", mout_cmu_g3aa_g3aa_p,
+	    CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 0, 3),
+	MUX(CLK_MOUT_G3D_BUSD, "mout_cmu_g3d_busd", mout_cmu_g3d_busd_p,
+	    CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD, 0, 3),
+	MUX(CLK_MOUT_G3D_GLB, "mout_cmu_g3d_glb", mout_cmu_g3d_glb_p,
+	    CLK_CON_MUX_MUX_CLKCMU_G3D_GLB, 0, 3),
+	MUX(CLK_MOUT_G3D_SWITCH, "mout_cmu_g3d_switch", mout_cmu_g3d_switch_p,
+	    CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH, 0, 3),
+	MUX(CLK_MOUT_GDC_GDC0, "mout_cmu_gdc_gdc0", mout_cmu_gdc_gdc0_p,
+	    CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0, 0, 3),
+	MUX(CLK_MOUT_GDC_GDC1, "mout_cmu_gdc_gdc1", mout_cmu_gdc_gdc1_p,
+	    CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1, 0, 3),
+	MUX(CLK_MOUT_GDC_SCSC, "mout_cmu_gdc_scsc", mout_cmu_gdc_scsc_p,
+	    CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC, 0, 3),
+	MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm", mout_cmu_hpm_p,
+	    CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 2),
+	MUX(CLK_MOUT_HSI0_BUS, "mout_cmu_hsi0_bus", mout_cmu_hsi0_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS, 0, 3),
+	MUX(CLK_MOUT_HSI0_DPGTC, "mout_cmu_hsi0_dpgtc", mout_cmu_hsi0_dpgtc_p,
+	    CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC, 0, 2),
+	MUX(CLK_MOUT_HSI0_USB31DRD, "mout_cmu_hsi0_usb31drd",
+	    mout_cmu_hsi0_usb31drd_p, CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD,
+	    0, 1),
+	MUX(CLK_MOUT_HSI0_USBDPDGB, "mout_cmu_hsi0_usbdpdbg",
+	    mout_cmu_hsi0_usbdpdbg_p, CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG,
+	    0, 1),
+	MUX(CLK_MOUT_HSI1_BUS, "mout_cmu_hsi1_bus", mout_cmu_hsi1_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS, 0, 3),
+	MUX(CLK_MOUT_HSI1_PCIE, "mout_cmu_hsi1_pcie", mout_cmu_hsi1_pcie_p,
+	    CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE, 0, 1),
+	MUX(CLK_MOUT_HSI2_BUS, "mout_cmu_hsi2_bus", mout_cmu_hsi2_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 3),
+	MUX(CLK_MOUT_HSI2_MMC_CARD, "mout_cmu_hsi2_mmc_card",
+	    mout_cmu_hsi2_mmc_card_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD,
+	    0, 2),
+	MUX(CLK_MOUT_HSI2_PCIE, "mout_cmu_hsi2_pcie", mout_cmu_hsi2_pcie0_p,
+	    CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE, 0, 1),
+	MUX(CLK_MOUT_HSI2_UFS_EMBD, "mout_cmu_hsi2_ufs_embd",
+	    mout_cmu_hsi2_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD,
+	    0, 2),
+	MUX(CLK_MOUT_IPP_BUS, "mout_cmu_ipp_bus", mout_cmu_ipp_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_IPP_BUS, 0, 3),
+	MUX(CLK_MOUT_ITP_BUS, "mout_cmu_itp_bus", mout_cmu_itp_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_ITP_BUS, 0, 3),
+	MUX(CLK_MOUT_MCSC_ITSC, "mout_cmu_mcsc_itsc", mout_cmu_mcsc_itsc_p,
+	    CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC, 0, 3),
+	MUX(CLK_MOUT_MCSC_MCSC, "mout_cmu_mcsc_mcsc", mout_cmu_mcsc_mcsc_p,
+	    CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC, 0, 3),
+	MUX(CLK_MOUT_MFC_MFC, "mout_cmu_mfc_mfc", mout_cmu_mfc_mfc_p,
+	    CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 3),
+	MUX(CLK_MOUT_MIF_BUSP, "mout_cmu_mif_busp", mout_cmu_mif_busp_p,
+	    CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP, 0, 2),
+	MUX(CLK_MOUT_MIF_SWITCH, "mout_cmu_mif_switch", mout_cmu_mif_switch_p,
+	    CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 3),
+	MUX(CLK_MOUT_MISC_BUS, "mout_cmu_misc_bus", mout_cmu_misc_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_MISC_BUS, 0, 2),
+	MUX(CLK_MOUT_MISC_SSS, "mout_cmu_misc_sss", mout_cmu_misc_sss_p,
+	    CLK_CON_MUX_MUX_CLKCMU_MISC_SSS, 0, 2),
+	MUX(CLK_MOUT_PDP_BUS, "mout_cmu_pdp_bus", mout_cmu_pdp_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_PDP_BUS, 0, 3),
+	MUX(CLK_MOUT_PDP_VRA, "mout_cmu_pdp_vra", mout_cmu_pdp_vra_p,
+	    CLK_CON_MUX_MUX_CLKCMU_PDP_VRA, 0, 3),
+	MUX(CLK_MOUT_PERIC0_BUS, "mout_cmu_peric0_bus", mout_cmu_peric0_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
+	MUX(CLK_MOUT_PERIC0_IP, "mout_cmu_peric0_ip", mout_cmu_peric0_ip_p,
+	    CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
+	MUX(CLK_MOUT_PERIC1_BUS, "mout_cmu_peric1_bus", mout_cmu_peric1_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
+	MUX(CLK_MOUT_PERIC1_IP, "mout_cmu_peric1_ip", mout_cmu_peric1_ip_p,
+	    CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
+	MUX(CLK_MOUT_TNR_BUS, "mout_cmu_tnr_bus", mout_cmu_tnr_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 3),
+	MUX(CLK_MOUT_TOP_BOOST_OPTION1, "mout_cmu_top_boost_option1",
+	    mout_cmu_top_boost_option1_p,
+	    CLK_CON_MUX_MUX_CLKCMU_TOP_BOOST_OPTION1, 0, 1),
+	MUX(CLK_MOUT_TOP_CMUREF, "mout_cmu_top_cmuref",
+	    mout_cmu_top_cmuref_p, CLK_CON_MUX_MUX_CLKCMU_TOP_CMUREF, 0, 2),
+	MUX(CLK_MOUT_TPU_BUS, "mout_cmu_tpu_bus", mout_cmu_tpu_bus_p,
+	    CLK_CON_MUX_MUX_CLKCMU_TPU_BUS, 0, 3),
+	MUX(CLK_MOUT_TPU_TPU, "mout_cmu_tpu_tpu", mout_cmu_tpu_tpu_p,
+	    CLK_CON_MUX_MUX_CLKCMU_TPU_TPU, 0, 3),
+	MUX(CLK_MOUT_TPU_TPUCTL, "mout_cmu_tpu_tpuctl", mout_cmu_tpu_tpuctl_p,
+	    CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL, 0, 3),
+	MUX(CLK_MOUT_TPU_UART, "mout_cmu_tpu_uart", mout_cmu_tpu_uart_p,
+	    CLK_CON_MUX_MUX_CLKCMU_TPU_UART, 0, 2),
+	MUX(CLK_MOUT_CMU_CMUREF, "mout_cmu_cmuref", mout_cmu_cmuref_p,
+	    CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+};
+
+static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
+	DIV(CLK_DOUT_BO_BUS, "dout_cmu_bo_bus", "gout_cmu_bo_bus",
+	    CLK_CON_DIV_CLKCMU_BO_BUS, 0, 4),
+	DIV(CLK_DOUT_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
+	    CLK_CON_DIV_CLKCMU_BUS0_BUS, 0, 4),
+	DIV(CLK_DOUT_BUS1_BUS, "dout_cmu_bus1_bus", "gout_cmu_bus1_bus",
+	    CLK_CON_DIV_CLKCMU_BUS1_BUS, 0, 4),
+	DIV(CLK_DOUT_BUS2_BUS, "dout_cmu_bus2_bus", "gout_cmu_bus2_bus",
+	    CLK_CON_DIV_CLKCMU_BUS2_BUS, 0, 4),
+	DIV(CLK_DOUT_CIS_CLK0, "dout_cmu_cis_clk0", "gout_cmu_cis_clk0",
+	    CLK_CON_DIV_CLKCMU_CIS_CLK0, 0, 5),
+	DIV(CLK_DOUT_CIS_CLK1, "dout_cmu_cis_clk1", "gout_cmu_cis_clk1",
+	    CLK_CON_DIV_CLKCMU_CIS_CLK1, 0, 5),
+	DIV(CLK_DOUT_CIS_CLK2, "dout_cmu_cis_clk2", "gout_cmu_cis_clk2",
+	    CLK_CON_DIV_CLKCMU_CIS_CLK2, 0, 5),
+	DIV(CLK_DOUT_CIS_CLK3, "dout_cmu_cis_clk3", "gout_cmu_cis_clk3",
+	    CLK_CON_DIV_CLKCMU_CIS_CLK3, 0, 5),
+	DIV(CLK_DOUT_CIS_CLK4, "dout_cmu_cis_clk4", "gout_cmu_cis_clk4",
+	    CLK_CON_DIV_CLKCMU_CIS_CLK4, 0, 5),
+	DIV(CLK_DOUT_CIS_CLK5, "dout_cmu_cis_clk5", "gout_cmu_cis_clk5",
+	    CLK_CON_DIV_CLKCMU_CIS_CLK5, 0, 5),
+	DIV(CLK_DOUT_CIS_CLK6, "dout_cmu_cis_clk6", "gout_cmu_cis_clk6",
+	    CLK_CON_DIV_CLKCMU_CIS_CLK6, 0, 5),
+	DIV(CLK_DOUT_CIS_CLK7, "dout_cmu_cis_clk7", "gout_cmu_cis_clk7",
+	    CLK_CON_DIV_CLKCMU_CIS_CLK7, 0, 5),
+	DIV(CLK_DOUT_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
+	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
+	DIV(CLK_DOUT_CPUCL0_DBG, "dout_cmu_cpucl0_dbg", "gout_cmu_cpucl0_dbg",
+	    CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 4),
+	DIV(CLK_DOUT_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch",
+	    "gout_cmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
+	DIV(CLK_DOUT_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch",
+	    "gout_cmu_cpucl1_switch", CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH, 0, 3),
+	DIV(CLK_DOUT_CPUCL2_SWITCH, "dout_cmu_cpucl2_switch",
+	    "gout_cmu_cpucl2_switch", CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH, 0, 3),
+	DIV(CLK_DOUT_CSIS_BUS, "dout_cmu_csis_bus", "gout_cmu_csis_bus",
+	    CLK_CON_DIV_CLKCMU_CSIS_BUS, 0, 4),
+	DIV(CLK_DOUT_DISP_BUS, "dout_cmu_disp_bus", "gout_cmu_disp_bus",
+	    CLK_CON_DIV_CLKCMU_DISP_BUS, 0, 4),
+	DIV(CLK_DOUT_DNS_BUS, "dout_cmu_dns_bus", "gout_cmu_dns_bus",
+	    CLK_CON_DIV_CLKCMU_DNS_BUS, 0, 4),
+	DIV(CLK_DOUT_DPU_BUS, "dout_cmu_dpu_bus", "gout_cmu_dpu_bus",
+	    CLK_CON_DIV_CLKCMU_DPU_BUS, 0, 4),
+	DIV(CLK_DOUT_EH_BUS, "dout_cmu_eh_bus", "gout_cmu_eh_bus",
+	    CLK_CON_DIV_CLKCMU_EH_BUS, 0, 4),
+	DIV(CLK_DOUT_G2D_G2D, "dout_cmu_g2d_g2d", "gout_cmu_g2d_g2d",
+	    CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
+	DIV(CLK_DOUT_G2D_MSCL, "dout_cmu_g2d_mscl", "gout_cmu_g2d_mscl",
+	    CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
+	DIV(CLK_DOUT_G3AA_G3AA, "dout_cmu_g3aa_g3aa", "gout_cmu_g3aa_g3aa",
+	    CLK_CON_DIV_CLKCMU_G3AA_G3AA, 0, 4),
+	DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
+	    CLK_CON_DIV_CLKCMU_G3D_BUSD, 0, 4),
+	DIV(CLK_DOUT_G3D_GLB, "dout_cmu_g3d_glb", "gout_cmu_g3d_glb",
+	    CLK_CON_DIV_CLKCMU_G3D_GLB, 0, 4),
+	DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_switch", "gout_cmu_g3d_switch",
+	    CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
+	DIV(CLK_DOUT_GDC_GDC0, "dout_cmu_gdc_gdc0", "gout_cmu_gdc_gdc0",
+	    CLK_CON_DIV_CLKCMU_GDC_GDC0, 0, 4),
+	DIV(CLK_DOUT_GDC_GDC1, "dout_cmu_gdc_gdc1", "gout_cmu_gdc_gdc1",
+	    CLK_CON_DIV_CLKCMU_GDC_GDC1, 0, 4),
+	DIV(CLK_DOUT_GDC_SCSC, "dout_cmu_gdc_scsc", "gout_cmu_gdc_scsc",
+	    CLK_CON_DIV_CLKCMU_GDC_SCSC, 0, 4),
+	DIV(CLK_DOUT_CMU_HPM, "dout_cmu_hpm", "gout_cmu_hpm",
+	    CLK_CON_DIV_CLKCMU_HPM, 0, 2),
+	DIV(CLK_DOUT_HSI0_BUS, "dout_cmu_hsi0_bus", "gout_cmu_hsi0_bus",
+	    CLK_CON_DIV_CLKCMU_HSI0_BUS, 0, 4),
+	DIV(CLK_DOUT_HSI0_DPGTC, "dout_cmu_hsi0_dpgtc", "gout_cmu_hsi0_dpgtc",
+	    CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 4),
+	DIV(CLK_DOUT_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd",
+	    "gout_cmu_hsi0_usb31drd", CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0, 5),
+	/* TODO register exists but all lower bits are reserved */
+	DIV(CLK_DOUT_HSI0_USBDPDGB, "dout_cmu_hsi0_usbdpdbg",
+	    "gout_cmu_hsi0_usbdpdbg", CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG, 0, 0),
+	DIV(CLK_DOUT_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
+	    CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 4),
+	DIV(CLK_DOUT_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pcie",
+	    CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 3),
+	DIV(CLK_DOUT_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
+	    CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
+	DIV(CLK_DOUT_HSI2_MMC_CARD, "dout_cmu_hsi2_mmc_card",
+	    "gout_cmu_hsi2_mmc_card", CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD, 0, 9),
+	DIV(CLK_DOUT_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie",
+	    CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 3),
+	DIV(CLK_DOUT_HSI2_UFS_EMBD, "dout_cmu_hsi2_ufs_embd",
+	    "gout_cmu_hsi2_ufs_embd", CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD, 0, 4),
+	DIV(CLK_DOUT_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
+	    CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
+	DIV(CLK_DOUT_ITP_BUS, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
+	    CLK_CON_DIV_CLKCMU_ITP_BUS, 0, 4),
+	DIV(CLK_DOUT_MCSC_ITSC, "dout_cmu_mcsc_itsc", "gout_cmu_mcsc_itsc",
+	    CLK_CON_DIV_CLKCMU_MCSC_ITSC, 0, 4),
+	DIV(CLK_DOUT_MCSC_MCSC, "dout_cmu_mcsc_mcsc", "gout_cmu_mcsc_mcsc",
+	    CLK_CON_DIV_CLKCMU_MCSC_MCSC, 0, 4),
+	DIV(CLK_DOUT_MFC_MFC, "dout_cmu_mfc_mfc", "gout_cmu_mfc_mfc",
+	    CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
+	DIV(CLK_DOUT_MIF_BUSP, "dout_cmu_mif_busp", "gout_cmu_mif_busp",
+	    CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
+	DIV(CLK_DOUT_MISC_BUS, "dout_cmu_misc_bus", "gout_cmu_misc_bus",
+	    CLK_CON_DIV_CLKCMU_MISC_BUS, 0, 4),
+	DIV(CLK_DOUT_MISC_SSS, "dout_cmu_misc_sss", "gout_cmu_misc_sss",
+	    CLK_CON_DIV_CLKCMU_MISC_SSS, 0, 4),
+	/* CLK_CON_DIV_CLKCMU_OTP lower bits reserved*/
+	DIV(CLK_DOUT_PDP_BUS, "dout_cmu_pdp_bus", "gout_cmu_pdp_bus",
+	    CLK_CON_DIV_CLKCMU_PDP_BUS, 0, 4),
+	DIV(CLK_DOUT_PDP_VRA, "dout_cmu_pdp_vra", "gout_cmu_pdp_vra",
+	    CLK_CON_DIV_CLKCMU_PDP_VRA, 0, 4),
+	DIV(CLK_DOUT_PERIC0_BUS, "dout_cmu_peric0_bus", "gout_cmu_peric0_bus",
+	    CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
+	DIV(CLK_DOUT_PERIC0_IP, "dout_cmu_peric0_ip", "gout_cmu_peric0_ip",
+	    CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
+	DIV(CLK_DOUT_PERIC1_BUS, "dout_cmu_peric1_bus", "gout_cmu_peric1_bus",
+	    CLK_CON_DIV_CLKCMU_PERIC1_BUS, 0, 4),
+	DIV(CLK_DOUT_PERIC1_IP, "dout_cmu_peric1_ip", "gout_cmu_peric1_ip",
+	    CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
+	DIV(CLK_DOUT_TNR_BUS, "dout_cmu_tnr_bus", "gout_cmu_tnr_bus",
+	    CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
+	DIV(CLK_DOUT_TPU_BUS, "dout_cmu_tpu_bus", "gout_cmu_tpu_bus",
+	    CLK_CON_DIV_CLKCMU_TPU_BUS, 0, 4),
+	DIV(CLK_DOUT_TPU_TPU, "dout_cmu_tpu_tpu", "gout_cmu_tpu_tpu",
+	    CLK_CON_DIV_CLKCMU_TPU_TPU, 0, 4),
+	DIV(CLK_DOUT_TPU_TPUCTL, "dout_cmu_tpu_tpuctl", "gout_cmu_tpu_tpuctl",
+	    CLK_CON_DIV_CLKCMU_TPU_TPUCTL, 0, 4),
+	DIV(CLK_DOUT_TPU_UART, "dout_cmu_tpu_uart", "gout_cmu_tpu_uart",
+	    CLK_CON_DIV_CLKCMU_TPU_UART, 0, 4),
+	DIV(CLK_DOUT_CMU_BOOST, "dout_cmu_boost", "gout_cmu_cmu_boost",
+	    CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
+	DIV(CLK_DOUT_CMU_CMUREF, "dout_cmu_cmuref", "gout_cmu_cmuref",
+	    CLK_CON_DIV_DIV_CLK_CMU_CMUREF, 0, 2),
+	DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_pll",
+	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
+	DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_pll",
+	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
+	DIV(CLK_DOUT_SHARED0_DIV4, "dout_shared0_div4", "dout_shared0_div2",
+	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
+	DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "mout_shared0_pll",
+	    CLK_CON_DIV_PLL_SHARED0_DIV5, 0, 3),
+	DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_pll",
+	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
+	DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_pll",
+	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
+	DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "mout_shared1_pll",
+	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
+	DIV(CLK_DOUT_SHARED2_DIV2, "dout_shared2_div2", "mout_shared2_pll",
+	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
+	DIV(CLK_DOUT_SHARED3_DIV2, "dout_shared3_div2", "mout_shared3_pll",
+	    CLK_CON_DIV_PLL_SHARED3_DIV2, 0, 1),
+};
+
+static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_BUS0_BOOST, "gout_cmu_bus0_boost", "mout_cmu_boost_option1",
+	     CLK_CON_GAT_CLKCMU_BUS0_BOOST, 21, 0, 0),
+	GATE(CLK_GOUT_BUS1_BOOST, "gout_cmu_bus1_boost", "mout_cmu_boost_option1",
+	     CLK_CON_GAT_CLKCMU_BUS1_BOOST, 21, 0, 0),
+	GATE(CLK_GOUT_BUS2_BOOST, "gout_cmu_bus2_boost", "mout_cmu_boost_option1",
+	     CLK_CON_GAT_CLKCMU_BUS2_BOOST, 21, 0, 0),
+	GATE(CLK_GOUT_CORE_BOOST, "gout_cmu_core_boost", "mout_cmu_boost_option1",
+	     CLK_CON_GAT_CLKCMU_CORE_BOOST, 21, 0, 0),
+	GATE(CLK_GOUT_CPUCL0_BOOST, "gout_cmu_cpucl0_boost",
+	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_CPUCL0_BOOST,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CPUCL1_BOOST, "gout_cmu_cpucl1_boost",
+	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_CPUCL1_BOOST,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CPUCL2_BOOST, "gout_cmu_cpucl2_boost",
+	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_CPUCL2_BOOST,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MIF_BOOST, "gout_cmu_mif_boost",
+	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_MIF_BOOST,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MIF_SWITCH, "gout_cmu_mif_switch", "mout_cmu_mif_switch",
+	     CLK_CON_GAT_CLKCMU_MIF_SWITCH, 21, 0, 0),
+	GATE(CLK_GOUT_BO_BUS, "gout_cmu_bo_bus", "mout_cmu_bo_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_BO_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_BUS0_BUS, "gout_cmu_bus0_bus", "mout_cmu_bus0_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_BUS1_BUS, "gout_cmu_bus1_bus", "mout_cmu_bus1_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_BUS2_BUS, "gout_cmu_bus2_bus", "mout_cmu_bus2_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_CIS_CLK0, "gout_cmu_cis_clk0", "mout_cmu_cis_clk0",
+	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0, 21, 0, 0),
+	GATE(CLK_GOUT_CIS_CLK1, "gout_cmu_cis_clk1", "mout_cmu_cis_clk1",
+	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1, 21, 0, 0),
+	GATE(CLK_GOUT_CIS_CLK2, "gout_cmu_cis_clk2", "mout_cmu_cis_clk2",
+	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2, 21, 0, 0),
+	GATE(CLK_GOUT_CIS_CLK3, "gout_cmu_cis_clk3", "mout_cmu_cis_clk3",
+	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3, 21, 0, 0),
+	GATE(CLK_GOUT_CIS_CLK4, "gout_cmu_cis_clk4", "mout_cmu_cis_clk4",
+	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4, 21, 0, 0),
+	GATE(CLK_GOUT_CIS_CLK5, "gout_cmu_cis_clk5", "mout_cmu_cis_clk5",
+	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5, 21, 0, 0),
+	GATE(CLK_GOUT_CIS_CLK6, "gout_cmu_cis_clk6", "mout_cmu_cis_clk6",
+	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK6, 21, 0, 0),
+	GATE(CLK_GOUT_CIS_CLK7, "gout_cmu_cis_clk7", "mout_cmu_cis_clk7",
+	     CLK_CON_GAT_GATE_CLKCMU_CIS_CLK7, 21, 0, 0),
+	GATE(CLK_GOUT_CMU_BOOST, "gout_cmu_cmu_boost", "mout_cmu_cmu_boost",
+	     CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST, 21, 0, 0),
+	GATE(CLK_GOUT_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_CORE_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_CPUCL0_DBG, "gout_cmu_cpucl0_dbg", "mout_cmu_cpucl0_dbg",
+	     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch",
+	     "mout_cmu_cpucl0_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch",
+	     "mout_cmu_cpucl1_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CPUCL2_SWITCH, "gout_cmu_cpucl2_switch",
+	     "mout_cmu_cpucl2_switch", CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH,
+	     21, 0, 0),
+	GATE(CLK_GOUT_CSIS_BUS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_DISP_BUS, "gout_cmu_disp_bus", "mout_cmu_disp_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_DISP_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_DNS_BUS, "gout_cmu_dns_bus", "mout_cmu_dns_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_DNS_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_BUS, "gout_cmu_dpu_bus", "mout_cmu_dpu_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_DPU_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_EH_BUS, "gout_cmu_eh_bus", "mout_cmu_eh_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_EH_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
+	     CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
+	GATE(CLK_GOUT_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl",
+	     CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL, 21, 0, 0),
+	GATE(CLK_GOUT_G3AA_G3AA, "gout_cmu_g3aa_g3aa", "mout_cmu_g3aa_g3aa",
+	     CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 21, 0, 0),
+	GATE(CLK_GOUT_G3D_BUSD, "gout_cmu_g3d_busd", "mout_cmu_g3d_busd",
+	     CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD, 21, 0, 0),
+	GATE(CLK_GOUT_G3D_GLB, "gout_cmu_g3d_glb", "mout_cmu_g3d_glb",
+	     CLK_CON_GAT_GATE_CLKCMU_G3D_GLB, 21, 0, 0),
+	GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_switch", "mout_cmu_g3d_switch",
+	     CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH, 21, 0, 0),
+	GATE(CLK_GOUT_GDC_GDC0, "gout_cmu_gdc_gdc0", "mout_cmu_gdc_gdc0",
+	     CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0, 21, 0, 0),
+	GATE(CLK_GOUT_GDC_GDC1, "gout_cmu_gdc_gdc1", "mout_cmu_gdc_gdc1",
+	     CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1, 21, 0, 0),
+	GATE(CLK_GOUT_GDC_SCSC, "gout_cmu_gdc_scsc", "mout_cmu_gdc_scsc",
+	     CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC, 21, 0, 0),
+	GATE(CLK_GOUT_CMU_HPM, "gout_cmu_hpm", "mout_cmu_hpm",
+	     CLK_CON_GAT_GATE_CLKCMU_HPM, 21, 0, 0),
+	GATE(CLK_GOUT_HSI0_BUS, "gout_cmu_hsi0_bus", "mout_cmu_hsi0_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_HSI0_DPGTC, "gout_cmu_hsi0_dpgtc", "mout_cmu_hsi0_dpgtc",
+	     CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC, 21, 0, 0),
+	GATE(CLK_GOUT_HSI0_USB31DRD, "gout_cmu_hsi0_usb31drd",
+	     "mout_cmu_hsi0_usb31drd", CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD,
+	     21, 0, 0),
+	GATE(CLK_GOUT_HSI0_USBDPDGB, "gout_cmu_hsi0_usbdpdbg",
+	     "mout_cmu_hsi0_usbdpdbg", CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG,
+	     21, 0, 0),
+	GATE(CLK_GOUT_HSI1_BUS, "gout_cmu_hsi1_bus", "mout_cmu_hsi1_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_HSI1_PCIE, "gout_cmu_hsi1_pcie", "mout_cmu_hsi1_pcie",
+	     CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE, 21, 0, 0),
+	GATE(CLK_GOUT_HSI2_BUS, "gout_cmu_hsi2_bus", "mout_cmu_hsi2_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_HSI2_MMC_CARD, "gout_cmu_hsi2_mmc_card",
+	     "mout_cmu_hsi2_mmc_card", CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD,
+	     21, 0, 0),
+	GATE(CLK_GOUT_HSI2_PCIE, "gout_cmu_hsi2_pcie", "mout_cmu_hsi2_pcie",
+	     CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE, 21, 0, 0),
+	GATE(CLK_GOUT_HSI2_UFS_EMBD, "gout_cmu_hsi2_ufs_embd",
+	     "mout_cmu_hsi2_ufs_embd", CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD,
+	     21, 0, 0),
+	GATE(CLK_GOUT_IPP_BUS, "gout_cmu_ipp_bus", "mout_cmu_ipp_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_IPP_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_ITP_BUS, "gout_cmu_itp_bus", "mout_cmu_itp_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_ITP_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_MCSC_ITSC, "gout_cmu_mcsc_itsc", "mout_cmu_mcsc_itsc",
+	     CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC, 21, 0, 0),
+	GATE(CLK_GOUT_MCSC_MCSC, "gout_cmu_mcsc_mcsc", "mout_cmu_mcsc_mcsc",
+	     CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC, 21, 0, 0),
+	GATE(CLK_GOUT_MFC_MFC, "gout_cmu_mfc_mfc", "mout_cmu_mfc_mfc",
+	     CLK_CON_GAT_GATE_CLKCMU_MFC_MFC, 21, 0, 0),
+	GATE(CLK_GOUT_MIF_BUSP, "gout_cmu_mif_busp", "mout_cmu_mif_busp",
+	     CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP, 21, 0, 0),
+	GATE(CLK_GOUT_MISC_BUS, "gout_cmu_misc_bus", "mout_cmu_misc_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_MISC_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSS, "gout_cmu_misc_sss", "mout_cmu_misc_sss",
+	     CLK_CON_GAT_GATE_CLKCMU_MISC_SSS, 21, 0, 0),
+	GATE(CLK_GOUT_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_PDP_VRA, "gout_cmu_pdp_vra", "mout_cmu_pdp_vra",
+	     CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_BUS, "gout_cmu_peric0_bus", "mout_cmu_peric0_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0_ip",
+	     CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_BUS, "gout_cmu_peric1_bus", "mout_cmu_peric1_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_PERIC1_IP, "gout_cmu_peric1_ip", "mout_cmu_peric1_ip",
+	     CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP, 21, 0, 0),
+	GATE(CLK_GOUT_TNR_BUS, "gout_cmu_tnr_bus", "mout_cmu_tnr_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_TNR_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_TOP_CMUREF, "gout_cmu_top_cmuref", "mout_cmu_top_cmuref",
+	     CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF, 21, 0, 0),
+	GATE(CLK_GOUT_TPU_BUS, "gout_cmu_tpu_bus", "mout_cmu_tpu_bus",
+	     CLK_CON_GAT_GATE_CLKCMU_TPU_BUS, 21, 0, 0),
+	GATE(CLK_GOUT_TPU_TPU, "gout_cmu_tpu_tpu", "mout_cmu_tpu_tpu",
+	     CLK_CON_GAT_GATE_CLKCMU_TPU_TPU, 21, 0, 0),
+	GATE(CLK_GOUT_TPU_TPUCTL, "gout_cmu_tpu_tpuctl", "mout_cmu_tpu_tpuctl",
+	     CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL, 21, 0, 0),
+	GATE(CLK_GOUT_TPU_UART, "gout_cmu_tpu_uart", "mout_cmu_tpu_uart",
+	     CLK_CON_GAT_GATE_CLKCMU_TPU_UART, 21, 0, 0),
+};
+
+static const struct samsung_cmu_info top_cmu_info __initconst = {
+	.pll_clks		= cmu_top_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(cmu_top_pll_clks),
+	.mux_clks		= cmu_top_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmu_top_mux_clks),
+	.div_clks		= cmu_top_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmu_top_div_clks),
+	.gate_clks		= cmu_top_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(cmu_top_gate_clks),
+	.nr_clk_ids		= TOP_NR_CLK,
+	.clk_regs		= cmu_top_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+};
+
+static void __init gs101_cmu_top_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
+}
+
+/* Register CMU_TOP early, as it's a dependency for other early domains */
+CLK_OF_DECLARE(gs101_cmu_top, "google,gs101-cmu-top",
+	       gs101_cmu_top_init);
+
+/* ---- CMU_APM ------------------------------------------------------------- */
+/* Register Offset definitions for CMU_APM (0x17400000) */
+#define APM_CMU_APM_CONTROLLER_OPTION							0x0800
+#define CLKOUT_CON_BLK_APM_CMU_APM_CLKOUT0						0x0810
+#define CLK_CON_MUX_MUX_CLKCMU_APM_FUNC							0x1000
+#define CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC						0x1004
+#define CLK_CON_DIV_DIV_CLK_APM_BOOST							0x1800
+#define CLK_CON_DIV_DIV_CLK_APM_USI0_UART						0x1804
+#define CLK_CON_DIV_DIV_CLK_APM_USI0_USI						0x1808
+#define CLK_CON_DIV_DIV_CLK_APM_USI1_UART						0x180c
+#define CLK_CON_GAT_CLK_BLK_APM_UID_APM_CMU_APM_IPCLKPORT_PCLK				0x2000
+#define CLK_CON_GAT_CLK_BUS0_BOOST_OPTION1						0x2004
+#define CLK_CON_GAT_CLK_CMU_BOOST_OPTION1						0x2008
+#define CLK_CON_GAT_CLK_CORE_BOOST_OPTION1						0x200c
+#define CLK_CON_GAT_GATE_CLKCMU_APM_FUNC						0x2010
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK			0x2014
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK		0x2018
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK			0x201c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_RTC_IPCLKPORT_PCLK				0x2020
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_TRTC_IPCLKPORT_PCLK				0x2024
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_IPCLK			0x2028
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK			0x202c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_IPCLK			0x2030
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK			0x2034
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK			0x2038
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK			0x203c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_D_TZPC_APM_IPCLKPORT_PCLK				0x2040
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_GPC_APM_IPCLKPORT_PCLK				0x2044
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_GREBEINTEGRATION_IPCLKPORT_HCLK			0x2048
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_ACLK				0x204c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_PCLK				0x2050
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_G_SWD_IPCLKPORT_I_CLK			0x2054
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK			0x2058
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_APM_IPCLKPORT_I_CLK			0x205c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_D_APM_IPCLKPORT_I_CLK			0x2060
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK			0x2064
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK		0x2068
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AOC_IPCLKPORT_PCLK			0x206c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AP_IPCLKPORT_PCLK			0x2070
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_GSA_IPCLKPORT_PCLK			0x2074
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_SWD_IPCLKPORT_PCLK			0x207c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_TPU_IPCLKPORT_PCLK			0x2080
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_AOC_IPCLKPORT_PCLK			0x2084
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK			0x2088
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_PMU_INTR_GEN_IPCLKPORT_PCLK			0x208c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_ACLK			0x2090
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_PCLK			0x2094
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK			0x2098
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT_CLK		0x209c
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_USI_IPCLKPORT_CLK		0x20a0
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPORT_CLK		0x20a4
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_APM_IPCLKPORT_PCLK				0x20a8
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_SUB_APM_IPCLKPORT_PCLK			0x20ac
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_ACLK				0x20b0
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_PCLK				0x20b4
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK			0x20b8
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK			0x20bc
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPCLKPORT_HCLK	0x20c0
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SYSMMU_D_APM_IPCLKPORT_CLK_S2			0x20c4
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK				0x20cc
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_ACLK				0x20d0
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_PCLK				0x20d4
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_ACLK			0x20d8
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_PCLK			0x20dc
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_ACLK				0x20e0
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK				0x20e4
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_ACLK			0x20e8
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_PCLK			0x20ec
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK				0x20f0
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK				0x20f4
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK				0x20f8
+#define CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK				0x20fc
+#define PCH_CON_LHM_AXI_G_SWD_PCH			0x3000
+#define PCH_CON_LHM_AXI_P_AOCAPM_PCH			0x3004
+#define PCH_CON_LHM_AXI_P_APM_PCH			0x3008
+#define PCH_CON_LHS_AXI_D_APM_PCH			0x300c
+#define PCH_CON_LHS_AXI_G_DBGCORE_PCH			0x3010
+#define PCH_CON_LHS_AXI_G_SCAN2DRAM_PCH			0x3014
+#define QCH_CON_APBIF_GPIO_ALIVE_QCH			0x3018
+#define QCH_CON_APBIF_GPIO_FAR_ALIVE_QCH		0x301c
+#define QCH_CON_APBIF_PMU_ALIVE_QCH			0x3020
+#define QCH_CON_APBIF_RTC_QCH				0x3024
+#define QCH_CON_APBIF_TRTC_QCH				0x3028
+#define QCH_CON_APM_CMU_APM_QCH				0x302c
+#define QCH_CON_APM_USI0_UART_QCH			0x3030
+#define QCH_CON_APM_USI0_USI_QCH			0x3034
+#define QCH_CON_APM_USI1_UART_QCH			0x3038
+#define QCH_CON_D_TZPC_APM_QCH				0x303c
+#define QCH_CON_GPC_APM_QCH				0x3040
+#define QCH_CON_GREBEINTEGRATION_QCH_DBG		0x3044
+#define QCH_CON_GREBEINTEGRATION_QCH_GREBE		0x3048
+#define QCH_CON_INTMEM_QCH				0x304c
+#define QCH_CON_LHM_AXI_G_SWD_QCH			0x3050
+#define QCH_CON_LHM_AXI_P_AOCAPM_QCH			0x3054
+#define QCH_CON_LHM_AXI_P_APM_QCH			0x3058
+#define QCH_CON_LHS_AXI_D_APM_QCH			0x305c
+#define QCH_CON_LHS_AXI_G_DBGCORE_QCH			0x3060
+#define QCH_CON_LHS_AXI_G_SCAN2DRAM_QCH			0x3064
+#define QCH_CON_MAILBOX_APM_AOC_QCH			0x3068
+#define QCH_CON_MAILBOX_APM_AP_QCH			0x306c
+#define QCH_CON_MAILBOX_APM_GSA_QCH			0x3070
+#define QCH_CON_MAILBOX_APM_SWD_QCH			0x3078
+#define QCH_CON_MAILBOX_APM_TPU_QCH			0x307c
+#define QCH_CON_MAILBOX_AP_AOC_QCH			0x3080
+#define QCH_CON_MAILBOX_AP_DBGCORE_QCH			0x3084
+#define QCH_CON_PMU_INTR_GEN_QCH			0x3088
+#define QCH_CON_ROM_CRC32_HOST_QCH			0x308c
+#define QCH_CON_RSTNSYNC_CLK_APM_BUS_QCH_GREBE		0x3090
+#define QCH_CON_RSTNSYNC_CLK_APM_BUS_QCH_GREBE_DBG	0x3094
+#define QCH_CON_SPEEDY_APM_QCH				0x3098
+#define QCH_CON_SPEEDY_SUB_APM_QCH			0x309c
+#define QCH_CON_SSMT_D_APM_QCH				0x30a0
+#define QCH_CON_SSMT_G_DBGCORE_QCH			0x30a4
+#define QCH_CON_SS_DBGCORE_QCH_DBG			0x30a8
+#define QCH_CON_SS_DBGCORE_QCH_GREBE			0x30ac
+#define QCH_CON_SYSMMU_D_APM_QCH			0x30b0
+#define QCH_CON_SYSREG_APM_QCH				0x30b8
+#define QCH_CON_UASC_APM_QCH				0x30bc
+#define QCH_CON_UASC_DBGCORE_QCH			0x30c0
+#define QCH_CON_UASC_G_SWD_QCH				0x30c4
+#define QCH_CON_UASC_P_AOCAPM_QCH			0x30c8
+#define QCH_CON_UASC_P_APM_QCH				0x30cc
+#define QCH_CON_WDT_APM_QCH				0x30d0
+#define QUEUE_CTRL_REG_BLK_APM_CMU_APM			0x3c00
+
+static const unsigned long apm_clk_regs[] __initconst = {
+	APM_CMU_APM_CONTROLLER_OPTION,
+	CLKOUT_CON_BLK_APM_CMU_APM_CLKOUT0,
+	CLK_CON_MUX_MUX_CLKCMU_APM_FUNC,
+	CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC,
+	CLK_CON_DIV_DIV_CLK_APM_BOOST,
+	CLK_CON_DIV_DIV_CLK_APM_USI0_UART,
+	CLK_CON_DIV_DIV_CLK_APM_USI0_USI,
+	CLK_CON_DIV_DIV_CLK_APM_USI1_UART,
+	CLK_CON_GAT_CLK_BLK_APM_UID_APM_CMU_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BUS0_BOOST_OPTION1,
+	CLK_CON_GAT_CLK_CMU_BOOST_OPTION1,
+	CLK_CON_GAT_CLK_CORE_BOOST_OPTION1,
+	CLK_CON_GAT_GATE_CLKCMU_APM_FUNC,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_RTC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_TRTC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_IPCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_IPCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_D_TZPC_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_GPC_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_GREBEINTEGRATION_IPCLKPORT_HCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_G_SWD_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_APM_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_D_APM_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AOC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AP_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_GSA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_SWD_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_TPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_AOC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_PMU_INTR_GEN_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_USI_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_SUB_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPCLKPORT_HCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SYSMMU_D_APM_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK,
+};
+
+PNAME(mout_apm_func_p)	= { "oscclk", "mout_apm_funcsrc",
+			    "pad_clk_apm", "oscclk" };
+PNAME(mout_apm_funcsrc_p) = { "pll_alv_div2_apm", "pll_alv_div4_apm",
+			      "pll_alv_div16_apm" };
+
+static const struct samsung_fixed_rate_clock apm_fixed_clks[] __initconst = {
+	FRATE(CLK_APM_PLL_DIV2_APM, "pll_alv_div2_apm", NULL, 0, 393216000),
+	FRATE(CLK_APM_PLL_DIV4_APM, "pll_alv_div4_apm", NULL, 0, 196608000),
+	FRATE(CLK_APM_PLL_DIV16_APM, "pll_alv_div16_apm", NULL, 0, 49152000),
+};
+
+static const struct samsung_mux_clock apm_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_APM_FUNC, "mout_apm_func", mout_apm_func_p,
+	    CLK_CON_MUX_MUX_CLKCMU_APM_FUNC, 4, 1),
+	MUX(CLK_MOUT_APM_FUNCSRC, "mout_apm_funcsrc", mout_apm_funcsrc_p,
+	    CLK_CON_MUX_MUX_CLKCMU_APM_FUNCSRC, 3, 1),
+};
+
+static const struct samsung_div_clock apm_div_clks[] __initconst = {
+	DIV(CLK_DOUT_APM_BOOST, "dout_apm_boost", "gout_apm_func",
+	    CLK_CON_DIV_DIV_CLK_APM_BOOST, 0, 1),
+	DIV(CLK_DOUT_APM_USI0_UART, "dout_apm_usi0_uart", "gout_apm_func",
+	    CLK_CON_DIV_DIV_CLK_APM_USI0_UART, 0, 7),
+	DIV(CLK_DOUT_APM_USI0_USI, "dout_apm_usi0_usi", "gout_apm_func",
+	    CLK_CON_DIV_DIV_CLK_APM_USI0_USI, 0, 7),
+	DIV(CLK_DOUT_APM_USI1_UART, "dout_apm_usi1_uart", "gout_apm_func",
+	    CLK_CON_DIV_DIV_CLK_APM_USI1_UART, 0, 7),
+};
+
+static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_APM_APM_CMU_APM_IPCLKPORT_PCLK,
+	     "gout_apm_apm_cmu_apm_ipclkport_pclk", "mout_apm_func",
+	     CLK_CON_GAT_CLK_BLK_APM_UID_APM_CMU_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_BUS0_BOOST_OPTION1, "gout_bus0_boost_option1",
+	     "dout_apm_boost", CLK_CON_GAT_CLK_BUS0_BOOST_OPTION1, 21, 0, 0),
+	GATE(CLK_GOUT_CMU_BOOST_OPTION1, "gout_cmu_boost_option1",
+	     "dout_apm_boost", CLK_CON_GAT_CLK_CMU_BOOST_OPTION1, 21, 0, 0),
+	GATE(CLK_CON_GAT_CLK_CORE_BOOST_OPTION1, "gout_core_boost_option1",
+	     "dout_apm_boost", CLK_CON_GAT_CLK_CORE_BOOST_OPTION1, 21, 0, 0),
+	GATE(CLK_GOUT_APM_FUNC, "gout_apm_func", "mout_apm_func",
+	     CLK_CON_GAT_GATE_CLKCMU_APM_FUNC, 21, 0, 0),
+	GATE(CLK_GOUT_APM_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
+	     "gout_apm_gpio_alive_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK,
+	     "gout_apm_gpio_far_alive_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
+	     "gout_apm_pmu_alive_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_APBIF_RTC_IPCLKPORT_PCLK,
+	     "gout_apm_apbif_rtc_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_RTC_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_APBIF_TRTC_IPCLKPORT_PCLK,
+	     "gout_apm_apbif_trtc_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APBIF_TRTC_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_APM_USI0_UART_IPCLKPORT_PCLK,
+	     "gout_apm_apm_usi0_uart_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_UART_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_APM_USI0_USI_IPCLKPORT_IPCLK,
+	     "gout_apm_apm_usi0_usi_ipclkport_ipclk", "dout_apm_usi0_uart",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI0_USI_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_APM_USI0_USI_IPCLKPORT_PCLK,
+	     "gout_apm_apm_usi0_usi_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_APM_USI1_UART_IPCLKPORT_IPCLK,
+	     "gout_apm_apm_usi1_uart_ipclkport_ipclk", "dout_apm_usi1_uart",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_IPCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_APM_USI1_UART_IPCLKPORT_PCLK,
+	     "gout_apm_apm_usi1_uart_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_APM_USI1_UART_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_D_TZPC_APM_IPCLKPORT_PCLK,
+	     "gout_apm_d_tzpc_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_D_TZPC_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_GPC_APM_IPCLKPORT_PCLK,
+	     "gout_apm_gpc_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_GPC_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_GREBEINTEGRATION_IPCLKPORT_HCLK,
+	     "gout_apm_grebeintegration", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_GREBEINTEGRATION_IPCLKPORT_HCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_INTMEM_IPCLKPORT_ACLK,
+	     "gout_apm_uid_intmem_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_INTMEM_IPCLKPORT_PCLK,
+	     "gout_apm_intmem_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_INTMEM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_LHM_AXI_G_SWD_IPCLKPORT_I_CLK,
+	     "gout_apm_lhm_axi_g_swd_ipclkport_i_clk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_G_SWD_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK,
+	     "gout_apm_lhm_axi_p_aocapm_ipclkport_i_clk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_LHM_AXI_P_AOCAPM_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_LHM_AXI_P_APM_IPCLKPORT_I_CLK,
+	     "gout_apm_lhm_axi_p_apm_ipclkport_i_clk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_D_APM_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_LHS_AXI_D_APM_IPCLKPORT_I_CLK,
+	     "gout_apm_lhs_axi_d_apm_ipclkport_i_clk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_D_APM_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK,
+	     "gout_apm_lhs_axi_g_dbgcore_ipclkport_i_clk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_DBGCORE_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK,
+	     "gout_apm_lhs_axi_g_scan2dram_ipclkport_i_clk",
+	     "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_LHS_AXI_G_SCAN2DRAM_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_MAILBOX_APM_AOC_IPCLKPORT_PCLK,
+	     "gout_apm_mailbox_apm_aoc_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AOC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_MAILBOX_APM_AP_IPCLKPORT_PCLK,
+	     "gout_apm_mailbox_apm_ap_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_AP_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_MAILBOX_APM_GSA_IPCLKPORT_PCLK,
+	     "gout_apm_mailbox_apm_gsa_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_GSA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_MAILBOX_APM_SWD_IPCLKPORT_PCLK,
+	     "gout_apm_mailbox_apm_swd_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_SWD_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_MAILBOX_APM_TPU_IPCLKPORT_PCLK,
+	     "gout_apm_mailbox_apm_tpu_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_APM_TPU_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_MAILBOX_AP_AOC_IPCLKPORT_PCLK,
+	     "gout_apm_uid_mailbox_ap_aoc_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_AOC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK,
+	     "gout_apm_mailbox_ap_dbgcore_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_MAILBOX_AP_DBGCORE_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_PMU_INTR_GEN_IPCLKPORT_PCLK,
+	     "gout_apm_pmu_intr_gen_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_PMU_INTR_GEN_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_ROM_CRC32_HOST_IPCLKPORT_ACLK,
+	     "gout_apm_rom_crc32_host_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_ROM_CRC32_HOST_IPCLKPORT_PCLK,
+	     "gout_apm_rom_crc32_host_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_ROM_CRC32_HOST_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK,
+	     "gout_apm_rstnsync_clk_cpm_bus_ipclkport_clk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_BUS_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT_CLK,
+	     "gout_apm_rstnsync_clk_apm_usi0_uart_ipclkport_clk",
+	     "dout_apm_usi0_uart",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_RSTNSYNC_CLK_APM_USI0_USI_IPCLKPORT_CLK,
+	     "gout_apm_rstnsync_clk_apm_usi0_usi_ipclkport_clk",
+	     "dout_apm_usi0_uart",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI0_UART_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPORT_CLK,
+	     "gout_apm_rstnsync_clk_apm_usi1_uart_ipclkport_clk",
+	     "dout_apm_usi1_uart",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_RSTNSYNC_CLK_APM_USI1_UART_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_SPEEDY_APM_IPCLKPORT_PCLK,
+	     "gout_apm_speedy_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_SPEEDY_SUB_APM_IPCLKPORT_PCLK,
+	     "gout_apm_speedy_sub_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SPEEDY_SUB_APM_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_SSMT_D_APM_IPCLKPORT_ACLK,
+	     "gout_apm_ssmt_d_apm_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_SSMT_D_APM_IPCLKPORT_PCLK,
+	     "gout_apm_ssmt_d_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_D_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_SSMT_G_DBGCORE_IPCLKPORT_ACLK,
+	     "gout_apm_ssmt_g_dbgcore_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_SSMT_G_DBGCORE_IPCLKPORT_PCLK,
+	     "gout_apm_ssmt_g_dbgcore_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SSMT_G_DBGCORE_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPCLKPORT_HCLK,
+	     "gout_apm_ss_dbgcore_ipclkport_ss_dbgcore_ipclkport_hclk",
+	     "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SS_DBGCORE_IPCLKPORT_SS_DBGCORE_IPCLKPORT_HCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_SYSMMU_D_APM_IPCLKPORT_CLK_S2,
+	     "gout_apm_sysmmu_d_dpm_ipclkport_clk_s2", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SYSMMU_D_APM_IPCLKPORT_CLK_S2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_SYSREG_APM_IPCLKPORT_PCLK,
+	     "gout_apm_sysreg_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_SYSREG_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_APM_IPCLKPORT_ACLK,
+	     "gout_apm_uasc_apm_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_APM_IPCLKPORT_PCLK,
+	     "gout_apm_uasc_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_DBGCORE_IPCLKPORT_ACLK,
+	     "gout_apm_uasc_dbgcore_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_DBGCORE_IPCLKPORT_PCLK,
+	     "gout_apm_uasc_dbgcore_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_DBGCORE_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_G_SWD_IPCLKPORT_ACLK,
+	     "gout_apm_uasc_g_swd_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_G_SWD_IPCLKPORT_PCLK,
+	     "gout_apm_uasc_g_swd_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK, 21, 0, 0),
+
+	GATE(CLK_GOUT_APM_UASC_P_AOCAPM_IPCLKPORT_ACLK,
+	     "gout_apm_uasc_p_aocapm_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_AOCAPM_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_P_AOCAPM_IPCLKPORT_PCLK,
+	     "gout_apm_uasc_p_aocapm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_P_APM_IPCLKPORT_ACLK,
+	     "gout_apm_uasc_p_apm_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_UASC_P_APM_IPCLKPORT_PCLK,
+	     "gout_apm_uasc_p_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_WDT_APM_IPCLKPORT_PCLK,
+	     "gout_apm_wdt_apm_ipclkport_pclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_APM_XIU_DP_APM_IPCLKPORT_ACLK,
+	     "gout_apm_xiu_dp_apm_ipclkport_aclk", "gout_apm_func",
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, 0, 0),
+};
+
+static const struct samsung_cmu_info apm_cmu_info __initconst = {
+	.mux_clks		= apm_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(apm_mux_clks),
+	.div_clks		= apm_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(apm_div_clks),
+	.gate_clks		= apm_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(apm_gate_clks),
+	.fixed_clks		= apm_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(apm_fixed_clks),
+	.nr_clk_ids		= APM_NR_CLK,
+	.clk_regs		= apm_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
+};
+
+/* ---- CMU_MISC ------------------------------------------------------------- */
+/* Register Offset definitions for CMU_MISC (0x10010000) */
+#define PLL_CON0_MUX_CLKCMU_MISC_BUS_USER	0x0600
+#define PLL_CON1_MUX_CLKCMU_MISC_BUS_USER	0x0604
+#define PLL_CON0_MUX_CLKCMU_MISC_SSS_USER	0x0610
+#define PLL_CON1_MUX_CLKCMU_MISC_SSS_USER	0x0614
+#define MISC_CMU_MISC_CONTROLLER_OPTION		0x0800
+#define CLKOUT_CON_BLK_MISC_CMU_MISC_CLKOUT0	0x0810
+#define CLK_CON_MUX_MUX_CLK_MISC_GIC		0x1000
+#define CLK_CON_DIV_DIV_CLK_MISC_BUSP		0x1800
+#define CLK_CON_DIV_DIV_CLK_MISC_GIC		0x1804
+#define CLK_CON_GAT_CLK_BLK_MISC_UID_MISC_CMU_MISC_IPCLKPORT_PCLK		0x2000
+#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK		0x2004
+#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_I_OSCCLK		0x2008
+#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK		0x200c
+#define CLK_CON_GAT_CLK_BLK_MISC_UID_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPORT_CLK	0x2010
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_ADM_AHB_SSS_IPCLKPORT_HCLKM		0x2014
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_DIT_IPCLKPORT_PCLKM		0x2018
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_PUF_IPCLKPORT_PCLKM		0x201c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_DIT_IPCLKPORT_ICLKL2A			0x2020
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_D_TZPC_MISC_IPCLKPORT_PCLK		0x2024
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_GIC_IPCLKPORT_GICCLK			0x2028
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_GPC_MISC_IPCLKPORT_PCLK			0x202c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AST_ICC_CPUGIC_IPCLKPORT_I_CLK	0x2030
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_D_SSS_IPCLKPORT_I_CLK		0x2034
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_GIC_IPCLKPORT_I_CLK		0x2038
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_MISC_IPCLKPORT_I_CLK		0x203c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_ACEL_D_MISC_IPCLKPORT_I_CLK		0x2040
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AST_IRI_GICCPU_IPCLKPORT_I_CLK	0x2044
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AXI_D_SSS_IPCLKPORT_I_CLK		0x2048
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_MCT_IPCLKPORT_PCLK			0x204c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_PCLK		0x2050
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_PCLK		0x2054
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_PCLK		0x2058
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PDMA_IPCLKPORT_ACLK			0x205c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_DMA_IPCLKPORT_ACLK			0x2060
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_ACLK			0x2064
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_PCLK			0x2068
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PUF_IPCLKPORT_I_CLK			0x206c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_ACLK			0x2070
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_PCLK			0x2074
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_ACLK			0x2078
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_PCLK			0x207c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_ACLK		0x2080
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_PCLK		0x2084
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_ACLK			0x2088
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_PCLK			0x208c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_ACLK			0x2090
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_PCLK			0x2094
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_ACLK			0x2098
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_PCLK			0x209c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSD_IPCLKPORT_CLK	0x20a0
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSP_IPCLKPORT_CLK	0x20a4
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_GIC_IPCLKPORT_CLK	0x20a8
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_SSS_IPCLKPORT_CLK	0x20ac
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_ACLK			0x20b0
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_PCLK			0x20b4
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SPDMA_IPCLKPORT_ACLK			0x20b8
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_ACLK			0x20bc
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_PCLK			0x20c0
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_ACLK			0x20c4
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_PCLK			0x20c8
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_ACLK		0x20cc
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_PCLK		0x20d0
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_ACLK			0x20d4
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_PCLK			0x20d8
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_ACLK			0x20dc
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_PCLK			0x20e0
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_ACLK			0x20e4
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_PCLK			0x20e8
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_ACLK			0x20ec
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_PCLK			0x20f0
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_MISC_IPCLKPORT_CLK_S2		0x20f4
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_SSS_IPCLKPORT_CLK_S1		0x20f8
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSREG_MISC_IPCLKPORT_PCLK		0x20fc
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_SUB_IPCLKPORT_PCLK			0x2100
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_TOP_IPCLKPORT_PCLK			0x2104
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER0_IPCLKPORT_PCLK		0x2108
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER1_IPCLKPORT_PCLK		0x210c
+#define CLK_CON_GAT_GOUT_BLK_MISC_UID_XIU_D_MISC_IPCLKPORT_ACLK			0x2110
+#define DMYQCH_CON_PPMU_DMA_QCH			0x3000
+#define DMYQCH_CON_PUF_QCH			0x3004
+#define PCH_CON_LHM_AXI_D_SSS_PCH		0x300c
+#define PCH_CON_LHM_AXI_P_GIC_PCH		0x3010
+#define PCH_CON_LHM_AXI_P_MISC_PCH		0x3014
+#define PCH_CON_LHS_ACEL_D_MISC_PCH		0x3018
+#define PCH_CON_LHS_AST_IRI_GICCPU_PCH		0x301c
+#define PCH_CON_LHS_AXI_D_SSS_PCH		0x3020
+#define QCH_CON_ADM_AHB_SSS_QCH			0x3024
+#define QCH_CON_DIT_QCH				0x3028
+#define QCH_CON_GIC_QCH				0x3030
+#define QCH_CON_LHM_AST_ICC_CPUGIC_QCH		0x3038
+#define QCH_CON_LHM_AXI_D_SSS_QCH		0x303c
+#define QCH_CON_LHM_AXI_P_GIC_QCH		0x3040
+#define QCH_CON_LHM_AXI_P_MISC_QCH		0x3044
+#define QCH_CON_LHS_ACEL_D_MISC_QCH		0x3048
+#define QCH_CON_LHS_AST_IRI_GICCPU_QCH		0x304c
+#define QCH_CON_LHS_AXI_D_SSS_QCH		0x3050
+#define QCH_CON_MCT_QCH				0x3054
+#define QCH_CON_MISC_CMU_MISC_QCH		0x3058
+#define QCH_CON_OTP_CON_BIRA_QCH		0x305c
+#define QCH_CON_OTP_CON_BISR_QCH		0x3060
+#define QCH_CON_OTP_CON_TOP_QCH			0x3064
+#define QCH_CON_PDMA_QCH			0x3068
+#define QCH_CON_PPMU_MISC_QCH			0x306c
+#define QCH_CON_QE_DIT_QCH			0x3070
+#define QCH_CON_QE_PDMA_QCH			0x3074
+#define QCH_CON_QE_PPMU_DMA_QCH			0x3078
+#define QCH_CON_QE_RTIC_QCH			0x307c
+#define QCH_CON_QE_SPDMA_QCH			0x3080
+#define QCH_CON_QE_SSS_QCH			0x3084
+#define QCH_CON_RTIC_QCH			0x3088
+#define QCH_CON_SPDMA_QCH			0x308c
+#define QCH_CON_SSMT_DIT_QCH			0x3090
+#define QCH_CON_SSMT_PDMA_QCH			0x3094
+#define QCH_CON_SSMT_PPMU_DMA_QCH		0x3098
+#define QCH_CON_SSMT_RTIC_QCH			0x309c
+#define QCH_CON_SSMT_SPDMA_QCH			0x30a0
+#define QCH_CON_SSMT_SSS_QCH			0x30a4
+#define QCH_CON_SSS_QCH				0x30a8
+#define QCH_CON_SYSMMU_MISC_QCH			0x30ac
+#define QCH_CON_SYSMMU_SSS_QCH			0x30b0
+#define QCH_CON_SYSREG_MISC_QCH			0x30b4
+#define QCH_CON_TMU_SUB_QCH			0x30b8
+#define QCH_CON_TMU_TOP_QCH			0x30bc
+#define QCH_CON_WDT_CLUSTER0_QCH		0x30c0
+#define QCH_CON_WDT_CLUSTER1_QCH		0x30c4
+#define QUEUE_CTRL_REG_BLK_MISC_CMU_MISC	0x3c00
+
+static const unsigned long misc_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_MISC_BUS_USER,
+	PLL_CON1_MUX_CLKCMU_MISC_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_MISC_SSS_USER,
+	PLL_CON1_MUX_CLKCMU_MISC_SSS_USER,
+	MISC_CMU_MISC_CONTROLLER_OPTION,
+	CLKOUT_CON_BLK_MISC_CMU_MISC_CLKOUT0,
+	CLK_CON_MUX_MUX_CLK_MISC_GIC,
+	CLK_CON_DIV_DIV_CLK_MISC_BUSP,
+	CLK_CON_DIV_DIV_CLK_MISC_GIC,
+	CLK_CON_GAT_CLK_BLK_MISC_UID_MISC_CMU_MISC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK,
+	CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_I_OSCCLK,
+	CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK,
+	CLK_CON_GAT_CLK_BLK_MISC_UID_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_ADM_AHB_SSS_IPCLKPORT_HCLKM,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_DIT_IPCLKPORT_PCLKM,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_PUF_IPCLKPORT_PCLKM,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_DIT_IPCLKPORT_ICLKL2A,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_D_TZPC_MISC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_GIC_IPCLKPORT_GICCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_GPC_MISC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AST_ICC_CPUGIC_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_D_SSS_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_GIC_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_MISC_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_ACEL_D_MISC_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AST_IRI_GICCPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AXI_D_SSS_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_MCT_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_PDMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_DMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_PUF_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSD_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSP_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_GIC_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_SSS_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SPDMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_ACLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_MISC_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_SSS_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSREG_MISC_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_SUB_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_TOP_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_MISC_UID_XIU_D_MISC_IPCLKPORT_ACLK,
+	DMYQCH_CON_PPMU_DMA_QCH,
+	DMYQCH_CON_PUF_QCH,
+	PCH_CON_LHM_AXI_D_SSS_PCH,
+	PCH_CON_LHM_AXI_P_GIC_PCH,
+	PCH_CON_LHM_AXI_P_MISC_PCH,
+	PCH_CON_LHS_ACEL_D_MISC_PCH,
+	PCH_CON_LHS_AST_IRI_GICCPU_PCH,
+	PCH_CON_LHS_AXI_D_SSS_PCH,
+	QCH_CON_ADM_AHB_SSS_QCH,
+	QCH_CON_DIT_QCH,
+	QCH_CON_GIC_QCH,
+	QCH_CON_LHM_AST_ICC_CPUGIC_QCH,
+	QCH_CON_LHM_AXI_D_SSS_QCH,
+	QCH_CON_LHM_AXI_P_GIC_QCH,
+	QCH_CON_LHM_AXI_P_MISC_QCH,
+	QCH_CON_LHS_ACEL_D_MISC_QCH,
+	QCH_CON_LHS_AST_IRI_GICCPU_QCH,
+	QCH_CON_LHS_AXI_D_SSS_QCH,
+	QCH_CON_MCT_QCH,
+	QCH_CON_MISC_CMU_MISC_QCH,
+	QCH_CON_OTP_CON_BIRA_QCH,
+	QCH_CON_OTP_CON_BISR_QCH,
+	QCH_CON_OTP_CON_TOP_QCH,
+	QCH_CON_PDMA_QCH,
+	QCH_CON_PPMU_MISC_QCH,
+	QCH_CON_QE_DIT_QCH,
+	QCH_CON_QE_PDMA_QCH,
+	QCH_CON_QE_PPMU_DMA_QCH,
+	QCH_CON_QE_RTIC_QCH,
+	QCH_CON_QE_SPDMA_QCH,
+	QCH_CON_QE_SSS_QCH,
+	QCH_CON_RTIC_QCH,
+	QCH_CON_SPDMA_QCH,
+	QCH_CON_SSMT_DIT_QCH,
+	QCH_CON_SSMT_PDMA_QCH,
+	QCH_CON_SSMT_PPMU_DMA_QCH,
+	QCH_CON_SSMT_RTIC_QCH,
+	QCH_CON_SSMT_SPDMA_QCH,
+	QCH_CON_SSMT_SSS_QCH,
+	QCH_CON_SSS_QCH,
+	QCH_CON_SYSMMU_MISC_QCH,
+	QCH_CON_SYSMMU_SSS_QCH,
+	QCH_CON_SYSREG_MISC_QCH,
+	QCH_CON_TMU_SUB_QCH,
+	QCH_CON_TMU_TOP_QCH,
+	QCH_CON_WDT_CLUSTER0_QCH,
+	QCH_CON_WDT_CLUSTER1_QCH,
+	QUEUE_CTRL_REG_BLK_MISC_CMU_MISC,
+};
+
+ /* List of parent clocks for Muxes in CMU_MISC */
+PNAME(mout_misc_bus_user_p)		= { "oscclk", "dout_cmu_misc_bus" };
+PNAME(mout_misc_sss_user_p)		= { "oscclk", "dout_cmu_misc_sss" };
+PNAME(mout_misc_gic_p)			= { "dout_misc_gic", "oscclk" };
+
+static const struct samsung_mux_clock misc_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_MISC_BUS_USER, "mout_misc_bus_user", mout_misc_bus_user_p,
+	    PLL_CON0_MUX_CLKCMU_MISC_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_MISC_SSS_USER, "mout_misc_sss_user", mout_misc_sss_user_p,
+	    PLL_CON0_MUX_CLKCMU_MISC_SSS_USER, 4, 1),
+	MUX(CLK_MOUT_MISC_GIC, "mout_misc_gic", mout_misc_gic_p,
+	    CLK_CON_MUX_MUX_CLK_MISC_GIC, 0, 0),
+};
+
+static const struct samsung_div_clock misc_div_clks[] __initconst = {
+	DIV(CLK_DOUT_MISC_BUSP, "dout_misc_busp", "mout_misc_bus_user",
+	    CLK_CON_DIV_DIV_CLK_MISC_BUSP, 0, 3),
+	DIV(CLK_DOUT_MISC_GIC, "dout_misc_gic", "mout_misc_bus_user",
+	    CLK_CON_DIV_DIV_CLK_MISC_GIC, 0, 3),
+};
+
+static const struct samsung_gate_clock misc_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_MISC_MISC_CMU_MISC_IPCLKPORT_PCLK,
+	     "gout_misc_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_CLK_BLK_MISC_UID_MISC_CMU_MISC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK,
+	     "gout_misc_otp_con_bira_ipclkport_i_oscclk", "dout_misc_busp",
+	     CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_OTP_CON_BISR_IPCLKPORT_I_OSCCLK,
+	     "gout_misc_otp_con_bisr_ipclkport_i_oscclk", "dout_misc_busp",
+	     CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_I_OSCCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_OTP_CON_TOP_IPCLKPORT_I_OSCCLK,
+	     "gout_misc_otp_con_top_ipclkport_i_oscclk", "dout_misc_busp",
+	     CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPORT_CLK,
+	     "gout_misc_rstnsync_clk_misc_oscclk_ipclkport_clk",
+	     "dout_misc_busp",
+	     CLK_CON_GAT_CLK_BLK_MISC_UID_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_ADM_AHB_SSS_IPCLKPORT_HCLKM,
+	     "gout_misc_adm_ahb_sss_ipclkport_hclkm", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_ADM_AHB_SSS_IPCLKPORT_HCLKM,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_AD_APB_DIT_IPCLKPORT_PCLKM,
+	     "gout_misc_ad_apb_dit_ipclkport_pclkm", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_DIT_IPCLKPORT_PCLKM,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_D_TZPC_MISC_IPCLKPORT_PCLK,
+	     "gout_misc_d_tzpc_misc_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_D_TZPC_MISC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_GIC_IPCLKPORT_GICCLK,
+	     "gout_misc_gic_ipclkport_gicclk", "mout_misc_gic",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_GIC_IPCLKPORT_GICCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_GPC_MISC_IPCLKPORT_PCLK,
+	     "gout_misc_gpc_misc_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_GPC_MISC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_LHM_AST_ICC_CPUGIC_IPCLKPORT_I_CLK,
+	     "gout_misc_lhm_ast_icc_gpugic_ipclkport_i_clk", "mout_misc_gic",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AST_ICC_CPUGIC_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_LHM_AXI_D_SSS_IPCLKPORT_I_CLK,
+	     "gout_misc_lhm_axi_d_sss_ipclkport_i_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_D_SSS_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_LHM_AXI_P_GIC_IPCLKPORT_I_CLK,
+	     "gout_misc_lhm_axi_p_gic_ipclkport_i_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_GIC_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_LHM_AXI_P_MISC_IPCLKPORT_I_CLK,
+	     "gout_misc_lhm_axi_p_misc_ipclkport_i_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_MISC_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_LHS_ACEL_D_MISC_IPCLKPORT_I_CLK,
+	     "gout_misc_lhs_acel_d_misc_ipclkport_i_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_ACEL_D_MISC_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_LHS_AST_IRI_GICCPU_IPCLKPORT_I_CLK,
+	     "gout_misc_lhs_ast_iri_giccpu_ipclkport_i_clk", "mout_misc_gic",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AST_IRI_GICCPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_LHS_AXI_D_SSS_IPCLKPORT_I_CLK,
+	     "gout_misc_lhs_axi_d_sss_ipclkport_i_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AXI_D_SSS_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_MCT_IPCLKPORT_PCLK, "gout_misc_mct_ipclkport_pclk",
+	     "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_MCT_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_OTP_CON_BIRA_IPCLKPORT_PCLK,
+	     "gout_misc_otp_con_bira_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_OTP_CON_BISR_IPCLKPORT_PCLK,
+	     "gout_misc_otp_con_bisr_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_OTP_CON_TOP_IPCLKPORT_PCLK,
+	     "gout_misc_otp_con_top_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_PDMA_IPCLKPORT_ACLK, "gout_misc_pdma_ipclkport_aclk",
+	     "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_PDMA_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_PPMU_MISC_IPCLKPORT_ACLK,
+	     "gout_misc_ppmu_misc_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_PPMU_MISC_IPCLKPORT_PCLK,
+	     "gout_misc_ppmu_misc_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_PUF_IPCLKPORT_I_CLK,
+	     "gout_misc_puf_ipclkport_i_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_PUF_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_DIT_IPCLKPORT_ACLK,
+	     "gout_misc_qe_dit_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_DIT_IPCLKPORT_PCLK,
+	     "gout_misc_qe_dit_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_PDMA_IPCLKPORT_ACLK,
+	     "gout_misc_qe_pdma_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_PDMA_IPCLKPORT_PCLK,
+	     "gout_misc_qe_pdma_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_PPMU_DMA_IPCLKPORT_ACLK,
+	     "gout_misc_qe_ppmu_dma_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_PPMU_DMA_IPCLKPORT_PCLK,
+	     "gout_misc_qe_ppmu_dma_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_RTIC_IPCLKPORT_ACLK,
+	     "gout_misc_qe_rtic_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_RTIC_IPCLKPORT_PCLK,
+	     "gout_misc_qe_rtic_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_SPDMA_IPCLKPORT_ACLK,
+	     "gout_misc_qe_spdma_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_SPDMA_IPCLKPORT_PCLK,
+	     "gout_misc_qe_spdma_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_SSS_IPCLKPORT_ACLK,
+	     "gout_misc_qe_sss_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_QE_SSS_IPCLKPORT_PCLK,
+	     "gout_misc_qe_sss_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_BUSD_IPCLKPORT_CLK,
+	     "gout_misc_rstnsync_clk_misc_busd_ipclkport_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSD_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_BUSP_IPCLKPORT_CLK,
+	     "gout_misc_rstnsync_clk_misc_busp_ipclkport_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSP_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_GIC_IPCLKPORT_CLK,
+	     "gout_misc_rstnsync_clk_misc_gic_ipclkport_clk", "mout_misc_gic",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_GIC_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_RSTNSYNC_CLK_MISC_SSS_IPCLKPORT_CLK,
+	     "gout_misc_rstnsync_clk_misc_sss_ipclkport_clk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_SSS_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_RTIC_IPCLKPORT_I_ACLK,
+	     "gout_misc_rtic_ipclkport_i_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_RTIC_IPCLKPORT_I_PCLK, "gout_misc_rtic_ipclkport_i_pclk",
+	     "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SPDMA_IPCLKPORT_ACLK,
+	     "gout_misc_spdma_ipclockport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SPDMA_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_DIT_IPCLKPORT_ACLK,
+	     "gout_misc_ssmt_dit_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_DIT_IPCLKPORT_PCLK,
+	     "gout_misc_ssmt_dit_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_PDMA_IPCLKPORT_ACLK,
+	     "gout_misc_ssmt_pdma_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_PDMA_IPCLKPORT_PCLK,
+	     "gout_misc_ssmt_pdma_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_PPMU_DMA_IPCLKPORT_ACLK,
+	     "gout_misc_ssmt_ppmu_dma_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_PPMU_DMA_IPCLKPORT_PCLK,
+	     "gout_misc_ssmt_ppmu_dma_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_RTIC_IPCLKPORT_ACLK,
+	     "gout_misc_ssmt_rtic_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_RTIC_IPCLKPORT_PCLK,
+	     "gout_misc_ssmt_rtic_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_SPDMA_IPCLKPORT_ACLK,
+	     "gout_misc_ssmt_spdma_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_SPDMA_IPCLKPORT_PCLK,
+	     "gout_misc_ssmt_spdma_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_SSS_IPCLKPORT_ACLK,
+	     "gout_misc_ssmt_sss_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSMT_SSS_IPCLKPORT_PCLK,
+	     "gout_misc_ssmt_sss_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSS_IPCLKPORT_I_ACLK,
+	     "gout_misc_sss_ipclkport_i_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SSS_IPCLKPORT_I_PCLK,
+	     "gout_misc_sss_ipclkport_i_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SYSMMU_MISC_IPCLKPORT_CLK_S2,
+	     "gout_misc_sysmmu_misc_ipclkport_clk_s2", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_MISC_IPCLKPORT_CLK_S2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SYSMMU_SSS_IPCLKPORT_CLK_S1,
+	     "gout_misc_sysmmu_sss_ipclkport_clk_s1", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_SSS_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_SYSREG_MISC_IPCLKPORT_PCLK,
+	     "gout_misc_sysreg_misc_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSREG_MISC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_TMU_SUB_IPCLKPORT_PCLK,
+	     "gout_misc_tmu_sub_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_SUB_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_TMU_TOP_IPCLKPORT_PCLK,
+	     "gout_misc_tmu_top_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_TOP_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	     "gout_misc_wdt_cluster0_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_WDT_CLUSTER1_IPCLKPORT_PCLK,
+	     "gout_misc_wdt_cluster1_ipclkport_pclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_MISC_XIU_D_MISC_IPCLKPORT_ACLK,
+	     "gout_misc_xiu_d_misc_ipclkport_aclk", "dout_misc_busp",
+	     CLK_CON_GAT_GOUT_BLK_MISC_UID_XIU_D_MISC_IPCLKPORT_ACLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info misc_cmu_info __initconst = {
+	.mux_clks		= misc_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(misc_mux_clks),
+	.div_clks		= misc_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(misc_div_clks),
+	.gate_clks		= misc_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(misc_gate_clks),
+	.nr_clk_ids		= MISC_NR_CLK,
+	.clk_regs		= misc_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
+	.clk_name		= "dout_cmu_misc_bus",
+};
+
+/* ---- platform_driver ----------------------------------------------------- */
+
+static int __init gs101_cmu_probe(struct platform_device *pdev)
+{
+	const struct samsung_cmu_info *info;
+	struct device *dev = &pdev->dev;
+
+	info = of_device_get_match_data(dev);
+	exynos_arm64_register_cmu(dev, dev->of_node, info);
+
+	return 0;
+}
+
+static const struct of_device_id gs101_cmu_of_match[] = {
+	{
+		.compatible = "google,gs101-cmu-apm",
+		.data = &apm_cmu_info,
+	}, {
+		.compatible = "google,gs101-cmu-misc",
+		.data = &misc_cmu_info,
+	}, {
+	},
+};
+
+static struct platform_driver gs101_cmu_driver __refdata = {
+	.driver	= {
+		.name = "gs101-cmu",
+		.of_match_table = gs101_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = gs101_cmu_probe,
+};
+
+static int __init gs101_cmu_init(void)
+{
+	return platform_driver_register(&gs101_cmu_driver);
+}
+core_initcall(gs101_cmu_init);
-- 
2.43.0.rc2.451.g8631bc7472-goog


