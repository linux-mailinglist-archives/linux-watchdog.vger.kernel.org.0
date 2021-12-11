Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6039D4716D8
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Dec 2021 22:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhLKVi4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Dec 2021 16:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbhLKViz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Dec 2021 16:38:55 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73FEC061714;
        Sat, 11 Dec 2021 13:38:54 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id bk14so18096842oib.7;
        Sat, 11 Dec 2021 13:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iTQzwKDgIocsUApNr+fAmWIgMsM4mUlNkVyblUy0yAU=;
        b=Vkwa98trjKx19TCqU3x3OX1bZlsn7Wa+tFX1IjEwK0qm1AL+VyJEhP+enk9jVIL7bp
         VNbCbmTpxtAeiYTqAAkPlNvMiNtOhN0VxU5OmjfgoQQ3b6qGiOr7QSEQGUEIZG+dWSV+
         LuTnLDNcZzCKfxpLgyRNC7EjaYpkD2VI4QWho+2d6H0f72cBm2W/Kl1y46GTZ90vitDV
         c7KkVG25qnSgadbDFgQemPcazVQzKWcFlTrjS1Ur4A8WX2W9ZnHcl7yo2Z2ET1oEub8G
         JZMWUjz5vzZHfux8Fc42h3KGslCJa3R9KMVsw8zsIezWYfA5yRC6hfzeIApnEfeXUTie
         WGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iTQzwKDgIocsUApNr+fAmWIgMsM4mUlNkVyblUy0yAU=;
        b=f8x1VuiauvdKd8T5XiQYA9DfQ3O0U/x4IzgplDE5ZjkcyNuagpSrhAYyHIj61JmEko
         sx2tCizEA9zZNBXGY9QIxI1q82VWtvSoHrvkWYgoy0TfbqX5p2n23SXFpx+jPPQsM3eL
         V5eLkLshc5k9LMX349hDNfoDw8Qt5RU1XXDued8GclP4PAgO4Us2ailB/1zEKouh/Mtz
         PE/19rE4km6ed2EJ7fmrua6HSEpLWG3RS0YkHmsA9xXLFMGqbDWOG8q06c93V5g3BO04
         k4qnZg9Poyq2qgEvSAnN4maP9IcIwmUQb/8JSimKHzZLkIsZkLZYw8ZIB7FbV8JJjP2Y
         TlmQ==
X-Gm-Message-State: AOAM532HygcHrGQpLBEuQUSuEEh0J1OH3AsRAS/4IwjdGelu+n38ELGG
        WbHTAu8KMTZ462lw0WoJQkL7H8rdx/E=
X-Google-Smtp-Source: ABdhPJyQ9ZUgGtqiuLJhVmw5CbtTHdangjaBzMkuipYyqwGU7j2tQraDjq7NZLDtYcEyX98uodKqGQ==
X-Received: by 2002:a05:6808:1396:: with SMTP id c22mr20017369oiw.59.1639258734086;
        Sat, 11 Dec 2021 13:38:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o2sm1763937oik.11.2021.12.11.13.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 13:38:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
 <20211211212617.19639-3-biju.das.jz@bp.renesas.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/4] watchdog: rzg2l_wdt: Add set_timeout callback
Message-ID: <4d5f3e8d-ff4d-27a1-d0b5-55be69d025c2@roeck-us.net>
Date:   Sat, 11 Dec 2021 13:38:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211212617.19639-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/11/21 1:26 PM, Biju Das wrote:
> Add support for set_timeout() callback.
> 
This needs an explanation. WDIOF_SETTIMEOUT is, after all,
already supported. I can see that 'count' is not recalculated,
so that is one of the reasons. However, it also needs to be explained
why it is necessary to stop and restart the watchdog.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/watchdog/rzg2l_wdt.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 58fe4efd9a89..c81b9dd05e63 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -117,6 +117,15 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
>   	return 0;
>   }
>   
> +static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
> +{
> +	wdev->timeout = timeout;
> +	rzg2l_wdt_stop(wdev);
> +	rzg2l_wdt_start(wdev);

Is it necessary to stop and restart the timeout, or would it be sufficient
to call rza_wdt_calc_timeout() ? If it is necessary, please add a comment
describing the reason.

Either case, calling rzg2l_wdt_start() unconditionally is wrong because
the watchdog might be stopped.

Guenter

> +
> +	return 0;
> +}
> +
>   static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>   			     unsigned long action, void *data)
>   {
> @@ -160,6 +169,7 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
>   	.start = rzg2l_wdt_start,
>   	.stop = rzg2l_wdt_stop,
>   	.ping = rzg2l_wdt_ping,
> +	.set_timeout = rzg2l_wdt_set_timeout,
>   	.restart = rzg2l_wdt_restart,
>   };
>   
> 

