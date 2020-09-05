Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC5A25E8FF
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Sep 2020 18:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgIEQOX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 5 Sep 2020 12:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgIEQOV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 5 Sep 2020 12:14:21 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E1BC061244
        for <linux-watchdog@vger.kernel.org>; Sat,  5 Sep 2020 09:14:20 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d9so13155pfd.3
        for <linux-watchdog@vger.kernel.org>; Sat, 05 Sep 2020 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zN9SBXgtMdpYSfTzZI1pIN59cB3X3aWVuXfxXT1W69o=;
        b=ERn4lyobv2FLfp9GEONWGq10MZE7HQMXsQQwjrvXbSLDdcj21AcR8/o1z9IdymPWKh
         PHX2OeosAV9y6RE6Lc3I28TsC8mnK1aXN0mCoFYJ0CmufmEsd6Z1cNizINSUhgimau9r
         wjnCc0TWmDO8dTU2WBbw6o5gvzkcSHhIO3tbZLqQCthuNo1QRJuqyEDA8MxiYEMV2zhF
         YyPO270+4PONGN6tDKSM2jUnsadDR1UTSOQkWCRPVckfcUA/CeG78fkpwh33hwYMHgoX
         5ltP39VSoGrXDHiZ4UM+26a+h1Pe6SldUVtg/MkcDhAglLjlNPbubI6VPWxHu36/j/bc
         94KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zN9SBXgtMdpYSfTzZI1pIN59cB3X3aWVuXfxXT1W69o=;
        b=QjzlfW2FEfHxyWXTyYI26i1KZOHtxE7y9isEPSM+73IM9o+l3KHMM91rvIcB40pLG6
         YmMgL24uSdA75vVhcqAU8wEAAh8ZW8gTq+yJaVw3kwKEm09YyKgSneaTwwILjU90wLlq
         sb+UmAMBRo7pA9nk4F39B4jS5OiVpM3UxBGeEfdN+OOQsTSPk3V+oUhCpg3B0jv8ES7D
         PHpgxr+B1q3Bw02pfUbJyZqbSUNaYJE+tochVmm79yD688cbSOdpkXjw3oBDwnz4eFzC
         fu2s2EyIOfC0a47KWmI6wlEeWX/MvL4UnaYvQdWU6myo/4AD8G+LutgALnaoIxIfV7Do
         ipdw==
X-Gm-Message-State: AOAM532W9P6KKDHuoNzrMkTRpf6yuAe3QAxGMDoVIHZE1LoM8X7t54BF
        aOpof037cSWrVjrH9QYa5pXTwUqhqtQ=
X-Google-Smtp-Source: ABdhPJwGflgTCP6xX2FeQtD03Qe0q2grXr+UHoo7MWxe4YhhyFUqVrICWPwJ5r2Fbpt1c+imCxe/zQ==
X-Received: by 2002:a05:6a00:14d4:: with SMTP id w20mr5438459pfu.199.1599322460201;
        Sat, 05 Sep 2020 09:14:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x185sm10277885pfc.188.2020.09.05.09.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 09:14:19 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: it87_wdt: add IT8784 ID
To:     Hanspeter Portner <dev@open-music-kontrollers.ch>,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <20200904211639.18787-1-dev@open-music-kontrollers.ch>
 <20200904211639.18787-2-dev@open-music-kontrollers.ch>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <b0b2ad3e-447f-4247-66ff-3277d3370996@roeck-us.net>
Date:   Sat, 5 Sep 2020 09:14:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904211639.18787-2-dev@open-music-kontrollers.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/4/20 2:16 PM, Hanspeter Portner wrote:
> IT8784 watchdog works as in IT878x
> 
> Tested on SHAREVDY K10 board.
> 
> Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/it87_wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index 2dac0ba551ce..2b4831842162 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -15,7 +15,7 @@
>   *	Support of the watchdog timers, which are available on
>   *	IT8607, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665, IT8686,
>   *	IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726, IT8728,
> - *	IT8772 and IT8783.
> + *	IT8772, IT8783 and IT8784.
>   */
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> @@ -68,6 +68,7 @@
>  #define IT8728_ID	0x8728
>  #define IT8772_ID	0x8772
>  #define IT8783_ID	0x8783
> +#define IT8784_ID	0x8784
>  #define IT8786_ID	0x8786
>  
>  /* GPIO Configuration Registers LDN=0x07 */
> @@ -297,6 +298,7 @@ static int __init it87_wdt_init(void)
>  	case IT8728_ID:
>  	case IT8772_ID:
>  	case IT8783_ID:
> +	case IT8784_ID:
>  	case IT8786_ID:
>  		max_units = 65535;
>  		break;
> 

