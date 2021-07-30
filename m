Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A67B3DB288
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 06:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbhG3E7F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 00:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbhG3E7F (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 00:59:05 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FECDC061765;
        Thu, 29 Jul 2021 21:59:00 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id u10so11532819oiw.4;
        Thu, 29 Jul 2021 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=doyxz9pyxdcEmVkUksEyDPhqPmEbmwaEjeQ3i/UpGPI=;
        b=u8yeEJHRqtNqfhHFzy5a7FSNQrIHeBnRCWbXqwv0EtSfS9IHzsCS3b/pXVZqu/PFPu
         CwAZ0AbUGdVO+R26a9N4UY8UojrHUY6MWxycHkaApDR3r1Qx2N3xuej0uho+BUVSpR4Q
         WwXa2JKn5Ko0Deapa6zENPe7pPZm6TBEQbl0zTKohKqYHjWK+jmhb14PUgeb+L65pZ1p
         /7I6DqqdgvCuOFVB/1H9fj7hE/4jNvwff79qqA8UuBiTG13R39uZu6zwe8xixfmDIsrr
         WuYr72PXc9PYmxcu1a6D6lwsXZTGe2tBwIOFHDKzY3QvNE7TLor5Q1rgTGhG2nlwddOX
         KusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=doyxz9pyxdcEmVkUksEyDPhqPmEbmwaEjeQ3i/UpGPI=;
        b=VC9ZuwxSgZNESs0kS/bNwROjMDF5OdgyJVI1a6RkTpusrgnwWg/cTrnnQhJH8Etud9
         LWWKGIVy1eybsMDOFNormmO8nEfxQviCXw+pgYCFMBpiYu5yxSmtoxEL7hWX6yYmcNcu
         7n+fjvFPsrhor5Gh6STnyZsBuXErMoacM2VF1qj2iBLl3JZqbKkaJrc5IqeuDldOqQ6k
         L2kvVmyqVWfsVnkL1aLHw1VRof1dd1srIvRhvGkQNWEUJmGapsaGUUTBp4QT7plGViun
         5ntUWrQKVxH4rwJ+fF58tIwAiGZYpooNTJX/CnJZKZEXgqraHxVHPCPC8tEDYg5VqkK3
         DPtQ==
X-Gm-Message-State: AOAM530xValelnaxSSXZJN5VPiNWm935wCjyVSs7Pb2qMBM87NMSgA3e
        1r+IEZdzMOfmAkGpfaT/MaU=
X-Google-Smtp-Source: ABdhPJycAFZT76xx9NYGJgNW85wPGAXIW4te2QuwzbyZln6VD7jIBeHMepQQ6KpVlNh5LzCklUYMtw==
X-Received: by 2002:a05:6808:6d1:: with SMTP id m17mr642861oih.34.1627621139603;
        Thu, 29 Jul 2021 21:58:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m7sm120260oiw.50.2021.07.29.21.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 21:58:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 29 Jul 2021 21:58:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Artem Lapkin <email2tema@gmail.com>
Cc:     narmstrong@baylibre.com, wim@linux-watchdog.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Message-ID: <20210730045857.GC2110311@roeck-us.net>
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730041355.2810397-4-art@khadas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 30, 2021 at 12:13:55PM +0800, Artem Lapkin wrote:
> Remove watchdog_stop_on_reboot()
> 
> Meson platform still have some hardware drivers problems for some
> configurations which can freeze device on shutdown/reboot stage and i
> think better to have reboot warranty by default.
> 
> I feel that it is important to keep the watchdog running during the
> reboot sequence, in the event that an abnormal driver freezes the reboot
> process.
> 
> This is my personal opinion and I hope the driver authors will agree
> with my proposal, or just ignore this commit if not.
> 
> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
> 

A much better description would be something like

"The Meson platform still has some hardware drivers problems for some
 configurations which can freeze devices on shutdown/reboot.
 Remove watchdog_stop_on_reboot() to catch this situation and ensure
 that the reboot happens anyway.
 Users who still want to stop the watchdog on reboot can still do so
 using the watchdog.stop_on_reboot=1 module parameter.
 "

That leaves the personal opinion out of the picture and provides both
a rationale for the change and an alternative for people who want
to stop the watchdog on reboot anyway.

> Signed-off-by: Artem Lapkin <art@khadas.com>

As mentioned, I'd still like to get an opinion from the driver
author and/or some other users of this platform. However, I'll
accept the patch with the above description change if I don't get
additional feedback.

Thanks,
Guenter

> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 945f5e65db57..d3c9e2f6e63b 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  
>  	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>  
> -	watchdog_stop_on_reboot(&data->wdt_dev);
>  	return devm_watchdog_register_device(dev, &data->wdt_dev);
>  }
>  
> -- 
> 2.25.1
> 
