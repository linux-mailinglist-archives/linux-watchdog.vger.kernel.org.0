Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A59B36704D
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Apr 2021 18:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241089AbhDUQiZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Apr 2021 12:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239029AbhDUQiY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Apr 2021 12:38:24 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16848C06174A;
        Wed, 21 Apr 2021 09:37:51 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id n140so42972504oig.9;
        Wed, 21 Apr 2021 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s40MAWzS3orpX0sQXdh1P8R77Yd2B3X1I4h9wVVWmC4=;
        b=YqKb/NMl2sXKkVa2wIVghu/UGYH/fIhNM2dV5W1cZ5QHjLt+IhrSgYP3ajqf6c41Qk
         NY2FUywhIi2+CQ2V/WLITHVbEn1F804cazJcDfEsqRT7mrElADGIXEdk2TsOU3LbvHdm
         /l8c6RW7tyAE1UZAVxE6fkzNPrsXQTXlvi6HawE6tSrEjxctnR4SyjHke/h4tdaoS/fr
         mMUjYnLZxBZ5g3aO7GFGyKsFR3d9/mu7xtv7WzDI8KHum5S0gyVJgSvWS93TSGVlRvdY
         BMIdD+yR7W0jUyClrWKAAneIBCTGXK7DUcXXkBtl/+rCCK2U60Q+jU0wvUlR9goYYO3/
         pz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=s40MAWzS3orpX0sQXdh1P8R77Yd2B3X1I4h9wVVWmC4=;
        b=QJwYmmofVcWdiK5gopd4VkSCA8M+MKDN83Eslj2KOWTysGEd+/szOumCSQviRJZjq8
         bhZGacs9Q/JOfRXFqIWnMplNCWg7/Wh4QQRW8JQ00I45ZIdacMOeRK2ks9+XVEN31+UU
         CPvPJzt+5TDBiPj5JyDFR0pYS43zaQDatYng/+hZ3PNvugycjbnY3cl5D7tbBzrvgM2y
         E1QlXUuib1IsxgVICrTzB2UaL4ku7fTTipnkyBRSm/9tVtHOWIPv9U4rpEOI/MtVPnYU
         3IvHsRJBwUm4GqbmA1AV9pDEDJZRWycEYxThnOFOtDoxKcD7YJleCfULtUmcRaOquBb7
         vI4w==
X-Gm-Message-State: AOAM5328Tm8xRp2hISMiMFePRJ1CB07Vo7tvWrI2LGT5HTkNRix2XrUs
        m4vV66NH4048cBfxWXymM1s=
X-Google-Smtp-Source: ABdhPJzbOhS4G+xW0JcEwWrJDF7AiaCfYMOz184Wxk4dRhLcn5Igq2x91dyn64GngRXv8FAodFmlVQ==
X-Received: by 2002:aca:ea06:: with SMTP id i6mr7524647oih.82.1619023070523;
        Wed, 21 Apr 2021 09:37:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l62sm580006oih.2.2021.04.21.09.37.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 09:37:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 21 Apr 2021 09:37:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Francesco Zanella <francesco.zanella@vimar.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: gpio-wdt: add "start-at-boot"
Message-ID: <20210421163748.GA110463@roeck-us.net>
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
 <20210421162621.24910-2-francesco.zanella@vimar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421162621.24910-2-francesco.zanella@vimar.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 21, 2021 at 06:26:20PM +0200, Francesco Zanella wrote:
> Documentation for new device tree property "start-at-boot".
> 
> Signed-off-by: Francesco Zanella <francesco.zanella@vimar.com>
> ---
>  Documentation/devicetree/bindings/watchdog/gpio-wdt.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> index 198794963786..cdaf7f0602e8 100644
> --- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> @@ -17,6 +17,13 @@ Optional Properties:
>  - always-running: If the watchdog timer cannot be disabled, add this flag to
>    have the driver keep toggling the signal without a client. It will only cease
>    to toggle the signal when the device is open and the timeout elapsed.
> +- start-at-boot: Start pinging hw watchdog at probe, in order to take advantage
> +  of kernel configs:
> +  - WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was been
> +    enabled before the kernel (by uboot for example) and userspace doesn't take
> +    control of /dev/watchdog in time;
> +  - WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
> +    /dev/watchdog within the timeout.

You are not supposed to refer to Linux kernel details in devicetree
bindings documents.

Guenter

>  
>  Example:
>  	watchdog: watchdog {
> -- 
> 2.17.1
> 
