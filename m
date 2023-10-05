Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2013C7BA83C
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Oct 2023 19:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjJERmU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Oct 2023 13:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbjJERmO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Oct 2023 13:42:14 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F72EE7
        for <linux-watchdog@vger.kernel.org>; Thu,  5 Oct 2023 10:42:09 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c6052422acso13525ad.1
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Oct 2023 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696527729; x=1697132529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=guI1ErqLB8fHUh42HC295ZsRdvUpMiv8fFDTMY14qKM=;
        b=zKThKlDvXZkXwSs422H2E7UefpKVBmIyeZ3ttBpdQKPNBit+DxY26d00nLwbXuzLXS
         ElcmreroJIBjsZswx1xdubSIbA4yRb2Jc138AVPtkpZWE7SftZrkT48tQ1YKZCqk2gRT
         nDRjjbU2L7rvh37wqlrTBrjCV8Ys5p5bcmDATqAxFKwvLoXcuqZ6MaFPG2QFJnD8yS7S
         ChioZuGmoRUqszAJ2syWLVmP1XTbaMYm0f2SbY9+p+aOL6hEI3nazC/WsUL7S9GLL7/h
         yP4lw1Z2IrL8Cn5/BH+YoK3F7wVtYxVCpM4Q79di29rs/fGjaw+fjG3mvDsb5BMzKps+
         cUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527729; x=1697132529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guI1ErqLB8fHUh42HC295ZsRdvUpMiv8fFDTMY14qKM=;
        b=LDGcuHmNB0j2qkwW/TnblRhsett4iRryyglQZtwdtcC7yENREBGDRjHPqt5qofUPxI
         60GEdh2bJZTEkEmVxoUZ616ITZqfp9G5fUD/5QwBqdGrgMLY9ROusSm+lZqEoQD0z+cE
         hdovQ6dJQDml+MoOif69uPTS3gm2auksonFe1KWS2TykmKyx7SD+m8Ty2HCEouomLIen
         qb5B3agEDgD6BfnbsMIu1Z+TIwHKQSv6UDFl8GoNxMfukuKldgItuC0g3Pd8jqFladNd
         tFU9pze0hTLRjEIa7Sq9Obe7+ycYeGb7vU4apXOcA5HGFQaM8+MY6WOiiT1+SYv3PSg3
         2OSA==
X-Gm-Message-State: AOJu0Yyg2jJPHvc7ENPxp8Lxj/f3aaEZQQQesKHSUwrNaqavppAb+9pH
        u4LfzzwPH9OLxwAz61A2iroEhw==
X-Google-Smtp-Source: AGHT+IH5HoP/UQX3Pd3tqlFWlR4DgPfEk8mJzYNCyku41VQfYykmXoGcDh5lrntdYC8S546j6wBfKQ==
X-Received: by 2002:a17:903:2351:b0:1c6:212f:c8e5 with SMTP id c17-20020a170903235100b001c6212fc8e5mr160767plh.26.1696527728388;
        Thu, 05 Oct 2023 10:42:08 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a1a4600b0026d54b2abe9sm2011765pjl.37.2023.10.05.10.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 10:42:07 -0700 (PDT)
Date:   Thu, 5 Oct 2023 10:42:04 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH 13/21] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
Message-ID: <ZR71bGHt6sfynDMH@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-14-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-14-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/05/2023, Peter Griffin wrote:
> CMU_TOP is the top level clock management unit which contains PLLs, muxes
> and gates that feed the other clock management units.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/Kconfig     |    9 +
>  drivers/clk/samsung/Makefile    |    1 +
>  drivers/clk/samsung/clk-gs101.c | 1558 +++++++++++++++++++++++++++++++
>  3 files changed, 1568 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-gs101.c
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 76a494e95027..4c8f173c4dec 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -13,6 +13,7 @@ config COMMON_CLK_SAMSUNG
>  	select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
>  	select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
>  	select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> +	select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR

Is this patch out of order? ARCH_GOOGLE_TENSOR hasn't been defined at this
point in the series (it's defined in 18/21).

Regards,
Will

>  
>  config S3C64XX_COMMON_CLK
>  	bool "Samsung S3C64xx clock controller support" if COMPILE_TEST
> @@ -102,3 +103,11 @@ config TESLA_FSD_COMMON_CLK
>  	help
>  	  Support for the clock controller present on the Tesla FSD SoC.
>  	  Choose Y here only if you build for this SoC.
> +
> +config GOOGLE_GS101_COMMON_CLK
> +	bool "Google gs101 clock controller support" if COMPILE_TEST
> +	depends on COMMON_CLK_SAMSUNG
> +	depends on EXYNOS_ARM64_COMMON_CLK
> +	help
> +	  Support for the clock controller present on the Google gs101 SoC.
> +	  Choose Y here only if you build for this SoC.
> \ No newline at end of file
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index ebbeacabe88f..1e69b8e14324 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -24,3 +24,4 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
>  obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
>  obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
>  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
> +obj-$(CONFIG_GOOGLE_GS101_COMMON_CLK)	+= clk-gs101.o
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> new file mode 100644
> index 000000000000..4c58fcc899be
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -0,0 +1,1558 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + * Author: Peter Griffin <peter.griffin@linaro.org>
> + *
> + * Common Clock Framework support for GS101.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/gs101.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/* NOTE: Must be equal to the last clock ID increased by one */
> +#define TOP_NR_CLK                     (CLK_GOUT_CMU_BOOST + 1)
> +
> +/* ---- CMU_TOP ------------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_TOP (0x1e080000) */
> +
> +#define PLL_LOCKTIME_PLL_SHARED0			0x0000
> +#define PLL_LOCKTIME_PLL_SHARED1			0x0004
> +#define PLL_LOCKTIME_PLL_SHARED2			0x0008
> +#define PLL_LOCKTIME_PLL_SHARED3			0x000c
> +#define PLL_LOCKTIME_PLL_SPARE				0x0010
> +#define PLL_CON0_PLL_SHARED0				0x0100
> +#define PLL_CON1_PLL_SHARED0				0x0104
> +#define PLL_CON2_PLL_SHARED0				0x0108
> +#define PLL_CON3_PLL_SHARED0				0x010c
> +#define PLL_CON4_PLL_SHARED0				0x0110
> +#define PLL_CON0_PLL_SHARED1				0x0140
> +#define PLL_CON1_PLL_SHARED1				0x0144
> +#define PLL_CON2_PLL_SHARED1				0x0148
> +#define PLL_CON3_PLL_SHARED1				0x014c
> +#define PLL_CON4_PLL_SHARED1				0x0150
> +#define PLL_CON0_PLL_SHARED2				0x0180
> +#define PLL_CON1_PLL_SHARED2				0x0184
> +#define PLL_CON2_PLL_SHARED2				0x0188
> +#define PLL_CON3_PLL_SHARED2				0x018c
> +#define PLL_CON4_PLL_SHARED2				0x0190
> +#define PLL_CON0_PLL_SHARED3				0x01c0
> +#define PLL_CON1_PLL_SHARED3				0x01c4
> +#define PLL_CON2_PLL_SHARED3				0x01c8
> +#define PLL_CON3_PLL_SHARED3				0x01cc
> +#define PLL_CON4_PLL_SHARED3				0x01d0
> +#define PLL_CON0_PLL_SPARE				0x0200
> +#define PLL_CON1_PLL_SPARE				0x0204
> +#define PLL_CON2_PLL_SPARE				0x0208
> +#define PLL_CON3_PLL_SPARE				0x020c
> +#define PLL_CON4_PLL_SPARE				0x0210
> +#define CMU_CMU_TOP_CONTROLLER_OPTION			0x0800
> +#define CLKOUT_CON_BLK_CMU_CMU_TOP_CLKOUT0		0x0810
> +#define CMU_HCHGEN_CLKMUX_CMU_BOOST			0x0840
> +#define CMU_HCHGEN_CLKMUX_TOP_BOOST			0x0844
> +#define CMU_HCHGEN_CLKMUX				0x0850
> +#define POWER_FAIL_DETECT_PLL				0x0864
> +#define EARLY_WAKEUP_FORCED_0_ENABLE			0x0870
> +#define EARLY_WAKEUP_FORCED_1_ENABLE			0x0874
> +#define EARLY_WAKEUP_APM_CTRL				0x0878
> +#define EARLY_WAKEUP_CLUSTER0_CTRL			0x087c
> +#define EARLY_WAKEUP_DPU_CTRL				0x0880
> +#define EARLY_WAKEUP_CSIS_CTRL				0x0884
> +#define EARLY_WAKEUP_APM_DEST				0x0890
> +#define EARLY_WAKEUP_CLUSTER0_DEST			0x0894
> +#define EARLY_WAKEUP_DPU_DEST				0x0898
> +#define EARLY_WAKEUP_CSIS_DEST				0x089c
> +#define EARLY_WAKEUP_SW_TRIG_APM			0x08c0
> +#define EARLY_WAKEUP_SW_TRIG_APM_SET			0x08c4
> +#define EARLY_WAKEUP_SW_TRIG_APM_CLEAR			0x08c8
> +#define EARLY_WAKEUP_SW_TRIG_CLUSTER0			0x08d0
> +#define EARLY_WAKEUP_SW_TRIG_CLUSTER0_SET		0x08d4
> +#define EARLY_WAKEUP_SW_TRIG_CLUSTER0_CLEAR		0x08d8
> +#define EARLY_WAKEUP_SW_TRIG_DPU			0x08e0
> +#define EARLY_WAKEUP_SW_TRIG_DPU_SET			0x08e4
> +#define EARLY_WAKEUP_SW_TRIG_DPU_CLEAR			0x08e8
> +#define EARLY_WAKEUP_SW_TRIG_CSIS			0x08f0
> +#define EARLY_WAKEUP_SW_TRIG_CSIS_SET			0x08f4
> +#define EARLY_WAKEUP_SW_TRIG_CSIS_CLEAR			0x08f8
> +
> +#define CLK_CON_MUX_MUX_CLKCMU_BO_BUS			0x1000
> +#define CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS			0x1004
> +#define CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS			0x1008
> +#define CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS			0x100c
> +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0			0x1010
> +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1			0x1014
> +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2			0x1018
> +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3			0x101c
> +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK4			0x1020
> +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK5			0x1024
> +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK6			0x1028
> +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK7			0x102c
> +#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST		0x1030
> +#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST_OPTION1	0x1034
> +#define CLK_CON_MUX_MUX_CLKCMU_CORE_BUS			0x1038
> +#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG		0x103c
> +#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH		0x1040
> +#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH		0x1044
> +#define CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH		0x1048
> +#define CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS			0x104c
> +#define CLK_CON_MUX_MUX_CLKCMU_DISP_BUS			0x1050
> +#define CLK_CON_MUX_MUX_CLKCMU_DNS_BUS			0x1054
> +#define CLK_CON_MUX_MUX_CLKCMU_DPU_BUS			0x1058
> +#define CLK_CON_MUX_MUX_CLKCMU_EH_BUS			0x105c
> +#define CLK_CON_MUX_MUX_CLKCMU_G2D_G2D			0x1060
> +#define CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL			0x1064
> +#define CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA		0x1068
> +#define CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD			0x106c
> +#define CLK_CON_MUX_MUX_CLKCMU_G3D_GLB			0x1070
> +#define CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH		0x1074
> +#define CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0			0x1078
> +#define CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1			0x107c
> +#define CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC			0x1080
> +#define CLK_CON_MUX_MUX_CLKCMU_HPM			0x1084
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS			0x1088
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC		0x108c
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD		0x1090
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG		0x1094
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS			0x1098
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE		0x109c
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS			0x10a0
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD		0x10a4
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE		0x10a8
> +#define CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD		0x10ac
> +#define CLK_CON_MUX_MUX_CLKCMU_IPP_BUS			0x10b0
> +#define CLK_CON_MUX_MUX_CLKCMU_ITP_BUS			0x10b4
> +#define CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC		0x10b8
> +#define CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC		0x10bc
> +#define CLK_CON_MUX_MUX_CLKCMU_MFC_MFC			0x10c0
> +#define CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP			0x10c4
> +#define CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH		0x10c8
> +#define CLK_CON_MUX_MUX_CLKCMU_MISC_BUS			0x10cc
> +#define CLK_CON_MUX_MUX_CLKCMU_MISC_SSS			0x10d0
> +#define CLK_CON_MUX_MUX_CLKCMU_PDP_BUS			0x10d4
> +#define CLK_CON_MUX_MUX_CLKCMU_PDP_VRA			0x10d8
> +#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS		0x10dc
> +#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP		0x10e0
> +#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS		0x10e4
> +#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP		0x10e8
> +#define CLK_CON_MUX_MUX_CLKCMU_TNR_BUS			0x10ec
> +#define CLK_CON_MUX_MUX_CLKCMU_TOP_BOOST_OPTION1	0x10f0
> +#define CLK_CON_MUX_MUX_CLKCMU_TOP_CMUREF		0x10f4
> +#define CLK_CON_MUX_MUX_CLKCMU_TPU_BUS			0x10f8
> +#define CLK_CON_MUX_MUX_CLKCMU_TPU_TPU			0x10fc
> +#define CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL		0x1100
> +#define CLK_CON_MUX_MUX_CLKCMU_TPU_UART			0x1104
> +#define CLK_CON_MUX_MUX_CMU_CMUREF			0x1108
> +
> +#define CLK_CON_DIV_CLKCMU_BO_BUS			0x1800
> +#define CLK_CON_DIV_CLKCMU_BUS0_BUS			0x1804
> +#define CLK_CON_DIV_CLKCMU_BUS1_BUS			0x1808
> +#define CLK_CON_DIV_CLKCMU_BUS2_BUS			0x180c
> +#define CLK_CON_DIV_CLKCMU_CIS_CLK0			0x1810
> +#define CLK_CON_DIV_CLKCMU_CIS_CLK1			0x1814
> +#define CLK_CON_DIV_CLKCMU_CIS_CLK2			0x1818
> +#define CLK_CON_DIV_CLKCMU_CIS_CLK3			0x181c
> +#define CLK_CON_DIV_CLKCMU_CIS_CLK4			0x1820
> +#define CLK_CON_DIV_CLKCMU_CIS_CLK5			0x1824
> +#define CLK_CON_DIV_CLKCMU_CIS_CLK6			0x1828
> +#define CLK_CON_DIV_CLKCMU_CIS_CLK7			0x182c
> +#define CLK_CON_DIV_CLKCMU_CORE_BUS			0x1830
> +#define CLK_CON_DIV_CLKCMU_CPUCL0_DBG			0x1834
> +#define CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH		0x1838
> +#define CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH		0x183c
> +#define CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH		0x1840
> +#define CLK_CON_DIV_CLKCMU_CSIS_BUS			0x1844
> +#define CLK_CON_DIV_CLKCMU_DISP_BUS			0x1848
> +#define CLK_CON_DIV_CLKCMU_DNS_BUS			0x184c
> +#define CLK_CON_DIV_CLKCMU_DPU_BUS			0x1850
> +#define CLK_CON_DIV_CLKCMU_EH_BUS			0x1854
> +#define CLK_CON_DIV_CLKCMU_G2D_G2D			0x1858
> +#define CLK_CON_DIV_CLKCMU_G2D_MSCL			0x185c
> +#define CLK_CON_DIV_CLKCMU_G3AA_G3AA			0x1860
> +#define CLK_CON_DIV_CLKCMU_G3D_BUSD			0x1864
> +#define CLK_CON_DIV_CLKCMU_G3D_GLB			0x1868
> +#define CLK_CON_DIV_CLKCMU_G3D_SWITCH			0x186c
> +#define CLK_CON_DIV_CLKCMU_GDC_GDC0			0x1870
> +#define CLK_CON_DIV_CLKCMU_GDC_GDC1			0x1874
> +#define CLK_CON_DIV_CLKCMU_GDC_SCSC			0x1878
> +#define CLK_CON_DIV_CLKCMU_HPM				0x187c
> +#define CLK_CON_DIV_CLKCMU_HSI0_BUS			0x1880
> +#define CLK_CON_DIV_CLKCMU_HSI0_DPGTC			0x1884
> +#define CLK_CON_DIV_CLKCMU_HSI0_USB31DRD		0x1888
> +#define CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG		0x188c
> +#define CLK_CON_DIV_CLKCMU_HSI1_BUS			0x1890
> +#define CLK_CON_DIV_CLKCMU_HSI1_PCIE			0x1894
> +#define CLK_CON_DIV_CLKCMU_HSI2_BUS			0x1898
> +#define CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD		0x189c
> +#define CLK_CON_DIV_CLKCMU_HSI2_PCIE			0x18a0
> +#define CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD		0x18a4
> +#define CLK_CON_DIV_CLKCMU_IPP_BUS			0x18a8
> +#define CLK_CON_DIV_CLKCMU_ITP_BUS			0x18ac
> +#define CLK_CON_DIV_CLKCMU_MCSC_ITSC			0x18b0
> +#define CLK_CON_DIV_CLKCMU_MCSC_MCSC			0x18b4
> +#define CLK_CON_DIV_CLKCMU_MFC_MFC			0x18b8
> +#define CLK_CON_DIV_CLKCMU_MIF_BUSP			0x18bc
> +#define CLK_CON_DIV_CLKCMU_MISC_BUS			0x18c0
> +#define CLK_CON_DIV_CLKCMU_MISC_SSS			0x18c4
> +#define CLK_CON_DIV_CLKCMU_OTP				0x18c8
> +#define CLK_CON_DIV_CLKCMU_PDP_BUS			0x18cc
> +#define CLK_CON_DIV_CLKCMU_PDP_VRA			0x18d0
> +#define CLK_CON_DIV_CLKCMU_PERIC0_BUS			0x18d4
> +#define CLK_CON_DIV_CLKCMU_PERIC0_IP			0x18d8
> +#define CLK_CON_DIV_CLKCMU_PERIC1_BUS			0x18dc
> +#define CLK_CON_DIV_CLKCMU_PERIC1_IP			0x18e0
> +#define CLK_CON_DIV_CLKCMU_TNR_BUS			0x18e4
> +#define CLK_CON_DIV_CLKCMU_TPU_BUS			0x18e8
> +#define CLK_CON_DIV_CLKCMU_TPU_TPU			0x18ec
> +#define CLK_CON_DIV_CLKCMU_TPU_TPUCTL			0x18f0
> +#define CLK_CON_DIV_CLKCMU_TPU_UART			0x18f4
> +#define CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST		0x18f8
> +#define CLK_CON_DIV_DIV_CLK_CMU_CMUREF			0x18fc
> +#define CLK_CON_DIV_PLL_SHARED0_DIV2			0x1900
> +#define CLK_CON_DIV_PLL_SHARED0_DIV3			0x1904
> +#define CLK_CON_DIV_PLL_SHARED0_DIV4			0x1908
> +#define CLK_CON_DIV_PLL_SHARED0_DIV5			0x190c
> +#define CLK_CON_DIV_PLL_SHARED1_DIV2			0x1910
> +#define CLK_CON_DIV_PLL_SHARED1_DIV3			0x1914
> +#define CLK_CON_DIV_PLL_SHARED1_DIV4			0x1918
> +#define CLK_CON_DIV_PLL_SHARED2_DIV2			0x191c
> +#define CLK_CON_DIV_PLL_SHARED3_DIV2			0x1920
> +
> +/* CLK_CON_GAT_UPDATES */
> +#define CLK_CON_GAT_CLKCMU_BUS0_BOOST			0x2000
> +#define CLK_CON_GAT_CLKCMU_BUS1_BOOST			0x2004
> +#define CLK_CON_GAT_CLKCMU_BUS2_BOOST			0x2008
> +#define CLK_CON_GAT_CLKCMU_CORE_BOOST			0x200c
> +#define CLK_CON_GAT_CLKCMU_CPUCL0_BOOST			0x2010
> +#define CLK_CON_GAT_CLKCMU_CPUCL1_BOOST			0x2014
> +#define CLK_CON_GAT_CLKCMU_CPUCL2_BOOST			0x2018
> +#define CLK_CON_GAT_CLKCMU_MIF_BOOST			0x201c
> +#define CLK_CON_GAT_CLKCMU_MIF_SWITCH			0x2020
> +#define CLK_CON_GAT_GATE_CLKCMU_BO_BUS			0x2024
> +#define CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS		0x2028
> +#define CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS		0x202c
> +#define CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS		0x2030
> +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0		0x2034
> +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1		0x2038
> +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2		0x203c
> +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3		0x2040
> +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4		0x2044
> +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5		0x2048
> +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK6		0x204c
> +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK7		0x2050
> +#define CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST		0x2054
> +#define CLK_CON_GAT_GATE_CLKCMU_CORE_BUS		0x2058
> +#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS		0x205c
> +#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH		0x2060
> +#define CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH		0x2064
> +#define CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH		0x2068
> +#define CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS		0x206c
> +#define CLK_CON_GAT_GATE_CLKCMU_DISP_BUS		0x2070
> +#define CLK_CON_GAT_GATE_CLKCMU_DNS_BUS			0x2074
> +#define CLK_CON_GAT_GATE_CLKCMU_DPU_BUS			0x2078
> +#define CLK_CON_GAT_GATE_CLKCMU_EH_BUS			0x207c
> +#define CLK_CON_GAT_GATE_CLKCMU_G2D_G2D			0x2080
> +#define CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL		0x2084
> +#define CLK_CON_GAT_GATE_CLKCMU_G3AA_G3AA		0x2088
> +#define CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD		0x208c
> +#define CLK_CON_GAT_GATE_CLKCMU_G3D_GLB			0x2090
> +#define CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH		0x2094
> +#define CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0		0x2098
> +#define CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1		0x209c
> +#define CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC		0x20a0
> +#define CLK_CON_GAT_GATE_CLKCMU_HPM			0x20a4
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS		0x20a8
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC		0x20ac
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD		0x20b0
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG		0x20b4
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS		0x20b8
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE		0x20bc
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS		0x20c0
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD		0x20c4
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE		0x20c8
> +#define CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD		0x20cc
> +#define CLK_CON_GAT_GATE_CLKCMU_IPP_BUS			0x20d0
> +#define CLK_CON_GAT_GATE_CLKCMU_ITP_BUS			0x20d4
> +#define CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC		0x20d8
> +#define CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC		0x20dc
> +#define CLK_CON_GAT_GATE_CLKCMU_MFC_MFC			0x20e0
> +#define CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP		0x20e4
> +#define CLK_CON_GAT_GATE_CLKCMU_MISC_BUS		0x20e8
> +#define CLK_CON_GAT_GATE_CLKCMU_MISC_SSS		0x20ec
> +#define CLK_CON_GAT_GATE_CLKCMU_PDP_BUS			0x20f0
> +#define CLK_CON_GAT_GATE_CLKCMU_PDP_VRA			0x20f4
> +#define CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS		0x20f8
> +#define CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP		0x20fc
> +#define CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS		0x2100
> +#define CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP		0x2104
> +#define CLK_CON_GAT_GATE_CLKCMU_TNR_BUS			0x2108
> +#define CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF		0x210c
> +#define CLK_CON_GAT_GATE_CLKCMU_TPU_BUS			0x2110
> +#define CLK_CON_GAT_GATE_CLKCMU_TPU_TPU			0x2114
> +#define CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL		0x2118
> +#define CLK_CON_GAT_GATE_CLKCMU_TPU_UART		0x211c
> +
> +#define DMYQCH_CON_CMU_TOP_CMUREF_QCH			0x3000
> +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK0		0x3004
> +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK1		0x3008
> +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK2		0x300c
> +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK3		0x3010
> +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK4		0x3014
> +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK5		0x3018
> +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK6		0x301c
> +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK7		0x3020
> +#define DMYQCH_CON_OTP_QCH				0x3024
> +#define QUEUE_CTRL_REG_BLK_CMU_CMU_TOP			0x3c00
> +#define QUEUE_ENTRY0_BLK_CMU_CMU_TOP			0x3c10
> +#define QUEUE_ENTRY1_BLK_CMU_CMU_TOP			0x3c14
> +#define QUEUE_ENTRY2_BLK_CMU_CMU_TOP			0x3c18
> +#define QUEUE_ENTRY3_BLK_CMU_CMU_TOP			0x3c1c
> +#define QUEUE_ENTRY4_BLK_CMU_CMU_TOP			0x3c20
> +#define QUEUE_ENTRY5_BLK_CMU_CMU_TOP			0x3c24
> +#define QUEUE_ENTRY6_BLK_CMU_CMU_TOP			0x3c28
> +#define QUEUE_ENTRY7_BLK_CMU_CMU_TOP			0x3c2c
> +#define MIFMIRROR_QUEUE_CTRL_REG			0x3e00
> +#define MIFMIRROR_QUEUE_ENTRY0				0x3e10
> +#define MIFMIRROR_QUEUE_ENTRY1				0x3e14
> +#define MIFMIRROR_QUEUE_ENTRY2				0x3e18
> +#define MIFMIRROR_QUEUE_ENTRY3				0x3e1c
> +#define MIFMIRROR_QUEUE_ENTRY4				0x3e20
> +#define MIFMIRROR_QUEUE_ENTRY5				0x3e24
> +#define MIFMIRROR_QUEUE_ENTRY6				0x3e28
> +#define MIFMIRROR_QUEUE_ENTRY7				0x3e2c
> +#define MIFMIRROR_QUEUE_BUSY				0x3e30
> +#define GENERALIO_ACD_CHANNEL_0				0x3f00
> +#define GENERALIO_ACD_CHANNEL_1				0x3f04
> +#define GENERALIO_ACD_CHANNEL_2				0x3f08
> +#define GENERALIO_ACD_CHANNEL_3				0x3f0c
> +#define GENERALIO_ACD_MASK				0x3f14
> +
> +static const unsigned long cmu_top_clk_regs[] __initconst = {
> +	PLL_LOCKTIME_PLL_SHARED0,
> +	PLL_LOCKTIME_PLL_SHARED1,
> +	PLL_LOCKTIME_PLL_SHARED2,
> +	PLL_LOCKTIME_PLL_SHARED3,
> +	PLL_LOCKTIME_PLL_SPARE,
> +	PLL_CON0_PLL_SHARED0,
> +	PLL_CON1_PLL_SHARED0,
> +	PLL_CON2_PLL_SHARED0,
> +	PLL_CON3_PLL_SHARED0,
> +	PLL_CON4_PLL_SHARED0,
> +	PLL_CON0_PLL_SHARED1,
> +	PLL_CON1_PLL_SHARED1,
> +	PLL_CON2_PLL_SHARED1,
> +	PLL_CON3_PLL_SHARED1,
> +	PLL_CON4_PLL_SHARED1,
> +	PLL_CON0_PLL_SHARED2,
> +	PLL_CON1_PLL_SHARED2,
> +	PLL_CON2_PLL_SHARED2,
> +	PLL_CON3_PLL_SHARED2,
> +	PLL_CON4_PLL_SHARED2,
> +	PLL_CON0_PLL_SHARED3,
> +	PLL_CON1_PLL_SHARED3,
> +	PLL_CON2_PLL_SHARED3,
> +	PLL_CON3_PLL_SHARED3,
> +	PLL_CON4_PLL_SHARED3,
> +	PLL_CON0_PLL_SPARE,
> +	PLL_CON1_PLL_SPARE,
> +	PLL_CON2_PLL_SPARE,
> +	PLL_CON3_PLL_SPARE,
> +	PLL_CON4_PLL_SPARE,
> +	CMU_CMU_TOP_CONTROLLER_OPTION,
> +	CLKOUT_CON_BLK_CMU_CMU_TOP_CLKOUT0,
> +	CMU_HCHGEN_CLKMUX_CMU_BOOST,
> +	CMU_HCHGEN_CLKMUX_TOP_BOOST,
> +	CMU_HCHGEN_CLKMUX,
> +	POWER_FAIL_DETECT_PLL,
> +	EARLY_WAKEUP_FORCED_0_ENABLE,
> +	EARLY_WAKEUP_FORCED_1_ENABLE,
> +	EARLY_WAKEUP_APM_CTRL,
> +	EARLY_WAKEUP_CLUSTER0_CTRL,
> +	EARLY_WAKEUP_DPU_CTRL,
> +	EARLY_WAKEUP_CSIS_CTRL,
> +	EARLY_WAKEUP_APM_DEST,
> +	EARLY_WAKEUP_CLUSTER0_DEST,
> +	EARLY_WAKEUP_DPU_DEST,
> +	EARLY_WAKEUP_CSIS_DEST,
> +	EARLY_WAKEUP_SW_TRIG_APM,
> +	EARLY_WAKEUP_SW_TRIG_APM_SET,
> +	EARLY_WAKEUP_SW_TRIG_APM_CLEAR,
> +	EARLY_WAKEUP_SW_TRIG_CLUSTER0,
> +	EARLY_WAKEUP_SW_TRIG_CLUSTER0_SET,
> +	EARLY_WAKEUP_SW_TRIG_CLUSTER0_CLEAR,
> +	EARLY_WAKEUP_SW_TRIG_DPU,
> +	EARLY_WAKEUP_SW_TRIG_DPU_SET,
> +	EARLY_WAKEUP_SW_TRIG_DPU_CLEAR,
> +	EARLY_WAKEUP_SW_TRIG_CSIS,
> +	EARLY_WAKEUP_SW_TRIG_CSIS_SET,
> +	EARLY_WAKEUP_SW_TRIG_CSIS_CLEAR,
> +	CLK_CON_MUX_MUX_CLKCMU_BO_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0,
> +	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1,
> +	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2,
> +	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3,
> +	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK4,
> +	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK5,
> +	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK6,
> +	CLK_CON_MUX_MUX_CLKCMU_CIS_CLK7,
> +	CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST,
> +	CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST_OPTION1,
> +	CLK_CON_MUX_MUX_CLKCMU_CORE_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG,
> +	CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
> +	CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
> +	CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH,
> +	CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_DISP_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_DNS_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_DPU_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_EH_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_G2D_G2D,
> +	CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL,
> +	CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA,
> +	CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD,
> +	CLK_CON_MUX_MUX_CLKCMU_G3D_GLB,
> +	CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH,
> +	CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0,
> +	CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1,
> +	CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC,
> +	CLK_CON_MUX_MUX_CLKCMU_HPM,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE,
> +	CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD,
> +	CLK_CON_MUX_MUX_CLKCMU_IPP_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_ITP_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC,
> +	CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC,
> +	CLK_CON_MUX_MUX_CLKCMU_MFC_MFC,
> +	CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP,
> +	CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH,
> +	CLK_CON_MUX_MUX_CLKCMU_MISC_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_MISC_SSS,
> +	CLK_CON_MUX_MUX_CLKCMU_PDP_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_PDP_VRA,
> +	CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP,
> +	CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP,
> +	CLK_CON_MUX_MUX_CLKCMU_TNR_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_TOP_BOOST_OPTION1,
> +	CLK_CON_MUX_MUX_CLKCMU_TOP_CMUREF,
> +	CLK_CON_MUX_MUX_CLKCMU_TPU_BUS,
> +	CLK_CON_MUX_MUX_CLKCMU_TPU_TPU,
> +	CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL,
> +	CLK_CON_MUX_MUX_CLKCMU_TPU_UART,
> +	CLK_CON_MUX_MUX_CMU_CMUREF,
> +	CLK_CON_DIV_CLKCMU_BO_BUS,
> +	CLK_CON_DIV_CLKCMU_BUS0_BUS,
> +	CLK_CON_DIV_CLKCMU_BUS1_BUS,
> +	CLK_CON_DIV_CLKCMU_BUS2_BUS,
> +	CLK_CON_DIV_CLKCMU_CIS_CLK0,
> +	CLK_CON_DIV_CLKCMU_CIS_CLK1,
> +	CLK_CON_DIV_CLKCMU_CIS_CLK2,
> +	CLK_CON_DIV_CLKCMU_CIS_CLK3,
> +	CLK_CON_DIV_CLKCMU_CIS_CLK4,
> +	CLK_CON_DIV_CLKCMU_CIS_CLK5,
> +	CLK_CON_DIV_CLKCMU_CIS_CLK6,
> +	CLK_CON_DIV_CLKCMU_CIS_CLK7,
> +	CLK_CON_DIV_CLKCMU_CORE_BUS,
> +	CLK_CON_DIV_CLKCMU_CPUCL0_DBG,
> +	CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
> +	CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
> +	CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH,
> +	CLK_CON_DIV_CLKCMU_CSIS_BUS,
> +	CLK_CON_DIV_CLKCMU_DISP_BUS,
> +	CLK_CON_DIV_CLKCMU_DNS_BUS,
> +	CLK_CON_DIV_CLKCMU_DPU_BUS,
> +	CLK_CON_DIV_CLKCMU_EH_BUS,
> +	CLK_CON_DIV_CLKCMU_G2D_G2D,
> +	CLK_CON_DIV_CLKCMU_G2D_MSCL,
> +	CLK_CON_DIV_CLKCMU_G3AA_G3AA,
> +	CLK_CON_DIV_CLKCMU_G3D_BUSD,
> +	CLK_CON_DIV_CLKCMU_G3D_GLB,
> +	CLK_CON_DIV_CLKCMU_G3D_SWITCH,
> +	CLK_CON_DIV_CLKCMU_GDC_GDC0,
> +	CLK_CON_DIV_CLKCMU_GDC_GDC1,
> +	CLK_CON_DIV_CLKCMU_GDC_SCSC,
> +	CLK_CON_DIV_CLKCMU_HPM,
> +	CLK_CON_DIV_CLKCMU_HSI0_BUS,
> +	CLK_CON_DIV_CLKCMU_HSI0_DPGTC,
> +	CLK_CON_DIV_CLKCMU_HSI0_USB31DRD,
> +	CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG,
> +	CLK_CON_DIV_CLKCMU_HSI1_BUS,
> +	CLK_CON_DIV_CLKCMU_HSI1_PCIE,
> +	CLK_CON_DIV_CLKCMU_HSI2_BUS,
> +	CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD,
> +	CLK_CON_DIV_CLKCMU_HSI2_PCIE,
> +	CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD,
> +	CLK_CON_DIV_CLKCMU_IPP_BUS,
> +	CLK_CON_DIV_CLKCMU_ITP_BUS,
> +	CLK_CON_DIV_CLKCMU_MCSC_ITSC,
> +	CLK_CON_DIV_CLKCMU_MCSC_MCSC,
> +	CLK_CON_DIV_CLKCMU_MFC_MFC,
> +	CLK_CON_DIV_CLKCMU_MIF_BUSP,
> +	CLK_CON_DIV_CLKCMU_MISC_BUS,
> +	CLK_CON_DIV_CLKCMU_MISC_SSS,
> +	CLK_CON_DIV_CLKCMU_OTP,
> +	CLK_CON_DIV_CLKCMU_PDP_BUS,
> +	CLK_CON_DIV_CLKCMU_PDP_VRA,
> +	CLK_CON_DIV_CLKCMU_PERIC0_BUS,
> +	CLK_CON_DIV_CLKCMU_PERIC0_IP,
> +	CLK_CON_DIV_CLKCMU_PERIC1_BUS,
> +	CLK_CON_DIV_CLKCMU_PERIC1_IP,
> +	CLK_CON_DIV_CLKCMU_TNR_BUS,
> +	CLK_CON_DIV_CLKCMU_TPU_BUS,
> +	CLK_CON_DIV_CLKCMU_TPU_TPU,
> +	CLK_CON_DIV_CLKCMU_TPU_TPUCTL,
> +	CLK_CON_DIV_CLKCMU_TPU_UART,
> +	CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST,
> +	CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
> +	CLK_CON_DIV_PLL_SHARED0_DIV2,
> +	CLK_CON_DIV_PLL_SHARED0_DIV3,
> +	CLK_CON_DIV_PLL_SHARED0_DIV4,
> +	CLK_CON_DIV_PLL_SHARED0_DIV5,
> +	CLK_CON_DIV_PLL_SHARED1_DIV2,
> +	CLK_CON_DIV_PLL_SHARED1_DIV3,
> +	CLK_CON_DIV_PLL_SHARED1_DIV4,
> +	CLK_CON_DIV_PLL_SHARED2_DIV2,
> +	CLK_CON_DIV_PLL_SHARED3_DIV2,
> +	CLK_CON_GAT_CLKCMU_BUS0_BOOST,
> +	CLK_CON_GAT_CLKCMU_BUS1_BOOST,
> +	CLK_CON_GAT_CLKCMU_BUS2_BOOST,
> +	CLK_CON_GAT_CLKCMU_CORE_BOOST,
> +	CLK_CON_GAT_CLKCMU_CPUCL0_BOOST,
> +	CLK_CON_GAT_CLKCMU_CPUCL1_BOOST,
> +	CLK_CON_GAT_CLKCMU_CPUCL2_BOOST,
> +	CLK_CON_GAT_CLKCMU_MIF_BOOST,
> +	CLK_CON_GAT_CLKCMU_MIF_SWITCH,
> +	CLK_CON_GAT_GATE_CLKCMU_BO_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0,
> +	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1,
> +	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2,
> +	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3,
> +	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4,
> +	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5,
> +	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK6,
> +	CLK_CON_GAT_GATE_CLKCMU_CIS_CLK7,
> +	CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST,
> +	CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH,
> +	CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH,
> +	CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH,
> +	CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_DISP_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_DNS_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_DPU_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_EH_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_G2D_G2D,
> +	CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL,
> +	CLK_CON_GAT_GATE_CLKCMU_G3AA_G3AA,
> +	CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD,
> +	CLK_CON_GAT_GATE_CLKCMU_G3D_GLB,
> +	CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH,
> +	CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0,
> +	CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1,
> +	CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC,
> +	CLK_CON_GAT_GATE_CLKCMU_HPM,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE,
> +	CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD,
> +	CLK_CON_GAT_GATE_CLKCMU_IPP_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_ITP_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC,
> +	CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC,
> +	CLK_CON_GAT_GATE_CLKCMU_MFC_MFC,
> +	CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP,
> +	CLK_CON_GAT_GATE_CLKCMU_MISC_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_MISC_SSS,
> +	CLK_CON_GAT_GATE_CLKCMU_PDP_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_PDP_VRA,
> +	CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP,
> +	CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP,
> +	CLK_CON_GAT_GATE_CLKCMU_TNR_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF,
> +	CLK_CON_GAT_GATE_CLKCMU_TPU_BUS,
> +	CLK_CON_GAT_GATE_CLKCMU_TPU_TPU,
> +	CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL,
> +	CLK_CON_GAT_GATE_CLKCMU_TPU_UART,
> +	DMYQCH_CON_CMU_TOP_CMUREF_QCH,
> +	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK0,
> +	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK1,
> +	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK2,
> +	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK3,
> +	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK4,
> +	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK5,
> +	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK6,
> +	DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK7,
> +	DMYQCH_CON_OTP_QCH,
> +	QUEUE_CTRL_REG_BLK_CMU_CMU_TOP,
> +	QUEUE_ENTRY0_BLK_CMU_CMU_TOP,
> +	QUEUE_ENTRY1_BLK_CMU_CMU_TOP,
> +	QUEUE_ENTRY2_BLK_CMU_CMU_TOP,
> +	QUEUE_ENTRY3_BLK_CMU_CMU_TOP,
> +	QUEUE_ENTRY4_BLK_CMU_CMU_TOP,
> +	QUEUE_ENTRY5_BLK_CMU_CMU_TOP,
> +	QUEUE_ENTRY6_BLK_CMU_CMU_TOP,
> +	QUEUE_ENTRY7_BLK_CMU_CMU_TOP,
> +	MIFMIRROR_QUEUE_CTRL_REG,
> +	MIFMIRROR_QUEUE_ENTRY0,
> +	MIFMIRROR_QUEUE_ENTRY1,
> +	MIFMIRROR_QUEUE_ENTRY2,
> +	MIFMIRROR_QUEUE_ENTRY3,
> +	MIFMIRROR_QUEUE_ENTRY4,
> +	MIFMIRROR_QUEUE_ENTRY5,
> +	MIFMIRROR_QUEUE_ENTRY6,
> +	MIFMIRROR_QUEUE_ENTRY7,
> +	MIFMIRROR_QUEUE_BUSY,
> +	GENERALIO_ACD_CHANNEL_0,
> +	GENERALIO_ACD_CHANNEL_1,
> +	GENERALIO_ACD_CHANNEL_2,
> +	GENERALIO_ACD_CHANNEL_3,
> +	GENERALIO_ACD_MASK,
> +};
> +
> +static const struct samsung_pll_clock cmu_top_pll_clks[] __initconst = {
> +	/* CMU_TOP_PURECLKCOMP */
> +	PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
> +	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
> +	    NULL),
> +	PLL(pll_0517x, CLK_FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
> +	    PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1,
> +	    NULL),
> +	PLL(pll_0518x, CLK_FOUT_SHARED2_PLL, "fout_shared2_pll", "oscclk",
> +	    PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2,
> +	    NULL),
> +	PLL(pll_0518x, CLK_FOUT_SHARED3_PLL, "fout_shared3_pll", "oscclk",
> +	    PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3,
> +	    NULL),
> +	PLL(pll_0518x, CLK_FOUT_SPARE_PLL, "fout_spare_pll", "oscclk",
> +	    PLL_LOCKTIME_PLL_SPARE, PLL_CON3_PLL_SPARE,
> +	    NULL),
> +};
> +
> +/* List of parent clocks for Muxes in CMU_TOP */
> +PNAME(mout_shared0_pll_p)	= { "oscclk", "fout_shared0_pll" };
> +PNAME(mout_shared1_pll_p)	= { "oscclk", "fout_shared1_pll" };
> +PNAME(mout_shared2_pll_p)	= { "oscclk", "fout_shared2_pll" };
> +PNAME(mout_shared3_pll_p)	= { "oscclk", "fout_shared3_pll" };
> +PNAME(mout_spare_pll_p)		= { "oscclk", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS0 */
> +PNAME(mout_cmu_bus0_bus_p)	= { "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared2_div2", "dout_shared3_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_cmu_boost_p)	= { "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared2_div2", "dout_shared3_div2" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS1 */
> +PNAME(mout_cmu_bus1_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS2 */
> +PNAME(mout_cmu_bus2_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div3", "dout_shared1_div3",
> +				    "dout_shared0_div5", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CORE */
> +PNAME(mout_cmu_core_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div3", "dout_shared1_div3",
> +				    "dout_shared0_div5", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_EH */
> +PNAME(mout_cmu_eh_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div3", "dout_shared1_div3",
> +				    "dout_shared0_div5", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL2 */
> +PNAME(mout_cmu_cpucl2_switch_p)	= { "fout_shared1_pll", "dout_shared0_div2",
> +				    "dout_shared1_div2", "fout_shared2_pll",
> +				    "fout_shared3_pll", "dout_shared0_div3",
> +				    "dout_shared1_div3", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL1 */
> +PNAME(mout_cmu_cpucl1_switch_p)	= { "fout_shared1_pll", "dout_shared0_div2",
> +				    "dout_shared1_div2", "fout_shared2_pll",
> +				    "fout_shared3_pll", "dout_shared0_div3",
> +				    "dout_shared1_div3", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL0 */
> +PNAME(mout_cmu_cpucl0_switch_p)	= { "fout_shared1_pll", "dout_shared0_div2",
> +				    "dout_shared1_div2", "fout_shared2_pll",
> +				    "fout_shared3_pll", "dout_shared0_div3",
> +				    "dout_shared1_div3", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_cpucl0_dbg_p)	= { "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared2_div2", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_hpm_p)		= { "oscclk", "dout_shared1_div3",
> +				    "dout_shared0_div4", "dout_shared2_div2" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_G3D */
> +PNAME(mout_cmu_g3d_switch_p)	= { "fout_shared2_pll", "dout_shared0_div3",
> +				    "fout_shared3_pll", "dout_shared1_div3",
> +				    "dout_shared0_div4", "dout_shared1_div4",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_g3d_busd_p)	= { "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div3", "dout_shared1_div3",
> +				    "dout_shared0_div4", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_g3d_glb_p)	= { "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div3", "dout_shared1_div3",
> +				    "dout_shared0_div4", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_DPU */
> +PNAME(mout_cmu_dpu_p)		= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_DISP */
> +PNAME(mout_cmu_disp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_G2D */
> +PNAME(mout_cmu_g2d_g2d_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_g2d_mscl_p)	= { "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared2_div2", "dout_shared3_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI0 */
> +PNAME(mout_cmu_hsi0_usb31drd_p)	= { "oscclk", "dout_shared2_div2" };
> +
> +PNAME(mout_cmu_hsi0_bus_p)	= { "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared2_div2", "dout_shared3_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_hsi0_dpgtc_p)	= { "oscclk", "dout_shared0_div4",
> +				    "dout_shared2_div2", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_hsi0_usbdpdbg_p)	= { "oscclk", "dout_shared2_div2" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI1 */
> +PNAME(mout_cmu_hsi1_bus_p)	= { "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared2_div2", "dout_shared3_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_hsi1_pcie_p)	= { "oscclk", "dout_shared2_div2" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI2 */
> +PNAME(mout_cmu_hsi2_bus_p)	= { "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared2_div2", "dout_shared3_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_hsi2_pcie0_p)	= { "oscclk", "dout_shared2_div2" };
> +
> +PNAME(mout_cmu_hsi2_ufs_embd_p)	= { "oscclk", "dout_shared0_div4",
> +				    "dout_shared2_div2", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_hsi2_mmc_card_p)	= { "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div4", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CSIS */
> +PNAME(mout_cmu_csis_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_PDP */
> +PNAME(mout_cmu_pdp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_pdp_vra_p)	= { "fout_shared2_pll", "dout_shared0_div3",
> +				    "fout_shared3_pll", "dout_shared1_div3",
> +				    "dout_shared0_div4", "dout_shared1_div4",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_IPP */
> +PNAME(mout_cmu_ipp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_G3AA */
> +PNAME(mout_cmu_g3aa_p)		= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_ITP */
> +PNAME(mout_cmu_itp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_DNS */
> +PNAME(mout_cmu_dns_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_TNR */
> +PNAME(mout_cmu_tnr_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_MCSC */
> +PNAME(mout_cmu_mcsc_itsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_mcsc_mcsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_GDC */
> +PNAME(mout_cmu_gdc_scsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_gdc_gdc0_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +PNAME(mout_cmu_gdc_gdc1_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_MFC */
> +PNAME(mout_cmu_mfc_mfc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for DDRPHY0/1/2/3 */
> +
> +PNAME(mout_cmu_mif_switch_p)	= { "fout_shared0_pll", "fout_shared1_pll",
> +				    "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "dout_shared0_div3",
> +				    "fout_shared3_pll", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_MIF0/1/2/3 */
> +PNAME(mout_cmu_mif_busp_p)	= { "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared0_div5", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_boost_p)		= { "dout_shared0_div4", "dout_shared1_div4",
> +				    "dout_shared2_div2", "dout_shared3_div2" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_MISC */
> +PNAME(mout_cmu_misc_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
> +				    "dout_shared3_div2", "fout_spare_pll" };
> +PNAME(mout_cmu_misc_sss_p)	= { "dout_shared0_div4", "dout_shared2_div2",
> +				    "dout_shared3_div2", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_PERIC0 */
> +PNAME(mout_cmu_peric0_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
> +				    "dout_shared3_div2", "fout_spare_pll" };
> +PNAME(mout_cmu_peric0_ip_p)	= { "dout_shared0_div4", "dout_shared2_div2",
> +				    "dout_shared3_div2", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_PERIC1 */
> +PNAME(mout_cmu_peric1_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
> +				    "dout_shared3_div2", "fout_spare_pll" };
> +PNAME(mout_cmu_peric1_ip_p)	= { "dout_shared0_div4", "dout_shared2_div2",
> +				    "dout_shared3_div2", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_TPU */
> +PNAME(mout_cmu_tpu_tpu_p)	= { "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div3", "dout_shared1_div3",
> +				    "dout_shared0_div4", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_tpu_tpuctl_p)	= { "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div3", "dout_shared1_div3",
> +				    "dout_shared0_div4", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_tpu_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
> +				    "fout_shared2_pll", "fout_shared3_pll",
> +				    "dout_shared0_div3", "dout_shared1_div3",
> +				    "dout_shared0_div4", "fout_spare_pll" };
> +
> +PNAME(mout_cmu_tpu_uart_p)	= { "dout_shared0_div4", "dout_shared2_div2",
> +				    "dout_shared3_div2", "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_BO */
> +PNAME(mout_cmu_bo_bus_p)	= { "fout_shared2_pll", "dout_shared0_div3",
> +				    "fout_shared3_pll", "dout_shared1_div3",
> +				    "dout_shared0_div4", "dout_shared1_div4",
> +				    "fout_spare_pll" };
> +
> +/* List of parent clocks for Muxes in CMU_TOP: for CMU_G2D */
> +PNAME(mout_cmu_g2d_p)		= { "dout_shared0_div3", "fout_shared3_pll",
> +				    "dout_shared1_div3", "dout_shared0_div4",
> +				    "dout_shared1_div4", "dout_shared2_div2",
> +				    "fout_spare_pll" };
> +
> +/* gs101 */
> +static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst = {
> +	/* CMU_TOP_PURECLKCOMP */
> +	MUX(CLK_MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
> +	    PLL_CON0_PLL_SHARED0, 4, 1),
> +	MUX(CLK_MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
> +	    PLL_CON0_PLL_SHARED1, 4, 1),
> +	MUX(CLK_MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_p,
> +	    PLL_CON0_PLL_SHARED2, 4, 1),
> +	MUX(CLK_MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_p,
> +	    PLL_CON0_PLL_SHARED3, 4, 1),
> +	MUX(CLK_MOUT_SPARE_PLL, "mout_spare_pll", mout_spare_pll_p,
> +	    PLL_CON0_PLL_SPARE, 4, 1),
> +
> +	/* BUS0 */
> +	MUX(CLK_MOUT_BUS0_BUS, "mout_cmu_bus0_bus", mout_cmu_bus0_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS, 0, 2),
> +	MUX(CLK_MOUT_CMU_BOOST, "mout_cmu_boost", mout_cmu_cmu_boost_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST, 0, 2),
> +
> +	/* BUS1 */
> +	MUX(CLK_MOUT_BUS1_BUS, "mout_cmu_bus1_bus", mout_cmu_bus1_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS, 0, 2),
> +
> +	/* BUS2 */
> +	MUX(CLK_MOUT_BUS2_BUS, "mout_cmu_bus2_bus", mout_cmu_bus2_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS, 0, 2),
> +
> +	/* CORE */
> +	MUX(CLK_MOUT_CORE_BUS, "mout_cmu_core_bus", mout_cmu_core_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> +
> +	/* EH */
> +	MUX(CLK_MOUT_EH_BUS, "mout_cmu_eh_bus", mout_cmu_eh_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> +
> +	/* CPUCL{0,1,2,} */
> +	MUX(CLK_MOUT_CPUCL2_SWITCH, "mout_cmu_cpucl2_switch", mout_cmu_cpucl2_switch_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH, 0, 2),
> +
> +	MUX(CLK_MOUT_CPUCL1_SWITCH, "mout_cmu_cpucl1_switch", mout_cmu_cpucl1_switch_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH, 0, 2),
> +
> +	MUX(CLK_MOUT_CPUCL0_SWITCH, "mout_cmu_cpucl0_switch", mout_cmu_cpucl0_switch_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH, 0, 2),
> +
> +	MUX(CLK_MOUT_CPUCL0_DBG, "mout_cmu_cpucl0_dbg", mout_cmu_cpucl0_dbg_p,
> +	    CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 2),
> +
> +	MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm", mout_cmu_hpm_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 2),
> +
> +	/* G3D */
> +	MUX(CLK_MOUT_G3D_SWITCH, "mout_cmu_g3d_switch", mout_cmu_g3d_switch_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH, 0, 2),
> +
> +	MUX(CLK_MOUT_G3D_BUSD, "mout_cmu_g3d_busd", mout_cmu_g3d_busd_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD, 0, 2),
> +
> +	MUX(CLK_MOUT_G3D_GLB, "mout_cmu_g3d_glb", mout_cmu_g3d_glb_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_G3D_GLB, 0, 2),
> +	/* DPU */
> +	MUX(CLK_MOUT_DPU_BUS, "mout_cmu_dpu_bus", mout_cmu_dpu_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_DPU_BUS, 0, 2),
> +
> +	/* DISP */
> +	MUX(CLK_MOUT_DISP_BUS, "mout_cmu_disp_bus", mout_cmu_disp_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_DISP_BUS, 0, 2),
> +
> +	/* G2D */
> +	MUX(CLK_MOUT_G2D_G2D, "mout_cmu_g2d_g2d", mout_cmu_g2d_g2d_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_G2D_G2D, 0, 2),
> +
> +	MUX(CLK_MOUT_G2D_MSCL, "mout_cmu_g2d_mscl", mout_cmu_g2d_mscl_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 2),
> +
> +	/* HSI0 */
> +	MUX(CLK_MOUT_HSI0_USB31DRD, "mout_cmu_hsi0_usb31drd", mout_cmu_hsi0_usb31drd_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD, 0, 2),
> +
> +	MUX(CLK_MOUT_HSI0_BUS, "mout_cmu_hsi0_bus", mout_cmu_hsi0_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS, 0, 2),
> +
> +	MUX(CLK_MOUT_HSI0_DPGTC, "mout_cmu_hsi0_dpgtc", mout_cmu_hsi0_dpgtc_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC, 0, 2),
> +
> +	MUX(CLK_MOUT_HSI0_USBDPDGB, "mout_cmu_hsi0_usbdpdbg", mout_cmu_hsi0_usbdpdbg_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG, 0, 2),
> +
> +	/* HSI1 */
> +	MUX(CLK_MOUT_HSI1_BUS, "mout_cmu_hsi1_bus", mout_cmu_hsi1_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS, 0, 2),
> +
> +	MUX(CLK_MOUT_HSI1_PCIE, "mout_cmu_hsi1_pcie", mout_cmu_hsi1_pcie_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE, 0, 2),
> +	/* HSI2 */
> +	MUX(CLK_MOUT_HSI2_BUS, "mout_cmu_hsi2_bus", mout_cmu_hsi2_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 2),
> +
> +	MUX(CLK_MOUT_HSI2_PCIE, "mout_cmu_hsi2_pcie", mout_cmu_hsi2_pcie0_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE, 0, 2),
> +
> +	MUX(CLK_MOUT_HSI2_UFS_EMBD, "mout_cmu_hsi2_ufs_embd", mout_cmu_hsi2_ufs_embd_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD, 0, 2),
> +
> +	MUX(CLK_MOUT_HSI2_MMC_CARD, "mout_cmu_hsi2_mmc_card", mout_cmu_hsi2_mmc_card_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD, 0, 2),
> +
> +	/* CSIS */
> +	MUX(CLK_MOUT_CSIS, "mout_cmu_csis_bus", mout_cmu_csis_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS, 0, 2),
> +
> +	/* PDP */
> +	MUX(CLK_MOUT_PDP_BUS, "mout_cmu_pdp_bus", mout_cmu_pdp_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_PDP_BUS, 0, 2),
> +
> +	/* IPP */
> +	MUX(CLK_MOUT_IPP_BUS, "mout_cmu_ipp_bus", mout_cmu_ipp_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_IPP_BUS, 0, 2),
> +
> +	/* G3AA */
> +	MUX(CLK_MOUT_G3AA, "mout_cmu_g3aa", mout_cmu_g3aa_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 0, 2),
> +
> +	/* ITP */
> +	MUX(CLK_MOUT_ITP, "mout_cmu_itp_bus", mout_cmu_itp_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_ITP_BUS, 0, 2),
> +
> +	/* DNS */
> +	MUX(CLK_MOUT_DNS_BUS, "mout_cmu_dns_bus", mout_cmu_dns_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_DNS_BUS, 0, 2),
> +
> +	/* TNR */
> +	MUX(CLK_MOUT_TNR_BUS, "mout_cmu_tnr_bus", mout_cmu_tnr_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 2),
> +
> +	/* MCSC*/
> +	MUX(CLK_MOUT_MCSC_ITSC, "mout_cmu_mcsc_itsc", mout_cmu_mcsc_itsc_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC, 0, 2),
> +
> +	MUX(CLK_MOUT_MCSC_MCSC, "mout_cmu_mcsc_mcsc", mout_cmu_mcsc_mcsc_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC, 0, 2),
> +
> +	/* GDC */
> +	MUX(CLK_MOUT_GDC_SCSC, "mout_cmu_gdc_scsc", mout_cmu_gdc_scsc_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC, 0, 2),
> +
> +	MUX(CLK_MOUT_GDC_GDC0, "mout_cmu_gdc_gdc0", mout_cmu_gdc_gdc0_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0, 0, 2),
> +
> +	MUX(CLK_MOUT_GDC_GDC1, "mout_cmu_gdc_gdc1", mout_cmu_gdc_gdc1_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1, 0, 2),
> +
> +	/* MFC */
> +	MUX(CLK_MOUT_MFC_MFC, "mout_cmu_mfc_mfc", mout_cmu_mfc_mfc_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 2),
> +
> +	/* DDRPHY0/1/2/3 */
> +	MUX(CLK_MOUT_MIF_SWITCH, "mout_cmu_mif_switch", mout_cmu_mif_switch_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 2),
> +
> +	/* MIF0/1/2/3 */
> +	MUX(CLK_MOUT_MIF_BUS, "mout_cmu_mif_busp", mout_cmu_mif_busp_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP, 0, 2),
> +
> +	/* MISC */
> +	MUX(CLK_MOUT_MISC_BUS, "mout_cmu_misc_bus", mout_cmu_misc_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_MISC_BUS, 0, 2),
> +	MUX(CLK_MOUT_MISC_SSS, "mout_cmu_misc_sss", mout_cmu_misc_sss_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_MISC_SSS, 0, 2),
> +
> +	/* PERI0 */
> +	MUX(CLK_MOUT_PERIC0_IP, "mout_cmu_peric0_ip", mout_cmu_peric0_ip_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
> +	MUX(CLK_MOUT_PERIC0_BUS, "mout_cmu_peric0_bus", mout_cmu_peric0_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
> +	/* PERI1 */
> +	MUX(CLK_MOUT_PERIC1_IP, "mout_cmu_peric1_ip", mout_cmu_peric1_ip_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
> +	MUX(CLK_MOUT_PERIC1_BUS, "mout_cmu_peric1_bus", mout_cmu_peric1_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
> +
> +	/* TPU */
> +	MUX(CLK_MOUT_TPU_TPU, "mout_cmu_tpu_tpu", mout_cmu_tpu_tpu_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_TPU_TPU, 0, 2),
> +
> +	MUX(CLK_MOUT_TPU_TPUCTL, "mout_cmu_tpu_tpuctl", mout_cmu_tpu_tpuctl_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL, 0, 2),
> +
> +	MUX(CLK_MOUT_TPU_BUS, "mout_cmu_tpu_bus", mout_cmu_tpu_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_TPU_BUS, 0, 2),
> +
> +	MUX(CLK_MOUT_TPU_UART, "mout_cmu_tpu_uart", mout_cmu_tpu_uart_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_TPU_UART, 0, 2),
> +
> +	/* BO */
> +	MUX(CLK_MOUT_BO_BUS, "mout_cmu_bo_bus", mout_cmu_bo_bus_p,
> +	    CLK_CON_MUX_MUX_CLKCMU_BO_BUS, 0, 2),
> +};
> +
> +static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
> +	/* CMU_TOP_PURECLKCOMP */
> +	DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_pll",
> +	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
> +	DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_pll",
> +	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
> +	DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "mout_shared0_pll",
> +	    CLK_CON_DIV_PLL_SHARED0_DIV5, 0, 2),
> +	DIV(CLK_DOUT_SHARED0_DIV4, "dout_shared0_div4", "dout_shared0_div2",
> +	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
> +
> +	DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_pll",
> +	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
> +	DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_pll",
> +	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
> +	DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "mout_shared1_pll",
> +	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
> +
> +	DIV(CLK_DOUT_SHARED2_DIV2, "dout_shared2_div2", "mout_shared2_pll",
> +	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
> +
> +	DIV(CLK_DOUT_SHARED3_DIV2, "dout_shared3_div2", "mout_shared3_pll",
> +	    CLK_CON_DIV_PLL_SHARED3_DIV2, 0, 1),
> +
> +	/* BUS0 */
> +	DIV(CLK_DOUT_BUS0_BUS, "dout_cmu_bus0_bus_div", "gout_cmu_bus0_bus",
> +	    CLK_CON_DIV_CLKCMU_BUS0_BUS, 0, 4),
> +	DIV(CLK_DOUT_CMU_BOOST, "dout_cmu_boost", "gout_cmu_cmu_boost",
> +	    CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
> +
> +	/* BUS1 */
> +	DIV(CLK_DOUT_BUS1_BUS, "dout_cmu_bus1_bus", "gout_cmu_bus1_bus",
> +	    CLK_CON_DIV_CLKCMU_BUS1_BUS, 0, 4),
> +
> +	/* BUS2 */
> +	DIV(CLK_DOUT_BUS2_BUS, "dout_cmu_bus2_bus", "gout_cmu_bus2_bus",
> +	    CLK_CON_DIV_CLKCMU_BUS2_BUS, 0, 4),
> +
> +	/* CORE */
> +	DIV(CLK_DOUT_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
> +	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> +
> +	/* EH */
> +	DIV(CLK_DOUT_EH_BUS, "dout_cmu_eh_bus", "gout_cmu_eh_bus",
> +	    CLK_CON_DIV_CLKCMU_EH_BUS, 0, 4),
> +
> +	/* CPUCL{0,1,2,} */
> +	DIV(CLK_DOUT_CPUCL2_SWITCH, "dout_cmu_cpucl2_switch", "gout_cmu_cpucl2_switch",
> +	    CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH, 0, 3),
> +
> +	DIV(CLK_DOUT_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch", "gout_cmu_cpucl1_switch",
> +	    CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH, 0, 3),
> +
> +	DIV(CLK_DOUT_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch", "gout_cmu_cpucl0_switch",
> +	    CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
> +
> +	DIV(CLK_DOUT_CPUCL0_DBG, "dout_cmu_cpucl0_dbg", "gout_cmu_cpucl0_dbg",
> +	    CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 4),
> +
> +	DIV(CLK_DOUT_CMU_HPM, "dout_cmu_hpm", "gout_cmu_hpm",
> +	    CLK_CON_DIV_CLKCMU_HPM, 0, 2),
> +
> +	/* G3D */
> +	DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_switch", "gout_cmu_g3d_switch",
> +	    CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
> +
> +	DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_busd", "gout_cmu_g3d_busd",
> +	    CLK_CON_DIV_CLKCMU_G3D_BUSD, 0, 4),
> +
> +	DIV(CLK_DOUT_G3D_GLB, "dout_cmu_g3d_glb", "gout_cmu_g3d_glb",
> +	    CLK_CON_DIV_CLKCMU_G3D_GLB, 0, 4),
> +
> +	/* DPU */
> +	DIV(CLK_DOUT_DPU_BUS, "dout_cmu_dpu_bus", "gout_cmu_dpu_bus",
> +	    CLK_CON_DIV_CLKCMU_DPU_BUS, 0, 4),
> +
> +	/* DISP */
> +	DIV(CLK_DOUT_DISP_BUS, "dout_cmu_disp_bus", "gout_cmu_disp_bus",
> +	    CLK_CON_DIV_CLKCMU_DISP_BUS, 0, 4),
> +
> +	/* G2D */
> +	DIV(CLK_DOUT_G2D_G2D, "dout_cmu_g2d_g2d", "gout_cmu_g2d_g2d",
> +	    CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
> +
> +	DIV(CLK_DOUT_G2D_MSCL, "dout_cmu_g2d_mscl", "gout_cmu_g2d_mscl",
> +	    CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
> +
> +	/* HSI0 */
> +	DIV(CLK_DOUT_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd", "gout_cmu_hsi0_usb31drd",
> +	    CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0, 5),
> +
> +	DIV(CLK_DOUT_HSI0_BUS, "dout_cmu_hsi0_bus", "gout_cmu_hsi0_bus",
> +	    CLK_CON_DIV_CLKCMU_HSI0_BUS, 0, 4),
> +
> +	DIV(CLK_DOUT_HSI0_DPGTC, "dout_cmu_hsi0_dpgtc", "gout_cmu_hsi0_dpgtc",
> +	    CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 4),
> +
> +	/* TODO register exists but all lower bits are reserved */
> +	DIV(CLK_DOUT_HSI0_USBDPDGB, "dout_cmu_hsi0_usbdpdbg", "gout_cmu_hsi0_usbdpdbg",
> +	    CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG, 0, 0),
> +
> +	/* HSI1 */
> +	DIV(CLK_DOUT_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
> +	    CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 4),
> +
> +	DIV(CLK_DOUT_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pcie",
> +	    CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 3),
> +	/* HSI2 */
> +	DIV(CLK_DOUT_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
> +	    CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
> +
> +	DIV(CLK_DOUT_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie",
> +	    CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 3),
> +
> +	DIV(CLK_DOUT_HSI2_UFS_EMBD, "dout_cmu_hsi2_ufs_embd", "gout_cmu_hsi2_ufs_embd",
> +	    CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD, 0, 4),
> +
> +	DIV(CLK_DOUT_HSI2_MMC_CARD, "dout_cmu_hsi2_mmc_card", "gout_cmu_hsi2_mmc_card",
> +	    CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD, 0, 9),
> +
> +	/* CSIS */
> +	DIV(CLK_DOUT_CSIS, "dout_cmu_csis_bus", "gout_cmu_csis_bus",
> +	    CLK_CON_DIV_CLKCMU_CSIS_BUS, 0, 4),
> +
> +	/* PDP */
> +	DIV(CLK_DOUT_PDP_BUS, "dout_cmu_pdp_bus", "gout_cmu_pdp_bus",
> +	    CLK_CON_DIV_CLKCMU_PDP_BUS, 0, 4),
> +
> +	/* IPP */
> +	DIV(CLK_DOUT_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
> +	    CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
> +
> +	/* G3AA */
> +	DIV(CLK_DOUT_G3AA, "dout_cmu_g3aa", "gout_cmu_g3aa",
> +	    CLK_CON_DIV_CLKCMU_G3AA_G3AA, 0, 4),
> +
> +	/* ITP */
> +	DIV(CLK_DOUT_ITP, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
> +	    CLK_CON_DIV_CLKCMU_ITP_BUS, 0, 4),
> +
> +	/* DNS */
> +	DIV(CLK_DOUT_DNS_BUS, "dout_cmu_dns_bus", "gout_cmu_dns_bus",
> +	    CLK_CON_DIV_CLKCMU_DNS_BUS, 0, 4),
> +
> +	/* TNR */
> +	DIV(CLK_DOUT_TNR_BUS, "dout_cmu_tnr_bus", "gout_cmu_tnr_bus",
> +	    CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
> +
> +	/* MCSC*/
> +	DIV(CLK_DOUT_MCSC_ITSC, "dout_cmu_mcsc_itsc", "gout_cmu_mcsc_itsc",
> +	    CLK_CON_DIV_CLKCMU_MCSC_ITSC, 0, 4),
> +
> +	DIV(CLK_DOUT_MCSC_MCSC, "dout_cmu_mcsc_mcsc", "gout_cmu_mcsc_mcsc",
> +	    CLK_CON_DIV_CLKCMU_MCSC_MCSC, 0, 4),
> +
> +	/* GDC */
> +	DIV(CLK_DOUT_GDC_SCSC, "dout_cmu_gdc_scsc", "gout_cmu_gdc_scsc",
> +	    CLK_CON_DIV_CLKCMU_GDC_SCSC, 0, 4),
> +
> +	DIV(CLK_DOUT_GDC_GDC0, "dout_cmu_gdc_gdc0", "gout_cmu_gdc_gdc0",
> +	    CLK_CON_DIV_CLKCMU_GDC_GDC0, 0, 4),
> +
> +	DIV(CLK_DOUT_GDC_GDC1, "dout_cmu_gdc_gdc1", "gout_cmu_gdc_gdc1",
> +	    CLK_CON_DIV_CLKCMU_GDC_GDC1, 0, 4),
> +
> +	/* MFC */
> +	DIV(CLK_DOUT_MFC_MFC, "dout_cmu_mfc_mfc", "gout_cmu_mfc_mfc",
> +	    CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
> +
> +	/* MIF0/1/2/3 */
> +	DIV(CLK_DOUT_MIF_BUS, "dout_cmu_mif_busp", "gout_cmu_mif_busp",
> +	    CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
> +
> +	/* MISC */
> +	DIV(CLK_DOUT_MISC_BUS, "dout_cmu_misc_bus", "gout_cmu_misc_bus",
> +	    CLK_CON_DIV_CLKCMU_MISC_BUS, 0, 4),
> +	DIV(CLK_DOUT_MISC_SSS, "dout_cmu_misc_sss", "gout_cmu_misc_sss",
> +	    CLK_CON_DIV_CLKCMU_MISC_SSS, 0, 4),
> +
> +	/* PERI0 */
> +	DIV(CLK_DOUT_PERIC0_BUS, "dout_cmu_peric0_bus", "gout_cmu_peric0_bus",
> +	    CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
> +	DIV(CLK_DOUT_PERIC0_IP, "dout_cmu_peric0_ip", "gout_cmu_peric0_ip",
> +	    CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
> +
> +	/* PERI1 */
> +	DIV(CLK_DOUT_PERIC1_BUS, "dout_cmu_peric1_bus", "gout_cmu_peric1_bus",
> +	    CLK_CON_DIV_CLKCMU_PERIC1_BUS, 0, 4),
> +	DIV(CLK_DOUT_PERIC1_IP, "dout_cmu_peric1_ip", "gout_cmu_peric1_ip",
> +	    CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
> +
> +	/* TPU */
> +	DIV(CLK_DOUT_TPU_TPU, "dout_cmu_tpu_tpu", "gout_cmu_tpu_tpu",
> +	    CLK_CON_DIV_CLKCMU_TPU_TPU, 0, 4),
> +
> +	DIV(CLK_DOUT_TPU_TPUCTL, "dout_cmu_tpu_tpuctl", "gout_cmu_tpu_tpuctl",
> +	    CLK_CON_DIV_CLKCMU_TPU_TPUCTL, 0, 4),
> +
> +	DIV(CLK_DOUT_TPU_BUS, "dout_cmu_tpu_bus", "gout_cmu_tpu_bus",
> +	    CLK_CON_DIV_CLKCMU_TPU_BUS, 0, 4),
> +
> +	DIV(CLK_DOUT_TPU_UART, "dout_cmu_tpu_uart", "gout_cmu_tpu_uart",
> +	    CLK_CON_DIV_CLKCMU_TPU_UART, 0, 4),
> +
> +	/* BO */
> +	DIV(CLK_DOUT_BO_BUS, "dout_cmu_bo_bus", "gout_cmu_bo_bus",
> +	    CLK_CON_DIV_CLKCMU_BO_BUS, 0, 4),
> +
> +};
> +
> +static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
> +	/* CORE */
> +
> +	/* MISC */
> +	GATE(CLK_GOUT_MISC_BUS, "gout_cmu_misc_bus", "mout_cmu_misc_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_MISC_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_MISC_SSS, "gout_cmu_misc_sss", "mout_cmu_misc_sss",
> +	     CLK_CON_GAT_GATE_CLKCMU_MISC_SSS, 21, 0, 0),
> +
> +	/* BUS0 */
> +	GATE(CLK_GOUT_BUS0_BUS, "gout_cmu_bus0_bus", "mout_cmu_bus0_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS, 21, 0, 0),
> +
> +	/* BUS1 */
> +	GATE(CLK_GOUT_BUS1_BUS, "gout_cmu_bus1_bus", "mout_cmu_bus1_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS, 21, 0, 0),
> +
> +	/* BUS2 */
> +	GATE(CLK_GOUT_BUS2_BUS, "gout_cmu_bus2_bus", "mout_cmu_bus2_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS, 21, 0, 0),
> +
> +	/* CORE */
> +	GATE(CLK_GOUT_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_CORE_BUS, 21, 0, 0),
> +
> +	/* EH */
> +	GATE(CLK_GOUT_EH_BUS, "gout_cmu_eh_bus", "mout_cmu_eh_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_EH_BUS, 21, 0, 0),
> +
> +	/* CPUCL{0,1,2,} */
> +	GATE(CLK_GOUT_CPUCL2_SWITCH, "gout_cmu_cpucl2_switch", "mout_cmu_cpucl2_switch",
> +	     CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch", "mout_cmu_cpucl1_switch",
> +	     CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch", "mout_cmu_cpucl0_switch",
> +	     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_CPUCL0_DBG, "gout_cmu_cpucl0_dbg", "mout_cmu_cpucl0_dbg",
> +	     CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_CMU_HPM, "gout_cmu_hpm", "mout_cmu_hpm",
> +	     CLK_CON_GAT_GATE_CLKCMU_HPM, 21, 0, 0),
> +
> +	/* G3D */
> +	GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_switch", "mout_cmu_g3d_switch",
> +	     CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_busd", "mout_cmu_g3d_busd",
> +	     CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_G3D_GLB, "gout_cmu_g3d_glb", "mout_cmu_g3d_glb",
> +	     CLK_CON_GAT_GATE_CLKCMU_G3D_GLB, 21, 0, 0),
> +	/* DPU */
> +	GATE(CLK_GOUT_DPU_BUS, "gout_cmu_dpu_bus", "mout_cmu_dpu_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_DPU_BUS, 21, 0, 0),
> +	/* DISP */
> +	GATE(CLK_GOUT_DISP_BUS, "gout_cmu_disp_bus", "mout_cmu_disp_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_DISP_BUS, 21, 0, 0),
> +
> +	/* G2D */
> +	GATE(CLK_GOUT_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
> +	     CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl",
> +	     CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL, 21, 0, 0),
> +	/* HSI0 */
> +	GATE(CLK_GOUT_HSI0_USB31DRD, "gout_cmu_hsi0_usb31drd", "mout_cmu_hsi0_usb31drd",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_HSI0_BUS, "gout_cmu_hsi0_bus", "mout_cmu_hsi0_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_HSI0_DPGTC, "gout_cmu_hsi0_dpgtc", "mout_cmu_hsi0_dpgtc",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_HSI0_USBDPDGB, "gout_cmu_hsi0_usbdpdbg", "mout_cmu_hsi0_usbdpdbg",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG, 21, 0, 0),
> +	/* HSI1 */
> +	GATE(CLK_GOUT_HSI1_BUS, "gout_cmu_hsi1_bus", "mout_cmu_hsi1_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_HSI1_PCIE, "gout_cmu_hsi1_pcie", "mout_cmu_hsi1_pcie",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE, 21, 0, 0),
> +	/* HSI2 */
> +	GATE(CLK_GOUT_HSI2_BUS, "gout_cmu_hsi2_bus", "mout_cmu_hsi2_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_HSI2_PCIE, "gout_cmu_hsi2_pcie", "mout_cmu_hsi2_pcie",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_HSI2_UFS_EMBD, "gout_cmu_hsi2_ufs_embd", "mout_cmu_hsi2_ufs_embd",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD, 21, 0, 0),
> +	GATE(CLK_GOUT_HSI2_MMC_CARD, "gout_cmu_hsi2_mmc_card", "mout_cmu_hsi2_mmc_card",
> +	     CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD, 21, 0, 0),
> +	/* CSIS */
> +	GATE(CLK_GOUT_CSIS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
> +	/* PDP */
> +	GATE(CLK_GOUT_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> +
> +	/* IPP */
> +	GATE(CLK_GOUT_IPP_BUS, "gout_cmu_ipp_bus", "mout_cmu_ipp_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_IPP_BUS, 21, 0, 0),
> +	/* G3AA */
> +	GATE(CLK_GOUT_G3AA, "gout_cmu_g3aa", "mout_cmu_g3aa",
> +	     CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 21, 0, 0),
> +
> +	/* ITP */
> +	GATE(CLK_GOUT_ITP, "gout_cmu_itp_bus", "mout_cmu_itp_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_ITP_BUS, 21, 0, 0),
> +
> +	/* DNS */
> +	GATE(CLK_GOUT_DNS_BUS, "gout_cmu_dns_bus", "mout_cmu_dns_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_DNS_BUS, 21, 0, 0),
> +
> +	/* TNR */
> +	GATE(CLK_GOUT_TNR_BUS, "gout_cmu_tnr_bus", "mout_cmu_tnr_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_TNR_BUS, 21, 0, 0),
> +
> +	/* MCSC*/
> +	GATE(CLK_GOUT_MCSC_ITSC, "gout_cmu_mcsc_itsc", "mout_cmu_mcsc_itsc",
> +	     CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_MCSC_MCSC, "gout_cmu_mcsc_mcsc", "mout_cmu_mcsc_mcsc",
> +	     CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC, 21, 0, 0),
> +
> +	/* GDC */
> +	GATE(CLK_GOUT_GDC_SCSC, "gout_cmu_gdc_scsc", "mout_cmu_gdc_scsc",
> +	     CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_GDC_GDC0, "gout_cmu_gdc_gdc0", "mout_cmu_gdc_gdc0",
> +	     CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_GDC_GDC1, "gout_cmu_gdc_gdc1", "mout_cmu_gdc_gdc1",
> +	     CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1, 21, 0, 0),
> +
> +	/* MFC */
> +	GATE(CLK_GOUT_MFC_MFC, "gout_cmu_mfc_mfc", "mout_cmu_mfc_mfc",
> +	     CLK_CON_GAT_GATE_CLKCMU_MFC_MFC, 21, 0, 0),
> +
> +	/* DDRPHY0/1/2/3 */
> +	GATE(CLK_GOUT_MIF_SWITCH, "gout_cmu_mif_switch", "mout_cmu_mif_switch",
> +	     CLK_CON_GAT_CLKCMU_MIF_SWITCH, 21, 0, 0),
> +
> +	/* MIF0/1/2/3 */
> +	GATE(CLK_GOUT_MIF_BUS, "gout_cmu_mif_busp", "mout_cmu_mif_busp",
> +	     CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP, 21, 0, 0),
> +
> +	GATE(CLK_GOUT_CMU_BOOST, "gout_cmu_cmu_boost", "mout_cmu_boost",
> +	     CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST, 21, 0, 0),
> +
> +	/* MISC */
> +	GATE(CLK_GOUT_MISC_BUS, "gout_cmu_misc_bus", "mout_cmu_misc_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_MISC_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_MISC_SSS, "gout_cmu_misc_sss", "mout_cmu_misc_sss",
> +	     CLK_CON_GAT_GATE_CLKCMU_MISC_SSS, 21, 0, 0),
> +
> +	/* PERI0 */
> +	GATE(CLK_GOUT_PERIC0_BUS, "gout_cmu_peric0_bus", "mout_cmu_peric0_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0_ip",
> +	     CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
> +
> +	/* PERI1 */
> +	GATE(CLK_GOUT_PERIC1_BUS, "gout_cmu_peric1_bus", "mout_cmu_peric1_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_PERIC1_IP, "gout_cmu_peric1_ip", "mout_cmu_peric1_ip",
> +	     CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP, 21, 0, 0),
> +
> +	/* TPU */
> +	GATE(CLK_GOUT_TPU_TPU, "gout_cmu_tpu_tpu", "mout_cmu_tpu_tpu",
> +	     CLK_CON_GAT_GATE_CLKCMU_TPU_TPU, 21, 0, 0),
> +	GATE(CLK_GOUT_TPU_TPUCTL, "gout_cmu_tpu_tpuctl", "mout_cmu_tpu_tpuctl",
> +	     CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL, 21, 0, 0),
> +	GATE(CLK_GOUT_TPU_BUS, "gout_cmu_tpu_bus", "mout_cmu_tpu_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_TPU_BUS, 21, 0, 0),
> +	GATE(CLK_GOUT_TPU_UART, "gout_cmu_tpu_uart", "mout_cmu_tpu_uart",
> +	     CLK_CON_GAT_GATE_CLKCMU_TPU_UART, 21, 0, 0),
> +
> +	/* BO */
> +	GATE(CLK_GOUT_BO_BUS, "gout_cmu_bo_bus", "mout_cmu_bo_bus",
> +	     CLK_CON_GAT_GATE_CLKCMU_BO_BUS, 21, 0, 0),
> +
> +};
> +
> +static const struct samsung_cmu_info top_cmu_info __initconst = {
> +	.pll_clks		= cmu_top_pll_clks,
> +	.nr_pll_clks		= ARRAY_SIZE(cmu_top_pll_clks),
> +	.mux_clks		= cmu_top_mux_clks,
> +	.nr_mux_clks		= ARRAY_SIZE(cmu_top_mux_clks),
> +	.div_clks		= cmu_top_div_clks,
> +	.nr_div_clks		= ARRAY_SIZE(cmu_top_div_clks),
> +	.gate_clks		= cmu_top_gate_clks,
> +	.nr_gate_clks		= ARRAY_SIZE(cmu_top_gate_clks),
> +	.nr_clk_ids		= TOP_NR_CLK,
> +	.clk_regs		= cmu_top_clk_regs,
> +	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
> +};
> +
> +static void __init gs101_cmu_top_init(struct device_node *np)
> +{
> +	exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
> +}
> +
> +/* Register CMU_TOP early, as it's a dependency for other early domains */
> +CLK_OF_DECLARE(gs101_cmu_top, "google,gs101-cmu-top",
> +	       gs101_cmu_top_init);
> -- 
> 2.42.0.582.g8ccd20d70d-goog
> 
