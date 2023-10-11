Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE2417C5F6C
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 23:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233703AbjJKVvb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 17:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjJKVva (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 17:51:30 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6257BB6
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 14:51:26 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c9d4f08d7cso61105ad.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 14:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061086; x=1697665886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=11hxiH04t+NBoXMJdWHncjyIdj63ljtPExG26hNN36k=;
        b=P3gVeUZmEQ1Gp6yAxPk9o6DzaGADgJ3Y/z501RRN+dboNzd3fpN6oks0b6tS9Y3xNA
         BoobLeesC6sdtPjiiAAPVizs7SluENeF8qnxCXTKnoyOPoUzsfgL4CFYLoEmNeNRcxpK
         7iz9V0PbPEXVpDIGTESTKjZSyxVomhz9qt9G/rRnQ2MFsVeA8u2bzhPXqzGRJ7hhKHin
         yFtUnZd6iyMAm9+isZCCHkVNj7r82aRs7paMLb4e/Wphr6kZhC2dDFfBt0ayyvpF6fO3
         7KUFGkezoWYg93qteY5/Kd/xN5/nNtqwGmylywqCc8zB3bmZI++3RdiXIesZET8Gn9VE
         Oy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061086; x=1697665886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11hxiH04t+NBoXMJdWHncjyIdj63ljtPExG26hNN36k=;
        b=ne31Ic2NYnq9aAjP+gl7BKSbcdB1Q6uYMh6IbHtvIGKv6M17AXy8pRolrGJ3z9ynkh
         kefEzm33IdBCr3aIeElC/DwB4J85Xa87KHCGI1ZEajiSB8a1UYIL6xb6L/tOOsy+jnq9
         EJhJOesSVKFY89+ac9arIWisnbxzYt3DXhktox9+KlUj3Vk4QzdPM+TT0LQIdoxjTbnv
         jUh4qFuQk2pe4Hxhh3JusPcFFKcokJ6a9tHyKJOe0UHsoTrNZIvykoDT2vR/JmC7doYz
         DO6pDVzX6oVmXMGqjelabvUHpsASS80+WIb1FEQtmEBHkZvcTG0IkkLAj23o36K7fVkw
         NvGQ==
X-Gm-Message-State: AOJu0Yzd7wZUAvQRH6Zg0qDM0M27dGhRb5xQbqA8OClsmX1HzcEaTEK5
        /kheN4VRnHg6rm+OOAWQMIrK6g==
X-Google-Smtp-Source: AGHT+IGD93YC8hnIK1NhdF9XQTGCrNxtR6Tsfk+TGHuq1lPkDxpGxICfSMqvz/Ywye5aSEAfuu3wZA==
X-Received: by 2002:a17:902:f94b:b0:1c3:5df4:a778 with SMTP id kx11-20020a170902f94b00b001c35df4a778mr297865plb.13.1697061085603;
        Wed, 11 Oct 2023 14:51:25 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902b94300b001c5fc11c085sm310608pls.264.2023.10.11.14.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:51:24 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:51:21 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 12/20] clk: samsung: clk-gs101: Add support for
 CMU_MISC clock unit
Message-ID: <ZScY2TGtd_-yheMW@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-13-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-13-peter.griffin@linaro.org>
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

