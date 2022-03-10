Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8728E4D3E7A
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Mar 2022 01:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237820AbiCJA4v (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Mar 2022 19:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiCJA4u (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Mar 2022 19:56:50 -0500
X-Greylist: delayed 538 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Mar 2022 16:55:51 PST
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E89AB0C50
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 16:55:51 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 56ABD3200A6A;
        Wed,  9 Mar 2022 19:46:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 09 Mar 2022 19:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=qMB067cjzKW0O+
        0cerGYMqbUb9WGf9tnnpdSgxJ6Iuc=; b=sCNxXDgHCFLSYJ/1eFeMj6bZIiWNwl
        dRukwkAEM8cDpQph80Ic/1h/Mg2Bd26QgA2LB+olvFfRBDEkJ3XGw/drAJzvD59M
        xRw/RspdCFYPylBPqbYP6JWC4VZWl+iqh0iHZ/ExY3CRTRYhK/9BABg0gS8f4Va0
        SsrPtyM+re1TSDOyPCgnGfPEJLH3X4FxwlY8ov7OHrGLDHbD31fXlV0ZIb82MnBR
        /LC2ZroXGNA3HQWU3CTKsYiMxZJQNfaAWcRHPdTtTm3rpYQJGEJC7UP70IMK+xrh
        C+1hFjs7dl2IXaT/2qUExOMjfCM8H4g+tCECMIYFfhAXAiWfm32vr2VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=qMB067cjzKW0O+0cerGYMqbUb9WGf9tnnpdSgxJ6I
        uc=; b=HCJRd39Hi39pqlsoNzEjEL9sAMfY34B8TpvC9/H6kORkjNrKNFAvO4USh
        XcHjYRbRQDY/8HURpBOZDRCV0vV51kpwoJAiBROZP4CxzuPHYCinRefYjqck2LPK
        Vm/kF6cjoUEHiBKK0fKhX0SvOu0wdZPWGQAHnC+V5jjji0/HWYSc8SWZTJyeCvkz
        dDElsdjRPVd4/o8un3o5aG3bg8JOFrvE/sZ/0rSTNVvknc7caf54YfZbeCmcXY1F
        9JoN7wu0DeRMVUbQFjpFJm1Zjb36ee6s7IxiGtu3iBBPYKaI5jZ99PFoEEOZ0MeN
        8keW17lATFeFwyNbmWLXcm148Fs0g==
X-ME-Sender: <xms:d0opYiQIiTSYXj62HHFu2uiStbvxuYcmknR1Xz0UZquLzgFSoIoANw>
    <xme:d0opYnzrznzL0Zf9gR2YYni23dDyLberQGKFU00sfiY2ywMf7A_URWkNGgf5te3UP
    e_4VN6m45DDw9xp9A>
X-ME-Received: <xmr:d0opYv0DXKGtaPRbHcGTQpVBI_EBt5Io6fUbpxUmwHNPG7pK34A04BzxSJ4pswhD6-VWJRaql0SvmxbjNb7AB7M9WfQyjbtEfXMM9cc_QZljGQeucH7BxVz7YA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduledgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:d0opYuBs4rccbORgiqZb5kwPa8aqymj4X1xEgrad5PMgI7APACt5ZQ>
    <xmx:d0opYrhf_ZPlAMNpJZZLQBathZ-2KmyugyvClvMexI7AqlgGBc5zkA>
    <xmx:d0opYqqtZ_WmP-xKV2aPb6M5G5gtqv089_Da3NFKGaeE4RKcFHLgFA>
    <xmx:eEopYr4tfSP1gOZ6hj3pikuZ-DoJ2RbaGaa84m1gmBL6foAS04vIUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Mar 2022 19:46:47 -0500 (EST)
Subject: Re: [PATCH 01/14] dt-bindings: watchdog: sunxi: fix F1C100s
 compatible
To:     Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mesih Kilinc <mesihkilinc@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jesse Taube <mr.bossman075@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        George Hilliard <thirtythreeforty@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-2-andre.przywara@arm.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <661806b7-d63f-a7cf-9192-f67c4cd79f29@sholland.org>
Date:   Wed, 9 Mar 2022 18:46:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220307143421.1106209-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Andre,

On 3/7/22 8:34 AM, Andre Przywara wrote:
> The F1C100 series actually features a newer generation watchdog IP, so
> the compatible string was wrong.

The F1C100s watchdog seems to be unique in that it uses LOSC/osc32k as its only
clock source instead of HOSC/osc24M. The current binding requires that the first
clock is "hosc", so it seems that the binding needs to be relaxed to allow for
this case.

As long as there's only one clock source available, we don't really care where
it comes from. They are both divided to be approximately 32 kHz. So I don't
think this difference prevents using A31 as a fallback compatible.

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 43afa24513b9..d90655418d0e 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -29,7 +29,7 @@ properties:
>            - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
> -          - const: allwinner,sun4i-a10-wdt
> +          - const: allwinner,sun6i-a31-wdt

This can be combined with the enum of other compatibles that fall back to
allwinner,sun6i-a31-wdt (earlier in the file).

Regards,
Samuel

>        - const: allwinner,sun20i-d1-wdt
>        - items:
>            - const: allwinner,sun20i-d1-wdt-reset
> 

