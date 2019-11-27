Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A1710B101
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Nov 2019 15:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfK0ORo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Nov 2019 09:17:44 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46514 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbfK0ORn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Nov 2019 09:17:43 -0500
Received: by mail-ot1-f66.google.com with SMTP id n23so19195568otr.13;
        Wed, 27 Nov 2019 06:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zWxVmrfdBI7EDKg3dfR6vKDNrAF55vPOgfsHWCewUK0=;
        b=IYIM8e6HXQi7ulG8kN3IT+IPiPfRg2rr/m0N9K1sSb0D+OX/5LMfP7jWmGw0+RGNMQ
         xLRdrremAQeQ7ZWQBO1aFloCoBF6txaVCWu9YFVH+HudO2/hqJ5yT9b3iX0UgO5LFV2Y
         VW0sYg4lbuahz/iD+hWikI/THGaBAhJruGeu44tll7u2DPCujggMtGQEB0P7Cvl5ocdu
         a5qtCw06RnIPpmmJDamYHDqHjJryypgYrhcpirQmBm1S8/xZnIuuAGTRYdiuxqW1btvd
         zkF+7KGxyRCxNw1MtWgzyKnKTiWX5Hs9KMZ8gx/tEJsqOSBdyW1EwNDLjgftwEGkJv5S
         c9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zWxVmrfdBI7EDKg3dfR6vKDNrAF55vPOgfsHWCewUK0=;
        b=XUnWekslTAIS4DeVDPjmK0dbpv9VDgNDLcgkMIQ0NObl4ZDaR6G6R20P3LYYphArLV
         xgYyKdZ6yyaIuqt4t2hHv50ft1fD1dTEeYyC7C+R+MCuJmeQiQkYtULDrdoAGJ/7EEIY
         tfOgCo8FGGFupw7isJ75B8bsLOuXuhmW9EuzGdOgBK/6anIio6d6CJqYfEpXfJhCLqEG
         6sHsT2H/YPvdkcisyN86OeWKZ41V4P10WD83LZ3sIrFoUcQOlqenG7FoqXId94oyauBi
         Dq5+R5LKHALnuARU7MJn5IX8ixDaach2dUffopS85wKBcxJnhRicB2+wmMzxKs9SOlLf
         NHqg==
X-Gm-Message-State: APjAAAWQzIE5lBCGP/eIs+TuoP2+qIkF3apa8ySs6unEfYgExuKOXKIT
        kJeOBuj19yYh1NE9isdJ6SY9S0Dt
X-Google-Smtp-Source: APXvYqwDF1uD4aFvgN141kMr9cBfYEj70rfO2WHqwAxpSxnYajIvLOGIslkCbsoA1rzvI8tZ24Npew==
X-Received: by 2002:a9d:6344:: with SMTP id y4mr3895824otk.29.1574864262493;
        Wed, 27 Nov 2019 06:17:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w26sm4855691otm.28.2019.11.27.06.17.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 06:17:41 -0800 (PST)
Subject: Re: [PATCH] watchdog: max77620_wdt: fix potential build errors
To:     David Engraf <david.engraf@sysgo.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20191127084617.16937-1-david.engraf@sysgo.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7325c440-aa55-92ce-ec74-b420fd90a24b@roeck-us.net>
Date:   Wed, 27 Nov 2019 06:17:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127084617.16937-1-david.engraf@sysgo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/27/19 12:46 AM, David Engraf wrote:
> max77620_wdt uses watchdog core functions. Enable CONFIG_WATCHDOG_CORE
> to fix potential build errors.
> 
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 58e7c100b6ad..c9cc34f4e541 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -687,6 +687,7 @@ config MAX63XX_WATCHDOG
>   config MAX77620_WATCHDOG
>   	tristate "Maxim Max77620 Watchdog Timer"
>   	depends on MFD_MAX77620 || COMPILE_TEST
> +	select WATCHDOG_CORE
>   	help
>   	 This is the driver for the Max77620 watchdog timer.
>   	 Say 'Y' here to enable the watchdog timer support for
> 

