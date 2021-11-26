Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80F6445F069
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 16:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377985AbhKZPPl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 10:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350728AbhKZPNk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 10:13:40 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185E0C061784;
        Fri, 26 Nov 2021 07:02:37 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id r11so40134242edd.9;
        Fri, 26 Nov 2021 07:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7WKyxNFeEYKoREkD0c19RFptAww7wbbo/OFZ6cXxB1w=;
        b=N6uHU5ILrCIQvq7r4K+/wN2arEkieagq8CclQdF596CUIcI44bK1d4yLKV9YUv+fTw
         kuLTilApbMAkJWcxxrJqmoPbKMd5DF1QiRzVqFCc5Cy+i+6MP4KVI4Y43E8he6AqItIX
         6mbDEQSazDe1aC3Iz79MEHd3Io/d6uwIlw+eWwuobRcsb7crx28sRolhQUiqjNyAnaRr
         U58kSJbWKcS+kc7ajUKzA8DTUuZAihUMoNYcQaCAXIhTJ2en9qLMOUjvYHsnWYbv8GtJ
         j8o4/bcgCHl1hL83JbcKEJG9GPj18QbAPURaxxpAMpL+ikgWGaSjOqQUix4l45gr1z4q
         A4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7WKyxNFeEYKoREkD0c19RFptAww7wbbo/OFZ6cXxB1w=;
        b=wnxJmgvHC675X2JbWbiiFN9l2kVYc8ZSmfIKDYAVga9EKx5RTym9FnbkoN5w1GCW73
         5aLdgyGQ3g3QbPSKo+VHs+rMh2lRuoVQN6+imbJ8uJ6TndO3NsZ43Xuhj1l4nbOq8P5g
         xHMp9MjNE+fbggT4sN8ym+qH/pQ7E0+G2dhR/c11ZqaHVa3FdZG0Y/w/bcHovIktbaFF
         j3sToxzLjybtISnJ6IZZM5ETUgMUPYCyWpfNIJhmS794fb2BrKluPr/ndwGumehaF1i8
         0ILu3pXHsuDzLKDTKXBu/3DAt2fm9TKxs5HPgKDBE/4vucruRB48IApHkTi1gcZE1NcF
         Xr4g==
X-Gm-Message-State: AOAM5336/TIoWzghuyYLYZezVeV0H1eD1v78lj+G9GvRaY2MyoUkSGH9
        mbLf3ftIDMH7LD+qR/NfKawzi/Gxmfxg4WJE8+8=
X-Google-Smtp-Source: ABdhPJzdCYVcg2NuZzEDoNjtQDVAN598WW8V35ihTMNpJhv5/C7pXOi35tFFgwaHKlkf0MFcL/NWn3SMeEllabA0jtA=
X-Received: by 2002:a17:906:ecac:: with SMTP id qh12mr38496156ejb.377.1637938955561;
 Fri, 26 Nov 2021 07:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20211126141027.16161-1-henning.schild@siemens.com> <20211126141027.16161-3-henning.schild@siemens.com>
In-Reply-To: <20211126141027.16161-3-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Nov 2021 17:02:00 +0200
Message-ID: <CAHp75VcD0FQuG_AToNkVHHD9e6WV6=18P4U0cSi0qzD3FL=ssw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
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
        Pavel Machek <pavel@ucw.cz>, Enrico Weigelt <lkml@metux.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 26, 2021 at 4:10 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> This driver adds initial support for several devices from Siemens. It is
> based on a platform driver introduced in an earlier commit.

...

> +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> +       { }
> +};

Like I said, this is not okay.

Why can't you simply enable the pinctrl driver and use it?



-- 
With Best Regards,
Andy Shevchenko
