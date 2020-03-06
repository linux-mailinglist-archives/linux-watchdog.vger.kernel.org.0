Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E78B17C316
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 17:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgCFQi6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 11:38:58 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:40246 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgCFQi6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 11:38:58 -0500
Received: by mail-vs1-f65.google.com with SMTP id c18so1906296vsq.7
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Mar 2020 08:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qx3A/IQVNW7fzT3DwYvCqbENQb/6yvNaKEnyDu7jQZY=;
        b=2SQTFpXFJ0ik4M9EvISuXCVD3a7NNwmMo805wmtt408kV/i1HIwGDl8LwDBMYvNIiJ
         RZIqPk0VF9ZuvoGBqwqep2ipEY4NNQEGAJAcXLT3sTjK8Btj6AqWQMdrrc9wr3RZ8Ong
         Tx5DVRr103eEnHPfHk2FVvCmMXrQft2kBHl8eHNMAdHVmSAa1m10QUmchvkNvIH5p5x4
         QyY2aDHx8tgT0gAQRbJ6Ydu7Z2fVpO7X5qeVcbuAIyu3bCXqcASZHZKJ8ZljOPtXPP9G
         BGcqbEU/rAoQFHtk6bXIZVXtoXXnpy3xfrTgbAopTUrcF3bTgjcdk0D9UDJs5wmaQeW7
         k0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qx3A/IQVNW7fzT3DwYvCqbENQb/6yvNaKEnyDu7jQZY=;
        b=KbjV2/4+JJeCfOT7qPXFR4a9mHLqgZoMVuZycUSFtegBP+/JNL7tTs+TitYFbLzsuS
         e1tWS4kW4henEGrxTUc9uRiR1VSRHmpfDDTbDF8T2ENOwQGu+WTKVMc+2ynEYyNowZHV
         KHTNpg8TRDvd272ZGmjQeUJX+HuRA54Qe1DVgIUctZBi8GW23JYEL7n2iDkSI7k0IRGU
         MTe/ouUSx1zmx+/15chpfsAtOmRHlxrnyjffpBZTecrbBHJGMB30c+5pIb9vaCm6J79D
         F6nC1NU7dguZHgzZ4yP28klkekNcphXBEB1tKkQCPnfaDi+yaaU1QEsD6+s8pJvnjIPe
         GsaQ==
X-Gm-Message-State: ANhLgQ0votM99JZMh4tc/gIUsLZYIX2oIORzYiVSnO+9pJONp4GMf5Cu
        hFzr7DBINQExG2PE4TWqYBLeDFC/X5yss2ExUH7PLQ==
X-Google-Smtp-Source: ADFU+vsgrX3M9ZUTt8zNbjVtAO9AoVvwrrtdDDH13N7+Fbkq+KCJfEoKR4CXqN5VR9tlf56RJTCEgxF3RkYjr11VXSc=
X-Received: by 2002:a67:e195:: with SMTP id e21mr2608876vsl.159.1583512735838;
 Fri, 06 Mar 2020 08:38:55 -0800 (PST)
MIME-Version: 1.0
References: <1583509356-8265-1-git-send-email-Anson.Huang@nxp.com> <1583509356-8265-5-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1583509356-8265-5-git-send-email-Anson.Huang@nxp.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Fri, 6 Mar 2020 22:08:44 +0530
Message-ID: <CAHLCerPXZD_qpacWuQ51Fu5RGgq1NG-FUhzgKdxND7-t460Kfg@mail.gmail.com>
Subject: Re: [PATCH 5/5] thermal: add COMPILE_TEST support for IMX_SC_THERMAL
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        wim@linux-watchdog.org, linux@roeck-us.net, daniel.baluta@nxp.com,
        linux@rempel-privat.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, m.felsch@pengutronix.de,
        andriy.shevchenko@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        ronald@innovation.ch, Krzysztof Kozlowski <krzk@kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, Linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 6, 2020 at 9:19 PM Anson Huang <Anson.Huang@nxp.com> wrote:
>
> Add COMPILE_TEST support to i.MX SC thermal driver for better compile
> testing coverage.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 91af271..55c7641 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -254,7 +254,7 @@ config IMX_THERMAL
>
>  config IMX_SC_THERMAL
>         tristate "Temperature sensor driver for NXP i.MX SoCs with System Controller"
> -       depends on IMX_SCU
> +       depends on IMX_SCU || COMPILE_TEST
>         depends on OF
>         help
>           Support for Temperature Monitor (TEMPMON) found on NXP i.MX SoCs with
> --
> 2.7.4
>
