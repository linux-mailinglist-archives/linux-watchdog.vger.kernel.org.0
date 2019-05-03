Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B058134D9
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 May 2019 23:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbfECVZL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 May 2019 17:25:11 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35024 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbfECVZL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 May 2019 17:25:11 -0400
Received: by mail-pg1-f194.google.com with SMTP id h1so3310854pgs.2;
        Fri, 03 May 2019 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=QKhHiuaK+kBQQTG5PCdM043lhRH1lCekwSqh6wcid4A=;
        b=o48n/wxTCnepoGRodr/8Eb3qKwR3zlFghMbFk716SdYdufewLoibz2dK1C1INXGmVx
         x6KKswavML74FHMEomDFZuTILIUwUb6A59DoYIUTQmV2OY4qYVoVQ2VaTpw1oCfeT7ep
         kffeC+Z1jdPhkQtY396CxXd0IZ3JxToUqnLL+XSGagThD9hhE489q/ZDUzUJvry/sytv
         WC+FUh/mM7HTYcesxPYGbYda0o6aRPmMbDX6iSD74heRl6IFg9mRbyNKKS/w7sRF3hpw
         2nEC2ojWa2mHUodrI6APlye57SRnWcQi4HnlE+sQbxE+ggn8B5vIdNq/YR+0oEkuwtFn
         +0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=QKhHiuaK+kBQQTG5PCdM043lhRH1lCekwSqh6wcid4A=;
        b=BNtRZGb0mS0and7TwbMO8mqFrm2cP5PtbPHqKcUMTboz0MmQipoJr5B6Cps/mB3niX
         kfjKEUvWp1qd/gARkm4yT8SoUSA1wE/K6JTpV4hCT/ojNu5AyQPa3M150x8FYttslgqV
         dEH2fTnJFAtedOT07CJRMKmjsKtmdeqH53SbEl/+REsu0FkWhcnLvbxbA5RByy49K6Iv
         UyFbDQ4DilCEvfKmC9OYsAiDpegp54Q5s/rcnrDEhMYbABqxx4iKUuxj5gsZQJQDY5IB
         yYQx+GQRHnlBRctrieAxyPW8ntOa00ZgpmPcFJmEwOJxvZ1VrlrWQatYgLx557r7yIRc
         N7qQ==
X-Gm-Message-State: APjAAAXoRB2oGFHuM/L+NWPu+PVuQCzad179MxMzGdLFf5xhfZQzF3eU
        HmDJScevXg7RZg97e76ir07QD3aL
X-Google-Smtp-Source: APXvYqzxcUeAkW8Q2/lOAH1+GXkwO8+7WheAPslGvAgkGTwR93orPw0ZTB+ZV3UzzaWvEKtPbBCuYg==
X-Received: by 2002:a63:cc0a:: with SMTP id x10mr13684323pgf.179.1556918709597;
        Fri, 03 May 2019 14:25:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l26sm4091175pfb.20.2019.05.03.14.25.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 14:25:07 -0700 (PDT)
Date:   Fri, 3 May 2019 14:25:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ludovic Barre <ludovic.Barre@st.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH V3] watchdog: stm32: add dynamic prescaler support
Message-ID: <20190503212506.GA14661@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 03, 2019 at 03:48:26PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch allows to define the max prescaler by compatible.
> To set a large range of timeout, the prescaler should be set
> dynamically (from the timeout request) to improve the resolution
> in order to have a timeout close to the expected value.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/stm32_iwdg.c | 84 ++++++++++++++++++++++++-------------------
>  1 file changed, 47 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 6f7c2bc..d569a36 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -34,36 +34,44 @@
>  #define KR_KEY_EWA	0x5555 /* write access enable */
>  #define KR_KEY_DWA	0x0000 /* write access disable */
>  
> -/* IWDG_PR register bit values */
> -#define PR_4		0x00 /* prescaler set to 4 */
> -#define PR_8		0x01 /* prescaler set to 8 */
> -#define PR_16		0x02 /* prescaler set to 16 */
> -#define PR_32		0x03 /* prescaler set to 32 */
> -#define PR_64		0x04 /* prescaler set to 64 */
> -#define PR_128		0x05 /* prescaler set to 128 */
> -#define PR_256		0x06 /* prescaler set to 256 */
> +/* IWDG_PR register */
> +#define PR_SHIFT	2
> +#define PR_MIN		BIT(PR_SHIFT)
>  
>  /* IWDG_RLR register values */
> -#define RLR_MIN		0x07C /* min value supported by reload register */
> -#define RLR_MAX		0xFFF /* max value supported by reload register */
> +#define RLR_MIN		0x2		/* min value recommended */
> +#define RLR_MAX		GENMASK(11, 0)	/* max value of reload register */
>  
>  /* IWDG_SR register bit mask */
> -#define FLAG_PVU	BIT(0) /* Watchdog prescaler value update */
> -#define FLAG_RVU	BIT(1) /* Watchdog counter reload value update */
> +#define SR_PVU	BIT(0) /* Watchdog prescaler value update */
> +#define SR_RVU	BIT(1) /* Watchdog counter reload value update */
>  
>  /* set timeout to 100000 us */
>  #define TIMEOUT_US	100000
>  #define SLEEP_US	1000
>  
> -#define HAS_PCLK	true
> +struct stm32_iwdg_data {
> +	bool has_pclk;
> +	u32 max_prescaler;
> +};
> +
> +static const struct stm32_iwdg_data stm32_iwdg_data = {
> +	.has_pclk = false,
> +	.max_prescaler = 256,
> +};
> +
> +static const struct stm32_iwdg_data stm32mp1_iwdg_data = {
> +	.has_pclk = true,
> +	.max_prescaler = 1024,
> +};
>  
>  struct stm32_iwdg {
>  	struct watchdog_device	wdd;
> +	const struct stm32_iwdg_data *data;
>  	void __iomem		*regs;
>  	struct clk		*clk_lsi;
>  	struct clk		*clk_pclk;
>  	unsigned int		rate;
> -	bool			has_pclk;
>  };
>  
>  static inline u32 reg_read(void __iomem *base, u32 reg)
> @@ -79,31 +87,35 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
>  static int stm32_iwdg_start(struct watchdog_device *wdd)
>  {
>  	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
> -	u32 val = FLAG_PVU | FLAG_RVU;
> -	u32 reload;
> +	u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
>  	int ret;
>  
>  	dev_dbg(wdd->parent, "%s\n", __func__);
>  
> -	/* prescaler fixed to 256 */
> -	reload = clamp_t(unsigned int, ((wdd->timeout * wdt->rate) / 256) - 1,
> -			 RLR_MIN, RLR_MAX);
> +	tout = clamp_t(unsigned int, wdd->timeout,
> +		       wdd->min_timeout, wdd->max_hw_heartbeat_ms / 1000);
> +
> +	presc = DIV_ROUND_UP(tout * wdt->rate, RLR_MAX + 1);
> +
> +	/* The prescaler is align on power of 2 and start at 2 ^ PR_SHIFT. */
> +	presc = roundup_pow_of_two(presc);
> +	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
> +	iwdg_rlr = ((tout * wdt->rate) / presc) - 1;
>  
>  	/* enable write access */
>  	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
>  
>  	/* set prescaler & reload registers */
> -	reg_write(wdt->regs, IWDG_PR, PR_256); /* prescaler fix to 256 */
> -	reg_write(wdt->regs, IWDG_RLR, reload);
> +	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
> +	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
>  	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
>  
>  	/* wait for the registers to be updated (max 100ms) */
> -	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
> -					 !(val & (FLAG_PVU | FLAG_RVU)),
> +	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwdg_sr,
> +					 !(iwdg_sr & (SR_PVU | SR_RVU)),
>  					 SLEEP_US, TIMEOUT_US);
>  	if (ret) {
> -		dev_err(wdd->parent,
> -			"Fail to set prescaler or reload registers\n");
> +		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
>  		return ret;
>  	}
>  
> @@ -156,7 +168,7 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  	}
>  
>  	/* optional peripheral clock */
> -	if (wdt->has_pclk) {
> +	if (wdt->data->has_pclk) {
>  		wdt->clk_pclk = devm_clk_get(dev, "pclk");
>  		if (IS_ERR(wdt->clk_pclk)) {
>  			dev_err(dev, "Unable to get pclk clock\n");
> @@ -205,8 +217,8 @@ static const struct watchdog_ops stm32_iwdg_ops = {
>  };
>  
>  static const struct of_device_id stm32_iwdg_of_match[] = {
> -	{ .compatible = "st,stm32-iwdg", .data = (void *)!HAS_PCLK },
> -	{ .compatible = "st,stm32mp1-iwdg", .data = (void *)HAS_PCLK },
> +	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
> +	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
>  	{ /* end node */ }
>  };
>  MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
> @@ -215,19 +227,16 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct watchdog_device *wdd;
> -	const struct of_device_id *match;
>  	struct stm32_iwdg *wdt;
>  	int ret;
>  
> -	match = of_match_device(stm32_iwdg_of_match, dev);
> -	if (!match)
> -		return -ENODEV;
> -
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>  	if (!wdt)
>  		return -ENOMEM;
>  
> -	wdt->has_pclk = match->data;
> +	wdt->data = of_device_get_match_data(&pdev->dev);
> +	if (!wdt->data)
> +		return -ENODEV;
>  
>  	/* This is the timer base. */
>  	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
> @@ -242,11 +251,12 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>  
>  	/* Initialize struct watchdog_device. */
>  	wdd = &wdt->wdd;
> +	wdd->parent = dev;
>  	wdd->info = &stm32_iwdg_info;
>  	wdd->ops = &stm32_iwdg_ops;
> -	wdd->min_timeout = ((RLR_MIN + 1) * 256) / wdt->rate;
> -	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * 256 * 1000) / wdt->rate;
> -	wdd->parent = dev;
> +	wdd->min_timeout = DIV_ROUND_UP((RLR_MIN + 1) * PR_MIN, wdt->rate);
> +	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
> +				    1000) / wdt->rate;
>  
>  	watchdog_set_drvdata(wdd, wdt);
>  	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
> -- 
> 2.7.4
> 
