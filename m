Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D255601E7
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 16:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbiF2OEl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 10:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbiF2OEj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 10:04:39 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CD425E99
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 07:04:38 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a15so15175233pfv.13
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 07:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJldV9Lg+b4IlmSmUre+Ivr8s4HUdH+w61cGSIpdKu4=;
        b=XwRdlFhxzfdMTPgUqeiKEHmmRBzTVkDeklkdRrEip/5w7GR2DN03xRSwkjcGdSsZOK
         EfUvksY4pCpMfcg8gu/va2W/ELeNWSG9YI1Ux+zHIS3U+vzCfATA7eazqYKLksHgYxqc
         /UYC5nnGpPaDm9JJeC4v0v7K1yagXquGl2bSOLNrnOno8/CywiHP4wC6ggrDoiNim8Dl
         6pQzXHgsGNVgm+b1nPv+tmift41ZcVs4w8DNbiMoOmM8twtwe/d7kujBkm7irKzhqlA5
         yvPXfw+LJe9+woQDWVe0ewlp4STkeibjajVyAsh8XTZI89HAN5c9y5LFCCqrEmZqWB5k
         qszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJldV9Lg+b4IlmSmUre+Ivr8s4HUdH+w61cGSIpdKu4=;
        b=UijAA13CrNaa3mChdzn2YaR3CB/rwsPWnO+7ZwivpAWPkaLoF+8eqP5MXcTPTPF6K1
         8OzTgk2IoGFAnaEwNafy+qdbFqkMrksgt5ApGE/yUyJwd76MJ8LWmjuX203X6/uRS9Kc
         baW2dhuRWgALBNeDjNlIC1/INk9hWYI5hixlanjdlH4n9u9XJXxyhYqf/X1Sg5KXVavt
         u9OABbdry4sHy6BkEkVSV1e8IaSEeP2yzz/QGoNecEr7opl3SF/NE4Ty6bliNAgvkamT
         N8CyfwmXTcCMwVr3vvC070U6u3uWrLCdRMlSLBD59KYl8S77ELUfL4JVmFu/p0/+nXDM
         24Hg==
X-Gm-Message-State: AJIora+ejP/uwARv8VVxpnoc6p9n0XPAf5FL4H4malvWKAQf7i8YaIdW
        Ld0w4Dk5EZozFcAPxAH40jiZa6e5VooSJyr7bWQo2w==
X-Google-Smtp-Source: AGRyM1vmIc/VoYi6edjqcbO2ZhHtPmvK9N6600Fi4362rEyM5LLozf/8tLuwOpHMzzOIh2djp8mLM05E8M3i1NEWuNc=
X-Received: by 2002:a62:3145:0:b0:525:1309:36f8 with SMTP id
 x66-20020a623145000000b00525130936f8mr10449381pfx.74.1656511478069; Wed, 29
 Jun 2022 07:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com> <20220629084816.125515-4-stephan.gerhold@kernkonzept.com>
In-Reply-To: <20220629084816.125515-4-stephan.gerhold@kernkonzept.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 29 Jun 2022 16:04:01 +0200
Message-ID: <CAMZdPi8sNfPcikLbML1sNVp-kH9u1hXEob0JYMTxgkxAiHS7mA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] watchdog: pm8916_wdt: Handle watchdog enabled by bootloader
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
> The bootloader might already enable the watchdog to catch hangs
> during the boot process. In that case the kernel needs to ping
> the watchdog temporarily until userspace is fully started.
>
> Add a check for this in the probe() function and set the WDOG_HW_RUNNING
> flag to make the watchdog core handle this automatically.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
> Changes in v2: Improve error handling (suggested by Guenter)
> ---
>  drivers/watchdog/pm8916_wdt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 49f1a5204526..f4bfbffaf49c 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -142,6 +142,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct pm8916_wdt *wdt;
>         struct device *parent;
> +       unsigned int val;
>         int err, irq;
>         u8 poff[2];
>
> @@ -199,6 +200,15 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
>         if (poff[1] & PON_POFF_REASON2_OTST3)
>                 wdt->wdev.bootstatus |= WDIOF_OVERHEAT;
>
> +       err = regmap_read(wdt->regmap, wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL2,
> +                         &val);
> +       if (err)  {
> +               dev_err(dev, "failed to check if watchdog is active: %d\n", err);
> +               return err;
> +       }
> +       if (val & S2_RESET_EN_BIT)
> +               set_bit(WDOG_HW_RUNNING, &wdt->wdev.status);
> +
>         /* Configure watchdog to hard-reset mode */
>         err = regmap_write(wdt->regmap,
>                            wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL,
> --
> 2.30.2
>
