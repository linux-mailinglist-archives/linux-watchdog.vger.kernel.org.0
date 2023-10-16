Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 993C87CA536
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Oct 2023 12:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjJPKWp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 16 Oct 2023 06:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232327AbjJPKWo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 16 Oct 2023 06:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAE1AC
        for <linux-watchdog@vger.kernel.org>; Mon, 16 Oct 2023 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697451717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xGjF9yN2JU4rsRBxh81TQLA4dxrIk2DTJW01EJMcc44=;
        b=PhI+LH2ZghfR9VOKRJz0OFXq2n44jSGEozg7YxCFrKyTCZMqKwt9XsQB6LLKd2dHQpG8pG
        Pyp64WhocfEfvL0ZNnZyfCm7VRQ0dnqpWW7LxYt8ohkwCNacaR5dH8HjMaHAMX+/0oQjLT
        mXZA5dF/RgoEjZujWqHngzxL+HbuOxA=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-rzazXbIMPQSoMgUMKeRC-g-1; Mon, 16 Oct 2023 06:21:53 -0400
X-MC-Unique: rzazXbIMPQSoMgUMKeRC-g-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-55afcc54d55so4183072a12.0
        for <linux-watchdog@vger.kernel.org>; Mon, 16 Oct 2023 03:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697451712; x=1698056512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGjF9yN2JU4rsRBxh81TQLA4dxrIk2DTJW01EJMcc44=;
        b=FSM9sFhkeYjLzqfjqsIbK6I+g+R+qzJxCL8oAJ8OTntvnMEGpQc71a9/Z7jVFW7+ub
         Ot03gA/LnVsevnd4A7QB+ouYEa7EZbscri7P4AzqTlvm4WPujMSIdUX/7hXndK86tcyh
         /29HcuQlCkO6D7EIcs5nXeG1cqTJhK+EfGdIJpnwz/1n34S/cUtsq28APPDNEx189hdR
         ZH2XFaatyTjloSC1wSUuvuKNZ5WoWR8fSnP45PsL0bttAhBTWVG7yeMiJAiWoTtkSR1g
         ShomYwXQEZmPVv8nD+2TxVs14zGWnHXFpU55XVxd2AKfxZ8MKTS9pZKQ+r9uMOTJUSyb
         ynFQ==
X-Gm-Message-State: AOJu0YxQwp77YWHWKNWdBZIS7YiKNPGM6fQ7hyuo1PvoGLW1lGrmp3IH
        Zf5TVCqmP+S1LgSkOiHKD79lSzenmn4hxYORcLGsH5zMFxewxG7DdQQ48NIzasKsXjq8xGR4KBG
        WiiACTmdE/2Q9Z3QYXhzQnOrLqyqPsCuXvg9K0o+hEu0=
X-Received: by 2002:a17:90b:1bcf:b0:27d:5568:e867 with SMTP id oa15-20020a17090b1bcf00b0027d5568e867mr9777230pjb.9.1697451712631;
        Mon, 16 Oct 2023 03:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh4w2kfgA6irj9S5H8CD7jiE2fT+aEXo0NBodAdw0sHrdeKFRvizHig84xpQz0v52lUAoqIUCPBOCW+1adeO8=
X-Received: by 2002:a17:90b:1bcf:b0:27d:5568:e867 with SMTP id
 oa15-20020a17090b1bcf00b0027d5568e867mr9777213pjb.9.1697451712327; Mon, 16
 Oct 2023 03:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
In-Reply-To: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Mon, 16 Oct 2023 11:21:16 +0100
Message-ID: <CAOgh=Fy-=wJGcLOp1kn+Zd0H0+KysCQK3a7CwFyZLLvZ5W2Ekw@mail.gmail.com>
Subject: Re: [PATCH v2] watchdog: apple: Deactivate on suspend
To:     j@jannau.net
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 16 Oct 2023 at 08:05, Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> The watchdog remains active after putting the system into suspend. Add
> PM callbacks to deactivate the watchdog on suspend an re-activate it on
> resume.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
> Changes in v2:
> - use DEFINE_SIMPLE_DEV_PM_OPS
> - Link to v1: https://lore.kernel.org/r/20230930-apple-watchdog-suspend-v1-1-1998c0be9fd7@jannau.net
> ---
>  drivers/watchdog/apple_wdt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index eddeb0fede89..d4f739932f0b 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -173,6 +173,8 @@ static int apple_wdt_probe(struct platform_device *pdev)
>         if (!wdt->clk_rate)
>                 return -EINVAL;
>
> +       platform_set_drvdata(pdev, wdt);
> +
>         wdt->wdd.ops = &apple_wdt_ops;
>         wdt->wdd.info = &apple_wdt_info;
>         wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
> @@ -190,6 +192,28 @@ static int apple_wdt_probe(struct platform_device *pdev)
>         return devm_watchdog_register_device(dev, &wdt->wdd);
>  }
>
> +static int apple_wdt_resume(struct device *dev)
> +{
> +       struct apple_wdt *wdt = dev_get_drvdata(dev);
> +
> +       if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +               apple_wdt_start(&wdt->wdd);
> +
> +       return 0;
> +}
> +
> +static int apple_wdt_suspend(struct device *dev)
> +{
> +       struct apple_wdt *wdt = dev_get_drvdata(dev);
> +
> +       if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +               apple_wdt_stop(&wdt->wdd);
> +
> +       return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
> +
>  static const struct of_device_id apple_wdt_of_match[] = {
>         { .compatible = "apple,wdt" },
>         {},
> @@ -200,6 +224,7 @@ static struct platform_driver apple_wdt_driver = {
>         .driver = {
>                 .name = "apple-watchdog",
>                 .of_match_table = apple_wdt_of_match,
> +               .pm = pm_sleep_ptr(&apple_wdt_pm_ops),
>         },
>         .probe = apple_wdt_probe,
>  };
>
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20230930-apple-watchdog-suspend-7f73831130fb
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

