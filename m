Return-Path: <linux-watchdog+bounces-4943-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLQ6LUy7jWl96AAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4943-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 12:36:44 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEA12D0D6
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 12:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2371E30157CA
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 11:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132E2314A6B;
	Thu, 12 Feb 2026 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onv/610i"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A227E7EB;
	Thu, 12 Feb 2026 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896201; cv=none; b=iRD6T8DszkdPUgPxEXqsl0Pylw9/c/sXwHDID3fqZkxOu7bbWrnMp3Ud9G7/9K+cB82gA9DnhSImKH2Jew2l40UDsAnjJlthNx1nWIDCe5Rfao/fRXpK4pTsxXtSdm00JbdptCKL7c6dkER70d1PrLU1kj7Qv3G6IjJQxnabjmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896201; c=relaxed/simple;
	bh=B7E4+IAOzH/2D5RDt46LA2shT8s88ZGClPoLwMfqKVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naQGzokGI1gqCdpSqj7Hqxmw7RHbql4JRuKUnJC4244KjS59mtWhCRAWw3+RxQGuPZxpdhwHY1655JfMCg36E7x9d+snVU3C2TLNplepQEKoMIYCkEeLotClaT1jD8MVIPrSxqxFL2v97LsgFfWSbWOp8Oc+7VKkgQLVmmZwWbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onv/610i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD4CC4CEF7;
	Thu, 12 Feb 2026 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896200;
	bh=B7E4+IAOzH/2D5RDt46LA2shT8s88ZGClPoLwMfqKVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onv/610iuyirRHWcjNQxEpoFtb2tG/OldRjeF13iWIlAN+LmioJSYrBHP0ix/6jzZ
	 7MsAaN+D7mkmzbdewJkWvtuwzN5Cn6Rk8QjTLWmKmrNCbxlt64qOtF33f8POph72/I
	 J5S54oE8ik9nDF5hG/AaXMEVVEgwZZ5tjOwPE6r2KanPdWqhU1LZiEJHYDB+FqFZxs
	 bh+wpJaeBKGbthATACyYD0PlGJBV0IhLBl2QIG2WM1QW0p0Uv/v3OtiJM61grFw4Ym
	 N2Lw/vaJx3CzTmv8COC6FdYeMteKwIHayOqH3GgKDKypD+d2Cp9Rje2wt+azAJQUCK
	 L9Hgax3pfVwWw==
Date: Thu, 12 Feb 2026 12:36:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: mediatek: Add reset controller
 constants for mt8167
Message-ID: <20260212-offbeat-strong-gopher-5faeda@quoll>
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4943-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-watchdog@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux-watchdog.org,roeck-us.net,kernel.org,gmail.com,collabora.com,pengutronix.de,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30CEA12D0D6
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 07:03:23PM +0000, Luca Leonardo Scorcia wrote:
> This file comes from the Lenovo Smart Clock kernel sources.
> 

Where is the actual binding? Why is this separate file?

> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  include/dt-bindings/reset/mt8167-resets.h | 38 +++++++++++++++++++++++

Filename matching compatible,

>  1 file changed, 38 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt8167-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
> new file mode 100644
> index 000000000000..f77c2ca897cf
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt8167-resets.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.

Drop boiler plate. It is not even correct - conflicts SPDX which leads
to another point - you need copyright owners agreement to relicense the
code.

Just write new one, instead of sending us 2015 old code.



> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +
> +/* TOPRGU resets */
> +#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0 /* reset ddrphy and flash pad macro */
> +#define MT8167_TOPRGU_AUD_PAD_RST		1 /* Write 1 to reset audio_tdm_in_pad,audio_tdm_pad,audio_fifo */
> +#define MT8167_TOPRGU_MM_RST			2 /* Write 1 to reset MMSYS */
> +#define MT8167_TOPRGU_MFG_RST			3 /* Write 1 to reset MFG */
> +#define MT8167_TOPRGU_MDSYS_RST			4 /* Write 1 to reset INFRA_AO */
> +#define MT8167_TOPRGU_CONN_RST			5 /* Write 1 to reset CONNSYS WDT reset */
> +#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6 /* Write 1 to reset MM and its related pad macro(DPI,MIPI_CFG,MIPI_TX) */
> +#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7 /* Write 1 to reset digi_mipi_tx */
> +#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8 /* Write 1 to reset SPI_PAD_MACRO */
> +#define MT8167_TOPRGU_APMIXED_RST		10 /* Write 1 to reset APMIXEDSYS */
> +#define MT8167_TOPRGU_VDEC_RST			11 /* Write 1 to reset VDEC module */
> +#define MT8167_TOPRGU_CONN_MCU_RST		12 /* Write 1 to reset CONNSYS */
> +#define MT8167_TOPRGU_EFUSE_RST			13 /* Write 1 to reset efuse */
> +#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14 /* Write 1 to reset pwrap_spictl module */
> +#define MT8167_TOPRGU_SW_RST_NUM		15
> +
> +/* MMSYS resets */
> +#define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22

Nope, It's 16. IDs increment by 1.

Best regards,
Krzysztof


