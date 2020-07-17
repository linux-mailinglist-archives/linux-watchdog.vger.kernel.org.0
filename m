Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C14223C56
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jul 2020 15:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgGQNWS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jul 2020 09:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgGQNWR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jul 2020 09:22:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BACC08C5DB
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Jul 2020 06:22:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z24so12583696ljn.8
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Jul 2020 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Ss28C0+mM4ryhX0kbHHIUQ4RNo3GN12IhkPjDaqzOeE=;
        b=NKRXiZK5Vg4lLt6JNcSMS4fVRZqGLbiD3ALj2er8z+jz02t/Me0ivmqvp1Eq4f7cto
         iSCkX0wRPi8LV3a5neyPSxraBBE4AN80wprYFLY9UCrz8D/D0GmWu0Cvr7RSNz5TTQfy
         O42+2QyiWUhRw462YRkD8gdgOs8f6GxEZIf1MLRpn6UV+LxJg0+4eZHnA8kUfaoVfV3v
         fjyPwJSTHsX9XINiTWOt1p0/4oL6AsKumloGbenY15J2SvslvUBg1xIC0bVH5ORZxuMZ
         2grQrDkqAtCVXtvSstlPbK9ERHW2+ZPX35PPQO5Z6elS8vuDABLJKbuilb5nmyf3rLCX
         bh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ss28C0+mM4ryhX0kbHHIUQ4RNo3GN12IhkPjDaqzOeE=;
        b=ZpTPIJc0AOgOXxhSGL9jbZU4HAOyuiSO+wQlzT4WStMWnHT8MFVN/fQvYfOvwKrbUL
         xVPopOw4eNub2vUHCDABn9e+3AnW56kn8XGDq03wMWS5YTqRxEqZFaEuOQUcYS22XwIw
         X+UWVk7quMKEmCdfofi9B2fRwQjd/nt0jpnH75vvhrlBbimXEJaUuUaD4d8c/NvD3vSC
         XVoqgnI1XRl3rPTO3g1ognA5lhbBG9CHvkRu5OSPUontYNaWsMvWtmKcpK4KTiXJfWZG
         eKu7nNxs+nPx27aCh83Ej2/shJ8gHliKHJ9jKLKSk9rlENNPWpOXZs82H1y1iu4TOIzt
         PtXg==
X-Gm-Message-State: AOAM531CV7TY+0oUtb/8D2FBhoq/D4elFLFDxBkC399wHnNyaSkJMRJO
        4YmJXraFg2eZ6hQ6I4+/Ivnwfw==
X-Google-Smtp-Source: ABdhPJyQdCUcPwXAnEcnnv4mCw6GTSBF7SR7eCeWoXfWqYtwdr9WVEBVseii+1OEhPnuCx8eUP3JQw==
X-Received: by 2002:a2e:760f:: with SMTP id r15mr4331219ljc.275.1594992135764;
        Fri, 17 Jul 2020 06:22:15 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 203sm1649722ljf.14.2020.07.17.06.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:22:15 -0700 (PDT)
Date:   Fri, 17 Jul 2020 15:22:14 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 02/20] dt-bindings: thermal: rcar-gen3-thermal: Add
 r8a774e1 support
Message-ID: <20200717132214.GA177462@oden.dyn.berto.se>
References: <1594811350-14066-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594811350-14066-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594811350-14066-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-07-15 12:08:52 +0100, Lad Prabhakar wrote:
> Document RZ/G2H (R8A774E1) SoC bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> index b1a55ae497de..f386f2a7c06c 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - renesas,r8a774a1-thermal # RZ/G2M
>        - renesas,r8a774b1-thermal # RZ/G2N
> +      - renesas,r8a774e1-thermal # RZ/G2H
>        - renesas,r8a7795-thermal  # R-Car H3
>        - renesas,r8a7796-thermal  # R-Car M3-W
>        - renesas,r8a77961-thermal # R-Car M3-W+
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
