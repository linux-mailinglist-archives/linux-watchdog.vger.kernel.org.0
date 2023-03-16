Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052BA6BDCAF
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Mar 2023 00:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjCPXIk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Mar 2023 19:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjCPXIj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Mar 2023 19:08:39 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9475F534
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Mar 2023 16:08:37 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id f14so1534647iow.5
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Mar 2023 16:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679008117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEYDoZ7XI1/B9bySNpv6QF4LgT60qFX1T+p0VsFiFUg=;
        b=XVNorAO3igbPFQll4QBrBhyHn8AQ24d9oJcovuUb/EpfMaY5pRqhkOLHUMWfPQa3hc
         Q0ux6GfSdnkSycnLQpPnJmQk8Iz/+1EeXqS8HN9MvmZ1mGDXLCm144QV1lQ43/dtmeSi
         BF9Y47BicigJwD4zgx8dZSrwe5Hbs41JSHSZSTqX7Coc/7o6GVONd1PY75r/BnLi1mNi
         V6GO5hARQEa/puaWJ0iQEhTOAJwCbsaTgggJGhog9Dos149eQ+yPhQFcxz8nfP63u5NT
         OdVnSeDAtl63+dRprqp6M8CWrnYbT+zLYG5JXvh8ULo1P74FwnmudwK7CHmfZ58x/Wc/
         VeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679008117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEYDoZ7XI1/B9bySNpv6QF4LgT60qFX1T+p0VsFiFUg=;
        b=tPGsOabjTCZO1cejpf8GDcraarfCqDpEuK9ziacGIgYMUr1MR3eyPci/bhH96gHykg
         rJw6e6JXnnQESwXd4kzmTPv8FC0Od+xHgXCCuNvJj2o3zpLoRgnyJtXH9I27vFP/aV/2
         CzmWAZDq0644wU2UaKF5MHnFEKGPB50AJ6fRK7izb0hDr9Ebe/Kq8wLAiClXRLkJUYmw
         5XQ18JyJ3/C8v27ZO1oXkAOutr/gULOENPI3vRv3EjxLRWGpzA1CKCGXUIqH2gMjsOT9
         o1gFP/i3z5V4rr79krnRuqEI3MBn0D/uZanojNINCvYtyu+uTBUh9x2ezKjuYVpy3I3W
         Fi1g==
X-Gm-Message-State: AO0yUKUr/Twxe7xkREKnZM5grnmkjZN18VVdqxaCfQMk0sTHkVVbgsqR
        WcPIY9SL+AvoTCVeEP5QLBUCWwWrogg=
X-Google-Smtp-Source: AK7set/Jbi2LWtgnZmmh0JfuQmiZfcsLXCMbTCpK+FVUv92WAGzIGG052rVy2k4AcxxEQa+1nSBuIg==
X-Received: by 2002:a6b:ea18:0:b0:752:ecb4:cffa with SMTP id m24-20020a6bea18000000b00752ecb4cffamr490615ioc.6.1679008117287;
        Thu, 16 Mar 2023 16:08:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id az42-20020a05663841aa00b00401b9f59475sm176875jab.107.2023.03.16.16.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 16:08:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 16 Mar 2023 16:08:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Gregory Oakes <gregory.oakes@amd.com>
Cc:     linux-watchdog@vger.kernel.org, terry.bowman@amd.com
Subject: Re: [PATCH v2] watchdog: sp5100_tco: Immediately trigger upon
 starting.
Message-ID: <b05cdf9b-38bd-4942-8a4b-f37ffeb14004@roeck-us.net>
References: <20230316201312.17538-1-gregory.oakes@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316201312.17538-1-gregory.oakes@amd.com>
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

On Thu, Mar 16, 2023 at 03:13:12PM -0500, Gregory Oakes wrote:
> The watchdog countdown is supposed to begin when the device file is
> opened. Instead, it would begin countdown upon the first write to or
> close of the device file. Now, the ping operation is called within the
> start operation which ensures the countdown begins. From experimenation,
> it does not appear possible to do this with a single write including
> both the start bit and the trigger bit. So, it is done as two distinct
> writes.
> 
> Signed-off-by: Gregory Oakes <gregory.oakes@amd.com>

In the future, please remember to provide change logs.
Fortunately I still remember v1, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/watchdog/sp5100_tco.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index fb426b7d81da..14f8d8d90920 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -115,6 +115,10 @@ static int tco_timer_start(struct watchdog_device *wdd)
>  	val |= SP5100_WDT_START_STOP_BIT;
>  	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
>  
> +	/* This must be a distinct write. */
> +	val |= SP5100_WDT_TRIGGER_BIT;
> +	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
> +
>  	return 0;
>  }
>  
> -- 
> 2.39.1
> 
