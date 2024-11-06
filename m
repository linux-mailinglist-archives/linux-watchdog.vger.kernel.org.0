Return-Path: <linux-watchdog+bounces-2422-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4039BE92D
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 13:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34CAF1F23516
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Nov 2024 12:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7251DD55A;
	Wed,  6 Nov 2024 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NyTq7xis"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C041DF251;
	Wed,  6 Nov 2024 12:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730896276; cv=none; b=PmcNbnCGvVJnYZNK0INwRaHUX7gBe5fmNkdx22/f8ywkplJY6C/xknqOo+PoaL7okERbXV5Xa+nnGxJNQeCZbmD42btHY0yCMUTufgSUQ9AeaXYC/K5vd5NznmXvLgY/PQhym0xeCu+KbMFYfZxHskHKXNw2M9zUU2Rk1sRdwt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730896276; c=relaxed/simple;
	bh=A90cgTlUFFZc5KiS7CX3bzI9MZt05fj3oUZ7b1bgZxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G19XFrmOhm0aUrGaFdYnlXW1vJf2F1cC36Pq7odBf7TzGqIhdmo3q46xF5B9SuTy1zvRIMsbly2kuIt22IWYYjqMYvbkMclIJ6Gc33+oijCrsWnesXtjXnfjoj1H0KXRHzWF1gs6k5e8+6KibDjYPWg98a1XAIpzDhuHOlsGvhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NyTq7xis; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730896273;
	bh=A90cgTlUFFZc5KiS7CX3bzI9MZt05fj3oUZ7b1bgZxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NyTq7xisbYlabWUUc2K6qfI2wmbfSFW3KysBoZPNfPboGrQNmJk9AZRBVzMofpnYg
	 FuK93OA5HA3VEPgysk6Gu7wOzc3tmnUnEcT+H7PKR+iBYtrD6e7a0Tp8U9gZSUBEdD
	 f3/YBkGJPcL4P2dK+wbxFuWgEK2UHpmC3dI7Z4AmYFMmvAorQfSO4CwVFMXJkqpq/C
	 /cbJOc1ufSCCmMDFSUlexp6/LXd3m5iAuGki2yHxGWsPAhOLzj0LCt6WGQmEGRev5z
	 rkqxrbszgEAji/rmNeIqa8CJx4nCD51II/TI29DicPLOy550PMnsul9qLff86pwgkv
	 FvU6E7Vvb6VIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7A7817E3629;
	Wed,  6 Nov 2024 13:31:12 +0100 (CET)
Message-ID: <2bd7a02d-c5bc-4926-8aee-0eed6eb490a2@collabora.com>
Date: Wed, 6 Nov 2024 13:31:12 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] watchdog: mediatek: Fix mtk_wdt_restart
To: Yassine Oudjana <y.oudjana@protonmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
 <20241106104738.195968-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106104738.195968-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/11/24 11:47, Yassine Oudjana ha scritto:
> Clear the IRQ enable bit of WDT_MODE before asserting software reset
> in order to make TOPRGU issue a system reset signal instead of an IRQ.
> 
> Fixes: a44a45536f7b ("watchdog: Add driver for Mediatek watchdog")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

I'd be more comfortable with a title like:

watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()

or along those lines, saying what's this commit about, because a generic
"fix" doesn't really mean anything...

About the commit description - that's good.
Btw, I wonder if maintainers can fix the title without you sending a v3...

Anyway - you can get my:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo

> ---
>   drivers/watchdog/mtk_wdt.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index c35f85ce8d69c..e2d7a57d6ea2e 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -225,9 +225,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>   {
>   	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>   	void __iomem *wdt_base;
> +	u32 reg;
>   
>   	wdt_base = mtk_wdt->wdt_base;
>   
> +	/* Enable reset in order to issue a system reset instead of an IRQ */
> +	reg = readl(wdt_base + WDT_MODE);
> +	reg &= ~WDT_MODE_IRQ_EN;
> +	writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> +
>   	while (1) {
>   		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
>   		mdelay(5);



