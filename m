Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85711229DD
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 04:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfETCOO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 May 2019 22:14:14 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40867 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfETCON (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 May 2019 22:14:13 -0400
Received: by mail-ot1-f65.google.com with SMTP id u11so11572126otq.7
        for <linux-watchdog@vger.kernel.org>; Sun, 19 May 2019 19:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gv1D31tXAQjneU99Xjed5n2o+0M0UwCTvXDe48ANWo8=;
        b=j12qC/12lzbrvDNlCECnp9rJbNfbSY0WTGBK9mYxlpBG0zKbhA2eE3db6CQ8moH6iD
         WEYEm0aqsKGUyJRk9yhgp0EjzyLeTVGJLvhvcf+5uu8KINjRr+tl6FPMsvOzhR+Fn1VM
         0uBBc6HCM0FDuOqIqFKz6VeaV81VFyRH0nzQk5q9ZR0qJarOghA/G7/joZgZTkuvu+xQ
         vI7XvS29Lnf0c5/KsgN5Mt9EI2OI+DV7UZYacL83QnN2I8jCkEGUFuZisrgyuQXlrKpc
         uQF8cMWXTAaKGs37/oFk8r/EN9ZcebqzCO3L13zbfHREow36LreA9zr85/5si5zLzjq3
         36HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gv1D31tXAQjneU99Xjed5n2o+0M0UwCTvXDe48ANWo8=;
        b=iRL7wucOGQ8xNJCMpZJG30t5JLH8HkW0XDQwkBSxhPnGC6I9FfB6pEt26Hx14THT60
         1BQLry4nthbBsmjS9fr6AMaWfyQR986Eimw13zwbQAxga3Je4RrMfHx6ywkWWkFZ6A33
         DJ719mck8qRHaXZlWgcceOe7FsR36YAN3bHNPYZlAZ/Ov9yzKsIQqVJkmuQNetskxIhq
         EWtcR895v5bk6D0Ip0ObMQY+iFF7BZALGJHzCQujhBoLLTyxYejIAG/H4ok6owGe1GhC
         nl1nhxrl+szoBsfqfUyJMHXy4VeygqQMVUiaFDMXwzRkKscDu9S6pVVfs49T6qnpwP32
         w8Tg==
X-Gm-Message-State: APjAAAXmh/db7pyE4hWp9hvhFb2n6RSOKHFaRxQdaf5tam1wk4xd634l
        AZihQ58qgzfKkmWh3+qRGQTMDkscV8i6bySMhTcZpg==
X-Google-Smtp-Source: APXvYqzNFXg9RV1CPihRYM/Igc+TvKudhTU2MOwOVTB26UhfFrAXHJNSL1MUYhmNzGIRn51Yo0AZYFrEu6mulJkGPvM=
X-Received: by 2002:a9d:5c06:: with SMTP id o6mr10298926otk.123.1558318452983;
 Sun, 19 May 2019 19:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com> <20190518212801.31010-40-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190518212801.31010-40-wsa+renesas@sang-engineering.com>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Mon, 20 May 2019 10:14:01 +0800
Message-ID: <CAMz4ku+GLR3Z7TG0UQYh1sDEL4bzXjs9EpEVGeH_kERqUD131A@mail.gmail.com>
Subject: Re: [PATCH 39/46] watchdog: sprd_wdt: drop warning after registering device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wolfram,

On Sun, 19 May 2019 at 05:28, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The core will print out details now.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  drivers/watchdog/sprd_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> index 14874e9b207b..b049981de3f3 100644
> --- a/drivers/watchdog/sprd_wdt.c
> +++ b/drivers/watchdog/sprd_wdt.c
> @@ -328,7 +328,6 @@ static int sprd_wdt_probe(struct platform_device *pdev)
>         ret = devm_watchdog_register_device(dev, &wdt->wdd);
>         if (ret) {
>                 sprd_wdt_disable(wdt);
> -               dev_err(dev, "failed to register watchdog\n");
>                 return ret;
>         }
>         platform_set_drvdata(pdev, wdt);
> --
> 2.19.1
>


-- 
Baolin Wang
Best Regards