On 10/11/2023, Peter Griffin wrote:
> CMU Misc clocks IPs such as Watchdog. Add support for the
> muxes, dividers and gates in this CMU.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clk/samsung/clk-gs101.c | 312 ++++++++++++++++++++++++++++++++
>  1 file changed, 312 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> index 525f95e60665..bf2bd8cd39d0 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -20,6 +20,7 @@
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define TOP_NR_CLK                     (CLK_GOUT_CMU_BOOST + 1)
>  #define APM_NR_CLK                     (CLK_APM_PLL_DIV16_APM + 1)
> +#define MISC_NR_CLK                    (CLK_GOUT_MISC_WDT_CLUSTER1 + 1)
>  
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>  
> @@ -1815,6 +1816,314 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
>  	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
>  };
>  
> +/* ---- CMU_MISC ------------------------------------------------------------- */
> +/* Register Offset definitions for CMU_MISC (0x10010000) */
> +#define PLL_CON0_MUX_CLKCMU_MISC_BUS_USER	0x0600
> +#define PLL_CON1_MUX_CLKCMU_MISC_BUS_USER	0x0604
> +#define PLL_CON0_MUX_CLKCMU_MISC_SSS_USER	0x0610
> +#define PLL_CON1_MUX_CLKCMU_MISC_SSS_USER	0x0614
> +#define MISC_CMU_MISC_CONTROLLER_OPTION		0x0800
> +#define CLKOUT_CON_BLK_MISC_CMU_MISC_CLKOUT0	0x0810
> +#define CLK_CON_MUX_MUX_CLK_MISC_GIC		0x1000
> +#define CLK_CON_DIV_DIV_CLK_MISC_BUSP		0x1800
> +#define CLK_CON_DIV_DIV_CLK_MISC_GIC		0x1804
> +#define CLK_CON_GAT_CLK_BLK_MISC_UID_MISC_CMU_MISC_IPCLKPORT_PCLK		0x2000
> +#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK		0x2004
> +#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_I_OSCCLK		0x2008
> +#define CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK		0x200c
> +#define CLK_CON_GAT_CLK_BLK_MISC_UID_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPORT_CLK	0x2010
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_ADM_AHB_SSS_IPCLKPORT_HCLKM		0x2014
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_DIT_IPCLKPORT_PCLKM		0x2018
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_PUF_IPCLKPORT_PCLKM		0x201c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_DIT_IPCLKPORT_ICLKL2A			0x2020
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_D_TZPC_MISC_IPCLKPORT_PCLK		0x2024
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_GIC_IPCLKPORT_GICCLK			0x2028
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_GPC_MISC_IPCLKPORT_PCLK			0x202c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AST_ICC_CPUGIC_IPCLKPORT_I_CLK	0x2030
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_D_SSS_IPCLKPORT_I_CLK		0x2034
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_GIC_IPCLKPORT_I_CLK		0x2038
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_MISC_IPCLKPORT_I_CLK		0x203c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_ACEL_D_MISC_IPCLKPORT_I_CLK		0x2040
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AST_IRI_GICCPU_IPCLKPORT_I_CLK	0x2044
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AXI_D_SSS_IPCLKPORT_I_CLK		0x2048
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_MCT_IPCLKPORT_PCLK			0x204c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_PCLK		0x2050
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_PCLK		0x2054
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_PCLK		0x2058
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PDMA_IPCLKPORT_ACLK			0x205c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_DMA_IPCLKPORT_ACLK			0x2060
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_ACLK			0x2064
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_PCLK			0x2068
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_PUF_IPCLKPORT_I_CLK			0x206c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_ACLK			0x2070
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_PCLK			0x2074
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_ACLK			0x2078
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_PCLK			0x207c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_ACLK		0x2080
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_PCLK		0x2084
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_ACLK			0x2088
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_PCLK			0x208c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_ACLK			0x2090
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_PCLK			0x2094
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_ACLK			0x2098
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_PCLK			0x209c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSD_IPCLKPORT_CLK	0x20a0
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSP_IPCLKPORT_CLK	0x20a4
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_GIC_IPCLKPORT_CLK	0x20a8
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_SSS_IPCLKPORT_CLK	0x20ac
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_ACLK			0x20b0
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_PCLK			0x20b4
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SPDMA_IPCLKPORT_ACLK			0x20b8
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_ACLK			0x20bc
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_PCLK			0x20c0
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_ACLK			0x20c4
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_PCLK			0x20c8
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_ACLK		0x20cc
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_PCLK		0x20d0
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_ACLK			0x20d4
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_PCLK			0x20d8
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_ACLK			0x20dc
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_PCLK			0x20e0
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_ACLK			0x20e4
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_PCLK			0x20e8
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_ACLK			0x20ec
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_PCLK			0x20f0
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_MISC_IPCLKPORT_CLK_S2		0x20f4
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_SSS_IPCLKPORT_CLK_S1		0x20f8
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSREG_MISC_IPCLKPORT_PCLK		0x20fc
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_SUB_IPCLKPORT_PCLK			0x2100
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_TOP_IPCLKPORT_PCLK			0x2104
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER0_IPCLKPORT_PCLK		0x2108
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER1_IPCLKPORT_PCLK		0x210c
> +#define CLK_CON_GAT_GOUT_BLK_MISC_UID_XIU_D_MISC_IPCLKPORT_ACLK			0x2110
> +#define DMYQCH_CON_PPMU_DMA_QCH			0x3000
> +#define DMYQCH_CON_PUF_QCH			0x3004
> +#define PCH_CON_LHM_AXI_D_SSS_PCH		0x300c
> +#define PCH_CON_LHM_AXI_P_GIC_PCH		0x3010
> +#define PCH_CON_LHM_AXI_P_MISC_PCH		0x3014
> +#define PCH_CON_LHS_ACEL_D_MISC_PCH		0x3018
> +#define PCH_CON_LHS_AST_IRI_GICCPU_PCH		0x301c
> +#define PCH_CON_LHS_AXI_D_SSS_PCH		0x3020
> +#define QCH_CON_ADM_AHB_SSS_QCH			0x3024
> +#define QCH_CON_DIT_QCH				0x3028
> +#define QCH_CON_GIC_QCH				0x3030
> +#define QCH_CON_LHM_AST_ICC_CPUGIC_QCH		0x3038
> +#define QCH_CON_LHM_AXI_D_SSS_QCH		0x303c
> +#define QCH_CON_LHM_AXI_P_GIC_QCH		0x3040
> +#define QCH_CON_LHM_AXI_P_MISC_QCH		0x3044
> +#define QCH_CON_LHS_ACEL_D_MISC_QCH		0x3048
> +#define QCH_CON_LHS_AST_IRI_GICCPU_QCH		0x304c
> +#define QCH_CON_LHS_AXI_D_SSS_QCH		0x3050
> +#define QCH_CON_MCT_QCH				0x3054
> +#define QCH_CON_MISC_CMU_MISC_QCH		0x3058
> +#define QCH_CON_OTP_CON_BIRA_QCH		0x305c
> +#define QCH_CON_OTP_CON_BISR_QCH		0x3060
> +#define QCH_CON_OTP_CON_TOP_QCH			0x3064
> +#define QCH_CON_PDMA_QCH			0x3068
> +#define QCH_CON_PPMU_MISC_QCH			0x306c
> +#define QCH_CON_QE_DIT_QCH			0x3070
> +#define QCH_CON_QE_PDMA_QCH			0x3074
> +#define QCH_CON_QE_PPMU_DMA_QCH			0x3078
> +#define QCH_CON_QE_RTIC_QCH			0x307c
> +#define QCH_CON_QE_SPDMA_QCH			0x3080
> +#define QCH_CON_QE_SSS_QCH			0x3084
> +#define QCH_CON_RTIC_QCH			0x3088
> +#define QCH_CON_SPDMA_QCH			0x308c
> +#define QCH_CON_SSMT_DIT_QCH			0x3090
> +#define QCH_CON_SSMT_PDMA_QCH			0x3094
> +#define QCH_CON_SSMT_PPMU_DMA_QCH		0x3098
> +#define QCH_CON_SSMT_RTIC_QCH			0x309c
> +#define QCH_CON_SSMT_SPDMA_QCH			0x30a0
> +#define QCH_CON_SSMT_SSS_QCH			0x30a4
> +#define QCH_CON_SSS_QCH				0x30a8
> +#define QCH_CON_SYSMMU_MISC_QCH			0x30ac
> +#define QCH_CON_SYSMMU_SSS_QCH			0x30b0
> +#define QCH_CON_SYSREG_MISC_QCH			0x30b4
> +#define QCH_CON_TMU_SUB_QCH			0x30b8
> +#define QCH_CON_TMU_TOP_QCH			0x30bc
> +#define QCH_CON_WDT_CLUSTER0_QCH		0x30c0
> +#define QCH_CON_WDT_CLUSTER1_QCH		0x30c4
> +#define QUEUE_CTRL_REG_BLK_MISC_CMU_MISC	0x3c00
> +
> +static const unsigned long misc_clk_regs[] __initconst = {
> +	PLL_CON0_MUX_CLKCMU_MISC_BUS_USER,
> +	PLL_CON1_MUX_CLKCMU_MISC_BUS_USER,
> +	PLL_CON0_MUX_CLKCMU_MISC_SSS_USER,
> +	PLL_CON1_MUX_CLKCMU_MISC_SSS_USER,
> +	MISC_CMU_MISC_CONTROLLER_OPTION,
> +	CLKOUT_CON_BLK_MISC_CMU_MISC_CLKOUT0,
> +	CLK_CON_MUX_MUX_CLK_MISC_GIC,
> +	CLK_CON_DIV_DIV_CLK_MISC_BUSP,
> +	CLK_CON_DIV_DIV_CLK_MISC_GIC,
> +	CLK_CON_GAT_CLK_BLK_MISC_UID_MISC_CMU_MISC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_I_OSCCLK,
> +	CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_I_OSCCLK,
> +	CLK_CON_GAT_CLK_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_I_OSCCLK,
> +	CLK_CON_GAT_CLK_BLK_MISC_UID_RSTNSYNC_CLK_MISC_OSCCLK_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_ADM_AHB_SSS_IPCLKPORT_HCLKM,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_DIT_IPCLKPORT_PCLKM,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_AD_APB_PUF_IPCLKPORT_PCLKM,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_DIT_IPCLKPORT_ICLKL2A,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_D_TZPC_MISC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_GIC_IPCLKPORT_GICCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_GPC_MISC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AST_ICC_CPUGIC_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_D_SSS_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_GIC_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHM_AXI_P_MISC_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_ACEL_D_MISC_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AST_IRI_GICCPU_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_LHS_AXI_D_SSS_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_MCT_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_BISR_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_PDMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_DMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_PPMU_MISC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_PUF_IPCLKPORT_I_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_DIT_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PDMA_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_PPMU_DMA_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_RTIC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SPDMA_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_QE_SSS_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSD_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_BUSP_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_GIC_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_RSTNSYNC_CLK_MISC_SSS_IPCLKPORT_CLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_RTIC_IPCLKPORT_I_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SPDMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_DIT_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PDMA_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_PPMU_DMA_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_RTIC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SPDMA_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSMT_SSS_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_ACLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SSS_IPCLKPORT_I_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_MISC_IPCLKPORT_CLK_S2,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSMMU_SSS_IPCLKPORT_CLK_S1,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSREG_MISC_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_SUB_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_TMU_TOP_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER1_IPCLKPORT_PCLK,
> +	CLK_CON_GAT_GOUT_BLK_MISC_UID_XIU_D_MISC_IPCLKPORT_ACLK,
> +	DMYQCH_CON_PPMU_DMA_QCH,
> +	DMYQCH_CON_PUF_QCH,
> +	PCH_CON_LHM_AXI_D_SSS_PCH,
> +	PCH_CON_LHM_AXI_P_GIC_PCH,
> +	PCH_CON_LHM_AXI_P_MISC_PCH,
> +	PCH_CON_LHS_ACEL_D_MISC_PCH,
> +	PCH_CON_LHS_AST_IRI_GICCPU_PCH,
> +	PCH_CON_LHS_AXI_D_SSS_PCH,
> +	QCH_CON_ADM_AHB_SSS_QCH,
> +	QCH_CON_DIT_QCH,
> +	QCH_CON_GIC_QCH,
> +	QCH_CON_LHM_AST_ICC_CPUGIC_QCH,
> +	QCH_CON_LHM_AXI_D_SSS_QCH,
> +	QCH_CON_LHM_AXI_P_GIC_QCH,
> +	QCH_CON_LHM_AXI_P_MISC_QCH,
> +	QCH_CON_LHS_ACEL_D_MISC_QCH,
> +	QCH_CON_LHS_AST_IRI_GICCPU_QCH,
> +	QCH_CON_LHS_AXI_D_SSS_QCH,
> +	QCH_CON_MCT_QCH,
> +	QCH_CON_MISC_CMU_MISC_QCH,
> +	QCH_CON_OTP_CON_BIRA_QCH,
> +	QCH_CON_OTP_CON_BISR_QCH,
> +	QCH_CON_OTP_CON_TOP_QCH,
> +	QCH_CON_PDMA_QCH,
> +	QCH_CON_PPMU_MISC_QCH,
> +	QCH_CON_QE_DIT_QCH,
> +	QCH_CON_QE_PDMA_QCH,
> +	QCH_CON_QE_PPMU_DMA_QCH,
> +	QCH_CON_QE_RTIC_QCH,
> +	QCH_CON_QE_SPDMA_QCH,
> +	QCH_CON_QE_SSS_QCH,
> +	QCH_CON_RTIC_QCH,
> +	QCH_CON_SPDMA_QCH,
> +	QCH_CON_SSMT_DIT_QCH,
> +	QCH_CON_SSMT_PDMA_QCH,
> +	QCH_CON_SSMT_PPMU_DMA_QCH,
> +	QCH_CON_SSMT_RTIC_QCH,
> +	QCH_CON_SSMT_SPDMA_QCH,
> +	QCH_CON_SSMT_SSS_QCH,
> +	QCH_CON_SSS_QCH,
> +	QCH_CON_SYSMMU_MISC_QCH,
> +	QCH_CON_SYSMMU_SSS_QCH,
> +	QCH_CON_SYSREG_MISC_QCH,
> +	QCH_CON_TMU_SUB_QCH,
> +	QCH_CON_TMU_TOP_QCH,
> +	QCH_CON_WDT_CLUSTER0_QCH,
> +	QCH_CON_WDT_CLUSTER1_QCH,
> +	QUEUE_CTRL_REG_BLK_MISC_CMU_MISC,
> +};
> +
> +/* List of parent clocks for Muxes in CMU_MISC */
> +PNAME(mout_misc_bus_user_p)		= { "oscclk", "dout_cmu_misc_bus" };
> +PNAME(mout_misc_sss_user_p)		= { "oscclk", "dout_cmu_misc_sss" };
> +
> +static const struct samsung_mux_clock misc_mux_clks[] __initconst = {
> +	MUX(CLK_MOUT_MISC_BUS_USER, "mout_misc_bus_user", mout_misc_bus_user_p,
> +	    PLL_CON0_MUX_CLKCMU_MISC_BUS_USER, 4, 1),
> +	MUX(CLK_MOUT_MISC_SSS_USER, "mout_misc_sss_user", mout_misc_sss_user_p,
> +	    PLL_CON0_MUX_CLKCMU_MISC_SSS_USER, 4, 1),
> +};
> +
> +static const struct samsung_div_clock misc_div_clks[] __initconst = {
> +	DIV(CLK_DOUT_MISC_BUSP, "dout_misc_busp", "mout_misc_bus_user",
> +	    CLK_CON_DIV_DIV_CLK_MISC_BUSP, 0, 3),
> +	DIV(CLK_DOUT_MISC_GIC, "dout_misc_gic", "mout_misc_bus_user",
> +	    CLK_CON_DIV_DIV_CLK_MISC_GIC, 0, 3),
> +};
> +
> +static const struct samsung_gate_clock misc_gate_clks[] __initconst = {
> +	GATE(CLK_GOUT_MISC_PCLK, "gout_misc_pclk", "dout_misc_busp",
> +	     CLK_CON_GAT_CLK_BLK_MISC_UID_MISC_CMU_MISC_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +
> +	GATE(CLK_GOUT_MISC_SYSREG_PCLK, "gout_misc_sysreg_pclk", "dout_misc_busp",
> +	     CLK_CON_GAT_GOUT_BLK_MISC_UID_SYSREG_MISC_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +
> +	GATE(CLK_GOUT_MISC_WDT_CLUSTER0, "gout_misc_wdt_cluster0", "dout_misc_busp",
> +	     CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER0_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +
> +	GATE(CLK_GOUT_MISC_WDT_CLUSTER1, "gout_misc_wdt_cluster1", "dout_misc_busp",
> +	     CLK_CON_GAT_GOUT_BLK_MISC_UID_WDT_CLUSTER1_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +
> +};
> +
> +static const struct samsung_cmu_info misc_cmu_info __initconst = {
> +	.mux_clks		= misc_mux_clks,
> +	.nr_mux_clks		= ARRAY_SIZE(misc_mux_clks),
> +	.div_clks		= misc_div_clks,
> +	.nr_div_clks		= ARRAY_SIZE(misc_div_clks),
> +	.gate_clks		= misc_gate_clks,
> +	.nr_gate_clks		= ARRAY_SIZE(misc_gate_clks),
> +	.nr_clk_ids		= MISC_NR_CLK,
> +	.clk_regs		= misc_clk_regs,
> +	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
> +	.clk_name		= "dout_misc_bus",
> +};
> +
>  /* ---- platform_driver ----------------------------------------------------- */
>  
>  static int __init gs101_cmu_probe(struct platform_device *pdev)
> @@ -1832,6 +2141,9 @@ static const struct of_device_id gs101_cmu_of_match[] = {
>  	{
>  		.compatible = "google,gs101-cmu-apm",
>  		.data = &apm_cmu_info,
> +	}, {
> +		.compatible = "google,gs101-cmu-misc",
> +		.data = &misc_cmu_info,
>  	}, {
>  	},
>  };
> -- 
> 2.42.0.655.g421f12c284-goog
> 
