Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED02A616DE6
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Nov 2022 20:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiKBTjY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Nov 2022 15:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiKBTjX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Nov 2022 15:39:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C2010D9
        for <linux-watchdog@vger.kernel.org>; Wed,  2 Nov 2022 12:39:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 202E961B8A
        for <linux-watchdog@vger.kernel.org>; Wed,  2 Nov 2022 19:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703B1C433B5
        for <linux-watchdog@vger.kernel.org>; Wed,  2 Nov 2022 19:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667417961;
        bh=NNN0UxMOd3dLeOmZXzsUy1+1lS2djFE0TgJhCEKuEhU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n2hHu6216J08cpagBWQPxfpo9Q7QGAletwQ0p2PT5iF9+CUWgIXEhh+H0Xzb0T234
         iQ8RwpyFqlvSEi1z/Oc+AHnVSTJpjENuWjCncqedr0sIDgRkyv2FUEknap9q8CMDoE
         NW4psmXHHIq8RNyaX1G9equDHwGXobMFZcGx/B9jevLl1F77k1yYjgLVK+kSId6fx6
         Hs7bOq6PqiAJTaAUrBi8B7T5ZABemBdfVrzGKLzJ9gMy3c2YCgKUW2Lv6L45f6huUp
         CXaH9haymRhwHNjRlUp8mjumiTdGv+ZwPeXF1OJb/BbQMqLOaoH8r++p/Ol/gtAJRS
         rzq/ECONEjSZw==
Received: by mail-lf1-f54.google.com with SMTP id g7so29924222lfv.5
        for <linux-watchdog@vger.kernel.org>; Wed, 02 Nov 2022 12:39:21 -0700 (PDT)
X-Gm-Message-State: ACrzQf1U+LH6iHENMjUrkjG7vDlA+sBjfWkPPnFSkpmQ2ifrGibDW2rC
        dncPY+9P12p1XDyp7UVeuPWIgLF96pv6qPbmfg==
X-Google-Smtp-Source: AMsMyM6vqJNld5Ek1wx9W5gww5PYP9GqQKRKrzSNWiGtOOIFHvIVA7DkenLbCTD3su6+f9jYWE2MFZ9oVMtfD5RZ4ew=
X-Received: by 2002:a19:f24b:0:b0:4ab:cd12:d282 with SMTP id
 d11-20020a19f24b000000b004abcd12d282mr10270385lfk.74.1667417959382; Wed, 02
 Nov 2022 12:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221102192029.120917-1-marex@denx.de>
In-Reply-To: <20221102192029.120917-1-marex@denx.de>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 2 Nov 2022 14:39:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+wfG08rsr7Gcx7MJs0-nbAwePzh2j2EzutVWNKWWaWpw@mail.gmail.com>
Message-ID: <CAL_Jsq+wfG08rsr7Gcx7MJs0-nbAwePzh2j2EzutVWNKWWaWpw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: gpio: Convert bindings to YAML
To:     Marek Vasut <marex@denx.de>
Cc:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 2, 2022 at 2:20 PM Marek Vasut <marex@denx.de> wrote:
>
> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> NOTE: The Maintainer entry should likely be changed, although it seems
>       like this driver and its matching bindings are now unmaintained.
> ---
>  .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 ------------
>  .../bindings/watchdog/linux,wdt-gpio.yaml     | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml

Looks fine, but please resend to the DT list.

Rob
