Return-Path: <linux-watchdog+bounces-4941-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FQNKw6kjWlh5gAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4941-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 10:57:34 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D59E12C1DF
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 10:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3620B30DD8DC
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Feb 2026 09:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CEE2E5D17;
	Thu, 12 Feb 2026 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="laYuff1m"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4502E543B;
	Thu, 12 Feb 2026 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890121; cv=none; b=abtn40DEQW1FN+uPIhWoIRxMhz8HUiliiox/gKt+/Ym05V4dLppqczusH/wZ3f5wMmW0OnUeT/Jksd8vg4nwRNuq+dLmgwghD8QE9YrZxccfmUtZ16ktc/rjo8sUlO3FVnpScYLyec4twfKDrGxH0KRx3Ddt/5cXTkEwyk8l1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890121; c=relaxed/simple;
	bh=N62o0AizXGvG6KW1+joGamHuqnTNnvR3ujtxM+9dnw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6XZN1ZDrn2bpygZRKlUIZIhvjEAWc1yflIB7a7GgK1iXGBGBZ0pz+oAY6VQqHU2kmNLurI/tmJJvQCgPxeQe2X7zWI32flu0apZ904QOUKj+Cl9P03wdJpEtuaCxEwKGkzeoOQqut3nJulX0n2CWtI6TDkOA2b8N7YKEs41FME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=laYuff1m; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770890118;
	bh=N62o0AizXGvG6KW1+joGamHuqnTNnvR3ujtxM+9dnw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=laYuff1m37ibybD2IrXe46Ic/HVfch2ccbM/zJh2WZzVGmJey+Fp5p1EPLvPSplDX
	 wxgOsM1LZ+VcENrVt4c1qV7ZJFhX5yhT1trmn976thQAHdPLIIHZeIceuFZ6kOFPDd
	 /AN0oy2uUCj3ZSDWIoAhkL+wDCT9N4cjf4oTYAkibaOIZW3xpJOqDffJfKzVntEo3K
	 r4sYbDkTI0exkwkYN/nSXFL9ArH5M6UlGT7vG16bTe2mFoCdRpv9vv3X0SXJheQOrE
	 jhW0dXAf3u+GgreZkvjV7kQd0NkH5HLIkNsiZ6AxRRwcPnMF+MElCCNT6hFoMe8EVL
	 Uy5eke5GkKwAw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4148817E110D;
	Thu, 12 Feb 2026 10:55:18 +0100 (CET)
Message-ID: <2db84c85-706c-42db-8706-debe37ca3166@collabora.com>
Date: Thu, 12 Feb 2026 10:55:17 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: mt8167: Add additional mmsys reset bits
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
 <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4941-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 2D59E12C1DF
X-Rspamd-Action: no action

Il 11/02/26 20:03, Luca Leonardo Scorcia ha scritto:
> Some extra mmsys reset bits are defined in the Lenovo
> Smart Clock kernel sources - file cmdq_mdp.c
> 

Hah, just noticed that this patch actually adds the same resets as the ones
in my hints at patch 2.

In any case, since you're adding the MMSYS resets in patch [2/7], having two
patches doesn't make any sense.

Leaving the fact that this patch has the wrong title ... but well anyway, just
squash this one with [2/7] and send one patch adding all of the mmsys resets
at once.

Cheers,
Angelo

> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   include/dt-bindings/reset/mt8167-resets.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
> index f77c2ca897cf..b379f8f023d5 100644
> --- a/include/dt-bindings/reset/mt8167-resets.h
> +++ b/include/dt-bindings/reset/mt8167-resets.h
> @@ -33,6 +33,15 @@
>   #define MT8167_TOPRGU_SW_RST_NUM		15
>   
>   /* MMSYS resets */
> +#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
> +#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
> +#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
> +#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
>   #define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22
>   
>   #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */



