Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE47E4F1704
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Apr 2022 16:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237299AbiDDOds (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 4 Apr 2022 10:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbiDDOdr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 4 Apr 2022 10:33:47 -0400
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.194.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E62F3F302
        for <linux-watchdog@vger.kernel.org>; Mon,  4 Apr 2022 07:31:51 -0700 (PDT)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 01C9DADFA
        for <linux-watchdog@vger.kernel.org>; Mon,  4 Apr 2022 09:06:56 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id bNKBndAVPHnotbNKBnO7zf; Mon, 04 Apr 2022 09:04:55 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=K/Iz8lz+bBMhFV3lQqHqSsiYiXnliRuQPADXVtgEoLk=; b=Az7iEK9SepQCmQLdh9PJHZ8qT2
        ADqqtIX1aD1syu0+xbaRLyozn9T4zbgyk1jrkb+cShj2lJHzQPyHxiihrNbehEDCnvIhyrRqtnFxX
        xWAtD6XQC62QRoPHd54xSDRU0766Y3ruH7hJcyYxl4fxggFbs1INF+kenRJkjCc+gx2w7HjH1Ss8A
        l8L9G0mjD5CIsRPZ82rSuwmXOiuzqCpqOoJolR7/SFezTzDzgmR2yqcjKXwDfQAF70wlHYk0GMBXz
        qDA8If4pNOEPBvSmbh8xPiZg70pdThsN4x+t/DnYkweRLOh9gYhYG09Tm7u/vhbZ4JqZPkKVwDecG
        XYaBNAzg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57852 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nbNKA-000pyr-Mz; Mon, 04 Apr 2022 14:04:54 +0000
Date:   Mon, 4 Apr 2022 07:04:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mesih Kilinc <mesihkilinc@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jesse Taube <mr.bossman075@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        George Hilliard <thirtythreeforty@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: watchdog: sunxi: clarify clock
 support
Message-ID: <20220404140453.GA3286578@roeck-us.net>
References: <20220317162349.739636-1-andre.przywara@arm.com>
 <20220317162349.739636-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317162349.739636-3-andre.przywara@arm.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nbNKA-000pyr-Mz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57852
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Mar 17, 2022 at 04:23:39PM +0000, Andre Przywara wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 7a26cde0afdd..cbcf19f51411 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -39,14 +39,8 @@ properties:
>    clocks:
>      minItems: 1
>      items:
> -      - description: High-frequency oscillator input, divided internally
> -      - description: Low-frequency oscillator input, only found on some variants
> -
> -  clock-names:
> -    minItems: 1
> -    items:
> -      - const: hosc
> -      - const: losc
> +      - description: 32 KHz input clock
> +      - description: secondary clock source
>  
>    interrupts:
>      maxItems: 1
> @@ -71,9 +65,14 @@ then:
>    properties:
>      clocks:
>        minItems: 2
> +      items:
> +        - description: High-frequency oscillator input, divided internally
> +        - description: Low-frequency oscillator input
>  
>      clock-names:
> -      minItems: 2
> +      items:
> +        - const: hosc
> +        - const: losc
>  
>    required:
>      - clock-names
> @@ -83,9 +82,6 @@ else:
>      clocks:
>        maxItems: 1
>  
> -    clock-names:
> -      maxItems: 1
> -
>  unevaluatedProperties: false
>  
>  examples:
