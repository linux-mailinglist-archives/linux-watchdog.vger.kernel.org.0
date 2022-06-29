Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C933B5601E6
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 16:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbiF2OEM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 10:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbiF2OEJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 10:04:09 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D021A06C
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 07:04:08 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id m2so14230269plx.3
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EdrRI7wdzcTMpJgXQkU/GBqrnQC4E3t/koP9BuwI4hk=;
        b=Hq+3CZOcQWTta/OuScGhL1xbqamKUTJbRiqbNVIvykzRrTCR/Y6C5Sc4zCunkzNdA+
         1nR2a1pdqSg+1QtWDu91e2oV0Ey+3fo9UcH00NMvkRgzBLXAukXkTUq+QeSXUZAveKx4
         W4+rbEg4KVn9UFMOMmHUBYo6pF8A4rzWIBU3okIZsd/uKL1J442GzYDxTJQcCdnqx2ZP
         Rtj6eYXyAfIDLqsCY8QNEOR+iCIY2J5dH5kEH/fYp56Cbr7+f6rBj6UkRqR8zAXdtVQn
         phy2nut5GdYAKnNKxXQ/QtHc8QZZelMQhhn/HPe0c8u2ZQkCC3Y8jFkJRS+2gvjJSgF1
         BKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EdrRI7wdzcTMpJgXQkU/GBqrnQC4E3t/koP9BuwI4hk=;
        b=l0d0fRDX73WMZDfXzSZdeInf9PBYtZtHoFGcG1VfTNccxCw9BBCrs5shWAXPmEHxB3
         qPRVKfcn3UK3Su2lBQp5GNM9gsTWiWA0n3INJUfqs3vd0cxZbmjzIiYqvQpGCCYKqe9w
         RD5Iyuk0X1Y12xxMSIXVjcupZwm6JorwiWLC0vpyLBldMMXNBl9szeNP5iUlob9zv7B/
         nkKLtTF2mgPhejRRO8JfS8fAM/vf4vAkprQW0M/EPYq5p2ksUbbw8fA7rY7Szmqfl3Mv
         VQUKXeLgPQ0hbSPvAJ/PnMjBJxlFxOgcLtO24EMJoZpaTmLEsFI7AaVjLoW5ZCxVPdZP
         01bA==
X-Gm-Message-State: AJIora9ZdTCAeKwThriMU9anwRNO499EdVzn2VpXYPFvlSp+4oQULp6H
        jDPurtGL27VIwvaxLQPHmvCV4ZHmMaiu+UhXq93dOzxkru/6qw==
X-Google-Smtp-Source: AGRyM1tD3gOPXMBjoTZ9lNpZVsjL5tP7UGhJEIGW47E5nFXRUEUZUSIitGuFnNEgEDESNFahoUcNaTwXSgQ5nAub0Jk=
X-Received: by 2002:a17:90a:4209:b0:1df:b907:ed3d with SMTP id
 o9-20020a17090a420900b001dfb907ed3dmr4064205pjg.40.1656511447530; Wed, 29 Jun
 2022 07:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com> <20220629084816.125515-3-stephan.gerhold@kernkonzept.com>
In-Reply-To: <20220629084816.125515-3-stephan.gerhold@kernkonzept.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 29 Jun 2022 16:03:31 +0200
Message-ID: <CAMZdPi88AU3J+S+ayzEAiqN+_FcJKJS=6PCH+HVj7+HtpXmuhg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] watchdog: pm8916_wdt: Report reboot reason
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 29 Jun 2022 at 10:48, Stephan Gerhold
<stephan.gerhold@kernkonzept.com> wrote:
>
> The PM8916 PMIC provides "power-off reason" (POFF_REASON) registers
> to allow detecting why the board was powered off or rebooted. This
> can be used to expose if a reset happened due to a watchdog timeout.
> The watchdog API also provides status bits for overtemperature and
> undervoltage which happen to be reported in the same PMIC register.
>
> Make this information available as part of the watchdog device
> so userspace can decide to handle the situation accordingly.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
> Changes in v2: Improve error handling (suggested by Guenter)
> ---
>  drivers/watchdog/pm8916_wdt.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 670cd79f4cf9..49f1a5204526 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -9,6 +9,12 @@
>  #include <linux/regmap.h>
>  #include <linux/watchdog.h>
>
> +#define PON_POFF_REASON1               0x0c
> +#define PON_POFF_REASON1_PMIC_WD       BIT(2)
> +#define PON_POFF_REASON2               0x0d
> +#define PON_POFF_REASON2_UVLO          BIT(5)
> +#define PON_POFF_REASON2_OTST3         BIT(6)
> +
>  #define PON_INT_RT_STS                 0x10
>  #define PMIC_WD_BARK_STS_BIT           BIT(6)
>
> @@ -110,12 +116,14 @@ static irqreturn_t pm8916_wdt_isr(int irq, void *arg)
>  }
>
>  static const struct watchdog_info pm8916_wdt_ident = {
> -       .options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +       .options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
> +                  WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER,
>         .identity = "QCOM PM8916 PON WDT",
>  };
>
>  static const struct watchdog_info pm8916_wdt_pt_ident = {
>         .options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE |
> +                  WDIOF_OVERHEAT | WDIOF_CARDRESET | WDIOF_POWERUNDER |
>                    WDIOF_PRETIMEOUT,
>         .identity = "QCOM PM8916 PON WDT",
>  };
> @@ -135,6 +143,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>         struct pm8916_wdt *wdt;
>         struct device *parent;
>         int err, irq;
> +       u8 poff[2];
>
>         wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
>         if (!wdt)
> @@ -175,6 +184,21 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>                 wdt->wdev.info = &pm8916_wdt_ident;
>         }
>
> +       err = regmap_bulk_read(wdt->regmap, wdt->baseaddr + PON_POFF_REASON1,
> +                              &poff, ARRAY_SIZE(poff));
> +       if (err) {
> +               dev_err(dev, "failed to read POFF reason: %d\n", err);
> +               return err;
> +       }
> +
> +       dev_dbg(dev, "POFF reason: %#x %#x\n", poff[0], poff[1]);
> +       if (poff[0] & PON_POFF_REASON1_PMIC_WD)
> +               wdt->wdev.bootstatus |= WDIOF_CARDRESET;
> +       if (poff[1] & PON_POFF_REASON2_UVLO)
> +               wdt->wdev.bootstatus |= WDIOF_POWERUNDER;
> +       if (poff[1] & PON_POFF_REASON2_OTST3)
> +               wdt->wdev.bootstatus |= WDIOF_OVERHEAT;
> +
>         /* Configure watchdog to hard-reset mode */
>         err = regmap_write(wdt->regmap,
>                            wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL,
> --
> 2.30.2
>
