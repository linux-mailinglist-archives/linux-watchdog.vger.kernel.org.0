Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30B5301737
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbhAWRaY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbhAWRaY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:30:24 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14E5C06174A;
        Sat, 23 Jan 2021 09:29:43 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id k8so8452619otr.8;
        Sat, 23 Jan 2021 09:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3puvH5L1KRDWtKEUAlvHXEZu8I1zk2cc6t75N2DvFJQ=;
        b=PHZGgoWYjgxoPgVrPav8gdm5QNNWhMtJCnk7UeI1/TuenY5z4kiRy8kqpivL28llPo
         zUopJJznFJ7wgsGlUTEyXPmbbHhFpsvAkpbh0biKLbCoefJp8ggP2BbntJXZuysvWF7C
         o/QvXotsRkFG62gmwtA0KR5Sop/fIHQLuu4FTX1ZXfTkJIs/5jShZcQjOqOI+yraA83K
         Ww2fQ3krquw5naCiHybbkY68o1KSqzaH/xPicIwvS74yS0oKQtoL0gCdpgtMSBIQQOjt
         zTHPQI7j/j1TzeifkUn5blg7MyGJA/2LzNP6n/MLtedATmytM70qyFONxl1QeLnYpz9g
         UkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3puvH5L1KRDWtKEUAlvHXEZu8I1zk2cc6t75N2DvFJQ=;
        b=RAZmezFdpmmWtcoBDOhSQ8z7QuVCww3/iX/3RJMKPWrcfXfhp/lwoW3PGIQnPIh66R
         lGzr1hMOnTZoR4XHnD9wFmThLY73O9Td5Ey87+MfbTSuqFVA8vtMN7owAlUlJzeM5My/
         s34oyTX00reTfT1e1QpYeqntO3uCA6wmAC+QKOqXxoWsVnknMAmVm78kEDw8BiXdmtiV
         j5yZW5qJ45qj4gxYLXenx5Pan/fGS3i12jv4ZD965JXExmLeZVLJinjNXs3FvD+RDOdz
         yr0wsEEIh5RzSbWnxT6YXxmKxzF4QoCQ2xafomMpdghlCrim3wilFw+SMgK0UE9fwG3W
         MFGw==
X-Gm-Message-State: AOAM531R2YGQ9Bax2aOfrAn+1YU8ZxNuduVwmipkdpUzqrH0cQft1ktG
        EjFs1GslE2nwlvmfPF/T3eo=
X-Google-Smtp-Source: ABdhPJweF+RoTeM5djHPKGZzJlsU49ZZwkEIDxupe1PHBGnmv3SSsdQUbOF2XX0bRzDUZWgkG5kq5g==
X-Received: by 2002:a9d:1710:: with SMTP id i16mr7120046ota.260.1611422983198;
        Sat, 23 Jan 2021 09:29:43 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v10sm2392545otj.59.2021.01.23.09.29.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:29:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:29:41 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 17/21] dt-bindings: watchdog: sun4i: Add H616
 compatible string
Message-ID: <20210123172941.GA56996@roeck-us.net>
References: <20201211011934.6171-1-andre.przywara@arm.com>
 <20201211011934.6171-18-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211011934.6171-18-andre.przywara@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Dec 11, 2020 at 01:19:30AM +0000, Andre Przywara wrote:
> Use enums to group all compatible devices together on the way.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 5ac607de8be4..9aa3c313c49f 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -19,13 +19,11 @@ properties:
>        - const: allwinner,sun4i-a10-wdt
>        - const: allwinner,sun6i-a31-wdt
>        - items:
> -          - const: allwinner,sun50i-a64-wdt
> -          - const: allwinner,sun6i-a31-wdt
> -      - items:
> -          - const: allwinner,sun50i-a100-wdt
> -          - const: allwinner,sun6i-a31-wdt
> -      - items:
> -          - const: allwinner,sun50i-h6-wdt
> +          - enum:
> +              - allwinner,sun50i-a64-wdt
> +              - allwinner,sun50i-a100-wdt
> +              - allwinner,sun50i-h6-wdt
> +              - allwinner,sun50i-h616-wdt
>            - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
