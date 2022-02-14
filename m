Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702A04B5552
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Feb 2022 16:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236137AbiBNPvj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Feb 2022 10:51:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiBNPvi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Feb 2022 10:51:38 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1097449275;
        Mon, 14 Feb 2022 07:51:31 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso19732524ooi.1;
        Mon, 14 Feb 2022 07:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=93awWPSLOLHCSsywlBhIZubcOu6uImvQP2Eyrh2/H2Y=;
        b=SlWZHmVRn2ZL3YItm7H/bIg0N/t3riHntRZoNd4ygaR8fyH7ps0pimSqAY9uDjqWd6
         d7h/uYGUtR427j5mXX0XgFaYo0pojDz+yI8f3JUgZWtM61AIkhVqZalhg7bs7DNb5F/z
         AoXG9/Rfc8YoAVlUnsQbpKyWuQNiyidu/Mwq7yPs44xGQHP5zhcMhr63/KkFqX8dPD06
         ypTuk1XALOEmjWVsMc6UROb5GgnoxlJr/QhJabJCP+/AnXuVufdzXNbiIxibT63uhSK7
         PjFvWGAzvLmixOeR1WqBeqQMZuLP13cSAlXtE3i29HLy+BlpeMyp88f79aXrOW2noBr4
         Jctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=93awWPSLOLHCSsywlBhIZubcOu6uImvQP2Eyrh2/H2Y=;
        b=VcsgU96zhf+mRw3FG0VHmx3dfM95IUSUK89+A/mSrwjZE1rPriz3JvsErDlozPSiB6
         SZ9/v5B4SGLUuQH9he3qTmL8NIeIFLz6LqkEL6vXLkYhFwVzhex/ol5TesFNJK7eiH9w
         qG0yrG02OGgm+1VpbyBHqoP1R60H1LkrJlku1E40uHnqBNRVWj5WgQ934awLurOs0pq/
         PMolQ8bIfNbI75Ph2GunHBvLG4Z33kt16Hk/6W/zSkVotB9QuMnVku36Ai985HlpKoWc
         BFmv0HGYfR9qfdvFNua0aEDK33xMdLMyhdmux/MJW3pzf2UgEakzc0Zfkask9/3LfbPo
         74/Q==
X-Gm-Message-State: AOAM531csmy4QnkMS7S3IuiZ0ojHWFoBg9THgHqM6QxP/g2ENVb0DNAh
        leDcfSZIfWTsjBC4UGK9bcQ=
X-Google-Smtp-Source: ABdhPJwZgPJK35jhIBYuXxiRd5c+QY7PplfyFRwRwdzvscMyIofl6BY6z9hMXNqAw305zsXw/2+New==
X-Received: by 2002:a05:6870:818a:: with SMTP id k10mr73072oae.17.1644853890136;
        Mon, 14 Feb 2022 07:51:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k13sm13061401ots.48.2022.02.14.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:51:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Feb 2022 07:51:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a779f0: Add RWDT node
Message-ID: <20220214155128.GA101460@roeck-us.net>
References: <cover.1642525158.git.geert+renesas@glider.be>
 <556a7f41bdadceecbe8b59b79ac7e9f592ca17a2.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <556a7f41bdadceecbe8b59b79ac7e9f592ca17a2.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jan 18, 2022 at 06:09:04PM +0100, Geert Uytterhoeven wrote:
> Add a device node for the RCLK Watchdog Timer (RWDT) on the Renesas
> R-Car S4-8 (R8A779F0) SoC.
> 
> Extracted from a larger patch in the BSP by LUU HOAI.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> index 5426532d10e2a472..0ac8c345558efc17 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -59,6 +59,16 @@ soc: soc {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		rwdt: watchdog@e6020000 {
> +			compatible = "renesas,r8a779f0-wdt",
> +				     "renesas,rcar-gen4-wdt";
> +			reg = <0 0xe6020000 0 0x0c>;
> +			clocks = <&cpg CPG_MOD 907>;
> +			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +			resets = <&cpg 907>;
> +			status = "disabled";
> +		};
> +
>  		cpg: clock-controller@e6150000 {
>  			compatible = "renesas,r8a779f0-cpg-mssr";
>  			reg = <0 0xe6150000 0 0x4000>;
