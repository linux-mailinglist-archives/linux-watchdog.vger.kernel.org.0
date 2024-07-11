Return-Path: <linux-watchdog+bounces-1352-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1F592ECE8
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 18:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 706101C21F0A
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 16:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD7416D326;
	Thu, 11 Jul 2024 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bvhzre32"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0D716B751;
	Thu, 11 Jul 2024 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720715936; cv=none; b=btRgliq0LZY6aC1ChccaPIePNc/gol0A5zUPCXL2iV/EY9VXobIT8cCUvCxalJq0O0R8CKwSZ7znTWRB+WPH0c3eVNFCPMT15MwWN5IierHja3V1AAVhfPl8HUNaThJl3I85jdZymTjz2Gm5BiV2+nWGb13xV/xwAGG7+3Ru+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720715936; c=relaxed/simple;
	bh=UavMyNYF30mligF0aZsTuX6+8r35QoOCy1CLNriVcCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jwhv/cEJD0Gzr0e7E/J/VtDb68l4GhcwnFVifbgs1cOsuZQu5iOGWEEp9VmfVdAAZWj8NaC3tpFAkrGF98sKf36XGQaSpZ2TaciJGIYsJ1L/ryr36yiSVAF4yC4VbISIOQXtQv4zCijLWZ+65XqcAytgkbO7+QggKcc0+jNwk6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bvhzre32; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF90EC116B1;
	Thu, 11 Jul 2024 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720715936;
	bh=UavMyNYF30mligF0aZsTuX6+8r35QoOCy1CLNriVcCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bvhzre32EPArcVCo0Eotud0PYlBrGvFWmS7Mnyn9DEMnZSI4rRFdZaHaWG/I3EM2Q
	 GHvtDsl8jMNtwbFaw2zRkN9IltKzUMMKJmHRcnr6NylGmUa1sEbEiXQKkpP/Zcmg5K
	 aMwxW4hzbyWxC9pMJ4Fq2GdCgm1NBHQWnawmQeosZAEVjlwGIho2NSRXMjipkSZRDu
	 TDKXVsBkETA832fccWdFXleBCy8hYramdv5EJY+mIF0jin8Qg+IrbNxthc0Df83Ieg
	 cBAspqn3HecDX3XkBfQaUFPtNiusvJdcas3yZxm42DTJ3vkzB6hr7T04Tklx/mRoZO
	 RoQgDqwtrlo6Q==
Date: Thu, 11 Jul 2024 10:38:55 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Frank Wunderlich <linux@fw-web.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: Aw: Re: [PATCH v1 0/4] add syscon requirement for mt7988
Message-ID: <20240711163855.GA2369577-robh@kernel.org>
References: <20240709101328.102969-1-linux@fw-web.de>
 <126053ef-3bfb-47c2-aa17-eb1d26d99102@collabora.com>
 <trinity-93a5ed81-b890-4d49-bfec-1bbb1219cb65-1720611282583@3c-app-gmx-bs04>
 <23369ea1-12d2-4386-a8ac-431620b75e2e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23369ea1-12d2-4386-a8ac-431620b75e2e@collabora.com>

On Wed, Jul 10, 2024 at 02:50:42PM +0200, AngeloGioacchino Del Regno wrote:
> Il 10/07/24 13:34, Frank Wunderlich ha scritto:
> > Hi
> > 
> > > Gesendet: Mittwoch, 10. Juli 2024 um 12:45 Uhr
> > > Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
> > > Betreff: Re: [PATCH v1 0/4] add syscon requirement for mt7988
> > > 
> > > Il 09/07/24 12:13, Frank Wunderlich ha scritto:
> > > > From: Frank Wunderlich <frank-w@public-files.de>
> > > > 
> > > > Some nodes require the syscon fallback at least in u-boot when using
> > > > OF_UPSTREAM.
> > > > 
> > > > This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c for
> > > > "mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-node.
> > > > 
> > > 
> > > I wonder what's the major blocker here to modify the u-boot driver to take
> > > the upstream devicetree as-is, instead of using syscon_node_to_regmap?
> > 
> > in uboot there is no driver for all syscon and to handle parallel 
> > access this is done with the syscon fallback.
> > 
> > The syscon uclass is a small driver which is generic and only 
> > handle the regmap in global context.
> > 
> > In theory it could be possible that regmap is aquired twice when 
> > used from 2+ other drivers...to prevent this without
> > adding the syscon fallback each syscon needs a dedicated driver 
> > like in linux which does only syscon stuff (code
> > duplication at its best :) ).
> > 
> > of course i can use regmap_init_mem in the uboot ethernet driver
> > 
> > https://elixir.bootlin.com/u-boot/latest/source/drivers/core/regmap.c#L242
> > 
> > like it's done once for syscon-uclass.
> > 
> > but i will cause issues when a second device tries to access this 
> > regmap. So it was be much easier (for me) to add this
> > fallback and not writing 3 device-drivers in uboot doing the 
> > exactly same as syscon.
> > 
> > if you have a better idea how to handle it, let me know :)
> > 
> 
> I see. The problem is that, from your description, it looks like u-boot
> uses that as a kind of workaround for concurrent access to MMIO...
> 
> ...looks like a good topic to discuss in the u-boot mailing lists.
> 
> Definitely, the TOPRGU and the XFI PLL are not system controllers, so the actual
> "syscon" definition would be wrong for these, that's it.

While I'd prefer "syscon" never existed in the first place, I don't care 
too much if it gets added here or not. U-boot's reasoning for wanting it 
isn't really much better or worse than Linux's. Though if u-boot has 
multiple drivers using it, seems like an abstraction is missing if Linux 
doesn't need that.

Rob


