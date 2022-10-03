Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180C65F280A
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Oct 2022 06:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiJCEtJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Oct 2022 00:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiJCEtI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Oct 2022 00:49:08 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F9E3608C;
        Sun,  2 Oct 2022 21:49:07 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id h1-20020a4aa741000000b004756c611188so6053088oom.4;
        Sun, 02 Oct 2022 21:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6ShsVYmMzPVH1vorzQk59T6mVwkgDWOej3odS2dQce4=;
        b=Zc+Y1D1ztdvY3g+Yy91+ujcItw6B5a6dAJZTzhpWsXAob/c40XMtgNNwZ22TDhisPk
         ZkrWeAPz/gWvMh98llAmXkDe26csuajr+2R/rK+ln51TM7KP4VmJTWvSWvpJypmXNoTC
         w5b9LW+ACmUdqvRdCGbaeEH/qnhckb8K5ImQB9CP1MjZNoD5P0tP8MEo/N/JaxCHetsA
         Hy5IRUUfkeNgXrE19on5Qa/MQQqJUVDDTzlMhYAeJqyMaCw7O1qnYV6i5sxNoa/97STg
         HHC5BXYzOPefWWCjXdqnhmhO/gyzUF/xC2OmdCK4nS5G/fwWR+9Qoz5DTNA2oZ9O+gCk
         F0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6ShsVYmMzPVH1vorzQk59T6mVwkgDWOej3odS2dQce4=;
        b=HGCQDVlYhrfNw96NLmEUxba8+tIwLRnUwBHsGcAnc+tKVi9+ZF4p59l8Z4yqSe8tOU
         kOCBSlZR6JY9jrW3GjnobgQRH9b4yRgUp3ULLYGEbmARNMew/l856JSbKUogpjYpo7N3
         yWeIlTQWhrR3khwxOh8jmojlDKo6zqgJ3g9SqOE0VC4fcBDezRm4m+KUC3KALr0EplX9
         1jzFd6RQO1WeijBMF81tNDDyU6bFvVGjb4jwjfYmSPxBReH3AlL9fD7uNIHWjx2JBdrR
         l7oza511/UMtGcuxUkFYgPWPx8niVcGA0APZEctMGZG/dvwsN3W7VfPproEdXvAkdsuU
         /Sfg==
X-Gm-Message-State: ACrzQf1mmUnXDeoiJ3KiALFds6AQPvXb0SCcETvT8exDBFqXxFv5hcy/
        aOfW652XIkJXH3P44JV0YuKXn/c2HYEz1LHTAoqRKudu1Sw=
X-Google-Smtp-Source: AMsMyM53PxViMDhrxVzL8Uww/zxD2DQVnym7EE0Dekm6v+qkwfscHI96P9s/OHxMAhcnRO442t0ImpWGNjSixe8fYFo=
X-Received: by 2002:a9d:19ca:0:b0:655:bcdc:f546 with SMTP id
 k68-20020a9d19ca000000b00655bcdcf546mr7739030otk.304.1664772546848; Sun, 02
 Oct 2022 21:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220926162549.805108-1-sergio.paracuellos@gmail.com>
 <20220926211508.GA682626@roeck-us.net> <CAMhs-H-j34cfv1rJ=fUKhQrZ5FwSJezZFnw=esh4MPNw+zNUNA@mail.gmail.com>
 <CAMhs-H_hPsLZh9YrckPzOqx4NOPKAc8OGeHmerpsHABs0L13Fw@mail.gmail.com> <37986fbb-0c7d-ef87-200c-6f6ff49a8414@roeck-us.net>
In-Reply-To: <37986fbb-0c7d-ef87-200c-6f6ff49a8414@roeck-us.net>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 3 Oct 2022 06:48:55 +0200
Message-ID: <CAMhs-H_Mgvjk4hcRxgcrj4WXjcRK9rQ=Bzkj1+cLE5feN2J3SA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] dt-bindings: watchdog: migrate mt7621 text
 bindings to YAML
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        wim@linux-watchdog.org, Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Oct 2, 2022 at 6:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/29/22 10:26, Sergio Paracuellos wrote:
> > On Tue, Sep 27, 2022 at 10:24 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> >>
> >> On Mon, Sep 26, 2022 at 11:16 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>
> >>> On Mon, Sep 26, 2022 at 06:25:49PM +0200, Sergio Paracuellos wrote:
> >>>> Soc Mt7621 Watchdog bindings used text format, so migrate them to YAML.
> >>>>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >>>
> >>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >>
> >> Thanks, Guenter!
> >>
> >> Rob, I don't know why this patch is not in devicetree patchwork list...
> >>
> >> Please let me know if you want me to resend this again.
> >>
> >> Thanks,
> >>     Sergio Paracuellos
> >
> > I guess this patch is supposed to go through the watchdog tree??
> >
> > Thanks in advance for clarification.
> >
>
> Normally patches like this would be pushed through the watchdog tree.
> I added it to my watchdog-next branch, and usually Wim would
> pick it up from there. Note that I don't really care; either way
> is fine with me.

Thanks, for letting me know, Guenter.

Best regards,
    Sergio Paracuellos
>
> Guenter
