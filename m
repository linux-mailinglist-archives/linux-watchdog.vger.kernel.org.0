Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98405A2C12
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Aug 2022 18:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242917AbiHZQMl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Aug 2022 12:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241676AbiHZQMk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Aug 2022 12:12:40 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DF6B1DD
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 09:12:38 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id f4so1772001pgc.12
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 09:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=vy9ZtUAXnnCo482iCSX8U13zgx5iwtPA+G7sp79p0UI=;
        b=S/OUxlbREoZczA1LGbTubLhxERr4ukMsJkMNkh10GJslySmNTlPGJQPgoq9yPk90x7
         h1GpvRi250lQ1vbeWNGuG6pf1t/qh2TaMJL1ebT9q/yG5xAT5TdYAcDHUch57x0fSSuh
         464ILWiBHv4AkFUvNdnOqF1Wj7+xAF1TZaZT60ds4G/4N9hyBtlTJ5CQYgV01rdAotLi
         Y4Oam8oBcbG4Zkdwm7gJKaiIJy+g/AlV1UB44a9PQshPXjrWBbu6CVdiLNZKIEmraObG
         Ta0j8wMSRssHm5CZeH742PxVYWpc/NhMimAddKiijRvd0oODz2A5276zbexQW+yGfO/w
         Rx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=vy9ZtUAXnnCo482iCSX8U13zgx5iwtPA+G7sp79p0UI=;
        b=IgVJcUpWPFVGc2zyIhvBWAyFkv+CIv6eFkVCAqOiYfvAxqKbozp8a8VPM0oh3KQqpm
         1A4nm3wHp89ZQVql31UIsG3SYqCI1gn0QVIXM4WcVZsRKD8wHnKu3PsehFC1P1zdopnp
         rsVOonC2GPA1IJHyG9nKRmcw7LS9HWegcjarpdshDbCSBawka0o0cVbVhRGZ2M32tvOX
         nnRuRBVx9o3a4Ro+VI40OgsEGAe3fF9QMH2KMA3W9graZXGAyQxROTOeg9aeKnk3oLSd
         D+7Fku1slRubJtF4FBS8E3WEDVFiuYcFumBTkL4/UhVJ84vith5hz9bbIuLE4k6pHVec
         /rLg==
X-Gm-Message-State: ACgBeo03/+GUuNzkxDp8TV02QLVE2firSZr2IiwjIP1JbSlxAXLEstCp
        QlKbd2WwyIyLKaoQN9XxfyStRZnRLK6Ieg==
X-Google-Smtp-Source: AA6agR7UlRtF3F9FfjCCad/j+Sy7S+LOqcsVTj+1VuSqdZHB55N4Nfyb6V73IHt1+JNC54pIarJxCw==
X-Received: by 2002:a63:1e1b:0:b0:42b:5561:529e with SMTP id e27-20020a631e1b000000b0042b5561529emr3773336pge.514.1661530358031;
        Fri, 26 Aug 2022 09:12:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902784600b00168dadc7354sm1790140pln.78.2022.08.26.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 09:12:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 26 Aug 2022 09:12:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sergei Antonov <saproj@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: add _restart() function
Message-ID: <20220826161235.GA2900848@roeck-us.net>
References: <20220826135638.3751835-1-saproj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826135638.3751835-1-saproj@gmail.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 26, 2022 at 04:56:38PM +0300, Sergei Antonov wrote:
> Add a missing _restart function to watchdog_ops.

The restart function isn't "missing" because it is optional.

> FTWDT010 resets system when it is started with timeout = 0.
> 
> Signed-off-by: Sergei Antonov <saproj@gmail.com>
> ---
>  drivers/watchdog/ftwdt010_wdt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
> index 21dcc7765688..9eaaaca1094d 100644
> --- a/drivers/watchdog/ftwdt010_wdt.c
> +++ b/drivers/watchdog/ftwdt010_wdt.c
> @@ -93,6 +93,13 @@ static int ftwdt010_wdt_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
> +				unsigned long action, void *data)
> +{
> +	wdd->timeout = 0;
> +	return ftwdt010_wdt_start(wdd);

While technically correct, this crates the impression that
ftwdt010_wdt_start() might return an error - which it never does.
Given that, I would prefer
	ftwdt010_wdt_start(wdd);
	return 0;

Also, did you make sure that interrupt support does not interfer with
restart ? We don't want to get an interrupt when the watchdog fires due
to a call to the restart handler.

Thanks,
Guenter

> +}
> +
>  static irqreturn_t ftwdt010_wdt_interrupt(int irq, void *data)
>  {
>  	struct ftwdt010_wdt *gwdt = data;
> @@ -107,6 +114,7 @@ static const struct watchdog_ops ftwdt010_wdt_ops = {
>  	.stop		= ftwdt010_wdt_stop,
>  	.ping		= ftwdt010_wdt_ping,
>  	.set_timeout	= ftwdt010_wdt_set_timeout,
> +	.restart	= ftwdt010_wdt_restart,
>  	.owner		= THIS_MODULE,
>  };
>  
> -- 
> 2.34.1
> 
