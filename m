Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C60924E7D2F
	for <lists+linux-watchdog@lfdr.de>; Sat, 26 Mar 2022 01:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiCYVMJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Mar 2022 17:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbiCYVMI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Mar 2022 17:12:08 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC0313F1B;
        Fri, 25 Mar 2022 14:10:32 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id q129so9514425oif.4;
        Fri, 25 Mar 2022 14:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2TNPm4s2d/avyYNyKgm5CxLZb9xC2asaX7pXzx+AArg=;
        b=cgy+ob/SRo1Q8TXRDKbL9YzvHkS36vX62SWvhhqgWXz2wrw2Tdun0pNa/ekFC9sPy8
         cC9M/AxDfBdQUULWnhZJXu9TryTrIlTKRYM7dx3NEPq1t1YUbvawoe3Z57ubCVe/oxn8
         +HTQDnE4Hu2JZbzTjdsvg+p8MaYdlAUb+G5U6RCnQXz67pDzH7VWgdwv7FWd39pEWH+F
         5vXrhCGWj0RkWbo1YAtAmmEOQx2JZ3gVE8JtOrgA0LoWUxuqk8AVHj84Vr9UhaPSn3jK
         Xi/6QpKfwGvDvR7ShQ6w7usEdHQErn/ybLiX6kBv5P6A4+W3nsGbk3TdGyXaZerTyLCV
         XYsg==
X-Gm-Message-State: AOAM5319SO71D9ZsWmzsN5N2j1Jvv+VHqFtVDIzbRA48sQfTqhXnsH4t
        IS4YZ5iojhI+EoPkCeArzPEOnxmZvg==
X-Google-Smtp-Source: ABdhPJzcixabbXOwrUOVtS0coroIVjXvK0Wc/6jAmqmd0HOfLzrGJXCVH1qVrBh5a/RGQrQbiaYViw==
X-Received: by 2002:aca:1712:0:b0:2ec:e1a4:1ad1 with SMTP id j18-20020aca1712000000b002ece1a41ad1mr11155141oii.78.1648242632075;
        Fri, 25 Mar 2022 14:10:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m13-20020a9d7acd000000b005cda59325e6sm3069602otn.60.2022.03.25.14.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 14:10:31 -0700 (PDT)
Received: (nullmailer pid 459339 invoked by uid 1000);
        Fri, 25 Mar 2022 21:10:30 -0000
Date:   Fri, 25 Mar 2022 16:10:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mesih Kilinc <mesihkilinc@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        George Hilliard <thirtythreeforty@gmail.com>,
        Jesse Taube <mr.bossman075@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 02/12] dt-bindings: watchdog: sunxi: clarify clock
 support
Message-ID: <Yj4vxqRSKR+rcBLO@robh.at.kernel.org>
References: <20220317162349.739636-1-andre.przywara@arm.com>
 <20220317162349.739636-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317162349.739636-3-andre.przywara@arm.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 17 Mar 2022 16:23:39 +0000, Andre Przywara wrote:
> Most Allwinner SoCs have just one input clock to drive the watchdog
> peripheral. So far this is the 24 MHz "HOSC" oscillator, divided down
> internally to 32 KHz.
> The F1C100 series watchdog however uses the unchanged 32 KHz "LOSC" as
> its only clock input, which has the same effect, but let's the binding
> description mismatch.
> 
> Change the binding description to name the clocks more loosely, so both
> the LOSC and divided HOSC match the description. As the fixed clock names
> now make less sense, drop them from SoCs supporting just one clock
> input, they were not used by any DT anyway.
> 
> For the newer SoCs, supporting a choice of two input clocks, we keep
> both the description and clock-names requirement.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
