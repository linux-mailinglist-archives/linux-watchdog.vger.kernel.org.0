Return-Path: <linux-watchdog+bounces-1075-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2608D1B4D
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2024 14:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B1051F2142A
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2024 12:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB8B16D32F;
	Tue, 28 May 2024 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="dwXW4Biq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D6HBOi5r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508AF16D4E4;
	Tue, 28 May 2024 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716899358; cv=none; b=HDLta0xmfNmcRU5SUMJq/4B9kJ+lWcUQuXbhTcGM3/Yvp6gWZeTUeVBVBAh0Pp0z1BKiAQNOuTeEEBFYTZc7VCUY0IPqe7Ifhusb8GMNGqcLqmnScTxbAryoySUPyC3LZzZmy+PRV582CvMNdWuUIrcxA2byycV7QK5/+XcKUAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716899358; c=relaxed/simple;
	bh=lyBc29TA4yd8u4TMM6TvlxUzwi3smQ7TFv+ljitvgIE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=jXpjuhg2jfwwKND398Is1oPlVd/3v+yo4I1QgHb91bMaJamEEUO5wPluc6wV+rj/UY5LAxxpBOkfpoy65/UV9U6zowem5FmPpCU/SulBMWAPqnsf7NevRaYeDZygsrWINP8i75nPue7u76/TnrBgJFirF+h5H5hpVsrqd9hxNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=dwXW4Biq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D6HBOi5r; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id F16001C00145;
	Tue, 28 May 2024 08:29:14 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Tue, 28 May 2024 08:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1716899354; x=1716985754; bh=pOHuNo7fs/
	acy1/fCi3/6NTcu7dPBztJ/IQU53R3K0U=; b=dwXW4Biq0+E0YhtvgzTAG29yd1
	BGFmu85dbXSb6Vt9fuB2kKOUcu7bNF8ToXrEm2qVorOK2Q9rRcW+iqMTEHb0AluU
	NzM6tYaNKKdClPYamhwHQiwtQrv/54CUuGQcHzBkuVmTE04NfkvvW9qWxsJTgdVb
	49wbuzxql+89D60wlOeelw77gt2F6T9LAqctL+PsdvPB7PgiN0lBLSpPl1uYHiaq
	PR9j/8AXWGdSrA31KLY5MHDHRgmwyxolkbHBru4+vUUtgAnA3UOj1Cj1/GhzHAR5
	Li0KmYA1tU+qdOedGlhya2EjBoBm59jlTzoWkA13MZbY6uqYUf6hRrk/FUzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716899354; x=1716985754; bh=pOHuNo7fs/acy1/fCi3/6NTcu7dP
	BztJ/IQU53R3K0U=; b=D6HBOi5raC7Eqg7/u81NSKUnIPsV2pIPSb/OSn92QM4v
	Gxju98PvdDb/ED4HEr8BcK0/m7TxQzK/zGkSDEBGg1y/rU3bTZqdma75/YNtumsx
	RgxfdIysfiPGlQjoyEHy+JXSgWt3WXjXiRH53wS0Jg4ZXIZNhvzz2R4FZgXsl09B
	8cbs/gtLj53dKWfQdmoS4hVCQjwgeg954OR1uJ5q0crvsE39admbnitO2twtB3ff
	rMJoQwlTc67MX971i0b6SMz6qg24pxzCT0Z7ivmD93rks1ZXn543ZdIA8yNs2SIA
	ISSmTuFr3mj+ludhV1v3bCUfkBL7XoWWUrakg+lxXw==
X-ME-Sender: <xms:Gs5VZvO6N0uu7bHsWVUBPZWu33LenMGhMNqWOvbHI-XdxBWXED6JtQ>
    <xme:Gs5VZp8Hq3JfvxWq0nRa1RhC4ykQe6ZkRP2BNz5t9DF9Fpqq2n0w2UexlMmfAc6Zt
    9uHMli7oP7Ff6LMcjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejkedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeeiueefjeeiveetuddvkeetfeeltdevffevudeh
    ffefjedufedvieejgedugeekhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:Gs5VZuRwn1uN5tW7SfOfVfXq8mr8nF-kVlX5yI9lTSFrSnblKPK-3Q>
    <xmx:Gs5VZjtVY1EEQ_Aac0Dg3qG8GaolQcFn3xlT8ITao9Flp8NJUCjIow>
    <xmx:Gs5VZncQht7nLPG3uGcMoBLy-vgBoDyYuJGbPNv6a5Wz2jNrlNwuSw>
    <xmx:Gs5VZv2IehLVXnlb3miYzkOgwOnqfGNgJ0jb7apU3HI7oSLIibAG0A>
    <xmx:Gs5VZpu38XnG0PzRUmBgTWZmtrIDm1C5cLHY1ioFMc1nZdrYsPxoJT07>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EBEB3C60097; Tue, 28 May 2024 08:29:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <0780a0dd-be67-45a0-bec9-70458a75e823@app.fastmail.com>
In-Reply-To: <20240528120759.3491774-1-arnd@kernel.org>
References: <20240528120759.3491774-1-arnd@kernel.org>
Date: Tue, 28 May 2024 08:28:40 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Arnd Bergmann" <arnd@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>, "David Ober" <dober@lenovo.com>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Hans de Goede" <hdegoede@redhat.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: lenovo_se10_wdt: add HAS_IOPORT dependency
Content-Type: text/plain

Hi Arnd,

On Tue, May 28, 2024, at 8:07 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Once the inb()/outb() helpers become conditional, the newly added driver
> fails to link on targets without CONFIG_HAS_IOPORT:
>
> In file included from arch/arm64/include/asm/io.h:299,
>                  from include/linux/io.h:14,
>                  from drivers/watchdog/lenovo_se10_wdt.c:8:
> drivers/watchdog/lenovo_se10_wdt.c: In function 'set_bram':
> include/asm-generic/io.h:596:15: error: call to '_outb' declared with 
> attribute error: outb() requires CONFIG_HAS_IOPORT
>   596 | #define _outb _outb
> include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
>   655 | #define outb _outb
>       |              ^~~~~
> drivers/watchdog/lenovo_se10_wdt.c:67:9: note: in expansion of macro 
> 'outb'
>    67 |         outb(offset, bram_base);
>       |         ^~~~
>
> Add the same dependency we added to the other such drivers.
>
Ah - good catch, and my apologies.

> Fixes: 1f6602c8ed1e ("watchdog: lenovo_se10_wdt: Watchdog driver for 
> Lenovo SE10 platform")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/watchdog/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 5f91921afc79..24ea3b6f95fe 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -257,6 +257,7 @@ config GPIO_WATCHDOG_ARCH_INITCALL
>  config LENOVO_SE10_WDT
>  	tristate "Lenovo SE10 Watchdog"
>  	depends on (X86 && DMI) || COMPILE_TEST
> +	depends on HAS_IOPORT
>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for the watchdog
> -- 
> 2.39.2
Looks good to me. Thanks for the fix.
Reviewed-by Mark Pearson <mpearson-lenovo@squebb.ca>

Mark

