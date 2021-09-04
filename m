Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69AD400BD5
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Sep 2021 17:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236752AbhIDPMw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Sep 2021 11:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbhIDPMw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Sep 2021 11:12:52 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF052C061575;
        Sat,  4 Sep 2021 08:11:50 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so2691156otk.9;
        Sat, 04 Sep 2021 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LsO7ChoiOUbdf0evlicIaWpHPtdos4bfdl0lagLpQi8=;
        b=jFFKC+7ydZD0CmfMIj9jryBDPrD8OC331sUesCkXUkA1hiHFuoUDPSZCWrdSgH/rZU
         8aoUKIifcstigpw1jhVmmxSFYcmoCPfj4jZZYLU7XucmnjLrqbEkoP2Ccck4ZIj4fClT
         ijK8rCYC19MRu8SIkQz6DWzcWxCFBBnwks0Lw/Ay8bJobzmkcTctKt5+LuqPhIe2ifH6
         /DDiFOud/V64LuiUxMbpVKRZUNl25/Wmd3HkOuS1Yj39XdpOchbKI84cvkwArXGXgmdJ
         l+LbKuVYyDAs5jt8dWUUjsAsaZh2Y+QsKhU1oXww4KaNRMVp/LTLB2o94uMVkumDZu2n
         GKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LsO7ChoiOUbdf0evlicIaWpHPtdos4bfdl0lagLpQi8=;
        b=VIV8arscADU/1gDeino65Aw2Y6YgqwTUOeR9ZLPWDfMMlEXe0LxbpMuHqNOiV4aiWd
         TQ4mgPOfQtd8/sodfp7L0KqPjJhAEy3EMLJ3jfHA6dQYPIsvjHJPDSftMVNbN1LLFDV3
         OrIoDjifb+Gf+exh33KyXQ4qWBoywQdO2lh6tI594LodGRtXrB/IGZvBzmTpnK97DC+n
         iQeE21MufROvgcA2TXTsSSKYdrHeJueFkgZ0C0mjot1vkUx1XG03GVimUOE1Cl0eFZTC
         oR+7o8/VZRdeylWVKVwehlP+nfzBp0cqjGHD/Rqrrek9lo1bhU145u/qF0UxQ6YtZwR5
         5D8A==
X-Gm-Message-State: AOAM532mJ8SfZX8FHxRvnqhg62938fsHZNH/XhQz6/iVxkylvvAtT6ky
        rraPLsKRxYMBMb+hcUeSw34eVGEZoNw=
X-Google-Smtp-Source: ABdhPJxq2ImOOCGgziVvhGxFIqJeuPTlcWvwwDubYXJAg+nxscgQK8iGkKUPLvx+DnC+FlKQC4Qw8Q==
X-Received: by 2002:a9d:4b86:: with SMTP id k6mr3725632otf.338.1630768310180;
        Sat, 04 Sep 2021 08:11:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c75sm531751oob.47.2021.09.04.08.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:11:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Sep 2021 08:11:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: watchdog: sunxi: Add compatibles for
 D1
Message-ID: <20210904151148.GA3638506@roeck-us.net>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 02, 2021 at 05:57:49PM -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
> 
> Similarly to the R329, the D1 has three watchdog instances, and only one
> of them has the "soft reset" registers. So that instance needs an extra
> compatible string.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Acked-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes v2 to v3:
>  - Add additional allwinner,sun20i-d1-wdt-reset compatible
> Changes v1 to v2:
>  - None
> 
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 877f47759814..44cad9427ae6 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -30,6 +30,10 @@ properties:
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
>            - const: allwinner,sun4i-a10-wdt
> +      - const: allwinner,sun20i-d1-wdt
> +      - items:
> +          - const: allwinner,sun20i-d1-wdt-reset
> +          - const: allwinner,sun20i-d1-wdt
>  
>    reg:
>      maxItems: 1
> @@ -62,6 +66,8 @@ if:
>      compatible:
>        contains:
>          enum:
> +          - allwinner,sun20i-d1-wdt
> +          - allwinner,sun20i-d1-wdt-reset
>            - allwinner,sun50i-r329-wdt
>            - allwinner,sun50i-r329-wdt-reset
>  
