Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B242A4D3DCA
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Mar 2022 00:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbiCIX7N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Mar 2022 18:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiCIX7N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Mar 2022 18:59:13 -0500
X-Greylist: delayed 1760 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Mar 2022 15:58:13 PST
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.151.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD2ACE939
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 15:58:13 -0800 (PST)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 477DF7636
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 17:03:47 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id S5LPn2ECzdx86S5LPn7BGm; Wed, 09 Mar 2022 17:03:47 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YES7NizivrMmp+DCNWfLveM3VyxLU3dLyruJlPIenrs=; b=l2Myd8MkFJOHCb44HpN40rPaU7
        oMZr7HRZUI9YCYhjYYuFAdAZLvQ6lX0eQSKa3uDdW7dpMsSzmQAgDVEmNE3ekHMkiF8NzSKfw59G8
        pSO1zABRwX+ki5ysLAaBQ2qhmlO++RczUZFiG10goYeaP2+OoCL5V2ZnvKQWlgprscGUkhi0b6/Pt
        huuJFtcMGmLGTrCX7Yqop6UMYKEdfKkwYDtsFksu5OrkahynxMdqGHHBKtbNOJ9NEYFN1U35fxJl0
        EiRBAEmUH7fcqwwbL1+HA/4CaJVj270JUAJAZTnvecBIaA2iSLLDhoKlA2l5cg41CtWfh/e9v879H
        WRZGipGg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57402 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nS5LO-000CNo-2I; Wed, 09 Mar 2022 23:03:46 +0000
Date:   Wed, 9 Mar 2022 15:03:44 -0800
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
Subject: Re: [PATCH 02/14] ARM: dts: suniv: F1C100: fix watchdog compatible
Message-ID: <20220309230344.GA3801454@roeck-us.net>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307143421.1106209-3-andre.przywara@arm.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nS5LO-000CNo-2I
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57402
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 17
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

On Mon, Mar 07, 2022 at 02:34:09PM +0000, Andre Przywara wrote:
> The F1C100 series of SoCs actually have their watchdog IP being
> compatible with the newer Allwinner generation, not the older one.
> 
> The currently described sun4i-a10-wdt actually does not work, neither
> the watchdog functionality (just never fires), nor the reset part
> (reboot hangs).
> 
> Replace the compatible string with the one used by the newer generation.
> Verified to work with both the watchdog and reboot functionality on a
> LicheePi Nano.
> 
> Also add the missing interrupt line and clock source, to make it binding
> compliant.
> 
> Fixes: 4ba16d17efdd ("ARM: dts: suniv: add initial DTSI file for F1C100s")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> index 6100d3b75f61..def830101448 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -104,8 +104,10 @@ timer@1c20c00 {
>  
>  		wdt: watchdog@1c20ca0 {
>  			compatible = "allwinner,suniv-f1c100s-wdt",
> -				     "allwinner,sun4i-a10-wdt";
> +				     "allwinner,sun6i-a31-wdt";
>  			reg = <0x01c20ca0 0x20>;
> +			interrupts = <16>;
> +			clocks = <&osc32k>;
>  		};
>  
>  		uart0: serial@1c25000 {
