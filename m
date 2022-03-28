Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79FF94E8D0B
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Mar 2022 06:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237987AbiC1EV7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Mar 2022 00:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235838AbiC1EV6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Mar 2022 00:21:58 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5616D4F9E5;
        Sun, 27 Mar 2022 21:20:18 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id AB39B5C0102;
        Mon, 28 Mar 2022 00:20:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 28 Mar 2022 00:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=gcxTe7I+b2cXOh
        r8iL3p+tFExo38rtxcEnrviRHBb0c=; b=Lwfcip6WRZvpBe5iKnUoEcAQOf0NrB
        FIZD2NAGhQPIoo9fHCFKDcgcXahWVL8mhpCvsPjGu+xfp5g7Bmyrqie6LGAEx0T/
        8I3OCP7XWGG+Y/g8zZEtE+IJSbAmcUyMqFaSxVBJVtnaD/RcNBP/zSMmEYwFYbyy
        AA/2BS5mpYvXaSQnJ1s1OmIa5+BzTw/TVQHEZzaw0hrXa9fA8713U0vGlXybQiyy
        qrPwSTCK42dQPVsiJ4r+eINgYxZFQYnYXIGRHqN8ZHbkkPi7vazqmN3HB37kKM0B
        ndaA50vSXVUJwFwhMdPV10vDw1i98iLJdDDff1o6WntWrBI+3L4EkPxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=gcxTe7I+b2cXOhr8iL3p+tFExo38rtxcEnrviRHBb
        0c=; b=Lm66+Zocfvrts8tNO1wO43dzCSqNpnXLLLbm1yLSXbl4oIXnYB+LbBUUi
        0Sz5BY0fAZAFUozh3z+/lIioT9aYnVlhmZp8n1jKh6C3ITDgF/zz/FUtGmSa13HV
        A5iz5npML08vIrllxqC3W5G0bOZvOW+mpjw7flTN1j8UCnN2Va8zkU86ZGYviCWm
        A3PkZXQIdIEpMDQNJBu9Cl5nQHhq/V8I0AtAAkhAmvla0RAJYox6bpJdx+lkTrHJ
        00u9IECYHYoGbFrlNvJfrC4qNALLJbyUwOAi0WW022BpWDZOVRCuVav9CFitPYmP
        iRKdXpLWHZtPpGBVw9QRgRhX1L0Tw==
X-ME-Sender: <xms:gTdBYs7XNdLjXr-vMkJjNAophmCJZbnjOOAX2tnGtZ7RkOfmwuS3Rg>
    <xme:gTdBYt4Srr5_5rjlBp6-NeEamLk0ytt2o5i-N_rVeND9NSup5hNJPWKHf_U0JNC-A
    6wsVFA8uHCo5hJ8Rg>
X-ME-Received: <xmr:gTdBYrfUGXXhpD7RDyB0Ex5bdIgA5wR8K7AalFdX323JD61hzmG3_JMLea3xVWS5PNrBF-MLBoCabDEg-b4R6nv9Ricq0YlQSchHU8Juub3XGPc41rTddYYm2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:gTdBYhJosyAl8bQxLrtc4FswH6fvp1-qhObOqYgHJznTSl4KIYzfMg>
    <xmx:gTdBYgJAv-Q2MbbWNrJvx88cxIx2cAQ7exVLAubECQ8PkQgvncHHIg>
    <xmx:gTdBYiyprneBQmMKIHgMM_PTmFuZ_z88qq5DS1H8BzWPhdlBX-ePzg>
    <xmx:gTdBYigX5XLCI9p8goEIgnirT6j8DUCNSUheGJrdP20HnPC7qQjfsg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 00:20:16 -0400 (EDT)
Subject: Re: [PATCH v2 02/12] dt-bindings: watchdog: sunxi: clarify clock
 support
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
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
References: <20220317162349.739636-1-andre.przywara@arm.com>
 <20220317162349.739636-3-andre.przywara@arm.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <0d53e8c7-aa32-b19b-87b7-3923354f5a3f@sholland.org>
Date:   Sun, 27 Mar 2022 23:20:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220317162349.739636-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/17/22 11:23 AM, Andre Przywara wrote:
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

Reviewed-by: Samuel Holland <samuel@sholland.org>
