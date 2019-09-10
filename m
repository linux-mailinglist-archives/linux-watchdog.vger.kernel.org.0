Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57FD2AF0E3
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Sep 2019 20:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfIJSIg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Sep 2019 14:08:36 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45702 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfIJSIf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Sep 2019 14:08:35 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so11970722pfb.12;
        Tue, 10 Sep 2019 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VwwR89FpLpifmdwhttpMzRbm9Mo2l5M4v9cq9zL1hHU=;
        b=UODuqFDGMeFzwb/jFWRxBDymM9OOY7fs5E9syt1xsI69W6tT4yOJqvVkiphv8sz9Sa
         hNL+NVLNv/pzWq3VNFOhdVg1yLwD7fo0p6h7p9nQaSKbYDrVWGySe5whTohCo7mBWndN
         1dw66AzeFa/Vzas6WLPM6XH0xOjqFb2ARYkFrbYBV7CIP2gCDUvATi0hB1gT74gFwhtn
         CQUM0jBvgeD54Y3P8xubrFaX4S+8D4JLZJ8zro8kOciPqbECifooZfB2sYpO4/SbADNw
         QdUyVK3mHvc/6WvvEordOtt1lvOBwtibiRzZUz+U2zLV26s7CkNN6E7zW+JJrR65ZYAU
         3uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VwwR89FpLpifmdwhttpMzRbm9Mo2l5M4v9cq9zL1hHU=;
        b=k+mrSnQjSrBzca54rcTFtQnOpHkZF3O4El1ku3MCHXLmMMFZEith4aKguoE+Wrj/wJ
         bMO/mBR3t6XWEnV2NZtbwGtFEIYaKnum3XfM8MSgfFof7Xkd1D/AOBAkmUUQTRHUUIPO
         vbujOdIP+JO+aXx7ID8Uq5XYzgVznpyxH0YeEjcCDE22iwEcIFfixyRct8J7bc6KwTvl
         oBDgObqxzbt9SlGaGHQcfedUbR0A6nCl32XOm5K452nW0ZPtn9seg7lQG4CEZ/ZWsCIW
         CBUM0SYJDB8oPtZkNN2hbK2PZQzVMARD3w5kA69fcygRiM4sHuuOOQVKvbpN4t0Kq4IT
         6MIw==
X-Gm-Message-State: APjAAAXUMpZitgZbFrQan/RwQvv+Zoufq9eOSBh1X+unzzbPL+VoiXXk
        ZkWTvZj7yOLnEpvIUD0CeP8=
X-Google-Smtp-Source: APXvYqz4+EDh5QYKLyTBOfHENLJwzd94dQm9MxFksKrz5K1FiyR6Kxg8ffJue0PofAR0nt46TCZcVQ==
X-Received: by 2002:a63:1507:: with SMTP id v7mr27676269pgl.397.1568138914827;
        Tue, 10 Sep 2019 11:08:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s7sm280080pjn.8.2019.09.10.11.08.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 11:08:34 -0700 (PDT)
Date:   Tue, 10 Sep 2019 11:08:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, wim@linux-watchdog.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: qcom: remove unnecessary variable from
 private storage
Message-ID: <20190910180833.GA25692@roeck-us.net>
References: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
 <20190906205411.31666-3-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906205411.31666-3-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 06, 2019 at 10:54:11PM +0200, Jorge Ramirez-Ortiz wrote:
> there is no need to continue keeping the clock in private storage.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Good catch.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/qcom-wdt.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 935c78a882a3..e98f5a3d83ea 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -42,7 +42,6 @@ static const u32 reg_offset_data_kpss[] = {
>  
>  struct qcom_wdt {
>  	struct watchdog_device	wdd;
> -	struct clk		*clk;
>  	unsigned long		rate;
>  	void __iomem		*base;
>  	const u32		*layout;
> @@ -189,6 +188,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	const u32 *regs;
>  	u32 percpu_offset;
>  	int irq, ret;
> +	struct clk *clk;
>  
>  	regs = of_device_get_match_data(dev);
>  	if (!regs) {
> @@ -215,19 +215,18 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->base))
>  		return PTR_ERR(wdt->base);
>  
> -	wdt->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(wdt->clk)) {
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk)) {
>  		dev_err(dev, "failed to get input clock\n");
> -		return PTR_ERR(wdt->clk);
> +		return PTR_ERR(clk);
>  	}
>  
> -	ret = clk_prepare_enable(wdt->clk);
> +	ret = clk_prepare_enable(clk);
>  	if (ret) {
>  		dev_err(dev, "failed to setup clock\n");
>  		return ret;
>  	}
> -	ret = devm_add_action_or_reset(dev, qcom_clk_disable_unprepare,
> -				       wdt->clk);
> +	ret = devm_add_action_or_reset(dev, qcom_clk_disable_unprepare, clk);
>  	if (ret)
>  		return ret;
>  
> @@ -239,7 +238,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	 * that it would bite before a second elapses it's usefulness is
>  	 * limited.  Bail if this is the case.
>  	 */
> -	wdt->rate = clk_get_rate(wdt->clk);
> +	wdt->rate = clk_get_rate(clk);
>  	if (wdt->rate == 0 ||
>  	    wdt->rate > 0x10000000U) {
>  		dev_err(dev, "invalid clock rate\n");
