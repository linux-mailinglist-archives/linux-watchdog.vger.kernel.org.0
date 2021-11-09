Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CA344A808
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 08:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236160AbhKIICn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 03:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236082AbhKIICm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 03:02:42 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E30C061764;
        Mon,  8 Nov 2021 23:59:57 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id i11so10595608ilv.13;
        Mon, 08 Nov 2021 23:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iGTLUmZFXXi8TM5i97jxZTDNrNCsnanJmw2eZUcoYuo=;
        b=Mmz2mTVK2B6vz/4KEGe+N1RhRqNQK5ZN7luaXzJDbU6gddP/cEKQiM9rQeFq7D3sUd
         VBndsUntcjqvVqRVWkzoPIbDb3EsUIG9B7uSlf0cgMb2zpch5ia1Vt5JD/TooD+UzOZd
         KVy2NND5QEIvRxJfbdpcm0i3kwuchsBYADCUVtxlk9Oyo5W9d0SMnge8BHDoDyGe+z0E
         ttwJHTNQVFP1YxPML5iMMWSM1Pktx6K1vYOk9APdtEjp0wGxF6PUJvm3psLadF5wunnH
         49H+MUW9QQkU3w4ZslNOIzFpKR/H2RG9gQefLCrJf3q6pIOTUf6BlKVv6sWjF3nvcRv3
         nB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iGTLUmZFXXi8TM5i97jxZTDNrNCsnanJmw2eZUcoYuo=;
        b=fdKQBPu0o0jYlk0XS4N/NZSYmRMSkQvuSByqJangvEr8zdET1HPPu4cxRqSj2vU8Sz
         mhaKcU60ROcp9co6OkDlwOTcehBRVVG/SOsT3nhGK3pIg8+M+5PrhXHuxYySEwasMLDf
         zz7BMsvUrFhFO1lyNb9U+V1iT4cxU1LK4gw1LX/WWseL9TdTh7OIgCnxFw3TIvClZreI
         H7CKD49ZKv8/0AUJiBSDAQgvqwX88U1XC73TvfRwOfsMuVXECME2ZvkhOkxsWKQA0+Ju
         uFtqLKsum6fA1aOBbgxF5GJad+DfrF4U9r0jWdYlmLQlWOrTUZWd0Iwe+R4UI6dJTzKh
         HjBg==
X-Gm-Message-State: AOAM532b2m7MR2z7YX3qjzKX2iaANBUlkDv4mlqelQklJ4uEHrjK3GD1
        Fk7tKYJ3dsZm8jwDFyb+2lP87ZCfQVNGcYOpD7s=
X-Google-Smtp-Source: ABdhPJw2TWFh/34/tIN/mpZc8hZh2FjBcNIqCxxOwKS7eIeYvSqIuNEpPcJHt5ssTq+ZApXvVAd/8WM4QDc8HTZEttM=
X-Received: by 2002:a05:6e02:b42:: with SMTP id f2mr3874183ilu.93.1636444796818;
 Mon, 08 Nov 2021 23:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com> <20210730041355.2810397-4-art@khadas.com>
In-Reply-To: <20210730041355.2810397-4-art@khadas.com>
From:   Art Nikpal <email2tema@gmail.com>
Date:   Tue, 9 Nov 2021 15:59:46 +0800
Message-ID: <CAKaHn9KxZDAHdKGZg3-Pi3jZO5E3knESHCFjgaV09u5QYe074A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
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
> Remove watchdog_stop_on_reboot()
>
> Meson platform still have some hardware drivers problems for some
> configurations which can freeze device on shutdown/reboot stage and i
> think better to have reboot warranty by default.
>
> I feel that it is important to keep the watchdog running during the
> reboot sequence, in the event that an abnormal driver freezes the reboot
> process.
>
> This is my personal opinion and I hope the driver authors will agree
> with my proposal, or just ignore this commit if not.
>
> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
>
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 945f5e65db57..d3c9e2f6e63b 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>
>         meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>
> -       watchdog_stop_on_reboot(&data->wdt_dev);
>         return devm_watchdog_register_device(dev, &data->wdt_dev);
>  }
>
> --
> 2.25.1
>
