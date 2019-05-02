Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1672012319
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 May 2019 22:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfEBUV1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 May 2019 16:21:27 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42284 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBUV1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 May 2019 16:21:27 -0400
Received: by mail-pf1-f193.google.com with SMTP id 13so1366027pfw.9;
        Thu, 02 May 2019 13:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RSVFzqBrNoAzGByRQNnOze9LicthP1Zxl3KzGO68CDM=;
        b=HWx4202fdM6hgHbbQQbOCTOFjQO3TLGOtDwId2KDBlfH30aSG/7brUcfjmpDaWYqT3
         eFlgZC4UaIEyH1W/TgpcMokl72eG7heORhYTf5hLq3ddjpfaKH3a4bA9cXPngFWefwbD
         URW+U2ak3/2ADVYe9ubwMHSaEQxkDOhNvKCaE8Cxb6qSVI8iibrMAU+Rp1Rxloc+12o8
         NCvWGlpklHsKLBmvGLQQkz5AVpU2fi/9Fj/ZClx+PCIIcS8eB5/aP4bherxMBuYxUvx5
         gZkTz7eOCUMwO5KoGiKkFOpSITwMrVFd3nfoIvWTp2NSBdRFqruHZu4vLWgGoccWkG14
         g3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RSVFzqBrNoAzGByRQNnOze9LicthP1Zxl3KzGO68CDM=;
        b=eh3ZQSyAAa0HkZsU614MZ5T42eHllwJkE2VYo/Y3MF/bYfEBl35QsALAXQ5uxbeDqq
         UkpJRNZDFm1C4f7ECD4xNEtNnYVgnIONrlWrtQwEsdI6v11cwQ1rNQ2UZZvMX4nd4S41
         mPOV6DZsGXYPt/H/Pw/MbnVpMRtuAdksY5FQP3G1MgQE5zlfAowTwfRSuxtslhsvLRvv
         CtM3CeKWoNEgwWzHMot01KqEs8rcueHkgpofwzNrId/LINQguf1YLhBSh/t/IbBqz+RB
         HNbbo8ljIWbNnPTW9PydjKw0QeX29mssWmsmD1v9NHAhiniA4w0EmvYdm9GYIhzNtEQy
         yJ0g==
X-Gm-Message-State: APjAAAXCrpGgmgvG1Y0JaCtRa/Lw3N5frEAnmO4vqrDI8/kLoQB7WTbC
        uiPBX/Rj9VvCQyJYsDXKtIolDePi
X-Google-Smtp-Source: APXvYqyqxBdfissQiYlYy8sXzM14Kk6vmbI9ypGeaWGJkrP5xZhgv3S/pXhmaX20NrsLpXPiyu8UeQ==
X-Received: by 2002:a63:d908:: with SMTP id r8mr6061828pgg.268.1556828485710;
        Thu, 02 May 2019 13:21:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 15sm20555pfy.88.2019.05.02.13.21.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 13:21:24 -0700 (PDT)
Date:   Thu, 2 May 2019 13:21:22 -0700
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
Subject: Re: [PATCH V2 1/3] watchdog: stm32: update to
 devm_watchdog_register_device
Message-ID: <20190502202122.GA27894@roeck-us.net>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
 <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 02, 2019 at 04:08:44PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch updates to devm_watchdog_register_device interface
> 
Not that easy. See below.

A more complete solution is at
https://patchwork.kernel.org/patch/10894355

I have a total of three patches for this driver pending for
the next kernel release. Maybe it would make sense to (re-)
start this series from there after the next commit window
closes.

Guenter

> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/watchdog/stm32_iwdg.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index e00e3b3..e191bd8 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -243,7 +243,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>  		dev_warn(&pdev->dev,
>  			 "unable to set timeout value, using default\n");
>  
> -	ret = watchdog_register_device(wdd);
> +	ret = devm_watchdog_register_device(&pdev->dev, wdd);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to register watchdog device\n");
>  		goto err;
> @@ -263,7 +263,6 @@ static int stm32_iwdg_remove(struct platform_device *pdev)
>  {
>  	struct stm32_iwdg *wdt = platform_get_drvdata(pdev);
>  
> -	watchdog_unregister_device(&wdt->wdd);
>  	clk_disable_unprepare(wdt->clk_lsi);
>  	clk_disable_unprepare(wdt->clk_pclk);

This disables the clock while the watchdog is still registered
and running. That is not a good idea.

>  
> -- 
> 2.7.4
> 
