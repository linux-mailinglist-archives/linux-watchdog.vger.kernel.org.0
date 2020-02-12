Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF0015AAC4
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Feb 2020 15:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbgBLONC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Feb 2020 09:13:02 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43508 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbgBLONC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Feb 2020 09:13:02 -0500
Received: by mail-ot1-f65.google.com with SMTP id p8so1993086oth.10;
        Wed, 12 Feb 2020 06:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ttdkOvRWv6DGMpcB3fcAKHkL0yPgPNj0xyxtGHAS+k=;
        b=rxk73IvXMa+wxmrMWK4PMfjZ9ZGBLZmGevAsO0/PuizLU3LI6fN5tcJRknhUpxWycC
         k1Zb7KW8kt9W40Cs7ZJjPPWtfj/7yY5+AAKO+u4MosFEhzkbyIbD8rZWBNlkECoddr76
         nUVFuQuha/UfWSyLtjhB4hfKymJPTW/BPAXu0wjnJcQvtrHQQX3xkCDkNRYOgbJ8jjjx
         dYCMzJhK/MXSUIwxpv2Te5j8bDJcMqM60xShocQ0aOvCeQXX1ZoO4vZlRSGcomYA4kAN
         NWQeg+cNXEzD8Z3iVkhwx1XtwsZK+rm99sbDkDGCori/cliXxEc3FG/CbTwajUICY2Ha
         8PEQ==
X-Gm-Message-State: APjAAAXkQWUKTesCDX1a6slCD24E0K3cDROOx/yXxLYLmURoLa7YHGZQ
        VxxZZ6RYOcxJnhUo88WGK/7Um2dT12Ks/c51SOynMA==
X-Google-Smtp-Source: APXvYqzR7OaORdlF5UrmLZ6EPRNXL2rF6WTTqvtrdkhAi4jB+4tYETxFyim3k2HGtzfrNJJl7j89X3hkheK9gcgrp5I=
X-Received: by 2002:a9d:7602:: with SMTP id k2mr9507732otl.39.1581516781508;
 Wed, 12 Feb 2020 06:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20200208130803.23387-1-linux@roeck-us.net>
In-Reply-To: <20200208130803.23387-1-linux@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Feb 2020 15:12:50 +0100
Message-ID: <CAMuHMdWjTNwqtUmgw5xh0B+VPALmk8G+Br5je1=w-=nGZq8jMw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: da9062: Add dependency on I2C
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Stefan Lengfeld <contact@stefanchrist.eu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Feb 8, 2020 at 2:09 PM Guenter Roeck <linux@roeck-us.net> wrote:
> Since commit 057b52b4b3d58 ("watchdog: da9062: make restart handler atomic
> safe"), the driver calls i2c functions directly. It now therefore depends
> on I2C. This is a hard dependency which overrides COMPILE_TEST.
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 057b52b4b3d58 ("watchdog: da9062: make restart handler atomic safe")
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Cc: Stefan Lengfeld <contact@stefanchrist.eu>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Just ran into the same issue, so
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
