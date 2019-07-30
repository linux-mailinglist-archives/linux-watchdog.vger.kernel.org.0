Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADE4979EC7
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 04:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731265AbfG3CfH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 22:35:07 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39618 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731245AbfG3CfG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 22:35:06 -0400
Received: by mail-pf1-f193.google.com with SMTP id f17so25006685pfn.6;
        Mon, 29 Jul 2019 19:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mlwh30crVBnLbNh9X+zbIdeqfnMPnV8dXnmoYY7kniE=;
        b=J3Mj2u6m0LEC+pdyGJevYoc21SE2fTXsazpKYSQ1TmLqWkxSv0K+wZm3WdzXDD5BOG
         SrUWxtM6Pu4ReuTaEBJ97mYedREPqMWPwJftdfePrAJdzyaUMQ9nJbAzBDkhhlG6zZrP
         Olzn5ngbGoR8+H1ynH2ws/RHf4nirUoBdq2GGAAs4y7TZpEgnMXJR2qiqBQQwlvLOnBY
         5+TchRw/wVWrPU9T279yf5pL9vVOLVd5ggXQNiCroGoAhIaleUj7zSj85bCIEa4x4j0i
         jOjHZSk8HxaaWAbD/VeF6YUFhC5ew6EtbDmRQDASKs3BYdftwPppVbOTg4TSSe2D34wl
         X9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mlwh30crVBnLbNh9X+zbIdeqfnMPnV8dXnmoYY7kniE=;
        b=kM68nhoMFYmcN+SHUi0gLF1SsVte8rQeszU+7g9iKZHN6L5yLzk/e6B+k710wk6E1d
         ScvcLZyM8ZOUrs8kpeO1qg1g6JoCbrs5V454cD9Be2F29a3V5nn7FTnEXrmJRMvIYcwf
         +Ppnwipbx0ySnEvOSSG3LlTuVn+vw68wkoB0ugwGLMZX3B8bP8HgJehBx5ToCfEochjr
         SuNsrB3JEx0pujyn0CxKDS45B/SuoBqIVP4kgtn3dUd9zpHSBXlw0pZzq0dTk7s7Tjgt
         3CZU3/yGlZjJKKUKrhRkJlmKHKdBw1XAXs0mfcKhUPvS/bmrRIPBiGGc5RQdVCGuqBBK
         fbrw==
X-Gm-Message-State: APjAAAXCOBy1VLNSxzAUtjwSz9ZxhquAg/SNDxKOUoe8WZoHV7Jqph2R
        9q7qs1EGpmHlA7CGc7OMcmw=
X-Google-Smtp-Source: APXvYqzI3ZDoT4RrJbLun3wK7qvHZFDsP+mrUHgYSW6oQFrU1uCCaLRV4vvDVpFZWeqUvG/i7YyYiA==
X-Received: by 2002:a65:6216:: with SMTP id d22mr98999795pgv.404.1564454106123;
        Mon, 29 Jul 2019 19:35:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i9sm51642699pjj.2.2019.07.29.19.35.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 19:35:05 -0700 (PDT)
Subject: Re: [PATCH 3/4] watchdog device drivers:pc87413_wdt: Tidying up
 conversion of pc87413_wdt driver to common watchdog interface, removal of
 some stray nowayout parameters
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, andrianov@ispras.ru
References: <20190730021540.66579-1-mbalant3@gmail.com>
 <20190730021540.66579-3-mbalant3@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8cfb0a01-e51b-53f4-1311-f2e17d0e4049@roeck-us.net>
Date:   Mon, 29 Jul 2019 19:35:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730021540.66579-3-mbalant3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/29/19 7:15 PM, Mark Balantzyan wrote:
> There is a potential for the variable swc_base_addr in the call chain of the
> driver initialization function (init) to be used before initialization. This
> brought up the need for, by rewriting the driver to use the common watchdog
> interface, ensuring to have all resources in place. This patch addresses this
> need by rewriting into common watchdog interface utilization for the driver.
> 
> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
> 
> ---
>   drivers/watchdog/pc87413_wdt.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
> index a9070a22..bc6c4e19 100644
> --- a/drivers/watchdog/pc87413_wdt.c
> +++ b/drivers/watchdog/pc87413_wdt.c
> @@ -392,9 +392,3 @@ module_param(timeout, int, 0);
>   MODULE_PARM_DESC(timeout,
>   		"Watchdog timeout in minutes (default="
>   				__MODULE_STRING(DEFAULT_TIMEOUT) ").");
> -
> -module_param(nowayout, bool, 0);
> -MODULE_PARM_DESC(nowayout,watchdog_set_nowayout
> -		"Watchdog cannot be stopped once started (default="
> -				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> -
> 
Why would you no longer want this module parameter ?

You should keep it and call watchdog_set_nowayout(wdev, nowayout);
in the probe function.

Guenter

