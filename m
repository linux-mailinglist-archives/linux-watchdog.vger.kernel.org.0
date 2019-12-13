Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14E511E4EF
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2019 14:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbfLMNvg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Dec 2019 08:51:36 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33928 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMNvg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Dec 2019 08:51:36 -0500
Received: by mail-pf1-f196.google.com with SMTP id l127so1524712pfl.1;
        Fri, 13 Dec 2019 05:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IkiWlzBXeVbd3pSPzmXC9ZHVKdjut2jmY51Fm29xZAs=;
        b=i/RYUMmYOGOZ/VZKkxvFNK+7sCFzdMrMs6TAwG7vkLPleEc1/ItLPOymgcWVSS5G/U
         iMTxLpR/JsuQAOk5Ca8XHmU+ijB8RhElFbU9PNj/sOkgaNdwhbIY7f0X89f/+5qWquZf
         OtkK3OnWpS1/K0bgqrJas+gJAr2HyAlg7i0aOZUrTqRBOXGHGfG2M0LgwRrQfoJbYLRt
         kuBrwTLuAk9JI6agmzxTGL1XXgDWpLVXQOMl38OUyMrqFLmKz8DqyrwHOjMfMelCqsLP
         uBvsHhpOLHDtp7Rp1yPzGUozjOK/VHm8n3vgIa1+3i5y7GvZGnUd5IRJPWFIvrHtY58R
         mylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IkiWlzBXeVbd3pSPzmXC9ZHVKdjut2jmY51Fm29xZAs=;
        b=NVFnHVKGp4D+6cl7mzivNR2s7fKzO0hda9Km5S54Y6lXCUVuRc5LjeiVBZuXCfV6ti
         pbtoy8Yh5M/SicInhNAxltdyYTX4zwjidFHpYvgR98AX11mWr2sLrdsHvVHCUjwPrjZS
         JEF9p9eltc2mhnNjLUYSpERnjv+VjGv5ZyaSzpvvaT1+CYlhsa1xHCLfQ6DZ4c+f5ZIv
         tu272uXdHrdHQ2ouPEIYUiC8VCLNN8sbbbx7yJTTPd8kPzKRAfGz3xTiGljjZAp8BMmC
         1QXx2SwR11DplJBZNdb+0s7LcSGNwrpr1zDHjOmR9mCGfsnWA1szxx9wr4oVu1/8glHy
         jlLA==
X-Gm-Message-State: APjAAAUsi0P6kuKpkqhA+qWUYJsgTnVHovnz94Z+8YjBus3F4a/S6CEl
        +pnxKF4Mte7iRT+zRkRVAjiSNAxh
X-Google-Smtp-Source: APXvYqzZcDPfj1DX9SnGHIm18wsz2wIAlsgXAU/nTMByZURxs8UdspDbhjZ639wV1GPUt6rYXKjOjw==
X-Received: by 2002:a62:e40e:: with SMTP id r14mr15971357pfh.115.1576245095471;
        Fri, 13 Dec 2019 05:51:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f30sm11194840pga.20.2019.12.13.05.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 05:51:34 -0800 (PST)
Subject: Re: [PATCH] watchdog: qcom: Use platform_get_irq_optional() for bark
 irq
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-watchdog@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20191213064934.4112-1-saiprakash.ranjan@codeaurora.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b5b1d073-832b-e7bf-90b0-0cd4167ca3dc@roeck-us.net>
Date:   Fri, 13 Dec 2019 05:51:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213064934.4112-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/12/19 10:49 PM, Sai Prakash Ranjan wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/qcom-wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index a494543d3ae1..eb47fe5ed280 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -246,7 +246,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	/* check if there is pretimeout support */
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>   	if (irq > 0) {
>   		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
>   				       IRQF_TRIGGER_RISING,
> 

