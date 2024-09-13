Return-Path: <linux-watchdog+bounces-1893-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529C97876D
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 20:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44C7CB213F6
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 18:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B94446AF;
	Fri, 13 Sep 2024 18:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="jDfJUCZd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S3vKPw3X"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B8422338;
	Fri, 13 Sep 2024 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250550; cv=none; b=K+7ChdXuZxlr4ckarnsEgp7ncFC8VIwo9jGOfTjzMIoz1DKvMUdor1p02JOihhOt2KdbkBFU77l46SbrveiP34bqLaI7k4OknPsLK+hnJShyU6MByklpHOihonrWALY6KOYYvaQXQ85QQghZeQLVgOFxxK48KoG+1NoMl3Jwu9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250550; c=relaxed/simple;
	bh=/xiIVCpQW8QVmjZDSV8aZTbb32lrd7k8VmT6lTMuWYs=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=XvY+8ovlGJIbqpqleyuVpyedKKTeIMuvwes4nPxs4OUuQ9epfL4A3w9nZAGPg4V+Y9qZq4mXDSvEbchcGNW9G45h9JjBMYbvb1nAYQnVNHNv2exAz32HaXxGrkz98GT3nbl9aUSii9DeGgMFYG6sdN88tQHZvDzFQy6/QC/phPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=jDfJUCZd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S3vKPw3X; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id C1C1C138019B;
	Fri, 13 Sep 2024 14:02:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 13 Sep 2024 14:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1726250547; x=1726336947; bh=KgF0/2DNs9uieC59wQf5tgot36dlRR/u
	LSlmHjblz8o=; b=jDfJUCZdWRxOrQNYqiCr29EzjLrYMMyWE8xrlqsLM4gCD0m4
	fIBqqCscBgOc53ODPmHaM9lIwcOIeE5WXUENMS40op1bgfe7WaJm9+uKMiuGpbYu
	z68XBaOvdCHbVaWjFYeA1XVzg3uhs71MHeErif85AA8UIoTbp5wlxqf15VmLvFKF
	68IvfoLSVxTpTyx1yBQ3ffGpplSvbitYlK58/Gok4cdneqPoL6JZHZJZwx5/1bmf
	ZcP2iF2rPZxOBsHefvXTIC0oJI/9ovVPBv1rgfypihgz82prof1VIY4tw0bq8HfE
	HoCo+Rx8TDF+vYk32/YIoI2nQOAIBZESWu7Xqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726250547; x=
	1726336947; bh=KgF0/2DNs9uieC59wQf5tgot36dlRR/uLSlmHjblz8o=; b=S
	3vKPw3X8+p0TuP5oitYCrbasHjLSNfzYbnLPPTSUD9n9SOsBHBTV3rhRoG9Sz0+f
	iYBtg2anqYVoK2XIUoirmgmpKYBGg6bRmuy062xAw7pKSWwVoppNDSrpwmUIyrTI
	b1WddpmgFklmtzlmDR8i+wPjHeL1wjeFsqkbJR6CCePUnTo3h/ZlODuSbGJj6nJs
	ehj9Z262VUsbnNPdd10IDNKw3DxbMNymnuEQRpBdN1WQactt4+vBFbAEWDfhKZgY
	GwrdbqNJnpV4P5FxzT133Eg6q0SWrLlwO9l9A87cn6Ht5a/X/AK0hMCN4xKOpKvZ
	LsRnhhTy6q6ssdlLTQLUQ==
X-ME-Sender: <xms:Mn7kZi5ixJbZmhT0bVEtddEfFd-tQM4Fg1eGjOekVYL8o0HvfiBM1A>
    <xme:Mn7kZr49MVBKoyNmQB7os9zjSbnWDUJChlhouk_wKZtfAKzyoOfyEYeB3_WbGgWFh
    hRkcTpGg6G51nMUx_4>
X-ME-Received: <xmr:Mn7kZhdW-Ah9w-QxaNDS_FMuxeBSbTtFMa2ULkkE-3udsueyJ4w8jvIlgUYaUVWthuvAaoLrFYdPUD7JkwOPpyYaBzOQ5PbOw6qFy_GhRLGDN4Vq2SMP0JIj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpegtgffhggfufffkfhevjgfvofesthhqmhdthhdt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpedvhfdtudduvdeujeeufffgudekvdefvefgueei
    iedvledtheegieevffdtteekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhiheslhhi
    shhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehtohifihhn
    tghhvghnmhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepfihimheslhhinhhugidqfi
    grthgthhguohhgrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghi
    ghdrihhopdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpth
    htoheplhhinhhugidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshht
X-ME-Proxy: <xmx:Mn7kZvK9LIOXYJhkNiRYtHzMBLdArpEcWF2HUUeKWfBdzw51UOy9UA>
    <xmx:Mn7kZmIQEEDreFMXyn5maw8cZZ3V5K0pUzY6Kc1FLgUmMylX5OmKjQ>
    <xmx:Mn7kZgyizUyd_tZRoEhVDhAOoVN3XbYxZCyGrJe1Yp_nJHYRPVw2uA>
    <xmx:Mn7kZqJY0rBUI7QTtaNy2dT3F4qO2gMyIHR4pJGmA6oJEUtCldfcjA>
    <xmx:M37kZjU_lZZ5ME2AO2S9WbRuT_gyEjtkX4ijfixdcVo069ul7vd20g1Z>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Sep 2024 14:02:26 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Sven Peter <sven@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] watchdog: apple: Increase reset delay to 150ms
Date: Fri, 13 Sep 2024 20:02:14 +0200
Message-Id: <0F0CD820-4479-4DDB-BA89-CB44F4A190F3@svenpeter.dev>
References: <20240913174540.45551-1-towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240913174540.45551-1-towinchenmi@gmail.com>
To: Nick Chan <towinchenmi@gmail.com>
X-Mailer: iPhone Mail (21G93)


>=20
> On 13. Sep 2024, at 19:46, Nick Chan <towinchenmi@gmail.com> wrote:
>=20
> =EF=BB=BFThe Apple A8X SoC seems to be slowest at resetting, taking up to a=
round
> 125ms to reset. Wait 150ms to be safe here.
>=20
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@svenpeter.dev>


> drivers/watchdog/apple_wdt.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index d4f739932f0b..353ecf0b04dc 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -127,11 +127,11 @@ static int apple_wdt_restart(struct watchdog_device *=
wdd, unsigned long mode,
>    /*
>     * Flush writes and then wait for the SoC to reset. Even though the
>     * reset is queued almost immediately experiments have shown that it
> -     * can take up to ~20-25ms until the SoC is actually reset. Just wait=

> -     * 50ms here to be safe.
> +     * can take up to ~120-125ms until the SoC is actually reset. Just
> +     * wait 150ms here to be safe.
>     */
>    (void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> -    mdelay(50);
> +    mdelay(150);
>=20
>    return 0;
> }
>=20
> base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
> --
> 2.46.0
>=20


