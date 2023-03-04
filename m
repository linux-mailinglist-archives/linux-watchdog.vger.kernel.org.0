Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B10D6AAB84
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjCDRPB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:15:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjCDRPA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:15:00 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9C1113E7
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:14:59 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id i12so3854368ila.5
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677950099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChmJfkOhxYgj+wVxzLpVE5rj9ox+LfnBzqQoePsRvdg=;
        b=O4TRIqXfRQAJBR3Dgv9pKEy2nMroDnmsaqLoDWkh48eQWHX8EEOHLqoLuNfrW+EVs3
         +D+16tI5eTTvSkq3+hfOjovZ4G1eJKElDzIg3pV9UefI+8zVby9pIz3vbpVxqlMJxZs0
         N86zBP6II9KXhZhPOjG4N0ET5DYGOUi8Rn2DfMPCGIZSoRkjFO33bCAiQ/5Dr/PQ/Tf7
         dQpcjVHA96qyoJyw673YuqsV1aflLLO4bk4Oppl7XwtNT7r4uYU1Krpf+tbSzSYJ62ya
         /otxFTprY3e2ddz0nL94fWmo1ekq31AkItF0VDjVG+heHFsRJHLqzTMpsTxRz5/IamW1
         PS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677950099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ChmJfkOhxYgj+wVxzLpVE5rj9ox+LfnBzqQoePsRvdg=;
        b=cIqgiyC1uGLMkzEZ/IETfmbtTOmAlxws01BymWbyNSgPs+WET9q/CZK2eUN0EcaqNn
         hMzOYUl/idi7x8GbTdGuWsNeyJLrqpms++syXA1ll7Be6MoCIuIQs6A5jUDKwAKICxWO
         uELtTTbUlwDqw8djK9D/b0ArXotwh5I5E0XGC8nDqWZFSdacPWOhV6NXkFxYwj/MIB1d
         /QuYnhQK7J8yRIVfrNCEzIaeCtdNJA51aMZcdkO3pU3DiV4qA9i78E2780z4MU/qtaFY
         8tnLvJXRB8XOtMW0927DMZofEpF29PYQU+CyZRs5hKfmH0PSGyT/EH8IQHNTFbsKTs+a
         ODSg==
X-Gm-Message-State: AO0yUKX4nCzn7jIsA1d7br6BWqRE82lVh1V+j5wPVmsRvXulk7hfCLn9
        EKxeU1PMvN2u3rYsfeQ4C1v2YxvwOkI=
X-Google-Smtp-Source: AK7set+SvZHZ8L8afmw8Qp/RxWZLN+gSrOTpha0YKDB43AX9AyYUuvfnyxPKkcJtSmgxSnUSTbdpIw==
X-Received: by 2002:a05:6e02:1e06:b0:315:5467:4a3f with SMTP id g6-20020a056e021e0600b0031554674a3fmr5237888ila.30.1677950099141;
        Sat, 04 Mar 2023 09:14:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h27-20020a056638063b00b003c449a192cdsm1662694jar.73.2023.03.04.09.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:14:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:14:57 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 34/34] watchdog: wm8350: Convert to platform remove
 callback returning void
Message-ID: <7db0e8ab-5fd2-416d-a4c7-579249aded2a@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-35-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-35-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 03, 2023 at 10:37:16PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/watchdog/wm8350_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/wm8350_wdt.c b/drivers/watchdog/wm8350_wdt.c
> index 33c62d51f00a..febda195aed2 100644
> --- a/drivers/watchdog/wm8350_wdt.c
> +++ b/drivers/watchdog/wm8350_wdt.c
> @@ -156,15 +156,14 @@ static int wm8350_wdt_probe(struct platform_device *pdev)
>  	return watchdog_register_device(&wm8350_wdt);
>  }
>  
> -static int wm8350_wdt_remove(struct platform_device *pdev)
> +static void wm8350_wdt_remove(struct platform_device *pdev)
>  {
>  	watchdog_unregister_device(&wm8350_wdt);
> -	return 0;
>  }

Again, just call devm_watchdog_register_device() in the probe function
and drop the remove function entirely.

Thanks,
Guenter

>  
>  static struct platform_driver wm8350_wdt_driver = {
>  	.probe = wm8350_wdt_probe,
> -	.remove = wm8350_wdt_remove,
> +	.remove_new = wm8350_wdt_remove,
>  	.driver = {
>  		.name = "wm8350-wdt",
>  	},
> -- 
> 2.39.1
> 
