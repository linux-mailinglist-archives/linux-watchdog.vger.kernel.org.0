Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74FE64002F3
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 18:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349763AbhICQIt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Sep 2021 12:08:49 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:45926 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235671AbhICQIt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Sep 2021 12:08:49 -0400
Received: by mail-ot1-f44.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso7084369otv.12;
        Fri, 03 Sep 2021 09:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X9EoctdCi61dxF0sN3RYUh7Sq1ZZ1hgqyk+aajCi77E=;
        b=rJlp6zMF2xZNKzQ4xplCUEAAGPkGL6bXYfDKj6Kp7LaK+enFq2lj+MBL50E1FauSli
         YT8hy+JHeRohL5zQBwzFCoh9dWP20y0bTqGWip9RPdj3T2HwirUoilRgZgdAO5JR9RQE
         qYFnl4vRQrW5gzZ+GtRM3DQjLbRn9ArR2qxEaKYW2STz1Wv/WW2Lf9th1ev/q0fQg+YA
         IFQx7jEKWul2MaM/WJFG3J/p7pzI+SQzaL/vDpVqNIGKBYtXnuM/xTCsCXC9ykbQIpC+
         wEINTE401WdCILWjykbJDiVjPGy9O4NfVX+y7PJ0QjSdziu0RPhv5ejDwokS2bHMJihV
         qd6Q==
X-Gm-Message-State: AOAM531kuDbvY3b/ZvgLF6KQ1R5Cbu/GvJiOcgOtGKazkJi99zrhwXbn
        k00PZGTGaLN6P2lYQSai8w==
X-Google-Smtp-Source: ABdhPJx6fVy45NUm19V4s1kfkPU3oDPESzTSfZcum5Yriq84uuncy+0f+/TnPB6bRmWPuRaP4J69Ew==
X-Received: by 2002:a9d:7006:: with SMTP id k6mr3874778otj.181.1630685268668;
        Fri, 03 Sep 2021 09:07:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e11sm1090605oiw.18.2021.09.03.09.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 09:07:47 -0700 (PDT)
Received: (nullmailer pid 3026291 invoked by uid 1000);
        Fri, 03 Sep 2021 16:07:46 -0000
Date:   Fri, 3 Sep 2021 11:07:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        linux-watchdog@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: sunxi: Add compatibles for
 R329
Message-ID: <YTJIUocojn3h4R25@robh.at.kernel.org>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 02 Sep 2021 17:57:48 -0500, Samuel Holland wrote:
> On existing SoCs, the watchdog has a single clock input: HOSC (OSC24M)
> divided by 750.  However, starting with R329, LOSC (OSC32k) is added as
> an alternative clock source, with a bit to switch between them.
> 
> Since 24 MHz / 750 == 32 kHz, not 32.768 kHz, the hardware adjusts the
> cycle counts to keep the timeouts independent of the clock source. This
> keeps the programming interface backward-compatible.
> 
> Furthermore, the R329 has two watchdogs: one for use by the ARM CPUs
> at 0x20000a0, and a second one for use by the DSPs at 0x7020400. The
> first of these adds two more new registers, to allow software to
> immediately assert the SoC reset signal. Add an additional "-reset"
> suffix to signify the presence of this feature.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes v2 to v3:
>  - Add else case
>  - Add additional allwinner,sun50i-r329-wdt-reset compatible
> Changes v1 to v2:
>  - Switch clock-names from enum to const
>  - Add descriptions to "clocks" items
> 
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 42 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
