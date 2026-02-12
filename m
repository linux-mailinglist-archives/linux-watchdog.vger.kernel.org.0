Return-Path: <linux-watchdog+bounces-4936-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEgkNC6jjWlh5gAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4936-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 10:53:50 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5875212C0F6
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 10:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F157D31055CF
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 09:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0921C2E265A;
	Thu, 12 Feb 2026 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Hn/4weQH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2BD2E0400;
	Thu, 12 Feb 2026 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889953; cv=none; b=pkh6uDG/UOtHI+R13nagPvykuMT+Beguj/LOIS4At5kaZ8xOQ2Tztq9CiMMNWeNCWy8EntKc02FdzLh4nSxX25yxZdd5ytvBvwn3Ki4KJvObBNPG/7+76sjrh724p9068ASPP9K6j8R9N1EiSjQHd813donvp3Gacna0J6/l5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889953; c=relaxed/simple;
	bh=2LumtwVT4QDDpuSP3HIIGZQ4HRZvYGsUCxRUalgpxrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGhm5218nvoaPyaKGDgKgX/6FXAMa5iCxdSVgVhtuYRXFpeD/Sa5WIwPlqQAm7vjFpHla49v9Ab78BMd/vTH0d89xYqGDkhYZj23L2RPuEcGHbo/USAh1J+MsDAnEXtQX9gKI22zu/98BJ+sDoaFRaNYL2nIul39eeTgR+ihVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hn/4weQH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770889951;
	bh=2LumtwVT4QDDpuSP3HIIGZQ4HRZvYGsUCxRUalgpxrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hn/4weQHNFlsTBTqG4b29/rCqcdfBAKTztHzp3egMHeHcgipblJR9dpV0RfIaBvPu
	 ZpJiecxTTfwDmZbEo/PNG9KJ85qhxxCE5kJiLLy2cAvJ3+BXGnFIf7s7whR6zhAXwg
	 HfSbOiod8Va28YnMok6ituly8w7teaNNkwqCvK9UTjkNQ2X62uQZrlAygMDcQkRfax
	 F0ZgVJvQiQ1OuLCdpPfyY6kd+gwQ9eNEoSAVEyFlZjFiJrCF+pZwIZUH3GxjK8gF5O
	 7LO1eiGlGdCcsieU1fnxuLNBnER3kVOW/Ze//gbTd/B9ispcOyMRNJ55ACFzm6/44z
	 BdXdK9vAOD7dA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A6A617E1416;
	Thu, 12 Feb 2026 10:52:30 +0100 (CET)
Message-ID: <d62466ab-92d2-4bda-baeb-36786984f59f@collabora.com>
Date: Thu, 12 Feb 2026 10:52:30 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: mediatek: Add reset controller constants
 for mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4786b688175eed89b899bdfd7e72505cafd7c3b0.1770836190.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4936-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-watchdog@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,kernel.org,gmail.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 5875212C0F6
X-Rspamd-Action: no action

Il 11/02/26 20:03, Luca Leonardo Scorcia ha scritto:
> This file comes from the Lenovo Smart Clock kernel sources.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   include/dt-bindings/reset/mt8167-resets.h | 38 +++++++++++++++++++++++

Please rename this to "mediatek,mt8167-resets.h"

>   1 file changed, 38 insertions(+)
>   create mode 100644 include/dt-bindings/reset/mt8167-resets.h
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

End the comment here; the extra text is redundant with the specified license
identifier anyway.

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
> +
> +/* TOPRGU resets */
> +#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0 /* reset ddrphy and flash pad macro */

Please remove all of the extra comments: they're stating the obvious anyway.

> +#define MT8167_TOPRGU_AUD_PAD_RST		1 /* Write 1 to reset audio_tdm_in_pad,audio_tdm_pad,audio_fifo */
> +#define MT8167_TOPRGU_MM_RST			2 /* Write 1 to reset MMSYS */
> +#define MT8167_TOPRGU_MFG_RST			3 /* Write 1 to reset MFG */
> +#define MT8167_TOPRGU_MDSYS_RST			4 /* Write 1 to reset INFRA_AO */
> +#define MT8167_TOPRGU_CONN_RST			5 /* Write 1 to reset CONNSYS WDT reset */
> +#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6 /* Write 1 to reset MM and its related pad macro(DPI,MIPI_CFG,MIPI_TX) */
> +#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7 /* Write 1 to reset digi_mipi_tx */
> +#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8 /* Write 1 to reset SPI_PAD_MACRO */

You're missing reset N.9 - I'm mostly sure that 9 is

MT8167_TOPRGU_INFRA_AO_RST

> +#define MT8167_TOPRGU_APMIXED_RST		10 /* Write 1 to reset APMIXEDSYS */
> +#define MT8167_TOPRGU_VDEC_RST			11 /* Write 1 to reset VDEC module */
> +#define MT8167_TOPRGU_CONN_MCU_RST		12 /* Write 1 to reset CONNSYS */
> +#define MT8167_TOPRGU_EFUSE_RST			13 /* Write 1 to reset efuse */
> +#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14 /* Write 1 to reset pwrap_spictl module */
> +#define MT8167_TOPRGU_SW_RST_NUM		15
> +
> +/* MMSYS resets */
> +#define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22

That's not ok. All of the bindings must not be hardware specific, and I know
that this "22" is bit(22) of MMSYS.

The definitions must start from 0 and must have no holes (0 1 2 4 6 7 8 is not ok,
but 0 1 2 3 4 5 is ok).
If you have the entire list and it also matches 1:1 with the HW coincidentally,
that'd be okay as well.

Since I have a hunch that you don't actually have the entire list, you should
at this point define your MT8167_SW0_RST_B_DISP_DSI0 as 0, and check the review
on your mmsys patch for more hints.

P.S.:

#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
#define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	9

> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */



