Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962742A96AE
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 14:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgKFNGt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 08:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgKFNGs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 08:06:48 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6744EC0613CF;
        Fri,  6 Nov 2020 05:06:47 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id y22so1143606oti.10;
        Fri, 06 Nov 2020 05:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fRK20G4/BGOrBRLDBmiiL7+5bvGQEl0XDwSOBPWbBI8=;
        b=JotNPZjcRcLLMkuJh6BLaDMSDw0g7P04Xc5AxvNd8vw3seVk1bWBFK5HRpSVUYTO6n
         oOVRugi+2iuG0C6UdIMZjoi/IByn0JrN3JEzxY7fSYsz8ESmjt/RCRwwOqbEYnDBBpIy
         41R+7lhPGbrQTBqfYfZ9oQuw4l6XJhIiowlsXRb8iAHInVIlyFk8RviH1mSHXniuRGX3
         yiYwEdEyYCYv8B0a1m8nctmtQldvR+L5yZczLKgmns6QXJOfDpnjYK9feNC8fURO1UJc
         HfrPDHlI41/nLcozi0PMKg3XF1J2oeW2TOXAvlPgpMFCSPzToEUMp/rHeSCxIlNEEUFo
         QAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=fRK20G4/BGOrBRLDBmiiL7+5bvGQEl0XDwSOBPWbBI8=;
        b=EEGEwE/JUpAqCu1S4NU5dv2oGH3AY72wL8X1U/1pG1dFuzQS48AfXRac4n4WPdV5qH
         HQ6HdrNAurZkqam5+/gs153e1tqvkh/dpcNX88W+QmTX5icqA2e89hEmlympZPzqBke2
         3hfKvFNFDfwM4jqzS+Z1rbTRO5grBeIlpY1jW+DmV5n+VqU/jjh3XptUoNBEQmaA65fY
         lOsO6bTr8roTFAH2NnoHR30ZfOT0nc75H8hShNhSXtCi+i+6RRcD8h4zubx1bmTFkRGR
         AvmP4mL7OhsnhMe5zRvWyOTJsRFgu5avNGsNwvavR4kZMZHSFkxdnRpmt5kmUuO17fST
         +0Yg==
X-Gm-Message-State: AOAM532z7nQZq9fuzex0Lge1pbClyVWuLiSrmOPhWSvq7mMw4O4uqs3i
        wNAQdIyfMC96q4FFjukVby8SvZv43oQ=
X-Google-Smtp-Source: ABdhPJzRc9hhnOoI4fdYnfJ7tHtsKnHiE1V8K23BxTe2pXu/JQNI10YNh9dPjDG0eyzVTDtu3k11Xw==
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr1010166otq.265.1604668006787;
        Fri, 06 Nov 2020 05:06:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m10sm294602oon.27.2020.11.06.05.06.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Nov 2020 05:06:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 6 Nov 2020 05:06:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe Roullier <christophe.roullier@st.com>
Cc:     wim@linux-watchdog.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Etienne Carriere <etienne.carriere@st.com>
Subject: Re: [PATCH  1/1] watchdog: stm32_iwdg: don't print an error on probe
 deferral
Message-ID: <20201106130644.GA14837@roeck-us.net>
References: <20201106094627.21132-1-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106094627.21132-1-christophe.roullier@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 06, 2020 at 10:46:27AM +0100, Christophe Roullier wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Do not print an error trace when deferring probe for clock resources.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  drivers/watchdog/stm32_iwdg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 25188d6bbe15..1b71c205cee0 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -163,7 +163,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  
>  	wdt->clk_lsi = devm_clk_get(dev, "lsi");
>  	if (IS_ERR(wdt->clk_lsi)) {
> -		dev_err(dev, "Unable to get lsi clock\n");
> +		if (PTR_ERR(wdt->clk_lsi) != -EPROBE_DEFER)
> +			dev_err(dev, "Unable to get lsi clock\n");
>  		return PTR_ERR(wdt->clk_lsi);

I would suggest to use
		return dev_err_probe(dev, PTR_ERR(wdt->clk_lsi), "Unable to get lsi clock\n");

Guenter

>  	}
>  
> @@ -171,7 +172,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  	if (wdt->data->has_pclk) {
>  		wdt->clk_pclk = devm_clk_get(dev, "pclk");
>  		if (IS_ERR(wdt->clk_pclk)) {
> -			dev_err(dev, "Unable to get pclk clock\n");
> +			if (PTR_ERR(wdt->clk_pclk) != -EPROBE_DEFER)
> +				dev_err(dev, "Unable to get pclk clock\n");
>  			return PTR_ERR(wdt->clk_pclk);
>  		}
>  
> -- 
> 2.17.1
> 
