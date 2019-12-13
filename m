Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B5211DE78
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2019 08:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfLMHPi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Dec 2019 02:15:38 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35573 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfLMHPh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Dec 2019 02:15:37 -0500
Received: by mail-pl1-f196.google.com with SMTP id s10so875138plp.2
        for <linux-watchdog@vger.kernel.org>; Thu, 12 Dec 2019 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mHQ0q3g+tRg8eVn0qW80HuKuE2LjVhRlKO13OPMy4+Y=;
        b=aQx+FVJ730/G66jiW0rfYPuqoQg7TX1LUPRcRHlfbgyXEgO7uKvAIHOnQCbmkWGnOP
         nGHoPie3hCjTBUatu8ebhpHQO9BqdUNAV0xvFsjKJ8RrEl1d7wXt/jNunRKwfLDG0+5r
         oq/gnJ+LH79x3kRyCsnpJsDsNAeLHkmCfHNvEPRD4GELzribJintbTTevtB8T9MrEHS7
         ooCe/agLWX2umyWLGGfecYB5OfGV9q7gN9AZT+6f2TJOtTp++c0de0VmbMT6tUqm36cv
         eP1+qq0p1ukgiHi96LKj67mNns0Y2wuEhdGSlSIvXcUDf1alpavYr44mReDvg92YFtcM
         RFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mHQ0q3g+tRg8eVn0qW80HuKuE2LjVhRlKO13OPMy4+Y=;
        b=bYa02ssg480Ro3P8lvLoOCyqUiDBYJlurorx+AeMNuaZ+twyrUH/CNUJ4Co8a/nd9/
         cMR5PhtZqKFMkE9g8wrATjokzwGq45pc0Vv5nUjtpX87kD9QJ9nNPgyjFLE0PzYw2rAs
         OHzlB3+tpcYjxZV3yV7X8zR1+f06s3I9sqti514+AXQIxj2VwMXj8emWC1c9H+bzm72Z
         +dKOkrAslbLWLk0h3WWE3BUHGpbmuyXXh21Q2JDkAsoJxnDpIhSsDBzLp1hnjZKMYczW
         1/GXULNvaoF7EcPoBuRXNbPF88fZDOfd7RtBjdHfc0oV5HTAOIk/TokwcqdbkzhzzJU6
         yL9Q==
X-Gm-Message-State: APjAAAWrg6e7bEuzYoZRbvq6xyvj61sx6mpvJnnvhD0lXvTx4UlGsPBr
        gGSwIQcPblfziAYKnMrIAGmK6A==
X-Google-Smtp-Source: APXvYqzq74VMCuqzGB3Kj7gGVNIA4Ijzqq7PocCemaMG3g6FBuTGD0W9nmO37l+ydi3SA9McM2UACQ==
X-Received: by 2002:a17:90a:8c02:: with SMTP id a2mr14893150pjo.79.1576221337047;
        Thu, 12 Dec 2019 23:15:37 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o12sm10404288pfg.152.2019.12.12.23.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 23:15:36 -0800 (PST)
Date:   Thu, 12 Dec 2019 23:15:33 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-watchdog@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] watchdog: qcom: Use platform_get_irq_optional() for bark
 irq
Message-ID: <20191213071533.GG415177@yoga>
References: <20191213064934.4112-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213064934.4112-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu 12 Dec 22:49 PST 2019, Sai Prakash Ranjan wrote:

> platform_get_irq() prints an error message when the interrupt
> is not available. So on platforms where bark interrupt is
> not specified, following error message is observed on SDM845.
> 
> [    2.975888] qcom_wdt 17980000.watchdog: IRQ index 0 not found
> 
> This is also seen on SC7180, SM8150 SoCs as well.
> Fix this by using platform_get_irq_optional() instead.
> 
> Fixes: 36375491a4395654 ("watchdog: qcom: support pre-timeout when the bark irq is available")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/watchdog/qcom-wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index a494543d3ae1..eb47fe5ed280 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -246,7 +246,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	/* check if there is pretimeout support */
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq > 0) {
>  		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
>  				       IRQF_TRIGGER_RISING,
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
