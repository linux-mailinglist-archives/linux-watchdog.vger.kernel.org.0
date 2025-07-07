Return-Path: <linux-watchdog+bounces-3820-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF5AFB010
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 11:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F10063AAAB5
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 09:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545E529008E;
	Mon,  7 Jul 2025 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ee/ZizGV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D12A1C4A0A;
	Mon,  7 Jul 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881609; cv=none; b=BgBA02aeSV04GTJhtlVuGXH0BF4qNcSRM3bQ1jMkHop1xzoNo2PE+qNlwxAQBnPFe89QErenzXqTXY9dm0roxg9pIt1VyfL+HgirLjWR9USBEoOAhgq22W6sfRaL85jyRp/dat+d4/QODk96qEmxh7zVIVEZSUT8C6UsoYaYsLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881609; c=relaxed/simple;
	bh=X9OPy8lPBzx5zXYW1HynhmA/aOJsEytUlCoR4bDLob4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lRlugNdzUGhORTvvJmqz8dExMh+fhKtX+BHR9OXu5gI9srqutG71yST8u80+/XYAdLm+yF5c4Df47OvCjpACrq35I81Nu18yT/LdOaJXD9z6WwkrsrV2rio/wbgCohCg1yIXUXQWOytAO5WRgru+/yXrB7sBuSemLxhWcZfhs7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ee/ZizGV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751881605;
	bh=X9OPy8lPBzx5zXYW1HynhmA/aOJsEytUlCoR4bDLob4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ee/ZizGVMxKrUWe6P3Z0136YBYCER/oyjhC8ElcUR4/ulQ5Qf8XGLyy0gSoAxVrIT
	 wIC2PBM/BjmesI2cnk98ro8eY0tJAHxmgzy/yqx766uAWfo/Wk2KmpkkiQy0XVBcXB
	 9vuqrCr1nPPnMWjTaTf90rEQ1UWgc7BQiyhLN/TNezFNTiFAeMZIkPyHX/ulF1Xjg1
	 WBX0lYxeNTm+ndxkmsU/O3mVsRPYFFl+xaY1nuyi0XXp4SYlndlvbcRRNLOk6ZaqHm
	 fyLUflZUlQvzttDyteHhvqDqI9XTESRoKXV9spY5VrPudXt20VOwUpC0RfW8ewANLP
	 sYafYBWj6oDFw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 025FE17E07C9;
	Mon,  7 Jul 2025 11:46:44 +0200 (CEST)
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
Message-Id: <175188160494.76260.12978644604061063764.b4-ty@collabora.com>
Date: Mon, 07 Jul 2025 11:46:44 +0200
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

Applied to v6.16-next/arm32, thanks!

[07/11] ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
        commit: a46ae3392aad15cc1b13fb098515e457934bfbff
[08/11] ARM: mediatek: add MT6572 smp bring up code
        commit: 9ed85e0747c0ef14d1867035fc05e3882343597e

Cheers,
Angelo



