Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C3A4E8D09
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Mar 2022 06:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbiC1EV6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 28 Mar 2022 00:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbiC1EV4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 28 Mar 2022 00:21:56 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF9D4A912;
        Sun, 27 Mar 2022 21:20:16 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 7D4955C0114;
        Mon, 28 Mar 2022 00:20:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 28 Mar 2022 00:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=LWULiqUBy94G+z
        Vt5d3sDbXHmVDkBVmNPR0kMei1vp4=; b=U8FZF16IK/JaTMPDzm9qioZrE4gK1Q
        QBhTnK833pkrwvJm5hFCE1Hy3hBuw9NJAqAQEYmkPDaxO1oqF0etgf/XolZj1p6W
        jXq9rzVWWTqDLpMFxD//8dH4mv3X1te/haSTxVbkw8td+FrpQNFh+EIkqCUcUVYH
        4IvBRktce+VeFD6P0UK2M2JT+ZDjJanOCAl91+aT5MEQeMzFBlJ+9ZN7U1irZbyG
        +5Dfi/5vYgicE552nlvL5TIRoNS3SGeETgSALOTjYFvGbVOI5iNqUG6Qcn1abHmP
        DXCItCjijjJYOWSBP0t2ZaPGWnc2W3X0ZwkuddmzaCYLMTywUy59cxmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=LWULiqUBy94G+zVt5d3sDbXHmVDkBVmNPR0kMei1v
        p4=; b=iZtYcskpMu7aXQzeDD9Igr/yA3hzLx1qtL8FKN+N3M19VmS3Pxt4lybeK
        6LwXNDLTkW2PgUDHalDoFkHrajbGzCjhlG2JDskXgrUok8Hw5H07/3hq0YsYHnNz
        etuPsGhonr9gipBgnUEabww5Nz+UMsRyczmLJ/omMWhrEUrJ/4aXQ0zxVTSojQJg
        HoFMKYhB+Xbbisc7DbNrIiYqvs690xxc1vV8yTgndrl3amfIrXVrTCHwyyEIqsk7
        AmxjBe77KSCppOgCxA3CBXAuxM7tYapqY+DcrrtGE3OW/CE5Zt2JrOTdYntpL5sj
        Cn1ecuFY2F0kp1eHOsiJh0IuHpYvQ==
X-ME-Sender: <xms:fTdBYijEn6_dqxoawuoBKj0-WciUuUJ3P840iGP8xN7-OXFSEjlY5w>
    <xme:fTdBYjCRGB4jF2EsAF9UFmuNVePfzFyg9JPQTNtT5OCbVuogKSUV-JZetQBvNqmPj
    lv9jXt3jEtQVOlSqQ>
X-ME-Received: <xmr:fTdBYqFJh1IYkIRwdHQN5IWksfVztlq8qkdpD6jIqhxAHysRfMJNpXpMMlJLqu51yEduV3XSFNeQbBg9sLMOFkZVxWS5LAoaTccL5_WHXpXfS10KJwv9uoHylQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:fTdBYrRrEHMC6Ljq8ZbS_bPqxoO5_o14vgN_-MlrMy6IRIHYP26zlg>
    <xmx:fTdBYvxX9VwGDl67N41o1kWClIH5OfuMwiv6ngrW126QWTYEMA13Fg>
    <xmx:fTdBYp56uSbFFiByTLC25a-dCImaz7KKdPH65KKEAiKD3NFCixwKCg>
    <xmx:fjdBYkIPNcg3CWkoxmY5E7sXPan-3VIgcvnp2KmScA8o-K8S53FRkQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 00:20:12 -0400 (EDT)
Subject: Re: [PATCH v2 01/12] dt-bindings: watchdog: sunxi: fix F1C100s
 compatible
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
 <20220317162349.739636-2-andre.przywara@arm.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <0a8f1844-55ed-7672-6e95-d919d31f5237@sholland.org>
Date:   Sun, 27 Mar 2022 23:20:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220317162349.739636-2-andre.przywara@arm.com>
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
> The F1C100 series actually features a newer generation watchdog IP, so
> the compatible string was wrong.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>
