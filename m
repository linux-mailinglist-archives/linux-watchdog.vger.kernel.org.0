Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761A944A806
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 08:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbhKIICX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 03:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236082AbhKIICX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 03:02:23 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91A6C061764;
        Mon,  8 Nov 2021 23:59:37 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id k22so8344229iol.13;
        Mon, 08 Nov 2021 23:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hmUXkB89ButE1Z765XTXNCp1u56Qd6wf2aziMZ8NFk0=;
        b=fPJfNMm7/gUHIcEaWXU0OyZFNfTULORu2U0KvhHno5JtoDHlzPuUJjMj4GVCujegFG
         BdKQgfjyqgTKSAYS79g/RqXm+G1PzsSt8gTyMXYlXmyezGwJa0qlXIAmMEOPmFphTueV
         JFzA+gRzqP7Ewtcy1AXSZoN+DauAGj+uSKT/QHHJ6Tkz+ky0xhgWeYKJHl7z7jiux0Zo
         ybetTnGpNrJEhscCYcb0R+W1iK4UKpY6hQhOWSSDWEOCNkVLnotlFtYvhM2YORJWUM9h
         HnIDgXiJq0MnnXUhsHr69QFe3CJD5VSHXmjKJMmMMR/kcZpi2ukQGLbNbThwHBe6tu/K
         z1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hmUXkB89ButE1Z765XTXNCp1u56Qd6wf2aziMZ8NFk0=;
        b=qRnaX98V13wt2N56LGlksxuNqTZ/tk9ogBjk1gy7SBWievbYVgvzL1pOYsu2j/UoX2
         gJ1mu5V+QbaT/7uRlUhK3vqgy12zVJfF4pb5CYPYWogUUXjDpRSVf+kZAW6bu+D5W4wo
         2Mf85nMQVewvh/N6TlIcscKxT8fFhgbsDMC64gxSr073x88JauBcTEMvTbGaMe3TKwMm
         +mwbtIHL5S3Yt3V8WF2KAhTQ0POIGRdmqkzsO/uEIfKQ50nvChWxi0x6m1K7wJ8n119o
         PdtVxGgdyN3YPse07g8G8bq1QeICa4CZcSuNostM8SCuK2uj06mfBBq59vTRDWIvtDCt
         jW3w==
X-Gm-Message-State: AOAM530dL9V9w7GJQDZn5m7wHNvC+VBH0fZhaWZ0v1C3m0BkFdXBu8XS
        o9pB9bfuEIyMbiYUtJCTteC+Ops8S+JnJ2aQEYw=
X-Google-Smtp-Source: ABdhPJys23Mg+2iXv/lIUi7n2/IVdgSVVAilVV/JSel59JmYZMTCPc+6nhl9NIQxciF+CVnJrp0huAqMosOzfu+wt0U=
X-Received: by 2002:a05:6638:2650:: with SMTP id n16mr3998715jat.72.1636444777348;
 Mon, 08 Nov 2021 23:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com> <20210730041355.2810397-3-art@khadas.com>
In-Reply-To: <20210730041355.2810397-3-art@khadas.com>
From:   Art Nikpal <email2tema@gmail.com>
Date:   Tue, 9 Nov 2021 15:59:26 +0800
Message-ID: <CAKaHn9+MsrXOObVqb53gwGdoUwzRsaxUMhrDMhiM6wkwSFJXmA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] watchdog: meson_gxbb_wdt: add timeout parameter
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     wim@linux-watchdog.org, Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
        Gouwa Wang <gouwa@khadas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

hi Guenter Roeck
why still not merged to upstream ?

On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
>
> Add timeout module parameter
>
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5aebc3a09652..945f5e65db57 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
>                  __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>
> +static unsigned int timeout;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +                __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>  struct meson_gxbb_wdt {
>         void __iomem *reg_base;
>         struct watchdog_device wdt_dev;
> @@ -180,6 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>         data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>         data->wdt_dev.min_timeout = 1;
>         data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +       watchdog_init_timeout(&data->wdt_dev, timeout, dev);
>         watchdog_set_nowayout(&data->wdt_dev, nowayout);
>         watchdog_set_drvdata(&data->wdt_dev, data);
>
> --
> 2.25.1
>
