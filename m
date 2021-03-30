Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1605434E60A
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Mar 2021 13:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhC3LFL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Mar 2021 07:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbhC3LEw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Mar 2021 07:04:52 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67913C061574;
        Tue, 30 Mar 2021 04:04:52 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id l76so11460058pga.6;
        Tue, 30 Mar 2021 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MLBeoULdugcCnUPIfdbDs+A8k9dizPk/RhGEW8FH4qI=;
        b=ZY2H8JjGdzPSlsPLMpktphd4H2J8L1GzUZCBlFCNBZFB3VLKxP0qGA4K1+sm+g/cN9
         DyubWtZkl2gL+3UolES1JuoIYhCg7XUUpx5adse/HTlBfoiRDXFWit/MUqQ2ZNrtVx1Z
         Tk4M7YxnU4SFpxLtn/7jH3IVurPR1ZrkdmPQH9hxEFEAZBR21NGyxiwIOoPkIG6ubroS
         /ihOldBcfihI2sHottMzTg1v3O+0y2zDY6F62uCII8E5n9012CIIddIXy0x3vLZ5RuvN
         n4WGK0+3QZtg8nfZ8HXmy110rUjX1gjnF+IFM1TOJqRZjr4y7xUetDMRMiH0EPHXR+7J
         QOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MLBeoULdugcCnUPIfdbDs+A8k9dizPk/RhGEW8FH4qI=;
        b=kz/efTzcNnoaRaSJOybbwcPSZtO7dlN3YF+iYT2Z5MhGb0K1yCILPlaFCYTPTpTQbh
         tUPNP4eX1/TmDimzeoTuJS/DtFAp+ESyP2kABDLToNzpkHUQy5UY8LjIoHqK5GnoTzoq
         T/PK2gRNsTJoHA1VIUcZeOJWr17y7RBoPvQl7AJzsbEbBNkisEdo1XtC3gN0tC6to1l1
         lFJjVej6yLbWGgm/VdgHnmD7MUd4wMKjxUD3q8dbAQAARwS3On8HgIQ/HXPXcloue2Ak
         jTKn2RXC+CaTgYwaFSFpfZdceEGc9ktBk8htiZhvFSONmvd8jSESAq7C+PWP3w4HR5cZ
         0IYA==
X-Gm-Message-State: AOAM531G7g3BCnPuzn3Ax3fkdcbTCRylbQffG9TiYrrCmj0WdYWEwzRW
        6nKNDip26W3AOjqUfdkXgq6Y+vaxYB/ZyEUxeNs=
X-Google-Smtp-Source: ABdhPJysXjGeGbF/h718mXjMe4mIMc76BZcAiyOPzxbUiQ4n9tbSaDufcNFAgmiNwEupsnCIP6iHkEq7tgLlEoog8ZE=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr5367809pgi.4.1617102291959;
 Tue, 30 Mar 2021 04:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210329174928.18816-1-henning.schild@siemens.com> <20210329174928.18816-3-henning.schild@siemens.com>
In-Reply-To: <20210329174928.18816-3-henning.schild@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 14:04:35 +0300
Message-ID: <CAHp75Vdh_YAJLE4DWPhxhYY1g5Fc_7EFgr4FED3crpfpzwXeRg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] leds: simatic-ipc-leds: add new driver for Siemens
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

On Mon, Mar 29, 2021 at 8:59 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> This driver adds initial support for several devices from Siemens. It is
> based on a platform driver introduced in an earlier commit.

...

> +#define SIMATIC_IPC_LED_PORT_BASE      0x404E

> +static struct simatic_ipc_led simatic_ipc_leds_io[] = {
> +       {1 << 15, "green:" LED_FUNCTION_STATUS "-1" },
> +       {1 << 7,  "yellow:" LED_FUNCTION_STATUS "-1" },
> +       {1 << 14, "red:" LED_FUNCTION_STATUS "-2" },
> +       {1 << 6,  "yellow:" LED_FUNCTION_STATUS "-2" },
> +       {1 << 13, "red:" LED_FUNCTION_STATUS "-3" },
> +       {1 << 5,  "yellow:" LED_FUNCTION_STATUS "-3" },
> +       { }
> +};

> +static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
> +       {0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
> +       {0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
> +       {0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
> +       {0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
> +       {0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
> +       {0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
> +       { }
> +};

It seems to me like poking GPIO controller registers directly. This is not good.
The question still remains: Can we simply register a GPIO (pin
control) driver and use an LED GPIO driver with an additional board
file that instantiates it?

-- 
With Best Regards,
Andy Shevchenko
