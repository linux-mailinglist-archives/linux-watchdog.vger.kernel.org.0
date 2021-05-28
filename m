Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C98394423
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 May 2021 16:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbhE1OYu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 May 2021 10:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbhE1OYt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 May 2021 10:24:49 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9066C06174A
        for <linux-watchdog@vger.kernel.org>; Fri, 28 May 2021 07:23:13 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id g38so5714609ybi.12
        for <linux-watchdog@vger.kernel.org>; Fri, 28 May 2021 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=syysfoCLQhlZX4I15Hdgek+czZDdAMbqNxcJPk1EsOQ=;
        b=Bi4g/rtry3daF+gwc3vRtRNefr36ib+72ReLa3GeeD9O3ybgsW5H+StLvG598fcTA2
         MxJCazJmuhXChu6NvwkTut4KABCZtDklevvhSdJrjzkGSFpjSB9y1qKrfSy/NJ2F9zqa
         SZ1tZs0U6q14X/bQF2A24cWdOm+OoG6tGIOcgxXj07e6xNBC4d2gkVJuryB4N0qhMpSv
         vjosCTpmqAA7DzXW5J9O4/xo9afKZ9gPBnxKBSRuGMrT6i6aZSDO3XwKpRv4Txh494Db
         xnpj5063UpPa68aZM8xfll+N3FUZukP1ajAbSd7u4yzb1znukr81z6bLt4hdid2Qss8i
         6bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=syysfoCLQhlZX4I15Hdgek+czZDdAMbqNxcJPk1EsOQ=;
        b=WsC1qDBsvhBd7XiFqe//8Dh6O078JvCmDBNnuYIugGUCcz0DwE/3647zj67y9emZx0
         v4jGvA8hoMCgfK6Qu6dsjg3Sds7x6btrqWhJvkYTVJ+RphZQFWSa6kmsu2vLCJXa7x2F
         Y2OgCosK0Q/Q3l46woafLjs86av/JVtuaaXtZQ1BC3Itpk2zeO0jr2dSvNxa4VQBRGDg
         2RXk4G6TVkC6fVRfIGN5kz16BjhHNVzLPs4otGB4CiI5BPvhr8HO4xEwonhpiFjKxhhG
         pVTRIwIv7HqoCApDQaVjRo4lLHQdF+ioKFcBWb787NecYW2V4pIAYlVaZJJpG9s0g9CP
         UosQ==
X-Gm-Message-State: AOAM532SiVX+WBtA+y90lj82mgUzYrHmuX/vYIwuutChWnCR/mKn+PuS
        91wq/d8CXjueS9Pgh5q1qkKgemrf9s7gxhQASJ98Ng==
X-Google-Smtp-Source: ABdhPJx8mHtOAu17ADz6J7AwfAXA/YIRldt+oDMdzuZLRNE9q/0fTWnkdiCMlbQ3GUS+scmZ1tLW01HbzK50dqSraow=
X-Received: by 2002:a25:420c:: with SMTP id p12mr9823321yba.25.1622211792670;
 Fri, 28 May 2021 07:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621937490.git.matti.vaittinen@fi.rohmeurope.com> <dba3927a575645e5bf1ff35edea5ad74ea86885e.1621937490.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <dba3927a575645e5bf1ff35edea5ad74ea86885e.1621937490.git.matti.vaittinen@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 28 May 2021 16:23:02 +0200
Message-ID: <CAMpxmJU8GY568LwEyKnxiN3vPgOreyCYYJF_sD2dFKuMOm6A4A@mail.gmail.com>
Subject: Re: [PATCH 6/9] gpio: bd70528 Drop BD70528 support
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-pm <linux-pm@vger.kernel.org>, linux-rtc@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, May 25, 2021 at 12:15 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> The only known BD70528 use-cases are such that the PMIC is controlled
> from separate MCU which is not running Linux. I am not aware of
> any Linux driver users. Furthermore, it seems there is no demand for
> this IC. Let's ease the maintenance burden and drop the driver. We can
> always add it back if there is sudden need for it.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>
> ---

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
