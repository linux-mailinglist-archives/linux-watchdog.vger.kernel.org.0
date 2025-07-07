Return-Path: <linux-watchdog+bounces-3819-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED3AFB009
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 11:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 297293BDA48
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 09:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417731BCA0E;
	Mon,  7 Jul 2025 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YraI6P48"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4894E2AD14;
	Mon,  7 Jul 2025 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881574; cv=none; b=TCqz4ETc19MFSQXp90rpF1R/6ZcZwl7/r0yp/Kq7rbyGfy7JreTboQa/wV53YVEt6kiu14APNlt99UuobYYQYK5GWpdUQHibpCu1yEnx+Uf+rmcybsuNEympBInjTzB86FVL0WT8ylKRW69bjZ8Vn313DD3GZncJF60vp2IUQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881574; c=relaxed/simple;
	bh=53Gq0bPO8TQdrskZuLSfMBb8Flq3ZNsUzD9zOfGkHMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iPCcptZEmdLc7YXB+Ix8xjzBRGN9Kg7CcbTvLS/mk8qKbM5+DKpcTTyZTkwj1LqbsILq+QN8oL0dU8tDwKgzpy+uNdgYvHFdtaUJV22uO8FAI8rpZyKdtEO6CDwdagLzghN4xqno5akAGb8hJhIGqOuOCDiMVSO+gDH6ok4IRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YraI6P48; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751881570;
	bh=53Gq0bPO8TQdrskZuLSfMBb8Flq3ZNsUzD9zOfGkHMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YraI6P4805tpiyc2sfEVxGMVhcPWRB2cnHx2GxtIlonVmtxrqWPUgNt5MSSkfaHdp
	 Kf/3J9gHVtYsUAErEA7J4flZfJ8x7kzgALduReSP7EETzUJOTofQ19Q22I1yvoGGMO
	 vh1BFGM8oMEpz6VwmGRAFcqNxZznINPDj38KPbfZ7ORmZ0tkXCpkMALzgvHKxXVKA6
	 9yuSuUOq4++DIHLtyxzOx6Dh+WJ1XP+lXTbwjNEeHnZyohUArNiaO82mSQ93/GUb5K
	 Jr515AdH/dQ4vMjgLcfUdSQVhvdg4EfxYyoW+NzRud2px2/nyP6K+OavGBL2wVpyKl
	 CTjQZM2rDV+BQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7967317E07C9;
	Mon,  7 Jul 2025 11:46:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>, Max Shevchenko <wctrl@proton.me>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
Subject: Re: (subset) [PATCH v4 00/11] ARM: Add support for MediaTek MT6572
 SoC
Message-Id: <175188156942.75673.6578470598593432446.b4-ty@collabora.com>
Date: Mon, 07 Jul 2025 11:46:09 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 02 Jul 2025 13:50:37 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> 

Applied to v6.16-next/dts32, thanks!

[02/11] dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
        commit: b5ae84ea536e6814f0f25bfd647e66a319b8a7fe
[03/11] dt-bindings: timer: mediatek: add MT6572
        commit: 7827b0ff3bb3cdd79e2a44a9e62b4437c9b13f0a
[04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
        commit: a79e5369cfd78d450e47eec1bc20672ea3494982
[05/11] dt-bindings: vendor-prefixes: add JTY
        commit: 1b301b7e2843f8ae8761fa57eac94439f4748e6f
[06/11] dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
        commit: 5215cdb013954c0f166795cf77fe80cb08b8a32e
[09/11] ARM: dts: mediatek: add basic support for MT6572 SoC
        commit: 2a64fc95eb43640482dd4a011ec2170d4ac38fb4
[10/11] ARM: dts: mediatek: add basic support for JTY D101 board
        commit: 3b192aa9c28234f93ac926d4f885d8c02df2f35e
[11/11] ARM: dts: mediatek: add basic support for Lenovo A369i board
        commit: 2dab43dbceab83faf967202c67fbabc4685d482c

Cheers,
Angelo



