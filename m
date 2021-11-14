Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCE244F7A3
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Nov 2021 12:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbhKNLlF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 14 Nov 2021 06:41:05 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59709 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230267AbhKNLlA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 14 Nov 2021 06:41:00 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 17D0A3200A1E;
        Sun, 14 Nov 2021 06:38:04 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Sun, 14 Nov 2021 06:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=kVt32bRdunDSKqz99dZa5ReeKAhQ
        4s8YMHBQ8vywbDo=; b=fBVrOulOiJoFHb37TPRaCs1N6eOE70DoTFBd3yN/eiR0
        ylw4nnaDlba/dKa7zBXs4ohHl7UP8OEfjxWiiCwiexBXdHmMZIHlngnWy80CThun
        pMrGtEcHzkNqPBKabL70kLXbWmmqv5vndPQA5Ygqv0AT4AK2zqx3QkiyCuYSxVHg
        h5fjTvKldf664cTeO9gnH8paVzOhnKWzmWeNNwqwfos1oMS1aj61/f7KHWe1F5iP
        XWssULDdvERD6XLYmKNhB5vg4mjqcWxa2FoF/3Aq4Dmh4BFAm8HbIiGYB7Ud/f+a
        cpaa/RLUy7pAiYM9eB6AiK/BaAp0/rwVGoiCiVyckQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kVt32b
        RdunDSKqz99dZa5ReeKAhQ4s8YMHBQ8vywbDo=; b=dqGPyo+y47tSBq1K4MI9zw
        1LhJQAXWHbkABKDavhowrb4rhKAPI3suSiQOrcuGjch+yKagPE6WorAAkXdgUKYV
        dAub7yavzDWXkz5jsB7i89NMoyJrd7/buPaUboNKlMJiyHrQrC5TE0zXegWMP69P
        v5E7o6b6ubbzr8DDHPq93uwMe3Ou/a0gM9EVo0rQh8xHHsFr7KMTfTW/Ziv7WS0y
        LfJtRtZyvqZun6zPEUJ7APOGdkoNb2hiNCZNUVbtgXFD4dUYJjG3FRNj7pdPYOc9
        6Ti4AdoKYe65zCK3AWU1XFMZxhfR5M/wKq1ETYv4DFGXH99S659CGCbJd5iYlbrg
        ==
X-ME-Sender: <xms:GvWQYb2mVNl-VY1R32yYkmsr-SqSc5gmyBpuNiOQ1-At41NLp1F9kg>
    <xme:GvWQYaHoCntibUmcptsZf0kYcNuBWbCRI9kRDfYjdOUPhPRO0loq2gfxmRZcu_lyu
    7hAFC9PJmobg9wga2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdejgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhvvghn
    ucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
    htvghrnhepgfeigeeiffeuhfettdejgfetjeetfeelfefgfefgvddvtdfghfffudehvdef
    keffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    hvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:GvWQYb4KcjpfOE5hWg94gLD1HPxLXdGOu08FQow4y-G6jW8EnRXnnQ>
    <xmx:GvWQYQ2zQEg22caSzrafeEJH326hCrfwFmjLus-MGks31oNBauaE2Q>
    <xmx:GvWQYeGuqXbC1ZPeZxR9H1rG7A6TpimlTVStYrqHB16Yfvrpfznrvg>
    <xmx:G_WQYR3d8w4eFA6xs5hPPdcm3yy53zAe0qxxErvC1uIE0dJVeYzQ4g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6E365274013E; Sun, 14 Nov 2021 06:38:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <95dea968-f452-4ba0-9b66-c9bc4269a52c@www.fastmail.com>
In-Reply-To: <YY/YnlCxLqdw/zAo@sunset>
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <20211113094732.73889-2-sven@svenpeter.dev> <YY/YnlCxLqdw/zAo@sunset>
Date:   Sun, 14 Nov 2021 12:37:42 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc:     "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        "Guenter Roeck" <linux@roeck-us.net>,
        "Hector Martin" <marcan@marcan.st>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Kettenis" <mark.kettenis@xs4all.nl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] watchdog: Add Apple SoC watchdog driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On Sat, Nov 13, 2021, at 16:24, Alyssa Rosenzweig wrote:
>> + * This HW block has three separate watchdogs. WD0 resets the machine
>> + * to recovery mode and is not very useful for us. WD1 and WD2 trigger a normal
>> + * machine reset. WD0 additionally supports a configurable interrupt.
>
> Do we have any idea what the difference between WD1 and WD2 is?

I've never seen macOS write to WD2 when running in our hypervisor and only
found that one when I was looking at the rest of the MMIO region.
From what I can tell it works exactly like WD1.

Sven
