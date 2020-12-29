Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B505D2E7215
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Dec 2020 17:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgL2QFG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Dec 2020 11:05:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgL2QFG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Dec 2020 11:05:06 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 422D4C0613D6
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Dec 2020 08:04:26 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 11so12165157oty.9
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Dec 2020 08:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QKMo0gRE9prc0FoEANAYxq5xXD1E1hRxEIQqLECAbNs=;
        b=mV4Jc4pWtSGgFAweBpkcgFvp4Se3Euxh/TIXSH3JpwSHu72JM2k3NBrCPhTKZv/u2R
         rkKfCl8BjvmskIHLsym7qj0ae7uMMjdckKmuJtJtcihSo+P3QzeW4g1+V7gPujsUQcmv
         rFj1Sr7hywkP73cgiYU4z7U3fNNjkuPQbakVLSDIeRVjFUqj/Al/BEHgoR2gLS0n5jMA
         ctueP2SXVDakLSe1R+f85Ny+NuSfI9xY/x9zn+lgrZI6uHJX4PczfTmEaVOSKDJhlEjj
         YMwudD397l4OdUGAhiNGJuM8Dvvsh92hOJXiy059iuB0gaYqCBu6XGD42yYCm7lGWI5U
         9JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QKMo0gRE9prc0FoEANAYxq5xXD1E1hRxEIQqLECAbNs=;
        b=jHEzD2YG+xh06O6S8WlFLKXN7BJ/uBWeptZWgJhQoc/zgQyOTj9AEMJ6mx+fd6yf1L
         dKf50WsJLYqVTQWFEFBgaNwsUS/A6Y4j1PVD3WrfpoxAERIiAtJwt9ELy4aQQKd6Hv/f
         dyfFX9tVhJ03b51xIgLI2MwdnPrBLyX6EoPOLeJFLJ4Q81l26rEYhKlN/GF2GFfN+lPK
         xLzo3tune1RoIKdQTfjJdO7oUdecHYFMgdbfxIZZpz3U38IvcByzEIsf1eWt/FALbJ9w
         Ct7pGl8BXYrNrVDZ+cQG7qGqid4aqkqpRAu9KCG5HjvHZInGPLIDDQfGh4pKde82eWju
         T9GQ==
X-Gm-Message-State: AOAM532T76UOb5uOTvVbl2fOsfB27/h3q+9KovRfVnB+vKoJCnWjXerM
        TlxzYaCloc+iQOj9TkNgf/bF8OOylBE=
X-Google-Smtp-Source: ABdhPJzcI1JZjb+OJ0u/NpNoVtdtodgnk2njIultqO367FUxXe4BBZPpEKxP200u6UGVxTTMh4YYfA==
X-Received: by 2002:a05:6830:1253:: with SMTP id s19mr35218737otp.270.1609257865381;
        Tue, 29 Dec 2020 08:04:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f67sm9896510otb.60.2020.12.29.08.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Dec 2020 08:04:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: use boolean value when setting nowayout
To:     Tian Tao <tiantao6@hisilicon.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <1609240776-39726-1-git-send-email-tiantao6@hisilicon.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <0e57aa94-6353-9e87-f8f8-41bab64f6d51@roeck-us.net>
Date:   Tue, 29 Dec 2020 08:04:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1609240776-39726-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/29/20 3:19 AM, Tian Tao wrote:
> Fixes coccicheck warnings:
> drivers/watchdog/alim7101_wdt.c:390:2-10: WARNING: Assignment of 0/1 to
> bool variable
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/watchdog/alim7101_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/alim7101_wdt.c b/drivers/watchdog/alim7101_wdt.c
> index 4ff7f5a..951449e 100644
> --- a/drivers/watchdog/alim7101_wdt.c
> +++ b/drivers/watchdog/alim7101_wdt.c
> @@ -387,7 +387,7 @@ static int __init alim7101_wdt_init(void)
>  			pr_info("Detected old alim7101 revision 'a1d'.  If this is a cobalt board, set the 'use_gpio' module parameter.\n");
>  			goto err_out;
>  		}
> -		nowayout = 1;
> +		nowayout = true;
>  	} else if ((tmp & 0x1e) != 0x12 && (tmp & 0x1e) != 0x00) {
>  		pr_info("ALi 1543 South-Bridge does not have the correct revision number (???1001?) - WDT not set\n");
>  		goto err_out;
> 

This driver would benefit from conversion to use the watchdog subsystem,
but it doesn't benefit from cosmetic changes. For the record, I am not
going to accept cosmetic changes to watchdog drivers unless they use
the watchdog subsystem.

As a general comment, please list the driver name in the subject of your
patches.

Thanks,
Guenter
