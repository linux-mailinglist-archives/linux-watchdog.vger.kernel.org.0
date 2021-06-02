Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503AC3986A9
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jun 2021 12:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbhFBKkL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Jun 2021 06:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbhFBKjv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Jun 2021 06:39:51 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C2EC061574;
        Wed,  2 Jun 2021 03:38:01 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id x22-20020a4a62160000b0290245cf6b7feeso434476ooc.13;
        Wed, 02 Jun 2021 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NHYeNA+V/PrJlvviVEjjujo+v93Ja60cG99fsblTbFI=;
        b=DOM0cr6AigqFT/wzI5JYEGs6+1XgsG3xF9KFYVvoKMWpeaFTFiAZ9H+IpwKXVHUo6a
         yCsG1tY60kqXLT3GGipB9JzXoTNfdXbgH3nqjy/BJEpgd9AKrdKCeVbp/ny9onHq3gfm
         gG0z3LYYPs2EyLD+4GIHN2pJYxSPbOW1Xb4XPm6YmJRodylzWF98rYo3vRUpRJHjbsxw
         R8T3K08XGZH5LZiId/mpeM+8gpl89wReRORot+2KQvd5kYYRVlyCfLFJwSJCDKZTt08n
         0isP7V8JUcdf77kSOOtmBWrQu/AUDrRGY+wfE5T5NFNv5oeCJNT0M17zrPq11TngSQvX
         Y6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=NHYeNA+V/PrJlvviVEjjujo+v93Ja60cG99fsblTbFI=;
        b=XPdoqIpEo7BUSpdGIyJtsOfUzlrf/BxfRcuKQbRjFX17tmwzisuMOH2R2vJaiOvyDF
         BWcGfYuw39joadngUd1cmgh2JmIuhGa1DdmLOLbNey8xFbM/rEjqAJsGf4yBTNMMPorZ
         MzbFLvWyVZyQkE6Wl0anA8XhFb3kS2V18WVRLhTGB3WJfFdsKB2ke+nOcmYi57asJYOP
         ncsS1b1fW13/da+fFjg9l/4rHQcXWVfw59CD9lEru70n4Mft3FSES5OSBeZ3UBURWKSz
         icFM28AuKxto3ylviNZ52hS/sHrlAfr6CmVgaeTYAuWa1jbZkAOMDit10ryyE9VTqmY/
         9JBg==
X-Gm-Message-State: AOAM532dWV/hvjDAs+GV2xxRQhZlexd5kGCpcXI1Z29/teVYGiKtY+/n
        RdXX1wuS2zmn9h3lC9lmVHI=
X-Google-Smtp-Source: ABdhPJzTNo0se9mK37UuoeN1ecljfwsBWrUc99om/YAcmBZbiez8FpWpti1NekxZInObdSBva3MFhg==
X-Received: by 2002:a4a:de18:: with SMTP id y24mr10079217oot.63.1622630280703;
        Wed, 02 Jun 2021 03:38:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s187sm4076067oig.6.2021.06.02.03.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:37:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Jun 2021 03:37:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/6] watchdog: bcm2835_wdt: consider
 system-power-controller property
Message-ID: <20210602103758.GA1865238@roeck-us.net>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622366775-5309-3-git-send-email-stefan.wahren@i2se.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, May 30, 2021 at 11:26:11AM +0200, Stefan Wahren wrote:
> Until now all Raspberry Pi boards used the power off function of the SoC.
> But the Raspberry Pi 400 uses gpio-poweroff for the whole board which
> possibly cannot register the poweroff handler because the it's
> already registered by this watchdog driver. So consider the
> system-power-controller property for registering, which is already
> defined in soc/bcm/brcm,bcm2835-pm.txt .
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm2835_wdt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index dec6ca0..9490717 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -205,9 +205,13 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	if (pm_power_off == NULL) {
> -		pm_power_off = bcm2835_power_off;
> -		bcm2835_power_off_wdt = wdt;
> +	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
> +		if (!pm_power_off) {
> +			pm_power_off = bcm2835_power_off;
> +			bcm2835_power_off_wdt = wdt;
> +		} else {
> +			dev_info(dev, "Poweroff handler already present!\n");
> +		}
>  	}
>  
>  	dev_info(dev, "Broadcom BCM2835 watchdog timer");
> -- 
> 2.7.4
> 
