Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C246F195FED
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Mar 2020 21:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgC0UmL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Mar 2020 16:42:11 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42540 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgC0UmK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Mar 2020 16:42:10 -0400
Received: by mail-pf1-f194.google.com with SMTP id 22so5041880pfa.9;
        Fri, 27 Mar 2020 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q2fc09QuL0vuPEfyLn2MIhj2N/FRjY+3fW5Z5f14Js4=;
        b=jLhGpXkYA1wZJl+Vn9LrohRWXm5mT0YDaYcBdgBKC0OKpg194RYojlYMU+bkNpL1pb
         Qbksq6QhLXjbMJfC9QCkiP5lUvD0wsJ37xplLmW+bNK/nJGBj/NCIyGH2MLwk6F7e+J1
         9EcgY+o1nAR6D0wKS1w3mxWylxrGoYyiC9w5wAml+chT3cGYETUEUIttc7YSpplyrPU6
         /G51bgGfY3E3a4lGrRhKXn78wRQnQJ7jgr4fwQU3jPN9O8ZVCOmw8ygKi+3gC0K7YSrx
         NukdfVL9Ady6tGFwjri/4NsFh1MRQY4ehza5XNIqq6vmr390foWj/OtqmLSh7TbAGx90
         0MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Q2fc09QuL0vuPEfyLn2MIhj2N/FRjY+3fW5Z5f14Js4=;
        b=cWNP+z0L0/syMPu0H7ke3SCxCVXKG4zY5cugza7IWibpLC8iKSrVvZ+iu5mIk4zMjp
         E0CfhxHMhkEVlHPW32uPCRYsU8UzxjgUtQ3TQTywSCxx2kZNPxA54Dv73n3EtU68c+KE
         6wWw5eDyenoZ5fJIexBRvr0OQTqmRNsmmvRHcEnJ89fWEo3QTHhghaBOid2H9YYiMPP+
         Z8rWuL3W17fdkNyyHl41+LeBwCxwKSx8Ql/qMAMWqqesyG2ueYAdp5lwbDvlOS+na+cn
         tHgmuPbFKKUofWaYlTMjEhTk72b1DGHOefkdQeM8b07GXOiHsE4nJDDBa6W/vpgHUS75
         uCfw==
X-Gm-Message-State: ANhLgQ3Fcs8wNH/pCUlQq5cZvadLfYC9MNgAJVE4Tr2SpNzAsAu1dbfn
        iZbWZGmgFDj4Vi19zBpX+/c=
X-Google-Smtp-Source: ADFU+vtAlj4M3EZreawCR4E6F/hBdZJPEnWEguI9gSWbo7xQ+qm2EsmjVrWgkCFoixTRhjA0LNblSw==
X-Received: by 2002:a62:778d:: with SMTP id s135mr1101976pfc.21.1585341727423;
        Fri, 27 Mar 2020 13:42:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e26sm4796108pfj.61.2020.03.27.13.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 13:42:06 -0700 (PDT)
Subject: Re: [PATCH] watchdog: sp805: fix restart handler
To:     Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Jongsung Kim <neidhard.kim@lge.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20200327162450.28506-1-michael@walle.cc>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <89ad42e9-8852-7ffd-6bfa-6db602caa51c@roeck-us.net>
Date:   Fri, 27 Mar 2020 13:42:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200327162450.28506-1-michael@walle.cc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/27/20 9:24 AM, Michael Walle wrote:
> The restart handler is missing two things, first, the registers
> has to be unlocked and second there is no synchronization for the
> write_relaxed() calls.
> 
> This was tested on a custom board with the NXP LS1028A SoC.
> 
> Fixes: 6c5c0d48b686c ("watchdog: sp805: add restart handler")
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp805_wdt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 53e04926a7b2..190d26e2e75f 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -137,10 +137,14 @@ wdt_restart(struct watchdog_device *wdd, unsigned long mode, void *cmd)
>  {
>  	struct sp805_wdt *wdt = watchdog_get_drvdata(wdd);
>  
> +	writel_relaxed(UNLOCK, wdt->base + WDTLOCK);
>  	writel_relaxed(0, wdt->base + WDTCONTROL);
>  	writel_relaxed(0, wdt->base + WDTLOAD);
>  	writel_relaxed(INT_ENABLE | RESET_ENABLE, wdt->base + WDTCONTROL);
>  
> +	/* Flush posted writes. */
> +	readl_relaxed(wdt->base + WDTLOCK);
> +
>  	return 0;
>  }
>  
> 

