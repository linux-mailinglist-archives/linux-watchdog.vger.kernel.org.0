Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B9445F04C
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 16:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354104AbhKZPJk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 10:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354044AbhKZPHj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 10:07:39 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E6AC0617A0;
        Fri, 26 Nov 2021 06:51:37 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id v1so39997598edx.2;
        Fri, 26 Nov 2021 06:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0mq1vNQYTZERHh5Eak1Azo3GljdHidR+eHCRS6zFKk0=;
        b=Kn3oKHFgJ87IEeBwuuPkNO1haRkQ0QEnbhln6HQTJ+1jBAI45X2jJbo9QXVvupZs2f
         /zhAOEup0m14zKw0/DVYvNgCEVI89vCbwQx6Bs+oJGjk0D66Q2Wcn4+WLflQe5HiMI8S
         6DUGRLcbNvTvKARCzDoN9cBHNth5QakeldGcUa4TGtiFuqBb1ridT2jMFsKFGdGcY9JD
         7QLTDJla5RfX97Z+lc5urkGI3/P68NP/xJl5/pyeWfmC42DEWCzmFXNQxFzzodTZfyA6
         n/Po5YGxZLf1K8g5il6XIxm5Xv39HZxLMmxLRPJOZtJ5fmf75ApT8WxBEOmR/Nul6WnF
         5tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0mq1vNQYTZERHh5Eak1Azo3GljdHidR+eHCRS6zFKk0=;
        b=BogrQwQRM1VZitFwA+W5BXMtwOTyD8Gyoc7ch6mRy02o7dVDjuCxsd3Fef2uyj+9XQ
         vN7dFfABQp96WvxStxFx5wNpQ/Np1O8ijgQkqndYFdQSwNmFwM6+IhQjHyD4hAey7xH0
         +yKYQ6VXqWZXzoVj1pZuQsrx4/M9abPwB3VrG3WC2xOAlAE++/iFEq6n5517lyjwgdTS
         NV7tEgmGWSyuf5jkq2gkxM3tUo427mI+75a4Y7ep7RURSrjZYW5BLtoqEXV3icIsY/8J
         Mjaa1g4+iFYNSVo6VNY6Mioti64rB2nxnzA9sCd6hM8fskpeUasH68qa00zQAfl2dKSF
         KrmA==
X-Gm-Message-State: AOAM533WwvTCYo/Is369FjKnqQAMfI+NnjCVMVHuTPllX5z0m5D7Gmxk
        iXD7+wJHQ1sswM9jXl0U62Fn/zMpZiWOYSlqE2E=
X-Google-Smtp-Source: ABdhPJzNJXVj837EBJjQ4fUSkTgK8Su/NYk++GapKXg1t9ODkOFNIAtHiQCFER430pimMOonFdv3qYTzoa2iHagEgBA=
X-Received: by 2002:a05:6402:291:: with SMTP id l17mr48603859edv.242.1637938296241;
 Fri, 26 Nov 2021 06:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20211126141027.16161-1-henning.schild@siemens.com> <20211126141027.16161-5-henning.schild@siemens.com>
In-Reply-To: <20211126141027.16161-5-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Nov 2021 16:51:00 +0200
Message-ID: <CAHp75Vf6x4-AYPPEMf7qXTi-RF92mdUn6rhghBpJ5avQAjYRzA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] platform/x86: pmc_atom: improve critclk_systems
 matching for Siemens PCs
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Enrico Weigelt <lkml@metux.net>,
        Michael Haener <michael.haener@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 26, 2021 at 4:10 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> Siemens industrial PCs unfortunately can not always be properly
> identified the way we used to. An earlier commit introduced code that
> allows proper identification without looking at DMI strings that could
> differ based on product branding.
> Switch over to that proper way and revert commits that used to collect
> the machines based on unstable strings.

Usually we start a series with fixes, but I guess it's fine here since
this can be taken separately, right?

...

> +#include <linux/platform_data/x86/simatic-ipc.h>

Seems not.  Question is then, what Fixes tags would  mean in this case?

-- 
With Best Regards,
Andy Shevchenko
