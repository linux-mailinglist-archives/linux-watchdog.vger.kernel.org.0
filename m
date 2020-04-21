Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3881B3137
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Apr 2020 22:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgDUUbi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Apr 2020 16:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgDUUbh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Apr 2020 16:31:37 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2628C0610D5
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 13:31:37 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id f19so5064iog.5
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Apr 2020 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DgynPmoHWquo2i6Yyvm5x5n+FCVjD0yzZNoB+cTueB0=;
        b=ie6ohRqyPbI+C4yBuHi6QA74OoL4yfStj7tBGqZwCMM1CSqVDKrZo5EzljVuI4Nwbh
         E8w+vvHv6vtOly2PHR4bf5m/LDCu6LXowc5Tv2F49VGJ+gHtIvdW7VpJTdKQDUsGlSXS
         JS2dURYAU+iGzaWXuh4lmrsMHOChsYSg3Z7aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DgynPmoHWquo2i6Yyvm5x5n+FCVjD0yzZNoB+cTueB0=;
        b=Sqz55j2Lpt/ewzAUPsCiYVuXoHn05xtyad0Wih8gQmjvp9XXuuzzxdiT3s2ChyH3af
         c6HOwwGe8cvpkgVrDS4/dJ5DvBrCIkkr+X6ITW6ZJVfGaL8Oh8vuTPKj2fVyeJzYcout
         rYWoB2/a/N90HzPHZYiPr1vCziR5P6GefCisVHZFZ5auHp/vnOh91xBxH3g9W0BSfyn4
         ZieF7Td7Bbj7faBgeGrtlv/NSoYtQUj/TBYF0dnFNnzDPyaQSHT1mbDJeH8JkfbrRnYM
         rAoU8HBa0spp8nRRXH5+et2PeiP02D84z+uhuFhMQwjqaJgfY1mmYEiYTTeKf0REwcCr
         voFg==
X-Gm-Message-State: AGi0PuarXe5+FNVb2FcHFYVl2jK7+qECGhrsmUp3PPvMoTvI5SUmiYVF
        hM63paQAkLfVhCZfxM5iuIwbr11uXxf/xEYv2W/C7g==
X-Google-Smtp-Source: APiQypIcsdGYB8kMa8Ef+QUbCPlWkfdqxPhfOwVS4UVzcXSmpGcF+MidhHbAyxQF165SEW5wUu6EYFT0GGPRKs8fm9c=
X-Received: by 2002:a02:90cd:: with SMTP id c13mr21792999jag.83.1587501096755;
 Tue, 21 Apr 2020 13:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200421110520.197930-1-evanbenn@chromium.org> <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
In-Reply-To: <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
From:   Julius Werner <jwerner@chromium.org>
Date:   Tue, 21 Apr 2020 13:31:25 -0700
Message-ID: <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Julius Werner <jwerner@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> +static int smcwd_call(unsigned long smc_func_id, enum smcwd_call call,
> +                     unsigned long arg, struct arm_smccc_res *res)

I think you should just take a struct watchdog_device* here and do the
drvdata unpacking inside the function.

> +static int smcwd_probe(struct platform_device *pdev)
> +{
> +       struct watchdog_device *wdd;
> +       int err;
> +       struct arm_smccc_res res;
> +       u32 *smc_func_id;
> +
> +       smc_func_id =
> +               devm_kzalloc(&pdev->dev, sizeof(*smc_func_id), GFP_KERNEL);
> +       if (!smc_func_id)
> +               return -ENOMEM;

nit: Could save the allocation by just casting the value itself to a
pointer? Or is that considered too hacky?

> +static const struct of_device_id smcwd_dt_ids[] = {
> +       { .compatible = "mediatek,mt8173-smc-wdt" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, smcwd_dt_ids);

So I'm a bit confused about this... I thought the plan was to either
use arm,smc-id and then there'll be no reason to put platform-specific
quirks into the driver, so we can just use a generic "arm,smc-wdt"
compatible string on all platforms; or we put individual compatible
strings for each platform and use them to hardcode platform-specific
differences (like the SMC ID) in the driver. But now you're kinda
doing both by making the driver code platform-independent but still
using a platform-specific compatible string, that doesn't seem to fit
together. (If the driver can be platform independent, I think it's
nicer to have a generic compatible string so that future platforms
which support the same interface don't have to land code changes in
order to just use the driver.)
