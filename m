Return-Path: <linux-watchdog+bounces-3761-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF6AEC1FB
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 23:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A8D9165D5B
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 21:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82134273D78;
	Fri, 27 Jun 2025 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZaVSjkB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED4273D70;
	Fri, 27 Jun 2025 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059405; cv=none; b=JiFVtqS9kp+CsjJ+ZPln936mKgTgm2RAJhr6vVA1L8juI0ClnCYjVKm+0h61kNoc+qP0f5yEnXe27A7Qo/n18rXZWuZCl5tekakkcoYPBFVL0ixiwtjCR6eVTUXLnhg2isJNHxXy11GJo+CkvHCrubg6ZFeCyZBAEW1wuRDECeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059405; c=relaxed/simple;
	bh=eJFxYUVuTiYmn7RP5+jGfs2IdBuQ1seJOqX9HC6rdao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxb0aUEQhp2Q4MRTdfiNQLRTwM2p44Q/O9x5SXLPSy/4MQLpTFuD1Q7Z7IzrneuaOzKk7eWTrH+D8CwjrQ6GunvcgMw/p/rm5H0DOCk3ztWx4va4lGMNTKfPTi0BUlWuzDA9qnzqcKoPyTgrnM4li3FwyMOCM+S8f+3LR2xyTT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZaVSjkB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB0DC4CEE3;
	Fri, 27 Jun 2025 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059404;
	bh=eJFxYUVuTiYmn7RP5+jGfs2IdBuQ1seJOqX9HC6rdao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZaVSjkBqdnNT0peaZv6ETmCYkq+FDmct4kamm4Gftide9hPz1b6ZIZ0Z5OAzqEMX
	 LJ3R5wCvC+FxOC8l9kO0f94lQh0mO8lgBZlGr/7cIXeg2BjQEN1/1km6EuzS2Uj6jM
	 QpXp+oiPmpju1r0CZFoI4Gy5BRBn7a6ZBllXipZupSAWKWwbF3gHJFNPAUA+dHufmi
	 HMcVStRTYoSPDZR7IvHSgYkujoFqxYcETVGCHatR2kpIHNjpxo5hM9Q6vR44FDnJPs
	 SQOxL0OOdtyMpZR2g888TF1EcnOjaqdRHO9UTB1UAtGZR1ovHm3AjMnTawrF3tArhD
	 EzJ1QzegVxM8Q==
Date: Fri, 27 Jun 2025 16:23:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: arm: mediatek: add boards based on
 the MT6572 SoC
Message-ID: <175105940347.167208.8424905965473353735.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-6-f7f842196986@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-6-f7f842196986@proton.me>


On Thu, 26 Jun 2025 11:53:59 +0300, Max Shevchenko wrote:
> Add entries for the JTY D101 tablet and the Lenovo A369i smartphone.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


