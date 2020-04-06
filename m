Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 366361A0132
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Apr 2020 00:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgDFWnA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Apr 2020 18:43:00 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33207 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgDFWnA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Apr 2020 18:43:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id c138so511871pfc.0
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Apr 2020 15:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RDjcEx6ccXaZmMNdz82QJ8MnVEXDMY7qKwHQQPARDQk=;
        b=dgsUmkRpTJLIS3xANnGoh9gkD7SJBMrHgc1Z2xCtlnisizOHJ3yePnDUvEFhHSe8Yl
         RBXnvFOW4odF+Iyijj/kA0z1z/Xhugs+iI/1AAcE9h/8tQFneR45pEHWzEFHX7UQqcqr
         Z3XuWXG/0nWkK5u/WUpTdU0usL4yn8tr4QgSytpi0l/OzvoLzw1ENSPKFsPUWN1IZFyz
         vWWKD1D6zIr9nLG7skpZBY4s3z686oE2I7YzBV4KvmqDQgCwJNb7foeOXOYirdorRPiN
         7viMrgLvYzgo9Q1MFrp1NXjlFA9d+GLppzs5OENePHbqgZqBtRsAGOwieNYZQ4+oXmiS
         Puhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RDjcEx6ccXaZmMNdz82QJ8MnVEXDMY7qKwHQQPARDQk=;
        b=eENl8PcX9k0TnrobKsiP0l451YqObMEazW/FJ/+ziBcbuwxzJvNR0rORfvdTYjwyuC
         tEDQEFOCNu7GxCD0mOTF5bJOfD7yiWbBqasLU+x1RtBMVQx1n21y5tIcpfsOZnaDsVc9
         XSA39eej9Cl1ScmBxRCQCGVtVwt/ynzrdmkKMsuGo7tQiQ8xoZWzyxGZQdbuBX12BDSB
         OeVCUgO3tRcCprMdc/UPRg6Tzt++LaaODEQrgSZWuHmhhOnLLKp25H2K/nVSFfDB41Od
         Q/Mwf4g5b4PXUf2tjnFko+ooOntxqbrKFiA8iRUe0JwQqcbPhi74ke+phUAwf7W6k3d4
         /Q0w==
X-Gm-Message-State: AGi0PuY3CXNa54UExkM8kK5XtPnAkz6IL+HwVPR8ElHnWgorSxEUKJGD
        AiTZJjSyBxupz5VKveu8RNK1pJHf
X-Google-Smtp-Source: APiQypJMLmy5B9oKIUjmW1XBQsps1L0FsKUX1ENDmgfRfT0c9gF8SUf0lFaaTQw06lvvwHYLjOxPew==
X-Received: by 2002:a63:29c1:: with SMTP id p184mr1349516pgp.37.1586212977276;
        Mon, 06 Apr 2020 15:42:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3sm602845pjz.2.2020.04.06.15.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 15:42:56 -0700 (PDT)
Subject: Re: [PATCH] drivers: watchdog: ts72xx_wdt: fix build error
To:     Shyam Saini <mayhs11saini@gmail.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org,
        jerome.oufella@savoirfairelinux.com,
        Shyam Saini <shyam.saini@savoirfairelinux.com>
References: <20200406215008.30468-1-shyam.saini@savoirfairelinux.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <54a81d98-d43e-da2d-ecec-1ba78ab01eda@roeck-us.net>
Date:   Mon, 6 Apr 2020 15:42:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200406215008.30468-1-shyam.saini@savoirfairelinux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/6/20 2:50 PM, Shyam Saini wrote:
> If TS72XX_WATCHDOG is y and WATCHDOG_CORE is not enabled or its m,
> then building fails:
> 
> drivers/watchdog/ts72xx_wdt.o: in function `ts72xx_wdt_probe':
> 	ts72xx_wdt.c:(.text+0x14c): undefined reference to \
> 	`watchdog_init_timeout'
> 	ts72xx_wdt.c:(.text+0x15c): undefined reference to \
> 	`devm_watchdog_register_device'
> 
> Select WATCHDOG_CORE to fix this.
> 
> Signed-off-by: Shyam Saini <shyam.saini@savoirfairelinux.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index cec868f8db3f..62da6e903336 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -669,6 +669,7 @@ config TS4800_WATCHDOG
>  config TS72XX_WATCHDOG
>  	tristate "TS-72XX SBC Watchdog"
>  	depends on MACH_TS72XX || COMPILE_TEST
> +	select WATCHDOG_CORE
>  	help
>  	  Technologic Systems TS-7200, TS-7250 and TS-7260 boards have
>  	  watchdog timer implemented in a external CPLD chip. Say Y here
> 

