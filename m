Return-Path: <linux-watchdog+bounces-2430-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A322B9C036C
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 12:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35A3AB2368D
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 11:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC731F4279;
	Thu,  7 Nov 2024 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="YPRG8d3H"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718CD1EF923;
	Thu,  7 Nov 2024 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977684; cv=none; b=nwsnk1IBMyR/aXU9cPgkuOxiHGBQNMVLv4tM9r7fLAIGnWjaZjT6jwIz5D8UX+ro+z9C+j7aNcNXHWtDc6oQqhe3VoNdZRp9L7uMHzXZVsSFDFsyUqRe9ug06PrX0Yf8NUmiyt5KSqkcB68/gpmReAd2UupOOZLgmX3V9D3h/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977684; c=relaxed/simple;
	bh=qm0sRgjyJYZCmmY/AhZSz8Z8fn4UGSfVYOCj0xQLmMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/9Kzh8tRYMmz/MPDAEkNyM9mMXvRGAj0JItN2WzG1Xn5kTx7inH/KbihfBiXbAAyT/chljxg1/ROsPWGSOAhSdQgqiLjuJdjXp07w2FWOjMPoN0u6TT/hv7m3A0Sxz8ijM2ul+9AuBOJ1nvprxtQYwnPKv/9cWUPOxARj66GjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=YPRG8d3H; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 7C90F40A9F; Thu,  7 Nov 2024 11:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 7C90F40A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730976040;
	bh=qm0sRgjyJYZCmmY/AhZSz8Z8fn4UGSfVYOCj0xQLmMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPRG8d3HYFQ0Avd4hWzXFR0pswWAUumDi+RYJTWINOPrlJpEj9MjYiA9uIdRtS4D2
	 5j2GbKZYMjLmQyWLx+Ryp5OMzp79ZJJeg/LNFXYrQ2s4Mmo19MfKx20mU/V5R6d8Ln
	 4nGMYvUB8vxv5Sp3HsQMT0JD8869hTIzuvFX+a/g=
Date: Thu, 7 Nov 2024 11:40:40 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] watchdog: mediatek: Fix mtk_wdt_restart
Message-ID: <20241107104040.GA5233@www.linux-watchdog.org>
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
 <20241106104738.195968-2-y.oudjana@protonmail.com>
 <2bd7a02d-c5bc-4926-8aee-0eed6eb490a2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bd7a02d-c5bc-4926-8aee-0eed6eb490a2@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Angelo, Yassine,

> Il 06/11/24 11:47, Yassine Oudjana ha scritto:
> >Clear the IRQ enable bit of WDT_MODE before asserting software reset
> >in order to make TOPRGU issue a system reset signal instead of an IRQ.
> >
> >Fixes: a44a45536f7b ("watchdog: Add driver for Mediatek watchdog")
> >Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> I'd be more comfortable with a title like:
> 
> watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()
> 
> or along those lines, saying what's this commit about, because a generic
> "fix" doesn't really mean anything...
> 
> About the commit description - that's good.
> Btw, I wonder if maintainers can fix the title without you sending a v3...

I added it into linux-watchdog-next and changed the commit description whiledoing that.

Kind regards,
Wim.

> 
> Anyway - you can get my:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Cheers!
> Angelo
> 
> >---
> >  drivers/watchdog/mtk_wdt.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> >diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> >index c35f85ce8d69c..e2d7a57d6ea2e 100644
> >--- a/drivers/watchdog/mtk_wdt.c
> >+++ b/drivers/watchdog/mtk_wdt.c
> >@@ -225,9 +225,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
> >  {
> >  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> >  	void __iomem *wdt_base;
> >+	u32 reg;
> >  	wdt_base = mtk_wdt->wdt_base;
> >+	/* Enable reset in order to issue a system reset instead of an IRQ */
> >+	reg = readl(wdt_base + WDT_MODE);
> >+	reg &= ~WDT_MODE_IRQ_EN;
> >+	writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> >+
> >  	while (1) {
> >  		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
> >  		mdelay(5);
> 
> 

