Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA8D44A800
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Nov 2021 08:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbhKIIBb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Nov 2021 03:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243886AbhKIIB2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Nov 2021 03:01:28 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374B4C06120B;
        Mon,  8 Nov 2021 23:58:42 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id f9so21532636ioo.11;
        Mon, 08 Nov 2021 23:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mwjsBGGCD6Y+on4qfMjaXA33EoSJBoNN2vPwpqcskAw=;
        b=IUrbL9AlXk0fdCuMK9JGzIsT37RIpNJ6ScHSRTi1DByphfQvE3lOk9ocM3uDuXg7PB
         gnVVwQte6EMSeXZV05BV+85MANq9JJEED/KtO8xUVV9cBYhTpIGQSEdIAYbZ3JTmd4+o
         /AfJf7g08Ob4VHcZbz7jlBiffZgU37nw4B9cBuyTemakQuTrzlGZV4kuoYYpVwa8cXYP
         WjhgnHc8NN2jefYORH+ysnkAsjkb/z1VNKYjDqNfwTpqQJGKn/6IJinYvBGG4XUtgG7b
         Atj4Uo+cPIFWbwlF2gJLrTr24uiTTz4tfhvXx8gNTylOLSe6t9r0Im+jbdYumsXSuZ5Z
         jJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mwjsBGGCD6Y+on4qfMjaXA33EoSJBoNN2vPwpqcskAw=;
        b=gHQ5SPZyfY7ZbXI6qQrMsxxh4Ss0Bcm76bvpipaHA6aGlJc9UH4PkkABxVbcMbb5Gx
         MbwivNA2/GoCQxQfLyoHjuegBWwFwlC4YadU34aTs1hsM72RHwPzfQ5XUp7azsdzuQ7G
         vmnAKUHjWqt3e20kdEXSjmbGHZMaLW42VHE2MCoa26tgnclECNm7tXNCtw0yoLrfMkFf
         nBnsMWLCafV8zvFKk1L2uywGSfMSI0HDRHgHsk7RuIiVkVW63THDEB3BjuQO97XJDjdC
         mDlbQMuE/gm+ngPw+DZxp2jFlQt6D/0HxnsP4okus3jKbfXajXyUD9uAjF4qoFWCk3En
         BLHQ==
X-Gm-Message-State: AOAM533+4ljyvadmeXdFiqW9VRzFIIV799tyWzH0znWqPFj0Wh0iS83V
        CNIa1/7MO4isPf4tBIjizrgAbLyzj5iDy4a9i4g=
X-Google-Smtp-Source: ABdhPJycZ82/dQ2znBgL0pLuCJ13f6SPkBhb/onDv2o3TeaSMpKRDUvadmLYqNTD72F5RNua1MGHp83w166OTPswtPQ=
X-Received: by 2002:a05:6638:348e:: with SMTP id t14mr3805695jal.145.1636444716827;
 Mon, 08 Nov 2021 23:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com>
In-Reply-To: <20210730041355.2810397-1-art@khadas.com>
From:   Art Nikpal <email2tema@gmail.com>
Date:   Tue, 9 Nov 2021 15:58:25 +0800
Message-ID: <CAKaHn9+sgFXtOXFNx=BGVyaoh6B_ZmVOS0RcWw49tvpJyNcgow@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] watchdog: meson_gxbb_wdt: improve
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     wim@linux-watchdog.org, Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
        Gouwa Wang <gouwa@khadas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

hi Guenter Roeck
why still not merged to upstream ?

On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
>
> * Added nowayout module parameter
> * Added timeout module parameter
> * Removed watchdog_stop_on_reboot
>
> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
>
> Artem Lapkin (3):
>   watchdog: meson_gxbb_wdt: add nowayout parameter
>   watchdog: meson_gxbb_wdt: add timeout parameter
>   watchdog: meson_gxbb_wdt: remove stop_on_reboot
>
>  drivers/watchdog/meson_gxbb_wdt.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
