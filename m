Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAA810D787
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Nov 2019 15:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfK2O42 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Nov 2019 09:56:28 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:44378 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfK2O41 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Nov 2019 09:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CrS/YJ/SHovJCxBREqPokxBbwSkt3UcFMvyi1UJYhN8=; b=aYONfjvnV8yjSRP0UET2X2oOX
        RmHwX2PDvBcd1DsNgS673jBam1Ro2qouuumtSC41E9PSVOiI4XFb2G0LaZWA4E/q2tiOguM9n9KNb
        s7WmRaDxxT+7CckZPqMkS+/W8ed+1SuvJ712zHDRfXqgQe+WZlL7WKK7DdXMrbPXuQrltbcDgfRKW
        lsNZSAKXAxvMw0+2cd/jhUHXxnA3le8JjfsWSSSOyXfLqIGO1uTPMllNyu4zrSTXvJzoHsjlcadFu
        gau0DWewPJpLq5IHG2WNToCzu/WUSGJuajCsoq56HfJK/Jma06iAB/0blHwYEojlAuCafSQI/qsop
        VTsEoxHMA==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:34614)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iahh2-0007fn-7m; Fri, 29 Nov 2019 14:56:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iahgz-0002NQ-Vn; Fri, 29 Nov 2019 14:56:22 +0000
Date:   Fri, 29 Nov 2019 14:56:21 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: orion: fix platform_get_irq() complaints
Message-ID: <20191129145621.GO25745@shell.armlinux.org.uk>
References: <E1iahcN-0000AT-Co@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1iahcN-0000AT-Co@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 29, 2019 at 02:51:35PM +0000, Russell King wrote:
> Fix:
> 
> orion_wdt f1020300.watchdog: IRQ index 1 not found
> 
> which is caused by platform_get_irq() now complaining when optional
> IRQs are not found.  Neither interrupt for orion is required, so
> make them both optional.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Note that it's a tad difficult to add an accurate Fixes: tag here
because the commit introducing the error message (7723f4c5ecdb) is
earlier than the commit introducing the functions to work around it.

> ---
>  drivers/watchdog/orion_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 1cccf8eb1c5d..8e6dfe76f9c9 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -602,7 +602,7 @@ static int orion_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &dev->wdt.status);
>  
>  	/* Request the IRQ only after the watchdog is disabled */
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq > 0) {
>  		/*
>  		 * Not all supported platforms specify an interrupt for the
> @@ -617,7 +617,7 @@ static int orion_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Optional 2nd interrupt for pretimeout */
> -	irq = platform_get_irq(pdev, 1);
> +	irq = platform_get_irq_optional(pdev, 1);
>  	if (irq > 0) {
>  		orion_wdt_info.options |= WDIOF_PRETIMEOUT;
>  		ret = devm_request_irq(&pdev->dev, irq, orion_wdt_pre_irq,
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
