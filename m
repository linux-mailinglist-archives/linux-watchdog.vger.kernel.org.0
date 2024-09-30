Return-Path: <linux-watchdog+bounces-2054-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A98989E98
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2024 11:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C62E51F20FD1
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2024 09:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90A718873F;
	Mon, 30 Sep 2024 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fUe0vnYA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OE6WleaI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B7C188734;
	Mon, 30 Sep 2024 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727689116; cv=none; b=ZkgGfnm8RfBuZf/Ad1VIf3Os0MOsa6Fq3XBcBmRBZp3y9O2u8BYwJECCQ2lB4pvErfxRPZ2vBv4YOConCjw/7cARiG2WaeJp/SVxYN5oCTm8IdLsUS7TieEVCZoMu7pMlSanFuxBz98emsPqnwuOb9kfFbSgrGCAR+lqWGFSmM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727689116; c=relaxed/simple;
	bh=AjjCBDd0nsipeu208WcIdXj8TEg91EpXaEoTrHSRxPg=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=W4l3u0b27fn6pmdY5Cn12ONdf3qjKh0yfk4lDrYSNC54NeEwBFcbHJ8PF5D2puChk6UPUQ1R5L/meGeR0JDMc94XdLs4lQhA58Ara49Drp6ISWsXmMGpCC00wXgbq/vgqpVF7R0X9rv0senFLrqfxF62cLUnmbECwx2r/n4F7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fUe0vnYA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OE6WleaI; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6DA971140234;
	Mon, 30 Sep 2024 05:38:33 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 30 Sep 2024 05:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727689113;
	 x=1727775513; bh=0pZwVNr1lAKNsIqugDiiFsNfmcaJup7h9klMs9lcUZ8=; b=
	fUe0vnYAhQAVX7ZNTsyJ0LiJqUjgrnkHcVkAgQJY61z1h8fCgOdXHwrzeRec5xr0
	b+1wxwhcjUeyjUY5Xjc4JspDyd0NjaxzlcZoTVawAbmhGc+9iSsUTHZA6XzHNlWe
	YrM527UYYuyE9tXb5eOkZj64HycUvh1Xdpla9CVFc/HOE43Oc9WIlxs8s6bRL9id
	bke5jD9PZuxkW3j58m7uG95lMb/WxfKqAA54QkB3fm7YcnE7cLp8KxU79IfK3gNg
	RBS8gMV0JwsgegazIsJFWuC6XNYpxiUGL/vYpnBU49Ys4kFhV9/8+6m6GmV7gEci
	sLLJ9s2ZrPd7SS3PPhR94Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727689113; x=
	1727775513; bh=0pZwVNr1lAKNsIqugDiiFsNfmcaJup7h9klMs9lcUZ8=; b=O
	E6WleaIJgBqwfkjwV+6/vVUBwh7werM+AQ1gW2m40RYwJyCSEuXz05nUR3i9Q3MZ
	EEczDZN3dmVoRKhgyYHFLtFhk4QWR8migVDXIBkFZJQmAHI8K5efV6pNQN84tjE5
	Rs3cN7bw2KkKxj7PYFp2vvbx8F+xMe+Wr89MiiDnHazsgCiwQoMGA6nIL4yivIQ/
	iSp/8bQt4d+Nevk1OXfsUGnG0Jug9NS+8rKx0j2e6jD5vTbLib/Jtj9n5mbqe/aL
	gV0CR73Y6DZ48J0kkD8kdY1c2FV+iYhNSNXFVs+8neZTIS1raS1rzDXNOuLtzLsb
	xVpWX7dvUF/JQc8UHI2Mw==
X-ME-Sender: <xms:l3H6Zlpna80A-aKemYDNwdcd2e4ZLSMjLsRNi64f_TbfN1x0bYgzzQ>
    <xme:l3H6Znr5g5BNjNUhj8kZ-2fuq6AZyuuIUH9Oh6qs64BSOtB0ETbODok8tIk1ljv31
    PquAlfYgzvhuW-amZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduhedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhkeeltdfffefhgffhteetheeuhffgteeghfdtueef
    udeuleetgfehtdejieffhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhofihinhgthhgvnhhmihesghhmrg
    hilhdrtghomhdprhgtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhig
    rdguvghvpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoh
    eplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprghlhihsshgrsehr
    ohhsvghniiifvghighdrihhopdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:mHH6ZiMtLdqnPrQxJ7N8hs5M2UJv2rqES9sZHNrpAUJY51VSRpGhQg>
    <xmx:mHH6Zg4W8bZpFUssjQgmUA3sCCR3lb5Ox7kWFnLi2Wi21A_3p5jNMQ>
    <xmx:mHH6Zk68ojMiiGCi1YTrvJmjiOFrVBXnw3AjDnBwfKpKHNgh2MLp5A>
    <xmx:mHH6ZojdRu7BOFJ1iw9wsNTktLKoj4X-iaMx6y9Yl5A6Mh-8RwwyWw>
    <xmx:mXH6ZlHWz7A46fVRwwW6BU2rXaXuOtfZfNaoZRdEV51xPwSR5u61xSvv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D9D9C2220072; Mon, 30 Sep 2024 05:38:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Sep 2024 09:37:53 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nick Chan" <towinchenmi@gmail.com>, "Hector Martin" <marcan@marcan.st>,
 "Sven Peter" <sven@svenpeter.dev>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <6775f288-9278-412e-957b-b341b1a75ae8@app.fastmail.com>
In-Reply-To: <20240930060653.4024-1-towinchenmi@gmail.com>
References: <20240930060653.4024-1-towinchenmi@gmail.com>
Subject: Re: [PATCH RESEND] watchdog: apple: Increase reset delay to 150ms
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 30, 2024, at 06:06, Nick Chan wrote:
> The Apple A8X SoC seems to be slowest at resetting, taking up to around
> 125ms to reset. Wait 150ms to be safe here.
>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/watchdog/apple_wdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index d4f739932f0b..353ecf0b04dc 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -127,11 +127,11 @@ static int apple_wdt_restart(struct 
> watchdog_device *wdd, unsigned long mode,
>  	/*
>  	 * Flush writes and then wait for the SoC to reset. Even though the
>  	 * reset is queued almost immediately experiments have shown that it
> -	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
> -	 * 50ms here to be safe.
> +	 * can take up to ~120-125ms until the SoC is actually reset. Just
> +	 * wait 150ms here to be safe.
>  	 */
>  	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> -	mdelay(50);
> +	mdelay(150);

I think you also need to insert a barrier before the mdelay(),
or turn the readl_relaxed() into a readl(), it will otherwise
be bypassed by the delay.

The comment is a bit confusing here as it suggests that the
MMIO read is meant to serialize between the restart and the
mdelay(), but the _relaxed() annotation on the readl()
explicitly skips that serialization, so one of the two is
wrong here.

       Arnd

