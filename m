Return-Path: <linux-watchdog+bounces-1041-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 152778BE095
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2024 13:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9731D1F28D84
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2024 11:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AD314E2CF;
	Tue,  7 May 2024 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ruObwgyP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JPiQrNkS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01805AD5D;
	Tue,  7 May 2024 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715079622; cv=none; b=j9lLIaCAh2TudkF6ZaJ6Yglhzj5cVpG0dzkaLI2V5DW/z1yVHyCpfryy6badIUiOmsN0aoD9KlYq+xXz1KaNPdfvyHs/8KVg21R4ck0cuZqEQsrFAz8dILtNO6hkN2IM1VLpvtf88l+EGZsvkcEG3rokCnzsD7Mm/gBl4o2mADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715079622; c=relaxed/simple;
	bh=GOmPvKg/hsfEYvJtMOTSpt/ymBtdoK3BtudP593XGbM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=I9Mj+9YvAb3G1TG60LHmsc+d15uBO5g8O8ObBBH8PjkZPwZsPQ8Xpo20+A1KkM2eDFELfXKmLj9/9OlcelStZpswmwM+rnf2lBrBxaH/qCSE1+/V1/yJbQJ5WxdhiDz9eBbeUN25S6J5Whum6Ff++MJ4PHna/cBF3R/zPPLgRCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ruObwgyP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JPiQrNkS; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id AEC7B1C001AE;
	Tue,  7 May 2024 07:00:18 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Tue, 07 May 2024 07:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1715079618; x=1715166018; bh=JqMkiABxrb
	ndUZwTzAatMGUFhKdyLpKog3/3w8OVh1s=; b=ruObwgyPMKloZsdgwjWkxX/IQk
	cHH+QCqU0Y19xzIsF2/qpu3hAwF6RjLbHRaGh3vKNO7VhpiuHMxI3A3T/+d9bf8J
	lia+KUmYadDnwNZSSOG68EFCKLIW/LSeGyBOcpbbmtazzuszelx1/wcsi7/Q9gkF
	zjPHrYC18YHgdaByvtZTuRAFKgCs4MWvf6KIK7zM2TQAaCPJe3FPdAcXoxSZcD89
	+GFEDB1acq4BI2fGxA7q8roeMl0Ip5lt7JOlS3aOwTJiGp0/SBseATyvyNVXA6K3
	kv+fVvrTBgX6PmOJ5GbaR8SUeAF+uCHzlESSs3FGAsi6If0HaUFXDLsYtTvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715079618; x=1715166018; bh=JqMkiABxrbndUZwTzAatMGUFhKdy
	LpKog3/3w8OVh1s=; b=JPiQrNkSV4p3LLttv8Og/5N1eunSq6XLjw43U4PYGmM2
	YkqLACHr3TpemhrsEqMALDw1ZTiJ0QvZ9aYJnDWNBPXrpcB9dmlGIRwio+jV661j
	kHmB7UZ4wRdHa+/ktqXj/SPLvV93VyMrFYYDNt4BXXQEEpWS3du4moNllSkQdf00
	iqbXR55eTcTAluYk9ab/OESfqbZss0NemWdLXm3WOK+UQ3p3Ki07FQZ4DYQabeJ6
	oyFfqL+uVuVjsElADnC9DNAOWoAHyxxtilxOO1623DkJHRlWrIkDUontI2Nh0yTI
	wymJ4O4UwokGjeCPd0f3M/vVZ44RzT8bcGkxhDvt4A==
X-ME-Sender: <xms:wQk6Zuwo1ST4goClnMR762cs2znh28PGO3uu1DPJfoPJaelEWnrtEg>
    <xme:wQk6ZqSQDNs1I-Ew-FtpXqXTDlC2HCP9bhBYNUrVHm_84XOXtyRVIcftdy3ox19VE
    oP8L0z4VUJKtd1Giiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeeiueefjeeiveetuddvkeetfeeltdevffevudeh
    ffefjedufedvieejgedugeekhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:wQk6ZgVG3RSZL8Pd5L80Dhzcy6qJjUao3_-5EE-1rXm8AnSa37oUog>
    <xmx:wQk6Zki6ntaVToL73sefS1HjJucPgilsYS6Lr5FLWd2QgD5c-dM9yg>
    <xmx:wQk6ZgDFlWOdwMWYokRYN6NvrZtRioI1iGD7M0ubqDvWsIrOo65t8w>
    <xmx:wQk6ZlJ9qRJKkeS_VMaA5zutT0hKRbYwQ2aSC7YmrUJaEcpYgiGZ1w>
    <xmx:wgk6Zv6YE4V6moggRBGLZVJAP8ciB4fJFmAsEsZaiuf7OuElkqgbdcEG>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9A1BCC60097; Tue,  7 May 2024 07:00:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <39139c19-cf91-4e25-a52b-876d0880f5ed@app.fastmail.com>
In-Reply-To: 
 <58005595a05ef803b454b78d3ae9b8ee0675bd5d.1715076440.git.geert+renesas@glider.be>
References: 
 <58005595a05ef803b454b78d3ae9b8ee0675bd5d.1715076440.git.geert+renesas@glider.be>
Date: Tue, 07 May 2024 06:59:57 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "David Ober" <dober@lenovo.com>, "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: LENOVO_SE10_WDT should depend on X86 && DMI
Content-Type: text/plain

Thanks Geert,

On Tue, May 7, 2024, at 6:07 AM, Geert Uytterhoeven wrote:
> The Lenovo SE10 watchdog is only present on Lenovo ThinkEdge SE10
> platforms, which are based on Intel Atom SoCs, and its driver relies on
> DMI tables.  Hence add dependencies on X86 && DMI, to prevent asking the
> user about this driver when configuring a kernel without Intel Atom or
> DMI support.
>
> While at it, fix the odd indentation (spaces instead of TABs).
>
> Fixes: 1f6602c8ed1eccac ("watchdog: lenovo_se10_wdt: Watchdog driver 
> for Lenovo SE10 platform")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/watchdog/Kconfig | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 24dfecbb30157fff..f002e9627c076f1f 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -255,14 +255,15 @@ config GPIO_WATCHDOG_ARCH_INITCALL
>  	  If in doubt, say N.
> 
>  config LENOVO_SE10_WDT
> -        tristate "Lenovo SE10 Watchdog"
> -        select WATCHDOG_CORE
> -        help
> -          If you say yes here you get support for the watchdog
> -          functionality for the Lenovo SE10 platform.
> -
> -          This driver can also be built as a module. If so, the module
> -          will be called lenovo-se10-wdt.
> +	tristate "Lenovo SE10 Watchdog"
> +	depends on (X86 && DMI) || COMPILE_TEST
> +	select WATCHDOG_CORE
> +	help
> +	  If you say yes here you get support for the watchdog
> +	  functionality for the Lenovo SE10 platform.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called lenovo-se10-wdt.
> 
>  config MENF21BMC_WATCHDOG
>  	tristate "MEN 14F021P00 BMC Watchdog"
> -- 
> 2.34.1

Looks good to me. And apologies on the spaces being wrong in the first place.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark

